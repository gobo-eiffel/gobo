#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* ET_CONSTANT_ATTRIBUTE.reset_assertions_checked */
void T251f85(T0* C)
{
	((T251*)(C))->a24 = EIF_FALSE;
	((T251*)(C))->a23 = EIF_FALSE;
}

/* ET_EXTERNAL_FUNCTION.reset_assertions_checked */
void T176f96(T0* C)
{
	((T176*)(C))->a31 = EIF_FALSE;
	((T176*)(C))->a30 = EIF_FALSE;
}

/* ET_GENERIC_CLASS_TYPE.process */
void T174f99(T0* C, T0* a1)
{
	T180x7459T0(a1, C);
}

/* ET_CLASS_TYPE.process */
void T172f96(T0* C, T0* a1)
{
	T180x7401T0(a1, C);
}

/* ET_CLASS.process */
void T60f164(T0* C, T0* a1)
{
	T180x7399T0(GE_void(a1), C);
}

/* ET_GENERIC_CLASS_TYPE.reset */
void T174f100(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		if (((T0*)(GE_void(l1)))->id==173) {
			T173f29(l1);
		} else {
			T425f29(l1);
		}
	}
}

/* ET_CLASS_TYPE.reset */
void T172f98(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		(GE_void(l1));
	}
}

/* ET_CLASS.reset_type */
void T60f215(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		T425f29(GE_void(l1));
	}
}

/* ET_DYNAMIC_PROCEDURE_TYPE.set_id */
void T233f73(T0* C, T6 a1)
{
	((T233*)(C))->a1 = a1;
}

/* ET_DYNAMIC_FUNCTION_TYPE.set_id */
void T232f73(T0* C, T6 a1)
{
	((T232*)(C))->a1 = a1;
}

/* ET_DYNAMIC_SPECIAL_TYPE.set_id */
void T228f72(T0* C, T6 a1)
{
	((T228*)(C))->a1 = a1;
}

/* ET_DYNAMIC_TUPLE_TYPE.set_id */
void T214f73(T0* C, T6 a1)
{
	((T214*)(C))->a1 = a1;
}

/* ET_DYNAMIC_TYPE.set_id */
void T157f69(T0* C, T6 a1)
{
	((T157*)(C))->a3 = a1;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.set_next_type */
void T233f68(T0* C, T0* a1)
{
	((T233*)(C))->a10 = a1;
}

/* ET_DYNAMIC_FUNCTION_TYPE.set_next_type */
void T232f68(T0* C, T0* a1)
{
	((T232*)(C))->a11 = a1;
}

/* ET_DYNAMIC_SPECIAL_TYPE.set_next_type */
void T228f67(T0* C, T0* a1)
{
	((T228*)(C))->a12 = a1;
}

/* ET_DYNAMIC_TUPLE_TYPE.set_next_type */
void T214f68(T0* C, T0* a1)
{
	((T214*)(C))->a13 = a1;
}

/* ET_DYNAMIC_TYPE.set_next_type */
void T157f65(T0* C, T0* a1)
{
	((T157*)(C))->a10 = a1;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.set_meta_type */
void T233f69(T0* C, T0* a1)
{
	((T233*)(C))->a11 = a1;
}

/* ET_DYNAMIC_FUNCTION_TYPE.set_meta_type */
void T232f69(T0* C, T0* a1)
{
	((T232*)(C))->a12 = a1;
}

/* ET_DYNAMIC_SPECIAL_TYPE.set_meta_type */
void T228f68(T0* C, T0* a1)
{
	((T228*)(C))->a13 = a1;
}

/* ET_DYNAMIC_TUPLE_TYPE.set_meta_type */
void T214f69(T0* C, T0* a1)
{
	((T214*)(C))->a14 = a1;
}

/* ET_DYNAMIC_TYPE.set_meta_type */
void T157f66(T0* C, T0* a1)
{
	((T157*)(C))->a11 = a1;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.put_target */
void T233f74(T0* C, T0* a1, T0* a2)
{
	if (((T233*)(C))->a3) {
		T1293x12226T0T0T0(GE_void(a1), C, C, a2);
	}
}

/* ET_DYNAMIC_FUNCTION_TYPE.put_target */
void T232f74(T0* C, T0* a1, T0* a2)
{
	if (((T232*)(C))->a3) {
		T1293x12226T0T0T0(GE_void(a1), C, C, a2);
	}
}

/* ET_DYNAMIC_SPECIAL_TYPE.put_target */
void T228f73(T0* C, T0* a1, T0* a2)
{
	if (((T228*)(C))->a3) {
		T1293x12226T0T0T0(GE_void(a1), C, C, a2);
	}
}

/* ET_DYNAMIC_TUPLE_TYPE.put_target */
void T214f75(T0* C, T0* a1, T0* a2)
{
	if (((T214*)(C))->a3) {
		T1293x12226T0T0T0(GE_void(a1), C, C, a2);
	}
}

/* ET_DYNAMIC_TYPE.put_target */
void T157f70(T0* C, T0* a1, T0* a2)
{
	if (((T157*)(C))->a2) {
		T1293x12226T0T0T0(GE_void(a1), C, C, a2);
	}
}

/* ET_DYNAMIC_PROCEDURE_TYPE.set_static */
void T233f77(T0* C, T1 a1)
{
	((T233*)(C))->a15 = a1;
}

/* ET_DYNAMIC_FUNCTION_TYPE.set_static */
void T232f77(T0* C, T1 a1)
{
	((T232*)(C))->a16 = a1;
}

/* ET_DYNAMIC_SPECIAL_TYPE.set_static */
void T228f76(T0* C, T1 a1)
{
	((T228*)(C))->a15 = a1;
}

/* ET_DYNAMIC_TUPLE_TYPE.set_static */
void T214f78(T0* C, T1 a1)
{
	((T214*)(C))->a16 = a1;
}

/* ET_DYNAMIC_TYPE.set_static */
void T157f73(T0* C, T1 a1)
{
	((T157*)(C))->a14 = a1;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.set_alive */
void T233f67(T0* C)
{
	((T233*)(C))->a3 = EIF_TRUE;
	T188f13(GE_void(((T233*)(C))->a9), C);
}

/* ET_DYNAMIC_FUNCTION_TYPE.set_alive */
void T232f67(T0* C)
{
	((T232*)(C))->a3 = EIF_TRUE;
	T188f13(GE_void(((T232*)(C))->a10), C);
}

/* ET_DYNAMIC_SPECIAL_TYPE.set_alive */
void T228f66(T0* C)
{
	((T228*)(C))->a3 = EIF_TRUE;
	T188f13(GE_void(((T228*)(C))->a11), C);
}

/* ET_DYNAMIC_TUPLE_TYPE.set_alive */
void T214f67(T0* C)
{
	((T214*)(C))->a3 = EIF_TRUE;
	T188f13(GE_void(((T214*)(C))->a12), C);
}

/* ET_DYNAMIC_TYPE.set_alive */
void T157f64(T0* C)
{
	((T157*)(C))->a2 = EIF_TRUE;
	T188f13(GE_void(((T157*)(C))->a8), C);
}

/* ET_DYNAMIC_PROCEDURE_TYPE.put_procedure_call */
void T233f78(T0* C, T0* a1)
{
	T226f14(GE_void(a1), ((T233*)(C))->a17);
	((T233*)(C))->a17 = a1;
}

/* ET_DYNAMIC_FUNCTION_TYPE.put_procedure_call */
void T232f78(T0* C, T0* a1)
{
	T226f14(GE_void(a1), ((T232*)(C))->a18);
	((T232*)(C))->a18 = a1;
}

/* ET_DYNAMIC_SPECIAL_TYPE.put_procedure_call */
void T228f77(T0* C, T0* a1)
{
	T226f14(GE_void(a1), ((T228*)(C))->a17);
	((T228*)(C))->a17 = a1;
}

/* ET_DYNAMIC_TUPLE_TYPE.put_procedure_call */
void T214f79(T0* C, T0* a1)
{
	T226f14(GE_void(a1), ((T214*)(C))->a18);
	((T214*)(C))->a18 = a1;
}

/* ET_DYNAMIC_TYPE.put_procedure_call */
void T157f74(T0* C, T0* a1)
{
	T226f14(GE_void(a1), ((T157*)(C))->a16);
	((T157*)(C))->a16 = a1;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.put_query_call */
void T233f79(T0* C, T0* a1)
{
	T222f13(GE_void(a1), ((T233*)(C))->a16);
	((T233*)(C))->a16 = a1;
}

/* ET_DYNAMIC_FUNCTION_TYPE.put_query_call */
void T232f79(T0* C, T0* a1)
{
	T222f13(GE_void(a1), ((T232*)(C))->a17);
	((T232*)(C))->a17 = a1;
}

/* ET_DYNAMIC_SPECIAL_TYPE.put_query_call */
void T228f78(T0* C, T0* a1)
{
	T222f13(GE_void(a1), ((T228*)(C))->a16);
	((T228*)(C))->a16 = a1;
}

/* ET_DYNAMIC_TUPLE_TYPE.put_query_call */
void T214f74(T0* C, T0* a1)
{
	T222f13(GE_void(a1), ((T214*)(C))->a17);
	((T214*)(C))->a17 = a1;
}

/* ET_DYNAMIC_TYPE.put_query_call */
void T157f75(T0* C, T0* a1)
{
	T222f13(GE_void(a1), ((T157*)(C))->a15);
	((T157*)(C))->a15 = a1;
}

/* XM_CALLBACKS_NULL.on_start */
void T344f2(T0* C)
{
}

/* XM_NAMESPACE_RESOLVER.on_start */
void T341f26(T0* C)
{
	((T341*)(C))->a2 = T1013c10();
	T341f36(C);
	T113x10650(GE_void(((T341*)(C))->a1));
}

/* XM_NAMESPACE_RESOLVER.attributes_make */
void T341f36(T0* C)
{
	((T341*)(C))->a6 = (T341f12(C));
	((T341*)(C))->a7 = (T341f12(C));
	((T341*)(C))->a8 = (T341f12(C));
}

/* XM_NAMESPACE_RESOLVER.new_string_queue */
T0* T341f12(T0* C)
{
	T0* R = 0;
	R = T1015c6();
	return R;
}

/* DS_LINKED_QUEUE [STRING_8].make */
T0* T1015c6(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1015));
	*(T1015*)C = GE_default1015;
	return C;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.make */
T0* T1013c10(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1013));
	*(T1013*)C = GE_default1013;
	((T1013*)(C))->a1 = T1281c9();
	return C;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].make */
T0* T1281c9(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1281));
	*(T1281*)C = GE_default1281;
	((T1281*)(C))->a3 = (T1281f7(C));
	return C;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].new_cursor */
T0* T1281f7(T0* C)
{
	T0* R = 0;
	R = T1282c7(C);
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].make */
T0* T1282c7(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1282));
	*(T1282*)C = GE_default1282;
	((T1282*)(C))->a4 = a1;
	((T1282*)(C))->a1 = EIF_TRUE;
	return C;
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start */
void T105f12(T0* C)
{
	((T105*)(C))->a2 = T99c15();
	((T105*)(C))->a5 = EIF_VOID;
	((T105*)(C))->a6 = T1303c31((T6)(GE_int32(0)));
}

/* DS_HASH_SET [XM_NAMESPACE].make_equal */
T0* T1303c31(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1303));
	*(T1303*)C = GE_default1303;
	T1303f34(C, a1);
	((T1303*)(C))->a3 = T1432c3();
	return C;
}

/* KL_EQUALITY_TESTER [XM_NAMESPACE].default_create */
T0* T1432c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1432));
	*(T1432*)C = GE_default1432;
	return C;
}

/* DS_HASH_SET [XM_NAMESPACE].make */
void T1303f34(T0* C, T6 a1)
{
	T6 t1;
	((T1303*)(C))->a5 = a1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T1303f40(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T1303f41(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T1303f42(C, t1);
	((T1303*)(C))->a8 = (T1303f20(C, a1));
	t1 = ((T6)((((T1303*)(C))->a8)+((T6)(GE_int32(1)))));
	T1303f43(C, t1);
	((T1303*)(C))->a4 = (T6)(GE_int32(0));
	((T1303*)(C))->a10 = (T6)(GE_int32(0));
	((T1303*)(C))->a1 = (T6)(GE_int32(0));
	T1303f35(C);
	((T1303*)(C))->a11 = (T1303f23(C));
}

/* DS_HASH_SET [XM_NAMESPACE].new_cursor */
T0* T1303f23(T0* C)
{
	T0* R = 0;
	R = T1433c3(C);
	return R;
}

/* DS_HASH_SET_CURSOR [XM_NAMESPACE].make */
T0* T1433c3(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1433));
	*(T1433*)C = GE_default1433;
	((T1433*)(C))->a1 = a1;
	((T1433*)(C))->a2 = ((T6)(GE_int32(-1)));
	return C;
}

/* DS_HASH_SET [XM_NAMESPACE].unset_found_item */
void T1303f35(T0* C)
{
	((T1303*)(C))->a12 = (T6)(GE_int32(0));
}

/* DS_HASH_SET [XM_NAMESPACE].make_slots */
void T1303f43(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T1303f29(C));
	((T1303*)(C))->a14 = (T119f2(GE_void(t1), a1));
}

/* DS_HASH_SET [XM_NAMESPACE].special_integer_ */
T0* T1303f29(T0* C)
{
	T0* R = 0;
	if (ge275os4870) {
		return ge275ov4870;
	} else {
		ge275os4870 = '\1';
	}
	R = T119c4();
	ge275ov4870 = R;
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].new_modulus */
T6 T1303f20(T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	t1 = ((T6)((t1)*((T6)(GE_int32(3)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].make_clashes */
void T1303f42(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T1303f29(C));
	((T1303*)(C))->a13 = (T119f2(GE_void(t1), a1));
}

/* DS_HASH_SET [XM_NAMESPACE].make_key_storage */
void T1303f41(T0* C, T6 a1)
{
}

/* DS_HASH_SET [XM_NAMESPACE].make_item_storage */
void T1303f40(T0* C, T6 a1)
{
	((T1303*)(C))->a15 = T1434c3();
	((T1303*)(C))->a2 = (T1434f1(GE_void(((T1303*)(C))->a15), a1));
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].make */
T0* T1434f1(T0* C, T6 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T1464c2(a1);
	R = (((T1464*)(GE_void(l1)))->a1);
	return R;
}

/* TO_SPECIAL [XM_NAMESPACE].make_area */
T0* T1464c2(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1464));
	*(T1464*)C = GE_default1464;
	((T1464*)(C))->a1 = T1431c4(a1);
	return C;
}

/* SPECIAL [XM_NAMESPACE].make */
T0* T1431c4(T6 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1431)+a1*sizeof(T0*));
	*(T1431*)C = GE_default1431;
	((T1431*)(C))->z1 = a1;
	return C;
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].default_create */
T0* T1434c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1434));
	*(T1434*)C = GE_default1434;
	return C;
}

/* XM_DOCUMENT.make */
T0* T99c15(void)
{
	T0* C;
	T0* t1;
	C = (T0*)GE_alloc(sizeof(T99));
	*(T99*)C = GE_default99;
	t1 = (T99f7(C));
	T99f16(C, ge1223ov10287, t1);
	return C;
}

/* XM_DOCUMENT.make_with_root_named */
void T99f16(T0* C, T0* a1, T0* a2)
{
	((T99*)(C))->a1 = T100c29(C, a1, a2);
	T99f17(C);
	T99f18(C, ((T99*)(C))->a1);
}

/* XM_DOCUMENT.force_last */
void T99f18(T0* C, T0* a1)
{
	T99f19(C, a1);
	T99f18p1(C, a1);
}

/* XM_DOCUMENT.force_last */
void T99f18p1(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = (T99f13(C));
	if (t1) {
		((T99*)(C))->a3 = T1405c3(a1);
		((T99*)(C))->a4 = ((T99*)(C))->a3;
		((T99*)(C))->a5 = (T6)(GE_int32(1));
	} else {
		l1 = ((T99*)(C))->a4;
		((T99*)(C))->a4 = T1405c3(a1);
		T1405f4(GE_void(l1), ((T99*)(C))->a4);
		((T99*)(C))->a5 = ((T6)((((T99*)(C))->a5)+((T6)(GE_int32(1)))));
	}
}

/* DS_LINKABLE [XM_NODE].make */
T0* T1405c3(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1405));
	*(T1405*)C = GE_default1405;
	((T1405*)(C))->a2 = a1;
	return C;
}

/* XM_DOCUMENT.is_empty */
T1 T99f13(T0* C)
{
	T1 R = 0;
	R = ((((T99*)(C))->a5)==((T6)(GE_int32(0))));
	return R;
}

/* XM_DOCUMENT.before_addition */
void T99f19(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T284x10312(GE_void(a1)));
		t1 = ((t2)!=(EIF_VOID));
		if (t1) {
			t2 = (T284x10312(GE_void(a1)));
			if (((T0*)(GE_void(t2)))->id==99) {
				T99f21(t2, a1);
			} else {
				T100f39(t2, a1);
			}
		}
		T284x10320T0(GE_void(a1), C);
	}
}

/* XM_ELEMENT.equality_delete */
void T100f39(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T100f8(C));
	T283f10(GE_void(l1));
	t1 = (((T283*)(GE_void(l1)))->a1);
	while (!(t1)) {
		t2 = (T283f8(GE_void(l1)));
		t1 = ((t2)==(a1));
		if (t1) {
			T283f14(GE_void(l1));
		} else {
			T283f11(GE_void(l1));
		}
		t1 = (((T283*)(GE_void(l1)))->a1);
	}
}

/* DS_LINKED_LIST_CURSOR [XM_NODE].remove */
void T283f14(T0* C)
{
	if (((T0*)(GE_void(((T283*)(C))->a4)))->id==100) {
		T100f31(((T283*)(C))->a4, C);
	} else {
		T99f26(((T283*)(C))->a4, C);
	}
}

/* XM_DOCUMENT.remove_at_cursor */
void T99f26(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	t1 = (T283f6(a1));
	if (t1) {
		T99f30(C);
	} else {
		t1 = (T283f7(a1));
		if (t1) {
			T99f31(C);
		} else {
			l1 = (((T283*)(a1))->a2);
			l2 = (((T1405*)(GE_void(l1)))->a1);
			t1 = ((l2)==(((T99*)(C))->a4));
			if (t1) {
				T99f32(C, l1);
			} else {
				t2 = (((T1405*)(GE_void(l2)))->a1);
				T1405f4(GE_void(l1), t2);
			}
			t2 = (((T1405*)(GE_void(l2)))->a2);
			T1405f6(GE_void(l1), t2);
			((T99*)(C))->a5 = ((T6)((((T99*)(C))->a5)-((T6)(GE_int32(1)))));
			T99f33(C, l2, l1);
		}
	}
}

/* XM_DOCUMENT.move_all_cursors */
void T99f33(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = ((T99*)(C))->a2;
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		t2 = (((T283*)(GE_void(l1)))->a2);
		t1 = ((t2)==(a1));
		if (t1) {
			T283f13(GE_void(l1), a2);
		}
		l1 = (((T283*)(GE_void(l1)))->a3);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* XM_DOCUMENT.set_last_cell */
void T99f32(T0* C, T0* a1)
{
	T1405f5(GE_void(a1));
	((T99*)(C))->a4 = a1;
}

/* XM_DOCUMENT.remove_last */
void T99f31(T0* C)
{
	T0* l1 = 0;
	T6 l2 = 0;
	T1 t1;
	t1 = ((((T99*)(C))->a5)==((T6)(GE_int32(1))));
	if (t1) {
		T99f34(C);
	} else {
		T99f36(C);
		l1 = ((T99*)(C))->a3;
		l2 = ((T99*)(C))->a5;
		t1 = ((l2)==((T6)(GE_int32(2))));
		while (!(t1)) {
			l1 = (((T1405*)(GE_void(l1)))->a1);
			l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
			t1 = ((l2)==((T6)(GE_int32(2))));
		}
		T99f32(C, l1);
		((T99*)(C))->a5 = ((T6)((((T99*)(C))->a5)-((T6)(GE_int32(1)))));
	}
}

/* XM_DOCUMENT.move_last_cursors_after */
void T99f36(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	l1 = ((T99*)(C))->a2;
	l4 = ((T99*)(C))->a4;
	t1 = (((T283*)(GE_void(l1)))->a2);
	t2 = ((t1)==(l4));
	if (t2) {
		T283f15(GE_void(l1));
	}
	l2 = l1;
	l1 = (((T283*)(GE_void(l1)))->a3);
	t2 = ((l1)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T283*)(GE_void(l1)))->a2);
		t2 = ((t1)==(l4));
		if (t2) {
			T283f15(GE_void(l1));
			l3 = (((T283*)(GE_void(l1)))->a3);
			T283f16(GE_void(l2), l3);
			T283f16(GE_void(l1), EIF_VOID);
			l1 = l3;
		} else {
			l2 = l1;
			l1 = (((T283*)(GE_void(l1)))->a3);
		}
		t2 = ((l1)==(EIF_VOID));
	}
}

/* XM_DOCUMENT.wipe_out */
void T99f34(T0* C)
{
	T99f37(C);
	((T99*)(C))->a3 = EIF_VOID;
	((T99*)(C))->a4 = EIF_VOID;
	((T99*)(C))->a5 = (T6)(GE_int32(0));
}

/* XM_DOCUMENT.move_all_cursors_after */
void T99f37(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = ((T99*)(C))->a2;
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T283f15(GE_void(l1));
		l2 = (((T283*)(GE_void(l1)))->a3);
		T283f16(GE_void(l1), EIF_VOID);
		l1 = l2;
		t1 = ((l1)==(EIF_VOID));
	}
}

/* XM_DOCUMENT.remove_first */
void T99f30(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	t1 = ((((T99*)(C))->a5)==((T6)(GE_int32(1))));
	if (t1) {
		T99f34(C);
	} else {
		l1 = (((T1405*)(GE_void(((T99*)(C))->a3)))->a1);
		T99f33(C, ((T99*)(C))->a3, l1);
		T99f35(C, l1);
		((T99*)(C))->a5 = ((T6)((((T99*)(C))->a5)-((T6)(GE_int32(1)))));
	}
}

/* XM_DOCUMENT.set_first_cell */
void T99f35(T0* C, T0* a1)
{
	((T99*)(C))->a3 = a1;
}

/* XM_DOCUMENT.equality_delete */
void T99f21(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T99f9(C));
	T283f10(GE_void(l1));
	t1 = (((T283*)(GE_void(l1)))->a1);
	while (!(t1)) {
		t2 = (T283f8(GE_void(l1)));
		t1 = ((t2)==(a1));
		if (t1) {
			T283f14(GE_void(l1));
		} else {
			T283f11(GE_void(l1));
		}
		t1 = (((T283*)(GE_void(l1)))->a1);
	}
}

/* XM_DOCUMENT.new_cursor */
T0* T99f9(T0* C)
{
	T0* R = 0;
	R = T283c9(C);
	return R;
}

/* XM_DOCUMENT.list_make */
void T99f17(T0* C)
{
	((T99*)(C))->a2 = (T99f9(C));
}

/* XM_ELEMENT.make */
T0* T100c29(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T100));
	*(T100*)C = GE_default100;
	((T100*)(C))->a1 = a1;
	((T100*)(C))->a2 = a2;
	((T100*)(C))->a3 = a3;
	T100f33(C);
	return C;
}

/* XM_ELEMENT.list_make */
void T100f33(T0* C)
{
	((T100*)(C))->a7 = (T100f8(C));
}

/* XM_DOCUMENT.default_ns */
unsigned char ge1231os10321 = '\0';
T0* ge1231ov10321;
T0* T99f7(T0* C)
{
	T0* R = 0;
	if (ge1231os10321) {
		return ge1231ov10321;
	} else {
		ge1231os10321 = '\1';
	}
	R = T1307c9();
	ge1231ov10321 = R;
	return R;
}

/* XM_NAMESPACE.make_default */
T0* T1307c9(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1307));
	*(T1307*)C = GE_default1307;
	T1307f8(C, GE_ms("", 0), GE_ms("", 0));
	return C;
}

/* XM_NAMESPACE.make */
void T1307f8(T0* C, T0* a1, T0* a2)
{
	((T1307*)(C))->a2 = a1;
	((T1307*)(C))->a1 = a2;
}

/* XM_NAMESPACE.make */
T0* T1307c8(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1307));
	*(T1307*)C = GE_default1307;
	((T1307*)(C))->a2 = a1;
	((T1307*)(C))->a1 = a2;
	return C;
}

/* XM_STOP_ON_ERROR_FILTER.on_start */
void T104f6(T0* C)
{
	((T104*)(C))->a1 = EIF_FALSE;
	((T104*)(C))->a2 = EIF_VOID;
	T104f6p1(C);
}

/* XM_STOP_ON_ERROR_FILTER.on_start */
void T104f6p1(T0* C)
{
	T1 t1;
	t1 = ((((T104*)(C))->a3)==(EIF_VOID));
	if (t1) {
		((T104*)(C))->a3 = T344c1();
	}
	T113x10650(GE_void(((T104*)(C))->a3));
}

/* XM_CALLBACKS_NULL.on_comment */
void T344f4(T0* C, T0* a1)
{
}

/* XM_NAMESPACE_RESOLVER.on_comment */
void T341f28(T0* C, T0* a1)
{
	T113x10655T0(GE_void(((T341*)(C))->a1), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_comment */
void T105f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = ((((T105*)(C))->a5)==(EIF_VOID));
	if (t1) {
		l1 = T1304c3(((T105*)(C))->a2, a1);
	} else {
		l1 = T1304c4(((T105*)(C))->a5, a1);
	}
	T105f22(C, l1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.handle_position */
void T105f22(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T105f8(C));
	if (t1) {
		t2 = (T111f128(GE_void(((T105*)(C))->a4)));
		T101f4(GE_void(((T105*)(C))->a1), t2, a1);
	}
}

/* XM_POSITION_TABLE.put */
void T101f4(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	l1 = T946c3(a1, a2);
	T945f14(GE_void(((T101*)(C))->a1), l1);
}

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].put_last */
void T945f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = (T945f5(C));
	if (t1) {
		((T945*)(C))->a2 = T1328c3(a1);
		((T945*)(C))->a3 = ((T945*)(C))->a2;
		((T945*)(C))->a4 = (T6)(GE_int32(1));
	} else {
		l1 = ((T945*)(C))->a3;
		((T945*)(C))->a3 = T1328c3(a1);
		T1328f4(GE_void(l1), ((T945*)(C))->a3);
		((T945*)(C))->a4 = ((T6)((((T945*)(C))->a4)+((T6)(GE_int32(1)))));
	}
}

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].put_right */
void T1328f4(T0* C, T0* a1)
{
	((T1328*)(C))->a2 = a1;
}

/* DS_LINKABLE [DS_PAIR [XM_POSITION, XM_NODE]].make */
T0* T1328c3(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1328));
	*(T1328*)C = GE_default1328;
	((T1328*)(C))->a1 = a1;
	return C;
}

/* DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]].is_empty */
T1 T945f5(T0* C)
{
	T1 R = 0;
	R = ((((T945*)(C))->a4)==((T6)(GE_int32(0))));
	return R;
}

/* DS_PAIR [XM_POSITION, XM_NODE].make */
T0* T946c3(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T946));
	*(T946*)C = GE_default946;
	((T946*)(C))->a1 = a1;
	((T946*)(C))->a2 = a2;
	return C;
}

/* XM_CALLBACKS_TO_TREE_FILTER.is_position_table_enabled */
T1 T105f8(T0* C)
{
	T1 R = 0;
	R = ((((T105*)(C))->a1)!=(EIF_VOID));
	return R;
}

/* XM_COMMENT.make_last */
T0* T1304c4(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1304));
	*(T1304*)C = GE_default1304;
	((T1304*)(C))->a1 = a2;
	T100f28(a1, C);
	return C;
}

/* XM_ELEMENT.force_last */
void T100f28(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = (T100f16(C));
	if (!(t1)) {
		t2 = (T100f17(C));
		t1 = ((t2)!=(a1));
	}
	if (t1) {
		T100f28p1(C, a1);
	}
}

/* XM_ELEMENT.force_last */
void T100f28p1(T0* C, T0* a1)
{
	T100f34(C, a1);
	T100f28p0(C, a1);
}

/* XM_ELEMENT.force_last */
void T100f28p0(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = (T100f16(C));
	if (t1) {
		((T100*)(C))->a4 = T1405c3(a1);
		((T100*)(C))->a5 = ((T100*)(C))->a4;
		((T100*)(C))->a6 = (T6)(GE_int32(1));
	} else {
		l1 = ((T100*)(C))->a5;
		((T100*)(C))->a5 = T1405c3(a1);
		T1405f4(GE_void(l1), ((T100*)(C))->a5);
		((T100*)(C))->a6 = ((T6)((((T100*)(C))->a6)+((T6)(GE_int32(1)))));
	}
}

/* XM_ELEMENT.before_addition */
void T100f34(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T284x10312(a1));
		t1 = ((t2)!=(EIF_VOID));
		if (t1) {
			t2 = (T284x10312(a1));
			if (((T0*)(GE_void(t2)))->id==99) {
				T99f21(t2, a1);
			} else {
				T100f39(t2, a1);
			}
		}
		T284x10320T0(a1, C);
	}
}

/* XM_ELEMENT.last */
T0* T100f17(T0* C)
{
	T0* R = 0;
	R = (((T1405*)(GE_void(((T100*)(C))->a5)))->a2);
	return R;
}

/* XM_ELEMENT.is_empty */
T1 T100f16(T0* C)
{
	T1 R = 0;
	R = ((((T100*)(C))->a6)==((T6)(GE_int32(0))));
	return R;
}

/* XM_COMMENT.make_last_in_document */
T0* T1304c3(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1304));
	*(T1304*)C = GE_default1304;
	((T1304*)(C))->a1 = a2;
	T99f18(GE_void(a1), C);
	return C;
}

/* XM_STOP_ON_ERROR_FILTER.on_comment */
void T104f8(T0* C, T0* a1)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f8p1(C, a1);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_comment */
void T104f8p1(T0* C, T0* a1)
{
	T113x10655T0(GE_void(((T104*)(C))->a3), a1);
}

/* XM_CALLBACKS_NULL.on_processing_instruction */
void T344f5(T0* C, T0* a1, T0* a2)
{
}

/* XM_NAMESPACE_RESOLVER.on_processing_instruction */
void T341f29(T0* C, T0* a1, T0* a2)
{
	T113x10654T0T0(GE_void(((T341*)(C))->a1), a1, a2);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_processing_instruction */
void T105f15(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T1 t1;
	t1 = ((((T105*)(C))->a5)==(EIF_VOID));
	if (t1) {
		l1 = T1305c4(((T105*)(C))->a2, a1, a2);
	} else {
		l1 = T1305c5(((T105*)(C))->a5, a1, a2);
	}
	T105f22(C, l1);
}

/* XM_PROCESSING_INSTRUCTION.make_last */
T0* T1305c5(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1305));
	*(T1305*)C = GE_default1305;
	((T1305*)(C))->a1 = a2;
	((T1305*)(C))->a2 = a3;
	T100f28(a1, C);
	return C;
}

/* XM_PROCESSING_INSTRUCTION.make_last_in_document */
T0* T1305c4(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1305));
	*(T1305*)C = GE_default1305;
	((T1305*)(C))->a1 = a2;
	((T1305*)(C))->a2 = a3;
	T99f18(GE_void(a1), C);
	return C;
}

/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
void T104f9(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f9p1(C, a1, a2);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_processing_instruction */
void T104f9p1(T0* C, T0* a1, T0* a2)
{
	T113x10654T0T0(GE_void(((T104*)(C))->a3), a1, a2);
}

/* XM_CALLBACKS_NULL.on_content */
void T344f6(T0* C, T0* a1)
{
}

/* XM_NAMESPACE_RESOLVER.on_content */
void T341f30(T0* C, T0* a1)
{
	T113x10660T0(GE_void(((T341*)(C))->a1), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_content */
void T105f16(T0* C, T0* a1)
{
	T0* l1 = 0;
	l1 = T1306c3(((T105*)(C))->a5, a1);
	T105f22(C, l1);
}

/* XM_CHARACTER_DATA.make_last */
T0* T1306c3(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1306));
	*(T1306*)C = GE_default1306;
	((T1306*)(C))->a1 = a2;
	T100f28(a1, C);
	return C;
}

/* XM_STOP_ON_ERROR_FILTER.on_content */
void T104f10(T0* C, T0* a1)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f10p1(C, a1);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_content */
void T104f10p1(T0* C, T0* a1)
{
	T113x10660T0(GE_void(((T104*)(C))->a3), a1);
}

/* XM_CALLBACKS_NULL.on_start_tag */
void T344f9(T0* C, T0* a1, T0* a2, T0* a3)
{
}

/* XM_NAMESPACE_RESOLVER.on_start_tag */
void T341f33(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1013f12(GE_void(((T341*)(C))->a2));
	((T341*)(C))->a3 = a2;
	((T341*)(C))->a4 = a3;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.push */
void T1013f12(T0* C)
{
	T0* t1;
	t1 = (T1013f8(C));
	T1281f11(GE_void(((T1013*)(C))->a1), t1);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].force_last */
void T1281f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = (T1281f6(C));
	if (t1) {
		((T1281*)(C))->a4 = T1388c4(a1);
		((T1281*)(C))->a2 = ((T1281*)(C))->a4;
		((T1281*)(C))->a1 = (T6)(GE_int32(1));
	} else {
		l1 = ((T1281*)(C))->a2;
		((T1281*)(C))->a2 = T1388c4(a1);
		T1388f5(GE_void(l1), ((T1281*)(C))->a2);
		((T1281*)(C))->a1 = ((T6)((((T1281*)(C))->a1)+((T6)(GE_int32(1)))));
	}
}

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].put_right */
void T1388f5(T0* C, T0* a1)
{
	((T1388*)(C))->a3 = a1;
	T1388f6(GE_void(a1), C);
}

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].attach_left */
void T1388f6(T0* C, T0* a1)
{
	((T1388*)(C))->a2 = a1;
}

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].make */
T0* T1388c4(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1388));
	*(T1388*)C = GE_default1388;
	((T1388*)(C))->a1 = a1;
	return C;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].is_empty */
T1 T1281f6(T0* C)
{
	T1 R = 0;
	R = ((((T1281*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.new_string_string_table */
T0* T1013f8(T0* C)
{
	T0* R = 0;
	T0* t1;
	R = T45c101();
	t1 = (T1013f9(C));
	T45f53(GE_void(R), t1);
	t1 = (T1013f9(C));
	T45f102(GE_void(R), t1);
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].set_equality_tester */
void T45f102(T0* C, T0* a1)
{
	((T45*)(C))->a8 = a1;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.string_equality_tester */
T0* T1013f9(T0* C)
{
	T0* R = 0;
	if (ge340os1590) {
		return ge340ov1590;
	} else {
		ge340os1590 = '\1';
	}
	R = T48c3();
	ge340ov1590 = R;
	return R;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].make_map_default */
T0* T45c101(void)
{
	T0* C;
	T6 t1;
	C = (T0*)GE_alloc(sizeof(T45));
	*(T45*)C = GE_default45;
	t1 = (T45f51(C));
	T45f52(C, t1);
	return C;
}

/* DS_HASH_TABLE [STRING_8, STRING_8].default_capacity */
T6 T45f51(T0* C)
{
	T6 R = 0;
	R = (T6)(GE_int32(10));
	return R;
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag */
void T105f17(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	t1 = ((((T105*)(C))->a5)==(EIF_VOID));
	if (t1) {
		t2 = (T105f7(C, a1, a2));
		l1 = T100c26(((T105*)(C))->a2, a3, t2);
	} else {
		t2 = (T105f7(C, a1, a2));
		l1 = T100c27(((T105*)(C))->a5, a3, t2);
	}
	((T105*)(C))->a5 = l1;
	T105f22(C, ((T105*)(C))->a5);
}

/* XM_ELEMENT.make_last */
T0* T100c27(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T100));
	*(T100*)C = GE_default100;
	((T100*)(C))->a2 = a2;
	((T100*)(C))->a3 = a3;
	T100f33(C);
	T100f28(a1, C);
	return C;
}

/* XM_ELEMENT.make_root */
T0* T100c26(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T100));
	*(T100*)C = GE_default100;
	((T100*)(C))->a2 = a2;
	((T100*)(C))->a3 = a3;
	T100f33(C);
	T99f20(GE_void(a1), C);
	return C;
}

/* XM_DOCUMENT.set_root_element */
void T99f20(T0* C, T0* a1)
{
	T99f27(C);
	((T99*)(C))->a1 = a1;
	T99f18(C, a1);
}

/* XM_DOCUMENT.remove_previous_root_element */
void T99f27(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T99f9(C));
	T283f10(GE_void(l1));
	t1 = (((T283*)(GE_void(l1)))->a1);
	while (!(t1)) {
		t2 = (T283f8(GE_void(l1)));
		t1 = ((t2)==(((T99*)(C))->a1));
		if (t1) {
			T283f14(GE_void(l1));
			T283f12(GE_void(l1));
		} else {
			T283f11(GE_void(l1));
		}
		t1 = (((T283*)(GE_void(l1)))->a1);
	}
}

/* XM_CALLBACKS_TO_TREE_FILTER.new_namespace */
T0* T105f7(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	R = T1307c8(a2, a1);
	t1 = (T1303f27(GE_void(((T105*)(C))->a6), R));
	if (t1) {
		t2 = (T1303f24(GE_void(((T105*)(C))->a6), R));
		t1 = (T1307f7(GE_void(t2), R));
	}
	if (t1) {
		R = (T1303f24(GE_void(((T105*)(C))->a6), R));
	} else {
		T1303f32(GE_void(((T105*)(C))->a6), R);
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].force_last */
void T1303f32(T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	T1303f35(C);
	T1303f33(C, a1);
	t1 = ((((T1303*)(C))->a1)!=((T6)(GE_int32(0))));
	if (t1) {
		T1303f36(C, a1, ((T1303*)(C))->a1);
	} else {
		l1 = ((T6)((((T1303*)(C))->a4)+((T6)(GE_int32(1)))));
		t1 = (T6f1(&l1, ((T1303*)(C))->a5));
		if (t1) {
			t2 = (T1303f21(C, l1));
			T1303f37(C, t2);
			l2 = (T1303f22(C, a1));
		} else {
			l2 = ((T1303*)(C))->a6;
		}
		t2 = (T1303f26(C, l2));
		T1303f38(C, t2, l1);
		T1303f39(C, l1, l2);
		T1303f36(C, a1, l1);
		((T1303*)(C))->a4 = l1;
		((T1303*)(C))->a7 = ((T6)((((T1303*)(C))->a7)+((T6)(GE_int32(1)))));
	}
}

/* DS_HASH_SET [XM_NAMESPACE].slots_put */
void T1303f39(T0* C, T6 a1, T6 a2)
{
	((T117*)(GE_void(((T1303*)(C))->a14)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_put */
void T1303f38(T0* C, T6 a1, T6 a2)
{
	((T117*)(GE_void(((T1303*)(C))->a13)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].slots_item */
T6 T1303f26(T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T117*)(GE_void(((T1303*)(C))->a14)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].hash_position */
T6 T1303f22(T0* C, T0* a1)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T1307f5(GE_void(a1)));
		R = ((T6)((t2)%(((T1303*)(C))->a8)));
	} else {
		R = ((T1303*)(C))->a8;
	}
	return R;
}

/* XM_NAMESPACE.hash_code */
T6 T1307f5(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = ((((T1307*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(((T1307*)(C))->a1)))->id==17)?T17f15(((T1307*)(C))->a1):T948f13(((T1307*)(C))->a1)));
	}
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].resize */
void T1303f37(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T1303f35(C);
	l1 = (T1303f20(C, a1));
	t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	T1303f44(C, t1);
	l2 = ((T1303*)(C))->a8;
	t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
	while (!(t2)) {
		T1303f39(C, (T6)(GE_int32(0)), l2);
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l2)<((T6)(GE_int32(0)))));
	}
	((T1303*)(C))->a8 = l1;
	l2 = ((T1303*)(C))->a4;
	t2 = ((T1)((l2)<((T6)(GE_int32(1)))));
	while (!(t2)) {
		t1 = (T1303f19(C, l2));
		t2 = (T6f1(&t1, (T6)(GE_int32(-1))));
		if (t2) {
			t3 = (T1303f18(C, l2));
			l3 = (T1303f22(C, t3));
			t1 = (T1303f26(C, l3));
			T1303f38(C, t1, l2);
			T1303f39(C, l2, l3);
		}
		l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
		t2 = ((T1)((l2)<((T6)(GE_int32(1)))));
	}
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T1303f45(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T1303f46(C, t1);
	t1 = ((T6)((a1)+((T6)(GE_int32(1)))));
	T1303f47(C, t1);
	((T1303*)(C))->a5 = a1;
	((T1303*)(C))->a1 = (T6)(GE_int32(0));
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_resize */
void T1303f47(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T1303f29(C));
	((T1303*)(C))->a13 = (T119f1(GE_void(t1), ((T1303*)(C))->a13, a1));
}

/* DS_HASH_SET [XM_NAMESPACE].key_storage_resize */
void T1303f46(T0* C, T6 a1)
{
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_resize */
void T1303f45(T0* C, T6 a1)
{
	((T1303*)(C))->a2 = (T1434f2(GE_void(((T1303*)(C))->a15), ((T1303*)(C))->a2, a1));
}

/* KL_SPECIAL_ROUTINES [XM_NAMESPACE].resize */
T0* T1434f2(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1431*)(a1))->z1);
	t2 = (T6f1(&a2, t1));
	if (t2) {
		R = (T1431f3(a1, a2));
	} else {
		R = a1;
	}
	return R;
}

/* SPECIAL [XM_NAMESPACE].resized_area */
T0* T1431f3(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	R = T1431c4(a1);
	t1 = (((T1431*)(C))->z1);
	T1431f6(GE_void(R), C, (T6)(GE_int32(0)), (T6)(GE_int32(0)), t1);
	return R;
}

/* SPECIAL [XM_NAMESPACE].copy_data */
void T1431f6(T0* C, T0* a1, T6 a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		T1431f7(C, a2, a3, a4);
	} else {
		l1 = a2;
		l2 = a3;
		l3 = ((T6)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T1431*)(a1))->z2[l1]);
			((T1431*)(C))->z2[l2] = (t2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [XM_NAMESPACE].move_data */
void T1431f7(T0* C, T6 a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T6f1(&a1, a2));
		if (t1) {
			t2 = ((T6)((a2)+(a3)));
			t1 = ((T1)((t2)<(a1)));
			if (t1) {
				T1431f8(C, a1, a2, a3);
			} else {
				T1431f9(C, a1, a2, a3);
			}
		} else {
			t2 = ((T6)((a1)+(a3)));
			t1 = ((T1)((t2)<(a2)));
			if (t1) {
				T1431f8(C, a1, a2, a3);
			} else {
				T1431f9(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [XM_NAMESPACE].overlapping_move */
void T1431f9(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((T1)((a1)<(a2)));
	if (t1) {
		t2 = ((T6)((a1)+(a3)));
		l1 = ((T6)((t2)-((T6)(GE_int32(1)))));
		l2 = ((T6)((a1)-((T6)(GE_int32(1)))));
		l3 = ((T6)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T1431*)(C))->z2[l1]);
			t2 = ((T6)((l1)+(l3)));
			((T1431*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = a1;
		l2 = ((T6)((a1)+(a3)));
		l3 = ((T6)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T1431*)(C))->z2[l1]);
			t2 = ((T6)((l1)-(l3)));
			((T1431*)(C))->z2[t2] = (t3);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [XM_NAMESPACE].non_overlapping_move */
void T1431f8(T0* C, T6 a1, T6 a2, T6 a3)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	l1 = a1;
	l2 = ((T6)((a1)+(a3)));
	l3 = ((T6)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T1431*)(C))->z2[l1]);
		t3 = ((T6)((l1)+(l3)));
		((T1431*)(C))->z2[t3] = (t2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* DS_HASH_SET [XM_NAMESPACE].key_storage_item */
T0* T1303f18(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T1303f16(C, a1));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_item */
T0* T1303f16(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T1431*)(GE_void(((T1303*)(C))->a2)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].clashes_item */
T6 T1303f19(T0* C, T6 a1)
{
	T6 R = 0;
	R = (((T117*)(GE_void(((T1303*)(C))->a13)))->z2[a1]);
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].slots_resize */
void T1303f44(T0* C, T6 a1)
{
	T0* t1;
	t1 = (T1303f29(C));
	((T1303*)(C))->a14 = (T119f1(GE_void(t1), ((T1303*)(C))->a14, a1));
}

/* DS_HASH_SET [XM_NAMESPACE].new_capacity */
T6 T1303f21(T0* C, T6 a1)
{
	T6 R = 0;
	T6 t1;
	t1 = (T6)(GE_int32(2));
	R = ((T6)((t1)*(a1)));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item_storage_put */
void T1303f36(T0* C, T0* a1, T6 a2)
{
	((T1431*)(GE_void(((T1303*)(C))->a2)))->z2[a2] = (a1);
}

/* DS_HASH_SET [XM_NAMESPACE].search_position */
void T1303f33(T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T1303*)(C))->a1 = (T1303f26(C, ((T1303*)(C))->a8));
		((T1303*)(C))->a6 = ((T1303*)(C))->a8;
		((T1303*)(C))->a9 = (T6)(GE_int32(0));
	} else {
		l4 = (T1303f17(C));
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T1303*)(C))->a1)==((T6)(GE_int32(0))));
			if (!(t1)) {
				t2 = (T1303f18(C, ((T1303*)(C))->a1));
				t3 = (T1432f1(GE_void(l4), a1, t2));
				t1 = ((T1)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T1432f1(GE_void(l4), a1, l3));
			}
			if (t1) {
				((T1303*)(C))->a6 = (T1303f22(C, a1));
				l1 = (T1303f26(C, ((T1303*)(C))->a6));
				((T1303*)(C))->a1 = (T6)(GE_int32(0));
				l2 = (T6)(GE_int32(0));
				t1 = ((l1)==((T6)(GE_int32(0))));
				while (!(t1)) {
					t2 = (T1303f18(C, l1));
					t1 = (T1432f1(GE_void(l4), a1, t2));
					if (t1) {
						((T1303*)(C))->a1 = l1;
						l1 = (T6)(GE_int32(0));
					} else {
						l2 = l1;
						l1 = (T1303f19(C, l1));
					}
					t1 = ((l1)==((T6)(GE_int32(0))));
				}
				((T1303*)(C))->a9 = l2;
			}
		} else {
			t1 = ((((T1303*)(C))->a1)==((T6)(GE_int32(0))));
			if (!(t1)) {
				t2 = (T1303f18(C, ((T1303*)(C))->a1));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T1303*)(C))->a6 = (T1303f22(C, a1));
				l1 = (T1303f26(C, ((T1303*)(C))->a6));
				((T1303*)(C))->a1 = (T6)(GE_int32(0));
				l2 = (T6)(GE_int32(0));
				t1 = ((l1)==((T6)(GE_int32(0))));
				while (!(t1)) {
					t2 = (T1303f18(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T1303*)(C))->a1 = l1;
						l1 = (T6)(GE_int32(0));
					} else {
						l2 = l1;
						l1 = (T1303f19(C, l1));
					}
					t1 = ((l1)==((T6)(GE_int32(0))));
				}
				((T1303*)(C))->a9 = l2;
			}
		}
	}
}

/* KL_EQUALITY_TESTER [XM_NAMESPACE].test */
T1 T1432f1(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t2 = (T1432f2(C));
				R = (T79f2(GE_void(t2), a1, a2));
			}
		}
	}
	return R;
}

/* KL_EQUALITY_TESTER [XM_NAMESPACE].any_ */
T0* T1432f2(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].key_equality_tester */
T0* T1303f17(T0* C)
{
	T0* R = 0;
	R = ((T1303*)(C))->a3;
	return R;
}

/* XM_NAMESPACE.same_prefix */
T1 T1307f7(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	t1 = (T1307f4(C, a1));
	if (t1) {
		t2 = (((T1307*)(GE_void(a1)))->a2);
		t1 = ((((T1307*)(C))->a2)==(t2));
		if (!(t1)) {
			t1 = ((((T1307*)(C))->a2)!=(EIF_VOID));
			if (t1) {
				t2 = (((T1307*)(GE_void(a1)))->a2);
				t1 = ((t2)!=(EIF_VOID));
			}
			if (t1) {
				t2 = (T1307f3(C));
				t3 = (((T1307*)(GE_void(a1)))->a2);
				R = (T26f1(GE_void(t2), ((T1307*)(C))->a2, t3));
			} else {
				R = EIF_FALSE;
			}
		} else {
			R = EIF_TRUE;
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE.string_ */
T0* T1307f3(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].item */
T0* T1303f24(T0* C, T0* a1)
{
	T0* R = 0;
	T1303f33(C, a1);
	R = (T1303f16(C, ((T1303*)(C))->a1));
	return R;
}

/* DS_HASH_SET [XM_NAMESPACE].has */
T1 T1303f27(T0* C, T0* a1)
{
	T1 R = 0;
	T1303f33(C, a1);
	R = ((((T1303*)(C))->a1)!=((T6)(GE_int32(0))));
	return R;
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
void T104f11(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f11p1(C, a1, a2, a3);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag */
void T104f11p1(T0* C, T0* a1, T0* a2, T0* a3)
{
	T113x10656T0T0T0(GE_void(((T104*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_NULL.on_end_tag */
void T344f8(T0* C, T0* a1, T0* a2, T0* a3)
{
}

/* XM_NAMESPACE_RESOLVER.on_end_tag */
void T341f32(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	T0* t2;
	t1 = (T341f9(C, a2));
	if (t1) {
		t2 = (T1013f2(GE_void(((T341*)(C))->a2), a2));
		T341f32p1(C, t2, a2, a3);
	} else {
		t2 = (T1013f3(GE_void(((T341*)(C))->a2)));
		T341f32p1(C, t2, a2, a3);
	}
	T1013f11(GE_void(((T341*)(C))->a2));
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.pop */
void T1013f11(T0* C)
{
	T6 t1;
	T1 t2;
	t1 = (((T1281*)(GE_void(((T1013*)(C))->a1)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		T1281f10(GE_void(((T1013*)(C))->a1));
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_last */
void T1281f10(T0* C)
{
	T1 t1;
	T0* t2;
	t1 = ((((T1281*)(C))->a1)==((T6)(GE_int32(1))));
	if (t1) {
		T1281f12(C);
	} else {
		T1281f13(C);
		t2 = (((T1388*)(GE_void(((T1281*)(C))->a2)))->a2);
		T1281f14(C, t2);
		((T1281*)(C))->a1 = ((T6)((((T1281*)(C))->a1)-((T6)(GE_int32(1)))));
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].set_last_cell */
void T1281f14(T0* C, T0* a1)
{
	T1388f7(a1);
	((T1281*)(C))->a2 = a1;
}

/* DS_BILINKABLE [DS_HASH_TABLE [STRING_8, STRING_8]].forget_right */
void T1388f7(T0* C)
{
	((T1388*)(C))->a3 = EIF_VOID;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_last_cursors_after */
void T1281f13(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	l1 = ((T1281*)(C))->a3;
	l4 = ((T1281*)(C))->a2;
	t1 = (((T1282*)(GE_void(l1)))->a2);
	t2 = ((t1)==(l4));
	if (t2) {
		T1282f11(GE_void(l1));
	}
	l2 = l1;
	l1 = (((T1282*)(GE_void(l1)))->a3);
	t2 = ((l1)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T1282*)(GE_void(l1)))->a2);
		t2 = ((t1)==(l4));
		if (t2) {
			T1282f11(GE_void(l1));
			l3 = (((T1282*)(GE_void(l1)))->a3);
			T1282f12(GE_void(l2), l3);
			T1282f12(GE_void(l1), EIF_VOID);
			l1 = l3;
		} else {
			l2 = l1;
			l1 = (((T1282*)(GE_void(l1)))->a3);
		}
		t2 = ((l1)==(EIF_VOID));
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_next_cursor */
void T1282f12(T0* C, T0* a1)
{
	((T1282*)(C))->a3 = a1;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_after */
void T1282f11(T0* C)
{
	((T1282*)(C))->a2 = EIF_VOID;
	((T1282*)(C))->a1 = EIF_FALSE;
	((T1282*)(C))->a5 = EIF_TRUE;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].wipe_out */
void T1281f12(T0* C)
{
	T1281f15(C);
	((T1281*)(C))->a4 = EIF_VOID;
	((T1281*)(C))->a2 = EIF_VOID;
	((T1281*)(C))->a1 = (T6)(GE_int32(0));
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].move_all_cursors_after */
void T1281f15(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = ((T1281*)(C))->a3;
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T1282f11(GE_void(l1));
		l2 = (((T1282*)(GE_void(l1)))->a3);
		T1282f12(GE_void(l1), EIF_VOID);
		l1 = l2;
		t1 = ((l1)==(EIF_VOID));
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve_default */
T0* T1013f3(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T1013f7(C));
	R = (T1013f2(C, t1));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.default_pseudo_prefix */
unsigned char ge1205os25857 = '\0';
T0* ge1205ov25857;
T0* T1013f7(T0* C)
{
	T0* R = 0;
	if (ge1205os25857) {
		return ge1205ov25857;
	} else {
		ge1205os25857 = '\1';
	}
	R = T17c42();
	ge1205ov25857 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_end_tag */
void T341f32p1(T0* C, T0* a1, T0* a2, T0* a3)
{
	T113x10659T0T0T0(GE_void(((T341*)(C))->a1), a1, a2, a3);
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.resolve */
T0* T1013f2(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	R = (T1013f6(C));
	l1 = (T1281f7(GE_void(((T1013*)(C))->a1)));
	T1282f8(GE_void(l1));
	t1 = (((T1282*)(GE_void(l1)))->a1);
	while (!(t1)) {
		t2 = (T1282f6(GE_void(l1)));
		t1 = (T45f48(GE_void(t2), a1));
		if (t1) {
			t2 = (T1282f6(GE_void(l1)));
			R = (T45f44(GE_void(t2), a1));
			T1282f9(GE_void(l1));
		} else {
			T1282f10(GE_void(l1));
		}
		t1 = (((T1282*)(GE_void(l1)))->a1);
	}
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].back */
void T1282f10(T0* C)
{
	T1281f18(GE_void(((T1282*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_back */
void T1281f18(T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	t1 = (((T1282*)(a1))->a5);
	if (t1) {
		l1 = EIF_TRUE;
		l3 = ((T1281*)(C))->a2;
	} else {
		t2 = (((T1282*)(a1))->a2);
		l3 = (((T1388*)(GE_void(t2)))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T1282f13(a1, l3, l2, EIF_FALSE);
	if (l2) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			T1281f20(C, a1);
		}
	} else {
		if (l1) {
			T1281f19(C, a1);
		}
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].add_traversing_cursor */
void T1281f19(T0* C, T0* a1)
{
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T1281*)(C))->a3));
	if (t1) {
		t2 = (((T1282*)(GE_void(((T1281*)(C))->a3)))->a3);
		T1282f12(a1, t2);
		T1282f12(GE_void(((T1281*)(C))->a3), a1);
	}
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].remove_traversing_cursor */
void T1281f20(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(((T1281*)(C))->a3));
	if (t1) {
		l2 = ((T1281*)(C))->a3;
		l1 = (((T1282*)(GE_void(l2)))->a3);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = l1;
			l1 = (((T1282*)(GE_void(l1)))->a3);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T1282*)(a1))->a3);
			T1282f12(GE_void(l2), t2);
			T1282f12(a1, EIF_VOID);
		}
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set */
void T1282f13(T0* C, T0* a1, T1 a2, T1 a3)
{
	((T1282*)(C))->a2 = a1;
	((T1282*)(C))->a1 = a2;
	((T1282*)(C))->a5 = a3;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].go_before */
void T1282f9(T0* C)
{
	T1281f17(GE_void(((T1282*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_go_before */
void T1281f17(T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 t1;
	l1 = (T1281f8(C, a1));
	T1282f14(a1);
	t1 = ((T1)(!(l1)));
	if (t1) {
		T1281f20(C, a1);
	}
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].set_before */
void T1282f14(T0* C)
{
	((T1282*)(C))->a2 = EIF_VOID;
	((T1282*)(C))->a1 = EIF_TRUE;
	((T1282*)(C))->a5 = EIF_FALSE;
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_off */
T1 T1281f8(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	t1 = (((T1282*)(a1))->a2);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].item */
T0* T1282f6(T0* C)
{
	T0* R = 0;
	R = (((T1388*)(GE_void(((T1282*)(C))->a2)))->a1);
	return R;
}

/* DS_BILINKED_LIST_CURSOR [DS_HASH_TABLE [STRING_8, STRING_8]].finish */
void T1282f8(T0* C)
{
	T1281f16(GE_void(((T1282*)(C))->a4), C);
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].cursor_finish */
void T1281f16(T0* C, T0* a1)
{
	T1 l1 = 0;
	T1 l2 = 0;
	T1 t1;
	l1 = (T1281f8(C, a1));
	l2 = ((((T1281*)(C))->a2)==(EIF_VOID));
	T1282f13(a1, ((T1281*)(C))->a2, l2, EIF_FALSE);
	t1 = ((T1)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T1281f19(C, a1);
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.default_namespace */
unsigned char ge1205os25858 = '\0';
T0* ge1205ov25858;
T0* T1013f6(T0* C)
{
	T0* R = 0;
	if (ge1205os25858) {
		return ge1205ov25858;
	} else {
		ge1205os25858 = '\1';
	}
	R = T17c42();
	ge1205ov25858 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.has_prefix */
T1 T341f9(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (((((T0*)(a1))->id==17)?((T17*)(a1))->a2:((T948*)(a1))->a1));
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_end_tag */
void T105f19(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* t1;
	T1 t2;
	t1 = (((T100*)(GE_void(((T105*)(C))->a5)))->a1);
	t2 = (((((T0*)(GE_void(t1)))->id==99)?T99f10(t1):T100f22(t1)));
	if (t2) {
		((T105*)(C))->a5 = EIF_VOID;
	} else {
		((T105*)(C))->a5 = (T100f15(GE_void(((T105*)(C))->a5)));
	}
}

/* XM_ELEMENT.parent_element */
T0* T100f15(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T1406c10();
	if (((T0*)(GE_void(((T100*)(C))->a1)))->id==99) {
		T99f22(((T100*)(C))->a1, l1);
	} else {
		T100f40(((T100*)(C))->a1, l1);
	}
	R = (((T1406*)(GE_void(l1)))->a1);
	return R;
}

/* XM_DOCUMENT.process */
void T99f22(T0* C, T0* a1)
{
	T1406f12(GE_void(a1), C);
}

/* XM_NODE_TYPER.process_document */
void T1406f12(T0* C, T0* a1)
{
	T1406f13(C);
	((T1406*)(C))->a4 = a1;
	((T1406*)(C))->a3 = a1;
}

/* XM_ELEMENT.is_root_node */
T1 T100f22(T0* C)
{
	T1 R = 0;
	R = ((((T100*)(C))->a1)==(EIF_VOID));
	return R;
}

/* XM_DOCUMENT.is_root_node */
T1 T99f10(T0* C)
{
	T1 R = 0;
	R = ((((T99*)(C))->a6)==(EIF_VOID));
	return R;
}

/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
void T104f13(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f13p1(C, a1, a2, a3);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_end_tag */
void T104f13p1(T0* C, T0* a1, T0* a2, T0* a3)
{
	T113x10659T0T0T0(GE_void(((T104*)(C))->a3), a1, a2, a3);
}

/* XM_CALLBACKS_NULL.on_attribute */
void T344f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
}

/* XM_NAMESPACE_RESOLVER.on_attribute */
void T341f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	t1 = (T341f9(C, a2));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (T341f14(C, a3));
	}
	if (t1) {
		T1013f13(GE_void(((T341*)(C))->a2), a4);
		if (((T341*)(C))->a5) {
			T341f38(C, a2, a3, a4);
		}
	} else {
		t1 = (T341f14(C, a2));
		if (t1) {
			t1 = (T1013f4(GE_void(((T341*)(C))->a2), a2));
			if (t1) {
				T341f35(C, ge1204ov19948);
			} else {
				T1013f14(GE_void(((T341*)(C))->a2), a4, a3);
			}
			if (((T341*)(C))->a5) {
				T341f38(C, a2, a3, a4);
			}
		} else {
			T341f38(C, a2, a3, a4);
		}
	}
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.add */
void T1013f14(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	t1 = (T1281f5(GE_void(((T1013*)(C))->a1)));
	T45f103(GE_void(t1), a1, a2);
}

/* DS_HASH_TABLE [STRING_8, STRING_8].force_new */
void T45f103(T0* C, T0* a1, T0* a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T45f56(C);
	t1 = ((((T45*)(C))->a7)==(((T45*)(C))->a5));
	if (t1) {
		t2 = ((T6)((((T45*)(C))->a7)+((T6)(GE_int32(1)))));
		t2 = (T45f23(C, t2));
		T45f59(C, t2);
	}
	l1 = ((T45*)(C))->a16;
	t1 = ((l1)==((T6)(GE_int32(0))));
	if (t1) {
		((T45*)(C))->a4 = ((T6)((((T45*)(C))->a4)+((T6)(GE_int32(1)))));
		l1 = ((T45*)(C))->a4;
	} else {
		t2 = (T6)(GE_int32(-1));
		t3 = (T45f25(C, l1));
		((T45*)(C))->a16 = ((T6)((t2)-(t3)));
	}
	l2 = (T45f28(C, a2));
	t2 = (T45f22(C, l2));
	T45f60(C, t2, l1);
	T45f61(C, l1, l2);
	T45f58(C, a1, l1);
	T45f62(C, a2, l1);
	((T45*)(C))->a7 = ((T6)((((T45*)(C))->a7)+((T6)(GE_int32(1)))));
}

/* DS_BILINKED_LIST [DS_HASH_TABLE [STRING_8, STRING_8]].last */
T0* T1281f5(T0* C)
{
	T0* R = 0;
	R = (((T1388*)(GE_void(((T1281*)(C))->a2)))->a1);
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.shallow_has */
T1 T1013f4(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (((T1281*)(GE_void(((T1013*)(C))->a1)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		t3 = (T1281f5(GE_void(((T1013*)(C))->a1)));
		R = (T45f48(GE_void(t3), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.attributes_force */
void T341f38(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1015f7(GE_void(((T341*)(C))->a6), a1);
	T1015f7(GE_void(((T341*)(C))->a7), a2);
	T1015f7(GE_void(((T341*)(C))->a8), a3);
}

/* DS_LINKED_QUEUE [STRING_8].force */
void T1015f7(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	l1 = T340c3(a1);
	t1 = (T1015f4(C));
	if (t1) {
		((T1015*)(C))->a1 = l1;
		((T1015*)(C))->a3 = l1;
		((T1015*)(C))->a2 = (T6)(GE_int32(1));
	} else {
		T340f4(GE_void(((T1015*)(C))->a3), l1);
		((T1015*)(C))->a3 = l1;
		((T1015*)(C))->a2 = ((T6)((((T1015*)(C))->a2)+((T6)(GE_int32(1)))));
	}
}

/* DS_LINKED_QUEUE [STRING_8].is_empty */
T1 T1015f4(T0* C)
{
	T1 R = 0;
	R = ((((T1015*)(C))->a2)==((T6)(GE_int32(0))));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.add_default */
void T1013f13(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T1013f7(C));
	T1013f14(C, a1, t1);
}

/* XM_NAMESPACE_RESOLVER.is_xmlns */
T1 T341f14(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T341f20(C));
		R = (T341f21(C, t2, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.same_string */
T1 T341f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T341f24(C));
	R = (T48f1(GE_void(t1), a1, a2));
	return R;
}

/* XM_NAMESPACE_RESOLVER.string_equality_tester */
T0* T341f24(T0* C)
{
	T0* R = 0;
	if (ge340os1590) {
		return ge340ov1590;
	} else {
		ge340os1590 = '\1';
	}
	R = T48c3();
	ge340ov1590 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xmlns */
unsigned char ge1172os19186 = '\0';
T0* ge1172ov19186;
T0* T341f20(T0* C)
{
	T0* R = 0;
	if (ge1172os19186) {
		return ge1172ov19186;
	} else {
		ge1172os19186 = '\1';
	}
	R = GE_ms("xmlns", 5);
	ge1172ov19186 = R;
	return R;
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_attribute */
void T105f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T105f7(C, a1, a2));
	l1 = T282c5(a3, t1, a4, ((T105*)(C))->a5);
	T105f22(C, l1);
}

/* XM_ATTRIBUTE.make_last */
T0* T282c5(T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T282));
	*(T282*)C = GE_default282;
	((T282*)(C))->a1 = a1;
	((T282*)(C))->a2 = a2;
	((T282*)(C))->a3 = a3;
	T100f28(GE_void(a4), C);
	return C;
}

/* XM_STOP_ON_ERROR_FILTER.on_attribute */
void T104f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f15p1(C, a1, a2, a3, a4);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_attribute */
void T104f15p1(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T113x10657T0T0T0T0(GE_void(((T104*)(C))->a3), a1, a2, a3, a4);
}

/* XM_CALLBACKS_NULL.on_finish */
void T344f3(T0* C)
{
}

/* XM_NAMESPACE_RESOLVER.on_finish */
void T341f27(T0* C)
{
	T113x10651(GE_void(((T341*)(C))->a1));
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_finish */
void T105f13(T0* C)
{
	T113x10651(GE_void(((T105*)(C))->a3));
}

/* XM_STOP_ON_ERROR_FILTER.on_finish */
void T104f7(T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f7p1(C);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_finish */
void T104f7p1(T0* C)
{
	T113x10651(GE_void(((T104*)(C))->a3));
}

/* XM_CALLBACKS_NULL.on_start_tag_finish */
void T344f7(T0* C)
{
}

/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
void T341f31(T0* C)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	t1 = (T341f9(C, ((T341*)(C))->a3));
	if (t1) {
		t1 = (T1013f5(GE_void(((T341*)(C))->a2), ((T341*)(C))->a3));
		if (t1) {
			t2 = (T1013f2(GE_void(((T341*)(C))->a2), ((T341*)(C))->a3));
			T113x10656T0T0T0(GE_void(((T341*)(C))->a1), t2, ((T341*)(C))->a3, ((T341*)(C))->a4);
			T341f37(C);
		} else {
			t2 = (T341f11(C));
			l1 = (T26f9(GE_void(t2), ge1204ov19947));
			t2 = (T341f11(C));
			l1 = (T26f8(GE_void(t2), l1, GE_ms(" in tag <", 9)));
			t2 = (T341f11(C));
			l1 = (T26f8(GE_void(t2), l1, ((T341*)(C))->a3));
			t2 = (T341f11(C));
			l1 = (T26f8(GE_void(t2), l1, GE_ms(":", 1)));
			t2 = (T341f11(C));
			l1 = (T26f8(GE_void(t2), l1, ((T341*)(C))->a4));
			t2 = (T341f11(C));
			l1 = (T26f8(GE_void(t2), l1, GE_ms(">", 1)));
			T341f35(C, l1);
		}
	} else {
		t2 = (T1013f3(GE_void(((T341*)(C))->a2)));
		T113x10656T0T0T0(GE_void(((T341*)(C))->a1), t2, ((T341*)(C))->a3, ((T341*)(C))->a4);
		T341f37(C);
	}
	T341f31p1(C);
}

/* XM_NAMESPACE_RESOLVER.on_start_tag_finish */
void T341f31p1(T0* C)
{
	T113x10658(GE_void(((T341*)(C))->a1));
}

/* XM_NAMESPACE_RESOLVER.string_ */
T0* T341f11(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.on_delayed_attributes */
void T341f37(T0* C)
{
	T1 t1;
	T0* t2;
	T0* t3;
	T0* t4;
	T0* t5;
	t1 = (T341f15(C));
	while (!(t1)) {
		t2 = (T1015f5(GE_void(((T341*)(C))->a6)));
		t1 = (T341f9(C, t2));
		if (t1) {
			t2 = (T1015f5(GE_void(((T341*)(C))->a6)));
			t1 = (T1013f5(GE_void(((T341*)(C))->a2), t2));
			if (t1) {
				t2 = (T1015f5(GE_void(((T341*)(C))->a6)));
				t2 = (T1013f2(GE_void(((T341*)(C))->a2), t2));
				t3 = (T1015f5(GE_void(((T341*)(C))->a6)));
				t4 = (T1015f5(GE_void(((T341*)(C))->a7)));
				t5 = (T1015f5(GE_void(((T341*)(C))->a8)));
				T113x10657T0T0T0T0(GE_void(((T341*)(C))->a1), t2, t3, t4, t5);
			} else {
				t2 = (T1015f5(GE_void(((T341*)(C))->a6)));
				t1 = (T341f16(C, t2));
				if (t1) {
					t2 = (T341f17(C));
					t3 = (T1015f5(GE_void(((T341*)(C))->a6)));
					t4 = (T1015f5(GE_void(((T341*)(C))->a7)));
					t5 = (T1015f5(GE_void(((T341*)(C))->a8)));
					T113x10657T0T0T0T0(GE_void(((T341*)(C))->a1), t2, t3, t4, t5);
				} else {
					t2 = (T1015f5(GE_void(((T341*)(C))->a6)));
					t1 = (T341f14(C, t2));
					if (t1) {
						t2 = (T341f18(C));
						t3 = (T1015f5(GE_void(((T341*)(C))->a6)));
						t4 = (T1015f5(GE_void(((T341*)(C))->a7)));
						t5 = (T1015f5(GE_void(((T341*)(C))->a8)));
						T113x10657T0T0T0T0(GE_void(((T341*)(C))->a1), t2, t3, t4, t5);
					} else {
						T341f35(C, ge1204ov19947);
					}
				}
			}
		} else {
			t2 = (T341f19(C));
			t3 = (T1015f5(GE_void(((T341*)(C))->a6)));
			t4 = (T1015f5(GE_void(((T341*)(C))->a7)));
			t5 = (T1015f5(GE_void(((T341*)(C))->a8)));
			T113x10657T0T0T0T0(GE_void(((T341*)(C))->a1), t2, t3, t4, t5);
		}
		T341f39(C);
		t1 = (T341f15(C));
	}
}

/* XM_NAMESPACE_RESOLVER.attributes_remove */
void T341f39(T0* C)
{
	T1015f8(GE_void(((T341*)(C))->a6));
	T1015f8(GE_void(((T341*)(C))->a7));
	T1015f8(GE_void(((T341*)(C))->a8));
}

/* DS_LINKED_QUEUE [STRING_8].remove */
void T1015f8(T0* C)
{
	T1 t1;
	t1 = ((((T1015*)(C))->a2)==((T6)(GE_int32(1))));
	if (t1) {
		T1015f9(C);
	} else {
		((T1015*)(C))->a1 = (((T340*)(GE_void(((T1015*)(C))->a1)))->a2);
		((T1015*)(C))->a2 = ((T6)((((T1015*)(C))->a2)-((T6)(GE_int32(1)))));
	}
}

/* DS_LINKED_QUEUE [STRING_8].wipe_out */
void T1015f9(T0* C)
{
	((T1015*)(C))->a1 = EIF_VOID;
	((T1015*)(C))->a3 = EIF_VOID;
	((T1015*)(C))->a2 = (T6)(GE_int32(0));
}

/* XM_NAMESPACE_RESOLVER.unprefixed_attribute_namespace */
T0* T341f19(T0* C)
{
	T0* R = 0;
	R = (T341f23(C));
	return R;
}

/* XM_NAMESPACE_RESOLVER.default_namespace */
unsigned char ge1172os19185 = '\0';
T0* ge1172ov19185;
T0* T341f23(T0* C)
{
	T0* R = 0;
	if (ge1172os19185) {
		return ge1172ov19185;
	} else {
		ge1172os19185 = '\1';
	}
	R = GE_ms("", 0);
	ge1172ov19185 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xmlns_namespace */
unsigned char ge1172os19193 = '\0';
T0* ge1172ov19193;
T0* T341f18(T0* C)
{
	T0* R = 0;
	if (ge1172os19193) {
		return ge1172ov19193;
	} else {
		ge1172os19193 = '\1';
	}
	R = GE_ms("http://www.w3.org/2000/xmlns/", 29);
	ge1172ov19193 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.xml_prefix_namespace */
unsigned char ge1172os19192 = '\0';
T0* ge1172ov19192;
T0* T341f17(T0* C)
{
	T0* R = 0;
	if (ge1172os19192) {
		return ge1172ov19192;
	} else {
		ge1172os19192 = '\1';
	}
	R = GE_ms("http://www.w3.org/XML/1998/namespace", 36);
	ge1172ov19192 = R;
	return R;
}

/* XM_NAMESPACE_RESOLVER.is_xml */
T1 T341f16(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T341f22(C));
		R = (T341f21(C, t2, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_NAMESPACE_RESOLVER.xml_prefix */
unsigned char ge1172os19187 = '\0';
T0* ge1172ov19187;
T0* T341f22(T0* C)
{
	T0* R = 0;
	if (ge1172os19187) {
		return ge1172ov19187;
	} else {
		ge1172os19187 = '\1';
	}
	R = GE_ms("xml", 3);
	ge1172ov19187 = R;
	return R;
}

/* DS_LINKED_QUEUE [STRING_8].item */
T0* T1015f5(T0* C)
{
	T0* R = 0;
	R = (((T340*)(GE_void(((T1015*)(C))->a1)))->a1);
	return R;
}

/* XM_NAMESPACE_RESOLVER.attributes_is_empty */
T1 T341f15(T0* C)
{
	T1 R = 0;
	R = (T1015f4(GE_void(((T341*)(C))->a6)));
	return R;
}

/* XM_NAMESPACE_RESOLVER_CONTEXT.has */
T1 T1013f5(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T1281f7(GE_void(((T1013*)(C))->a1)));
	T1282f8(GE_void(l1));
	t1 = (((T1282*)(GE_void(l1)))->a1);
	while (!(t1)) {
		t2 = (T1282f6(GE_void(l1)));
		R = (T45f48(GE_void(t2), a1));
		if (R) {
			T1282f9(GE_void(l1));
		} else {
			T1282f10(GE_void(l1));
		}
		t1 = (((T1282*)(GE_void(l1)))->a1);
	}
	return R;
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_start_tag_finish */
void T105f18(T0* C)
{
	T113x10658(GE_void(((T105*)(C))->a3));
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
void T104f12(T0* C)
{
	T1 t1;
	t1 = ((T1)(!(((T104*)(C))->a1)));
	if (t1) {
		T104f12p1(C);
	}
}

/* XM_STOP_ON_ERROR_FILTER.on_start_tag_finish */
void T104f12p1(T0* C)
{
	T113x10658(GE_void(((T104*)(C))->a3));
}

/* XM_CALLBACKS_NULL.on_error */
void T344f11(T0* C, T0* a1)
{
}

/* XM_NAMESPACE_RESOLVER.on_error */
void T341f35(T0* C, T0* a1)
{
	T113x10653T0(GE_void(((T341*)(C))->a1), a1);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_error */
void T105f20(T0* C, T0* a1)
{
	T113x10653T0(GE_void(((T105*)(C))->a3), a1);
}

/* XM_STOP_ON_ERROR_FILTER.on_error */
void T104f14(T0* C, T0* a1)
{
	((T104*)(C))->a1 = EIF_TRUE;
	((T104*)(C))->a2 = a1;
	T104f14p1(C, a1);
}

/* XM_STOP_ON_ERROR_FILTER.on_error */
void T104f14p1(T0* C, T0* a1)
{
	T113x10653T0(GE_void(((T104*)(C))->a3), a1);
}

/* XM_CALLBACKS_NULL.on_xml_declaration */
void T344f12(T0* C, T0* a1, T0* a2, T1 a3)
{
}

/* XM_NAMESPACE_RESOLVER.on_xml_declaration */
void T341f41(T0* C, T0* a1, T0* a2, T1 a3)
{
	T113x10652T0T0T1(GE_void(((T341*)(C))->a1), a1, a2, a3);
}

/* XM_CALLBACKS_TO_TREE_FILTER.on_xml_declaration */
void T105f23(T0* C, T0* a1, T0* a2, T1 a3)
{
	T113x10652T0T0T1(GE_void(((T105*)(C))->a3), a1, a2, a3);
}

/* XM_STOP_ON_ERROR_FILTER.on_xml_declaration */
void T104f16(T0* C, T0* a1, T0* a2, T1 a3)
{
	T113x10652T0T0T1(GE_void(((T104*)(C))->a3), a1, a2, a3);
}

/* XM_NAMESPACE_RESOLVER.set_next */
void T341f40(T0* C, T0* a1)
{
	((T341*)(C))->a1 = a1;
}

/* XM_CALLBACKS_TO_TREE_FILTER.set_next */
void T105f11(T0* C, T0* a1)
{
	((T105*)(C))->a3 = a1;
}

/* XM_STOP_ON_ERROR_FILTER.set_next */
void T104f5(T0* C, T0* a1)
{
	((T104*)(C))->a3 = a1;
}

/* KL_TEXT_OUTPUT_FILE.put_line */
void T213f24(T0* C, T0* a1)
{
	T213f22(C, a1);
	T213f25(C);
}

/* KL_STRING_OUTPUT_STREAM.put_line */
void T184f6(T0* C, T0* a1)
{
	T184f8(C, a1);
	T184f5(C);
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_line */
void T182f5(T0* C, T0* a1)
{
	T182f9(C, a1);
	T182f4(C);
}

/* KL_TEXT_OUTPUT_FILE.append */
void T213f29(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = a1;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (T22f25(GE_void(l1)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T22f49(GE_void(l1), (T6)(GE_int32(512)));
		}
		t1 = (T22f25(GE_void(l1)));
		while (!(t1)) {
			t2 = (((T22*)(GE_void(l1)))->a8);
			T213f22(C, t2);
			T22f49(GE_void(l1), (T6)(GE_int32(512)));
			t1 = (T22f25(GE_void(l1)));
		}
	} else {
		T213f29p1(C, a1);
	}
}

/* KL_TEXT_OUTPUT_FILE.append */
void T213f29p1(T0* C, T0* a1)
{
	T1 t1;
	T2 t2;
	t1 = (T22f25(GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T22f48(GE_void(a1));
	}
	t1 = (T22f25(GE_void(a1)));
	while (!(t1)) {
		t2 = (((T22*)(GE_void(a1)))->a9);
		T213f23(C, t2);
		T22f48(GE_void(a1));
		t1 = (T22f25(GE_void(a1)));
	}
}

/* KL_STRING_OUTPUT_STREAM.append */
void T184f10(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = a1;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (T22f25(GE_void(l1)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T22f49(GE_void(l1), (T6)(GE_int32(512)));
		}
		t1 = (T22f25(GE_void(l1)));
		while (!(t1)) {
			t2 = (((T22*)(GE_void(l1)))->a8);
			T184f8(C, t2);
			T22f49(GE_void(l1), (T6)(GE_int32(512)));
			t1 = (T22f25(GE_void(l1)));
		}
	} else {
		T184f10p1(C, a1);
	}
}

/* KL_STRING_OUTPUT_STREAM.append */
void T184f10p1(T0* C, T0* a1)
{
	T1 t1;
	T2 t2;
	t1 = (T22f25(GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T22f48(GE_void(a1));
	}
	t1 = (T22f25(GE_void(a1)));
	while (!(t1)) {
		t2 = (((T22*)(GE_void(a1)))->a9);
		T184f7(C, t2);
		T22f48(GE_void(a1));
		t1 = (T22f25(GE_void(a1)));
	}
}

/* KL_NULL_TEXT_OUTPUT_STREAM.append */
void T182f6(T0* C, T0* a1)
{
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = a1;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (T22f25(GE_void(l1)));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T22f49(GE_void(l1), (T6)(GE_int32(512)));
		}
		t1 = (T22f25(GE_void(l1)));
		while (!(t1)) {
			t2 = (((T22*)(GE_void(l1)))->a8);
			T182f9(C, t2);
			T22f49(GE_void(l1), (T6)(GE_int32(512)));
			t1 = (T22f25(GE_void(l1)));
		}
	} else {
		T182f6p1(C, a1);
	}
}

/* KL_NULL_TEXT_OUTPUT_STREAM.append */
void T182f6p1(T0* C, T0* a1)
{
	T1 t1;
	T2 t2;
	t1 = (T22f25(GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T22f48(GE_void(a1));
	}
	t1 = (T22f25(GE_void(a1)));
	while (!(t1)) {
		t2 = (((T22*)(GE_void(a1)))->a9);
		T182f7(C, t2);
		T22f48(GE_void(a1));
		t1 = (T22f25(GE_void(a1)));
	}
}

/* KL_TEXT_OUTPUT_FILE.put_integer */
void T213f28(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==((T6)(GE_int32(0))));
	if (t1) {
		T213f23(C, (T2)('0'));
	} else {
		t1 = ((T1)((a1)<((T6)(GE_int32(0)))));
		if (t1) {
			T213f23(C, (T2)('-'));
			t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
			l1 = ((T6)(-(t2)));
			l2 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			switch (t2) {
			case (T6)(T6)(GE_int32(0)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('1'));
				break;
			case (T6)(T6)(GE_int32(1)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('2'));
				break;
			case (T6)(T6)(GE_int32(2)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('3'));
				break;
			case (T6)(T6)(GE_int32(3)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('4'));
				break;
			case (T6)(T6)(GE_int32(4)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('5'));
				break;
			case (T6)(T6)(GE_int32(5)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('6'));
				break;
			case (T6)(T6)(GE_int32(6)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('7'));
				break;
			case (T6)(T6)(GE_int32(7)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('8'));
				break;
			case (T6)(T6)(GE_int32(8)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T213f28(C, l2);
				}
				T213f23(C, (T2)('9'));
				break;
			case (T6)(T6)(GE_int32(9)):
				t2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				T213f28(C, t2);
				T213f23(C, (T2)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = a1;
			l2 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t1 = ((l2)!=((T6)(GE_int32(0))));
			if (t1) {
				T213f28(C, l2);
			}
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			switch (t2) {
			case (T6)(T6)(GE_int32(0)):
				T213f23(C, (T2)('0'));
				break;
			case (T6)(T6)(GE_int32(1)):
				T213f23(C, (T2)('1'));
				break;
			case (T6)(T6)(GE_int32(2)):
				T213f23(C, (T2)('2'));
				break;
			case (T6)(T6)(GE_int32(3)):
				T213f23(C, (T2)('3'));
				break;
			case (T6)(T6)(GE_int32(4)):
				T213f23(C, (T2)('4'));
				break;
			case (T6)(T6)(GE_int32(5)):
				T213f23(C, (T2)('5'));
				break;
			case (T6)(T6)(GE_int32(6)):
				T213f23(C, (T2)('6'));
				break;
			case (T6)(T6)(GE_int32(7)):
				T213f23(C, (T2)('7'));
				break;
			case (T6)(T6)(GE_int32(8)):
				T213f23(C, (T2)('8'));
				break;
			case (T6)(T6)(GE_int32(9)):
				T213f23(C, (T2)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* KL_STRING_OUTPUT_STREAM.put_integer */
void T184f9(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==((T6)(GE_int32(0))));
	if (t1) {
		T184f7(C, (T2)('0'));
	} else {
		t1 = ((T1)((a1)<((T6)(GE_int32(0)))));
		if (t1) {
			T184f7(C, (T2)('-'));
			t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
			l1 = ((T6)(-(t2)));
			l2 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			switch (t2) {
			case (T6)(T6)(GE_int32(0)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('1'));
				break;
			case (T6)(T6)(GE_int32(1)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('2'));
				break;
			case (T6)(T6)(GE_int32(2)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('3'));
				break;
			case (T6)(T6)(GE_int32(3)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('4'));
				break;
			case (T6)(T6)(GE_int32(4)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('5'));
				break;
			case (T6)(T6)(GE_int32(5)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('6'));
				break;
			case (T6)(T6)(GE_int32(6)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('7'));
				break;
			case (T6)(T6)(GE_int32(7)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('8'));
				break;
			case (T6)(T6)(GE_int32(8)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T184f9(C, l2);
				}
				T184f7(C, (T2)('9'));
				break;
			case (T6)(T6)(GE_int32(9)):
				t2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				T184f9(C, t2);
				T184f7(C, (T2)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = a1;
			l2 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t1 = ((l2)!=((T6)(GE_int32(0))));
			if (t1) {
				T184f9(C, l2);
			}
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			switch (t2) {
			case (T6)(T6)(GE_int32(0)):
				T184f7(C, (T2)('0'));
				break;
			case (T6)(T6)(GE_int32(1)):
				T184f7(C, (T2)('1'));
				break;
			case (T6)(T6)(GE_int32(2)):
				T184f7(C, (T2)('2'));
				break;
			case (T6)(T6)(GE_int32(3)):
				T184f7(C, (T2)('3'));
				break;
			case (T6)(T6)(GE_int32(4)):
				T184f7(C, (T2)('4'));
				break;
			case (T6)(T6)(GE_int32(5)):
				T184f7(C, (T2)('5'));
				break;
			case (T6)(T6)(GE_int32(6)):
				T184f7(C, (T2)('6'));
				break;
			case (T6)(T6)(GE_int32(7)):
				T184f7(C, (T2)('7'));
				break;
			case (T6)(T6)(GE_int32(8)):
				T184f7(C, (T2)('8'));
				break;
			case (T6)(T6)(GE_int32(9)):
				T184f7(C, (T2)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_integer */
void T182f8(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==((T6)(GE_int32(0))));
	if (t1) {
		T182f7(C, (T2)('0'));
	} else {
		t1 = ((T1)((a1)<((T6)(GE_int32(0)))));
		if (t1) {
			T182f7(C, (T2)('-'));
			t2 = ((T6)((a1)+((T6)(GE_int32(1)))));
			l1 = ((T6)(-(t2)));
			l2 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			switch (t2) {
			case (T6)(T6)(GE_int32(0)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('1'));
				break;
			case (T6)(T6)(GE_int32(1)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('2'));
				break;
			case (T6)(T6)(GE_int32(2)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('3'));
				break;
			case (T6)(T6)(GE_int32(3)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('4'));
				break;
			case (T6)(T6)(GE_int32(4)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('5'));
				break;
			case (T6)(T6)(GE_int32(5)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('6'));
				break;
			case (T6)(T6)(GE_int32(6)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('7'));
				break;
			case (T6)(T6)(GE_int32(7)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('8'));
				break;
			case (T6)(T6)(GE_int32(8)):
				t1 = ((l2)!=((T6)(GE_int32(0))));
				if (t1) {
					T182f8(C, l2);
				}
				T182f7(C, (T2)('9'));
				break;
			case (T6)(T6)(GE_int32(9)):
				t2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				T182f8(C, t2);
				T182f7(C, (T2)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = a1;
			l2 = ((T6)((l1)/((T6)(GE_int32(10)))));
			t1 = ((l2)!=((T6)(GE_int32(0))));
			if (t1) {
				T182f8(C, l2);
			}
			t2 = ((T6)((l1)%((T6)(GE_int32(10)))));
			switch (t2) {
			case (T6)(T6)(GE_int32(0)):
				T182f7(C, (T2)('0'));
				break;
			case (T6)(T6)(GE_int32(1)):
				T182f7(C, (T2)('1'));
				break;
			case (T6)(T6)(GE_int32(2)):
				T182f7(C, (T2)('2'));
				break;
			case (T6)(T6)(GE_int32(3)):
				T182f7(C, (T2)('3'));
				break;
			case (T6)(T6)(GE_int32(4)):
				T182f7(C, (T2)('4'));
				break;
			case (T6)(T6)(GE_int32(5)):
				T182f7(C, (T2)('5'));
				break;
			case (T6)(T6)(GE_int32(6)):
				T182f7(C, (T2)('6'));
				break;
			case (T6)(T6)(GE_int32(7)):
				T182f7(C, (T2)('7'));
				break;
			case (T6)(T6)(GE_int32(8)):
				T182f7(C, (T2)('8'));
				break;
			case (T6)(T6)(GE_int32(9)):
				T182f7(C, (T2)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* KL_TEXT_OUTPUT_FILE.put_string */
void T213f22(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T213f12(C));
	t1 = (T26f6(GE_void(t1), a1));
	T213f32(C, t1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_string */
void T213f32(T0* C, T0* a1)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T74 t3;
	T14 t4;
	t1 = (((((T0*)(a1))->id==17)?((T17*)(a1))->a2:((T948*)(a1))->a1));
	t2 = ((t1)!=((T6)(GE_int32(0))));
	if (t2) {
		l1 = (((((T0*)(a1))->id==17)?((T17*)(a1))->a1:((T948*)(a1))->a2));
		(t3).id = 74;
		(t3).a1 = ((l1?(T14)(GE_types[((T0*)(l1))->id].is_special?(T14)((T15*)(l1))->z2:(T14)l1):(T14)0));
		t4 = ((t3).a1);
		t1 = (((((T0*)(a1))->id==17)?((T17*)(a1))->a2:((T948*)(a1))->a1));
		T213f36(C, ((T213*)(C))->a4, t4, t1);
	}
}

/* KL_TEXT_OUTPUT_FILE.file_ps */
void T213f36(T0* C, T14 a1, T14 a2, T6 a3)
{
	file_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_STRING_OUTPUT_STREAM.put_string */
void T184f8(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T184f3(C));
	t1 = (T26f6(GE_void(t1), a1));
	T17f41(GE_void(((T184*)(C))->a1), t1);
}

/* KL_STRING_OUTPUT_STREAM.string_ */
T0* T184f3(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_string */
void T182f9(T0* C, T0* a1)
{
}

/* KL_TEXT_OUTPUT_FILE.put_character */
void T213f23(T0* C, T2 a1)
{
	T213f33(C, a1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_character */
void T213f33(T0* C, T2 a1)
{
	T213f37(C, ((T213*)(C))->a4, a1);
}

/* KL_TEXT_OUTPUT_FILE.file_pc */
void T213f37(T0* C, T14 a1, T2 a2)
{
	file_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* KL_STRING_OUTPUT_STREAM.put_character */
void T184f7(T0* C, T2 a1)
{
	T17f39(GE_void(((T184*)(C))->a1), a1);
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_character */
void T182f7(T0* C, T2 a1)
{
}

/* KL_TEXT_OUTPUT_FILE.put_new_line */
void T213f25(T0* C)
{
	T213f22(C, ge414ov9151);
}

/* KL_STRING_OUTPUT_STREAM.put_new_line */
void T184f5(T0* C)
{
	T184f8(C, ge311ov9151);
}

/* KL_NULL_TEXT_OUTPUT_STREAM.put_new_line */
void T182f4(T0* C)
{
	T182f9(C, ge302ov9151);
}

/* AP_DISPLAY_HELP_FLAG.reset */
void T41f41(T0* C)
{
	((T41*)(C))->a5 = (T6)(GE_int32(0));
}

/* AP_ENUMERATION_OPTION.reset */
void T37f30(T0* C)
{
	((T37*)(C))->a1 = T80c23((T6)(GE_int32(1)));
}

/* AP_INTEGER_OPTION.reset */
void T36f27(T0* C)
{
	((T36*)(C))->a1 = T92c8();
}

/* DS_LINKED_LIST [INTEGER_32].make */
T0* T92c8(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T92));
	*(T92*)C = GE_default92;
	((T92*)(C))->a3 = (T92f5(C));
	return C;
}

/* DS_LINKED_LIST [INTEGER_32].new_cursor */
T0* T92f5(T0* C)
{
	T0* R = 0;
	R = T339c3(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [INTEGER_32].make */
T0* T339c3(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T339));
	*(T339*)C = GE_default339;
	((T339*)(C))->a1 = a1;
	((T339*)(C))->a2 = EIF_TRUE;
	return C;
}

/* AP_BOOLEAN_OPTION.reset */
void T35f30(T0* C)
{
	((T35*)(C))->a1 = T89c8();
}

/* DS_LINKED_LIST [BOOLEAN].make */
T0* T89c8(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T89));
	*(T89*)C = GE_default89;
	((T89*)(C))->a3 = (T89f5(C));
	return C;
}

/* DS_LINKED_LIST [BOOLEAN].new_cursor */
T0* T89f5(T0* C)
{
	T0* R = 0;
	R = T337c3(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [BOOLEAN].make */
T0* T337c3(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T337));
	*(T337*)C = GE_default337;
	((T337*)(C))->a1 = a1;
	((T337*)(C))->a2 = EIF_TRUE;
	return C;
}

/* AP_FLAG.reset */
void T33f23(T0* C)
{
	((T33*)(C))->a1 = (T6)(GE_int32(0));
}

/* AP_DISPLAY_HELP_FLAG.record_occurrence */
void T41f42(T0* C, T0* a1)
{
	T41f43(C, a1);
}

/* AP_DISPLAY_HELP_FLAG.display_help */
void T41f43(T0* C, T0* a1)
{
	T0* t1;
	T0* t2;
	t1 = (((T30*)(a1))->a7);
	t2 = (T41f29(C, a1));
	T83f11(GE_void(t1), t2);
	t1 = (T41f30(C));
	T29f2(GE_void(t1), (T6)(GE_int32(0)));
}

/* AP_DISPLAY_HELP_FLAG.exceptions */
T0* T41f30(T0* C)
{
	T0* R = 0;
	if (ge325os1579) {
		return ge325ov1579;
	} else {
		ge325os1579 = '\1';
	}
	R = T29c1();
	ge325ov1579 = R;
	return R;
}

/* AP_ERROR_HANDLER.report_info_message */
void T83f11(T0* C, T0* a1)
{
	T77f13(GE_void(((T83*)(C))->a4), a1);
}

/* AP_DISPLAY_HELP_FLAG.full_help_text */
T0* T41f29(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 l5 = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T6 t4;
	l3 = T1393c3();
	l4 = T1394c2(l3);
	R = (T41f13(C, a1));
	t1 = (((T30*)(a1))->a5);
	t2 = (T17f17(GE_void(t1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		T17f41(GE_void(R), ge59ov4102);
		t1 = (T41f25(C));
		T97f10(GE_void(t1), (T6)(GE_int32(0)));
		t1 = (T41f25(C));
		t3 = (((T30*)(a1))->a5);
		t1 = (T97f5(GE_void(t1), t3));
		T17f41(GE_void(R), t1);
		T17f41(GE_void(R), ge59ov4103);
	}
	T17f41(GE_void(R), ge59ov4104);
	l2 = (T30f15(a1));
	T1394f3(GE_void(l4), l2);
	l1 = (T6)(GE_int32(0));
	T81f22(GE_void(l2));
	t2 = (T81f9(GE_void(l2)));
	while (!(t2)) {
		t1 = (T81f7(GE_void(l2)));
		t2 = (T38x3588(GE_void(t1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = (T81f7(GE_void(l2)));
			t1 = (T38x3581(GE_void(t1)));
			t4 = (((T17*)(GE_void(t1)))->a2);
			l1 = (T6f15(&t4, l1));
		}
		T81f23(GE_void(l2));
		t2 = (T81f9(GE_void(l2)));
	}
	T81f22(GE_void(l2));
	t2 = (T81f9(GE_void(l2)));
	while (!(t2)) {
		t1 = (T81f7(GE_void(l2)));
		t2 = (T38x3588(GE_void(t1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			if (l5) {
				T17f39(GE_void(R), (T2)('\n'));
			}
			t1 = (T81f7(GE_void(l2)));
			t4 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T41f35(C, t1, t4));
			T17f41(GE_void(R), t1);
			l5 = EIF_TRUE;
		}
		T81f23(GE_void(l2));
		t2 = (T81f9(GE_void(l2)));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.option_help_text */
T0* T41f35(T0* C, T0* a1, T6 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = (T38x3581(GE_void(a1)));
	t2 = (((T17*)(GE_void(t1)))->a2);
	t2 = ((T6)((a2)-(t2)));
	l1 = T17c43((T2)(' '), t2);
	t1 = (T41f25(C));
	T97f10(GE_void(t1), a2);
	t1 = (T41f25(C));
	t3 = (T38x3581(GE_void(a1)));
	t3 = (T17f9(GE_void(t3), l1));
	t4 = (T38x3577(GE_void(a1)));
	t3 = (T17f9(GE_void(t3), t4));
	R = (T97f5(GE_void(t1), t3));
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].sort */
void T1394f3(T0* C, T0* a1)
{
	T1394f4(C, a1, ((T1394*)(C))->a1);
}

/* DS_QUICK_SORTER [AP_OPTION].sort_with_comparator */
void T1394f4(T0* C, T0* a1, T0* a2)
{
	T1 t1;
	T6 t2;
	t1 = (T81f17(GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((T81*)(GE_void(a1)))->a2);
		T1394f5(C, a1, a2, (T6)(GE_int32(1)), t2);
	}
}

/* DS_QUICK_SORTER [AP_OPTION].subsort_with_comparator */
void T1394f5(T0* C, T0* a1, T0* a2, T6 a3, T6 a4)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T6 l9 = 0;
	T6 l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T1 t4;
	t1 = ((T6)((a4)-(a3)));
	l5 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = ((l5)==((T6)(GE_int32(0))));
	while (!(t2)) {
		l5 = ((T6)((l5)/((T6)(GE_int32(2)))));
		l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
		t2 = ((l5)==((T6)(GE_int32(0))));
	}
	l4 = ((T6)((l4)+((T6)(GE_int32(10)))));
	l11 = T319c10((T6)(GE_int32(1)), l4);
	l12 = T319c10((T6)(GE_int32(1)), l4);
	T319f11(GE_void(l11), a3, (T6)(GE_int32(1)));
	T319f11(GE_void(l12), a4, (T6)(GE_int32(1)));
	l4 = (T6)(GE_int32(1));
	t2 = ((l4)==((T6)(GE_int32(0))));
	while (!(t2)) {
		l9 = (T319f4(GE_void(l11), l4));
		l10 = (T319f4(GE_void(l12), l4));
		l4 = ((T6)((l4)-((T6)(GE_int32(1)))));
		l1 = l9;
		l2 = l10;
		t2 = ((T1)((l1)<(l2)));
		if (t2) {
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = ((l2)==(t1));
			if (t2) {
				l7 = (T81f11(GE_void(a1), l1));
				l8 = (T81f11(GE_void(a1), l2));
				t2 = (T1393f1(GE_void(a2), l8, l7));
				if (t2) {
					T81f29(GE_void(a1), l7, l2);
					T81f29(GE_void(a1), l8, l1);
				}
			} else {
				t1 = ((T6)((l1)+(l2)));
				l3 = ((T6)((t1)/((T6)(GE_int32(2)))));
				l6 = (T81f11(GE_void(a1), l3));
				t3 = (T81f11(GE_void(a1), l10));
				T81f29(GE_void(a1), t3, l3);
				t2 = (T6f12(&l1, l2));
				while (!(t2)) {
					t2 = (T6f12(&l1, l2));
					if (!(t2)) {
						t3 = (T81f11(GE_void(a1), l1));
						t4 = (T1393f1(GE_void(a2), t3, l6));
						t2 = ((T1)(!(t4)));
					}
					while (!(t2)) {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						t2 = (T6f12(&l1, l2));
						if (!(t2)) {
							t3 = (T81f11(GE_void(a1), l1));
							t4 = (T1393f1(GE_void(a2), t3, l6));
							t2 = ((T1)(!(t4)));
						}
					}
					l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
					t2 = (T6f13(&l2, l1));
					if (!(t2)) {
						t3 = (T81f11(GE_void(a1), l2));
						t4 = (T1393f1(GE_void(a2), l6, t3));
						t2 = ((T1)(!(t4)));
					}
					while (!(t2)) {
						l2 = ((T6)((l2)-((T6)(GE_int32(1)))));
						t2 = (T6f13(&l2, l1));
						if (!(t2)) {
							t3 = (T81f11(GE_void(a1), l2));
							t4 = (T1393f1(GE_void(a2), l6, t3));
							t2 = ((T1)(!(t4)));
						}
					}
					t2 = ((T1)((l1)<(l2)));
					if (t2) {
						T81f30(GE_void(a1), l1, l2);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					t2 = (T6f12(&l1, l2));
				}
				t3 = (T81f11(GE_void(a1), l1));
				T81f29(GE_void(a1), t3, l10);
				T81f29(GE_void(a1), l6, l1);
				t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
				t2 = (T6f1(&t1, l9));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					T319f12(GE_void(l11), l9, l4);
					t1 = ((T6)((l1)-((T6)(GE_int32(1)))));
					T319f12(GE_void(l12), t1, l4);
				}
				t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t2 = ((T1)((t1)<(l10)));
				if (t2) {
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					T319f12(GE_void(l11), t1, l4);
					T319f12(GE_void(l12), l10, l4);
				}
			}
		}
		t2 = ((l4)==((T6)(GE_int32(0))));
	}
}

/* DS_ARRAYED_LIST [AP_OPTION].swap */
void T81f30(T0* C, T6 a1, T6 a2)
{
	T0* l1 = 0;
	T0* t1;
	l1 = (T81f11(C, a1));
	t1 = (T81f11(C, a2));
	T81f29(C, t1, a1);
	T81f29(C, l1, a2);
}

/* DS_ARRAYED_LIST [AP_OPTION].replace */
void T81f29(T0* C, T0* a1, T6 a2)
{
	((T331*)(GE_void(((T81*)(C))->a4)))->z2[a2] = (a1);
}

/* AP_OPTION_COMPARATOR.less_than */
T1 T1393f1(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	t1 = (T38x3586(GE_void(a1)));
	if (t1) {
		l1 = (T38x3579(GE_void(a1)));
	} else {
		t2 = (T38x3584(GE_void(a1)));
		l1 = (T2f1(&t2));
	}
	t1 = (T38x3586(GE_void(a2)));
	if (t1) {
		l2 = (T38x3579(GE_void(a2)));
	} else {
		t2 = (T38x3584(GE_void(a2)));
		l2 = (T2f1(&t2));
	}
	t3 = (T1393f2(C));
	t4 = (T26f18(GE_void(t3), l1, l2));
	R = ((t4)==((T6)(GE_int32(-1))));
	return R;
}

/* KL_STRING_ROUTINES.three_way_comparison */
T6 T26f18(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T6 l8 = 0;
	T6 l9 = 0;
	T1 l10 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = ((a2)==(a1));
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t2 = (T26f2(C));
		t1 = (T79f1(GE_void(t2), a1, ge411ov2786));
		if (t1) {
			t2 = (T26f2(C));
			t1 = (T79f1(GE_void(t2), a2, ge411ov2786));
		}
		if (t1) {
			l4 = (((T17*)(GE_void(a1)))->a2);
			l5 = (((T17*)(GE_void(a2)))->a2);
			t1 = ((T1)((l4)<(l5)));
			if (t1) {
				l3 = l4;
			} else {
				l3 = l5;
			}
			l2 = (T6)(GE_int32(1));
			t1 = (T6f1(&l2, l3));
			while (!(t1)) {
				l6 = (T17f10(GE_void(a1), l2));
				l7 = (T17f10(GE_void(a2), l2));
				t1 = ((l6)==(l7));
				if (t1) {
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T2f5(&l6, l7));
					if (t1) {
						l10 = EIF_TRUE;
						R = (T6)(GE_int32(-1));
						l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
					} else {
						l10 = EIF_TRUE;
						R = (T6)(GE_int32(1));
						l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
					}
				}
				t1 = (T6f1(&l2, l3));
			}
			t1 = ((T1)(!(l10)));
			if (t1) {
				t1 = ((T1)((l4)<(l5)));
				if (t1) {
					R = (T6)(GE_int32(-1));
				} else {
					t1 = ((l4)!=(l5));
					if (t1) {
						R = (T6)(GE_int32(1));
					}
				}
			}
		} else {
			l1 = EIF_VOID;
			t1 = ((l1)!=(EIF_VOID));
			if (t1) {
				R = ((GE_void(l1), a2, (T6)0));
			} else {
				l1 = EIF_VOID;
				t1 = ((l1)!=(EIF_VOID));
				if (t1) {
					t3 = ((GE_void(l1), a1, (T6)0));
					R = ((T6)(-(t3)));
				} else {
					l4 = (((T17*)(GE_void(a1)))->a2);
					l5 = (((T17*)(GE_void(a2)))->a2);
					t1 = ((T1)((l4)<(l5)));
					if (t1) {
						l3 = l4;
					} else {
						l3 = l5;
					}
					l2 = (T6)(GE_int32(1));
					t1 = (T6f1(&l2, l3));
					while (!(t1)) {
						l8 = (T17f7(GE_void(a1), l2));
						l9 = (T17f7(GE_void(a2), l2));
						t1 = ((l8)==(l9));
						if (t1) {
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						} else {
							t1 = ((T1)((l8)<(l9)));
							if (t1) {
								l10 = EIF_TRUE;
								R = (T6)(GE_int32(-1));
								l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
							} else {
								l10 = EIF_TRUE;
								R = (T6)(GE_int32(1));
								l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
							}
						}
						t1 = (T6f1(&l2, l3));
					}
					t1 = ((T1)(!(l10)));
					if (t1) {
						t1 = ((T1)((l4)<(l5)));
						if (t1) {
							R = (T6)(GE_int32(-1));
						} else {
							t1 = ((l4)!=(l5));
							if (t1) {
								R = (T6)(GE_int32(1));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* AP_OPTION_COMPARATOR.string_ */
T0* T1393f2(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* DS_QUICK_SORTER [AP_OPTION].make */
T0* T1394c2(T0* a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1394));
	*(T1394*)C = GE_default1394;
	((T1394*)(C))->a1 = a1;
	return C;
}

/* AP_OPTION_COMPARATOR.default_create */
T0* T1393c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1393));
	*(T1393*)C = GE_default1393;
	return C;
}

/* AP_ENUMERATION_OPTION.record_occurrence */
void T37f32(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	T37f32p1(C, a1);
	t1 = (((T30*)(a1))->a11);
	t2 = ((t1)!=(EIF_VOID));
	if (t2) {
		t1 = (((T30*)(a1))->a11);
		t2 = (T94f15(GE_void(((T37*)(C))->a3), t1));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t1 = (((T30*)(a1))->a11);
			l1 = T32c20(C, t1);
			t1 = (((T30*)(a1))->a7);
			T83f9(GE_void(t1), l1);
		}
	}
}

/* DS_LINKED_LIST [STRING_8].has */
T1 T94f15(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	l1 = ((T94*)(C))->a3;
	l2 = ((T94*)(C))->a5;
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((l1)==(EIF_VOID));
		while (!(t1)) {
			t2 = (((T340*)(GE_void(l1)))->a1);
			t1 = (T95f1(GE_void(l2), t2, a1));
			if (t1) {
				R = EIF_TRUE;
				l1 = EIF_VOID;
			} else {
				l1 = (((T340*)(GE_void(l1)))->a2);
			}
			t1 = ((l1)==(EIF_VOID));
		}
	} else {
		t1 = ((l1)==(EIF_VOID));
		while (!(t1)) {
			t2 = (((T340*)(GE_void(l1)))->a1);
			t1 = ((t2)==(a1));
			if (t1) {
				R = EIF_TRUE;
				l1 = EIF_VOID;
			} else {
				l1 = (((T340*)(GE_void(l1)))->a2);
			}
			t1 = ((l1)==(EIF_VOID));
		}
	}
	return R;
}

/* AP_ENUMERATION_OPTION.record_occurrence */
void T37f32p1(T0* C, T0* a1)
{
	T0* t1;
	t1 = (((T30*)(a1))->a11);
	T80f27(GE_void(((T37*)(C))->a1), t1);
}

/* AP_INTEGER_OPTION.record_occurrence */
void T36f28(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (((T30*)(a1))->a11);
	t2 = (((((T0*)(GE_void(t1)))->id==17)?T17f23(t1):T948f35(t1)));
	if (t2) {
		t1 = (((T30*)(a1))->a11);
		t3 = (((((T0*)(GE_void(t1)))->id==17)?T17f16(t1):T948f36(t1)));
		T92f9(GE_void(((T36*)(C))->a1), t3);
	} else {
		t1 = (((T30*)(a1))->a11);
		l1 = T32c20(C, t1);
		t1 = (((T30*)(a1))->a7);
		T83f9(GE_void(t1), l1);
		T92f9(GE_void(((T36*)(C))->a1), (T6)(GE_int32(0)));
	}
}

/* DS_LINKED_LIST [INTEGER_32].force_last */
void T92f9(T0* C, T6 a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = (T92f6(C));
	if (t1) {
		((T92*)(C))->a4 = T338c3(a1);
		((T92*)(C))->a2 = ((T92*)(C))->a4;
		((T92*)(C))->a1 = (T6)(GE_int32(1));
	} else {
		l1 = ((T92*)(C))->a2;
		((T92*)(C))->a2 = T338c3(a1);
		T338f4(GE_void(l1), ((T92*)(C))->a2);
		((T92*)(C))->a1 = ((T6)((((T92*)(C))->a1)+((T6)(GE_int32(1)))));
	}
}

/* DS_LINKED_LIST [INTEGER_32].is_empty */
T1 T92f6(T0* C)
{
	T1 R = 0;
	R = ((((T92*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.record_occurrence */
void T35f31(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	T0* t2;
	T1 t3;
	t1 = (T35f21(C));
	t2 = (((T30*)(a1))->a11);
	t3 = (T80f22(GE_void(t1), t2));
	if (t3) {
		T89f9(GE_void(((T35*)(C))->a1), EIF_TRUE);
	} else {
		t1 = (T35f22(C));
		t2 = (((T30*)(a1))->a11);
		t3 = (T80f22(GE_void(t1), t2));
		if (t3) {
			T89f9(GE_void(((T35*)(C))->a1), EIF_FALSE);
		} else {
			t1 = (((T30*)(a1))->a11);
			l1 = T32c20(C, t1);
			t1 = (((T30*)(a1))->a7);
			T83f9(GE_void(t1), l1);
		}
	}
}

/* AP_BOOLEAN_OPTION.false_strings */
unsigned char ge57os3877 = '\0';
T0* ge57ov3877;
T0* T35f22(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge57os3877) {
		return ge57ov3877;
	} else {
		ge57os3877 = '\1';
	}
	R = T80c23((T6)(GE_int32(5)));
	t1 = (T35f23(C));
	T80f41(GE_void(R), t1);
	T80f35(GE_void(R), GE_ms("no", 2));
	T80f35(GE_void(R), GE_ms("n", 1));
	T80f35(GE_void(R), GE_ms("0", 1));
	T80f35(GE_void(R), GE_ms("false", 5));
	T80f35(GE_void(R), GE_ms("f", 1));
	ge57ov3877 = R;
	return R;
}

/* AP_BOOLEAN_OPTION.case_insensitive_string_equality_tester */
unsigned char ge278os3329 = '\0';
T0* ge278ov3329;
T0* T35f23(T0* C)
{
	T0* R = 0;
	if (ge278os3329) {
		return ge278ov3329;
	} else {
		ge278os3329 = '\1';
	}
	R = T1392c3();
	ge278ov3329 = R;
	return R;
}

/* KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER.default_create */
T0* T1392c3(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1392));
	*(T1392*)C = GE_default1392;
	return C;
}

/* DS_LINKED_LIST [BOOLEAN].force_last */
void T89f9(T0* C, T1 a1)
{
	T0* l1 = 0;
	T1 t1;
	t1 = (T89f6(C));
	if (t1) {
		((T89*)(C))->a4 = T336c3(a1);
		((T89*)(C))->a2 = ((T89*)(C))->a4;
		((T89*)(C))->a1 = (T6)(GE_int32(1));
	} else {
		l1 = ((T89*)(C))->a2;
		((T89*)(C))->a2 = T336c3(a1);
		T336f4(GE_void(l1), ((T89*)(C))->a2);
		((T89*)(C))->a1 = ((T6)((((T89*)(C))->a1)+((T6)(GE_int32(1)))));
	}
}

/* DS_LINKABLE [BOOLEAN].put_right */
void T336f4(T0* C, T0* a1)
{
	((T336*)(C))->a2 = a1;
}

/* DS_LINKABLE [BOOLEAN].make */
T0* T336c3(T1 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T336));
	*(T336*)C = GE_default336;
	((T336*)(C))->a1 = a1;
	return C;
}

/* DS_LINKED_LIST [BOOLEAN].is_empty */
T1 T89f6(T0* C)
{
	T1 R = 0;
	R = ((((T89*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* DS_ARRAYED_LIST [STRING_8].has */
T1 T80f22(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	l1 = ((T80*)(C))->a1;
	l2 = ((T80*)(C))->a6;
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		while (!(t1)) {
			t2 = (((T85*)(GE_void(((T80*)(C))->a3)))->z2[l1]);
			t1 = (((((T0*)(GE_void(l2)))->id==48)?T48f1(l2, t2, a1):T1392f1(l2, t2, a1)));
			if (t1) {
				R = EIF_TRUE;
				l1 = (T6)(GE_int32(0));
			} else {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			}
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		}
	} else {
		t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		while (!(t1)) {
			t2 = (((T85*)(GE_void(((T80*)(C))->a3)))->z2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = EIF_TRUE;
				l1 = (T6)(GE_int32(0));
			} else {
				l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			}
			t1 = ((T1)((l1)<((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER.test */
T1 T1392f1(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(a2));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = EIF_FALSE;
			} else {
				t2 = (T1392f2(C));
				R = (T26f14(GE_void(t2), a1, a2));
			}
		}
	}
	return R;
}

/* KL_CASE_INSENSITIVE_STRING_EQUALITY_TESTER.string_ */
T0* T1392f2(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* AP_BOOLEAN_OPTION.true_strings */
unsigned char ge57os3878 = '\0';
T0* ge57ov3878;
T0* T35f21(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge57os3878) {
		return ge57ov3878;
	} else {
		ge57os3878 = '\1';
	}
	R = T80c23((T6)(GE_int32(5)));
	t1 = (T35f23(C));
	T80f41(GE_void(R), t1);
	T80f35(GE_void(R), GE_ms("yes", 3));
	T80f35(GE_void(R), GE_ms("y", 1));
	T80f35(GE_void(R), GE_ms("1", 1));
	T80f35(GE_void(R), GE_ms("true", 4));
	T80f35(GE_void(R), GE_ms("t", 1));
	ge57ov3878 = R;
	return R;
}

/* AP_FLAG.record_occurrence */
void T33f25(T0* C, T0* a1)
{
	((T33*)(C))->a1 = ((T6)((((T33*)(C))->a1)+((T6)(GE_int32(1)))));
}

/* KL_STDIN_FILE.read_character */
void T955f20(T0* C)
{
	T1 t1;
	t1 = ((((T955*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		((T955*)(C))->a3 = ((GE_void(((T955*)(C))->a4), (T2)0));
		((T955*)(C))->a4 = ((GE_void(((T955*)(C))->a4), (T0*)0));
	} else {
		t1 = (T955f7(C));
		if (t1) {
			((T955*)(C))->a1 = EIF_TRUE;
		} else {
			T955f23(C);
			((T955*)(C))->a1 = (T955f7(C));
		}
	}
}

/* KL_STDIN_FILE.old_read_character */
void T955f23(T0* C)
{
	((T955*)(C))->a3 = (T955f15(C, ((T955*)(C))->a5));
}

/* KL_STDIN_FILE.console_readchar */
T2 T955f15(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)(EIF_CHARACTER )console_readchar((FILE *)a1);
	return R;
}

/* KL_STDIN_FILE.old_end_of_file */
T1 T955f7(T0* C)
{
	T1 R = 0;
	R = (T955f12(C, ((T955*)(C))->a5));
	return R;
}

/* KL_STDIN_FILE.console_eof */
T1 T955f12(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)EIF_TEST((EIF_BOOLEAN )console_eof((FILE *)a1));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_character */
void T949f32(T0* C)
{
	T1 t1;
	T6 t2;
	T1 t3;
	t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(6))));
	if (t1) {
		T949f34(C);
		t2 = (((T1233*)(GE_void(((T949*)(C))->a3)))->a1);
		t1 = ((t2)==((T6)(GE_int32(0))));
		if (t1) {
			t3 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
			t1 = ((T1)(!(t3)));
		}
		if (t1) {
			T949f35(C);
		}
	} else {
		t2 = (((T1233*)(GE_void(((T949*)(C))->a3)))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		if (t1) {
			T1233f7(GE_void(((T949*)(C))->a3));
			t2 = (((T1233*)(GE_void(((T949*)(C))->a3)))->a1);
			t1 = ((t2)==((T6)(GE_int32(0))));
			if (t1) {
				t3 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
				t1 = ((T1)(!(t3)));
			}
			if (t1) {
				T949f35(C);
			}
		} else {
			T949f35(C);
		}
	}
}

/* DS_LINKED_QUEUE [CHARACTER_8].remove */
void T1233f7(T0* C)
{
	T1 t1;
	t1 = ((((T1233*)(C))->a1)==((T6)(GE_int32(1))));
	if (t1) {
		T1233f9(C);
	} else {
		((T1233*)(C))->a2 = (((T1339*)(GE_void(((T1233*)(C))->a2)))->a2);
		((T1233*)(C))->a1 = ((T6)((((T1233*)(C))->a1)-((T6)(GE_int32(1)))));
	}
}

/* DS_LINKED_QUEUE [CHARACTER_8].wipe_out */
void T1233f9(T0* C)
{
	((T1233*)(C))->a2 = EIF_VOID;
	((T1233*)(C))->a3 = EIF_VOID;
	((T1233*)(C))->a1 = (T6)(GE_int32(0));
}

/* XM_EIFFEL_INPUT_STREAM.noqueue_read_character */
void T949f35(T0* C)
{
	T1 t1;
	t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(1))));
	if (!(t1)) {
		t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(2))));
	}
	if (t1) {
		if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
			T22f48(((T949*)(C))->a4);
		} else {
			T1415f9(((T949*)(C))->a4);
		}
	} else {
		t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(3))));
		if (t1) {
			T949f36(C);
		} else {
			T949f37(C);
		}
	}
}

/* XM_EIFFEL_INPUT_STREAM.utf16_read_character */
void T949f37(T0* C)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
		T22f48(((T949*)(C))->a4);
	} else {
		T1415f9(((T949*)(C))->a4);
	}
	t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
		if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
			T22f48(((T949*)(C))->a4);
		} else {
			T1415f9(((T949*)(C))->a4);
		}
		t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
		t1 = ((T1)(!(t1)));
		if (t1) {
			l2 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
			l3 = (T949f25(C, l1, l2));
			l4 = (T949f26(C, l1, l2));
			t2 = (T949f22(C));
			t1 = (T1234f3(GE_void(t2), l3));
			if (t1) {
				t2 = (T949f22(C));
				t1 = (T1234f4(GE_void(t2), l3));
				if (t1) {
					t2 = (T949f22(C));
					l5 = (T1234f5(GE_void(t2), l3, l4));
					if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
						T22f48(((T949*)(C))->a4);
					} else {
						T1415f9(((T949*)(C))->a4);
					}
					t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
					t1 = ((T1)(!(t1)));
					if (t1) {
						l1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
						if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
							T22f48(((T949*)(C))->a4);
						} else {
							T1415f9(((T949*)(C))->a4);
						}
						t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
						t1 = ((T1)(!(t1)));
						if (t1) {
							l2 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
							l3 = (T949f25(C, l1, l2));
							l4 = (T949f26(C, l1, l2));
							t2 = (T949f22(C));
							t1 = (T1234f6(GE_void(t2), l3));
							if (t1) {
								t2 = (T949f22(C));
								t3 = (T949f22(C));
								t4 = (T1234f5(GE_void(t3), l3, l4));
								t4 = (T1234f7(GE_void(t2), l5, t4));
								T949f38(C, t4);
							}
						}
					}
				}
			} else {
				t4 = ((T6)((l3)*((T6)(GE_int32(256)))));
				t4 = ((T6)((t4)+(l4)));
				T949f38(C, t4);
			}
		}
	}
}

/* XM_EIFFEL_INPUT_STREAM.append_character */
void T949f38(T0* C, T6 a1)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T2 t3;
	l3 = (T949f27(C));
	t1 = (T949f8(C));
	T26f21(GE_void(t1), l3);
	t1 = (T949f24(C));
	T947f37(GE_void(t1), l3, a1);
	l2 = (((T17*)(GE_void(l3)))->a2);
	l1 = (T6)(GE_int32(1));
	t2 = (T6f1(&l1, l2));
	while (!(t2)) {
		t3 = (T17f10(GE_void(l3), l1));
		T1233f8(GE_void(((T949*)(C))->a3), t3);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = (T6f1(&l1, l2));
	}
}

/* DS_LINKED_QUEUE [CHARACTER_8].force */
void T1233f8(T0* C, T2 a1)
{
	T0* l1 = 0;
	T1 t1;
	l1 = T1339c3(a1);
	t1 = (T1233f4(C));
	if (t1) {
		((T1233*)(C))->a2 = l1;
		((T1233*)(C))->a3 = l1;
		((T1233*)(C))->a1 = (T6)(GE_int32(1));
	} else {
		T1339f4(GE_void(((T1233*)(C))->a3), l1);
		((T1233*)(C))->a3 = l1;
		((T1233*)(C))->a1 = ((T6)((((T1233*)(C))->a1)+((T6)(GE_int32(1)))));
	}
}

/* DS_LINKABLE [CHARACTER_8].put_right */
void T1339f4(T0* C, T0* a1)
{
	((T1339*)(C))->a2 = a1;
}

/* DS_LINKED_QUEUE [CHARACTER_8].is_empty */
T1 T1233f4(T0* C)
{
	T1 R = 0;
	R = ((((T1233*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* DS_LINKABLE [CHARACTER_8].make */
T0* T1339c3(T2 a1)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1339));
	*(T1339*)C = GE_default1339;
	((T1339*)(C))->a1 = a1;
	return C;
}

/* XM_EIFFEL_INPUT_STREAM.utf8 */
T0* T949f24(T0* C)
{
	T0* R = 0;
	if (ge338os10000) {
		return ge338ov10000;
	} else {
		ge338os10000 = '\1';
	}
	R = T947c36();
	ge338ov10000 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.utf8_buffer */
unsigned char ge1271os25298 = '\0';
T0* ge1271ov25298;
T0* T949f27(T0* C)
{
	T0* R = 0;
	if (ge1271os25298) {
		return ge1271ov25298;
	} else {
		ge1271os25298 = '\1';
	}
	R = T17c36((T6)(GE_int32(6)));
	ge1271ov25298 = R;
	return R;
}

/* UC_UTF16_ROUTINES.surrogate */
T6 T1234f7(T0* C, T6 a1, T6 a2)
{
	T6 R = 0;
	T6 t1;
	T6 t2;
	t1 = (T6)(GE_int32(65536));
	t2 = ((T6)((a1)*((T6)(GE_int32(1024)))));
	t2 = ((T6)((t2)+(a2)));
	R = ((T6)((t1)+(t2)));
	return R;
}

/* UC_UTF16_ROUTINES.is_low_surrogate */
T1 T1234f6(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f12(&a1, (T6)(GE_int32(220))));
	if (t1) {
		R = ((T1)((a1)<((T6)(GE_int32(224)))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF16_ROUTINES.least_10_bits */
T6 T1234f5(T0* C, T6 a1, T6 a2)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((a1)%((T6)(GE_int32(4)))));
	t1 = ((T6)((t1)*((T6)(GE_int32(256)))));
	R = ((T6)((t1)+(a2)));
	return R;
}

/* UC_UTF16_ROUTINES.is_high_surrogate */
T1 T1234f4(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f12(&a1, (T6)(GE_int32(216))));
	if (t1) {
		R = ((T1)((a1)<((T6)(GE_int32(220)))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF16_ROUTINES.is_surrogate */
T1 T1234f3(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f12(&a1, (T6)(GE_int32(216))));
	if (t1) {
		R = ((T1)((a1)<((T6)(GE_int32(224)))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.utf16 */
unsigned char ge336os2793 = '\0';
T0* ge336ov2793;
T0* T949f22(T0* C)
{
	T0* R = 0;
	if (ge336os2793) {
		return ge336ov2793;
	} else {
		ge336os2793 = '\1';
	}
	R = T1234c16();
	ge336ov2793 = R;
	return R;
}

/* UC_UTF16_ROUTINES.default_create */
T0* T1234c16(void)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1234));
	*(T1234*)C = GE_default1234;
	return C;
}

/* XM_EIFFEL_INPUT_STREAM.least_significant */
T6 T949f26(T0* C, T2 a1, T2 a2)
{
	T6 R = 0;
	T1 t1;
	t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(4))));
	if (t1) {
		R = ((T6)(a2));
	} else {
		R = ((T6)(a1));
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.most_significant */
T6 T949f25(T0* C, T2 a1, T2 a2)
{
	T6 R = 0;
	T1 t1;
	t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(4))));
	if (t1) {
		R = ((T6)(a1));
	} else {
		R = ((T6)(a2));
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.latin1_read_character */
void T949f36(T0* C)
{
	T1 t1;
	T2 t2;
	T6 t3;
	if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
		T22f48(((T949*)(C))->a4);
	} else {
		T1415f9(((T949*)(C))->a4);
	}
	t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
		t3 = ((T6)(t2));
		t1 = (T6f12(&t3, (T6)(GE_int32(128))));
		if (t1) {
			t2 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
			t3 = ((T6)(t2));
			T949f38(C, t3);
		}
	}
}

/* KL_STRING_INPUT_STREAM.read_character */
void T1415f9(T0* C)
{
	T6 t1;
	T1 t2;
	((T1415*)(C))->a4 = ((T6)((((T1415*)(C))->a4)+((T6)(GE_int32(1)))));
	t1 = (((T17*)(GE_void(((T1415*)(C))->a3)))->a2);
	t2 = (T6f13(&(((T1415*)(C))->a4), t1));
	if (t2) {
		((T1415*)(C))->a2 = (T17f10(GE_void(((T1415*)(C))->a3), ((T1415*)(C))->a4));
	} else {
		((T1415*)(C))->a1 = EIF_TRUE;
	}
}

/* XM_EIFFEL_INPUT_STREAM.utf16_detect_read_character */
void T949f34(T0* C)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	((T949*)(C))->a2 = (T6)(GE_int32(2));
	if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
		T22f48(((T949*)(C))->a4);
	} else {
		T1415f9(((T949*)(C))->a4);
	}
	t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
	t1 = ((T1)(!(t1)));
	if (t1) {
		l1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
		if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
			T22f48(((T949*)(C))->a4);
		} else {
			T1415f9(((T949*)(C))->a4);
		}
		t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
		t1 = ((T1)(!(t1)));
		if (t1) {
			l2 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
			t2 = (T949f22(C));
			t3 = ((T6)(l1));
			t4 = ((T6)(l2));
			t1 = (T1234f1(GE_void(t2), t3, t4));
			if (t1) {
				((T949*)(C))->a2 = (T6)(GE_int32(4));
			} else {
				t2 = (T949f22(C));
				t3 = ((T6)(l1));
				t4 = ((T6)(l2));
				t1 = (T1234f2(GE_void(t2), t3, t4));
				if (t1) {
					((T949*)(C))->a2 = (T6)(GE_int32(5));
				} else {
					t3 = ((T6)(l1));
					t1 = ((t3)==((T6)(GE_int32(0))));
					if (t1) {
						t1 = ((l2)==((T2)('<')));
					}
					if (t1) {
						((T949*)(C))->a2 = (T6)(GE_int32(4));
						T1233f8(GE_void(((T949*)(C))->a3), (T2)('<'));
					} else {
						t1 = ((l1)==((T2)('<')));
						if (t1) {
							t3 = ((T6)(l2));
							t1 = ((t3)==((T6)(GE_int32(0))));
						}
						if (t1) {
							((T949*)(C))->a2 = (T6)(GE_int32(5));
							T1233f8(GE_void(((T949*)(C))->a3), (T2)('<'));
						} else {
							t2 = (T949f24(C));
							t1 = (T947f30(GE_void(t2), l1, l2));
							if (t1) {
								if (((T0*)(GE_void(((T949*)(C))->a4)))->id==22) {
									T22f48(((T949*)(C))->a4);
								} else {
									T1415f9(((T949*)(C))->a4);
								}
								t1 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
								t1 = ((T1)(!(t1)));
								if (t1) {
									l3 = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
									t2 = (T949f24(C));
									t1 = (T947f31(GE_void(t2), l1, l2, l3));
									if (t1) {
									} else {
										T1233f8(GE_void(((T949*)(C))->a3), l1);
										T1233f8(GE_void(((T949*)(C))->a3), l2);
										T1233f8(GE_void(((T949*)(C))->a3), l3);
									}
								} else {
									T1233f8(GE_void(((T949*)(C))->a3), l1);
									T1233f8(GE_void(((T949*)(C))->a3), l2);
								}
							} else {
								T1233f8(GE_void(((T949*)(C))->a3), l1);
								T1233f8(GE_void(((T949*)(C))->a3), l2);
							}
						}
					}
				}
			}
		} else {
			T1233f8(GE_void(((T949*)(C))->a3), l1);
		}
	}
}

/* UC_UTF8_ROUTINES.is_endian_detection_character */
T1 T947f31(T0* C, T2 a1, T2 a2, T2 a3)
{
	T1 R = 0;
	T1 t1;
	t1 = (T947f30(C, a1, a2));
	if (t1) {
		R = ((a3)==((T2)('\277')));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF8_ROUTINES.is_endian_detection_character_start */
T1 T947f30(T0* C, T2 a1, T2 a2)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==((T2)('\357')));
	if (t1) {
		R = ((a2)==((T2)('\273')));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF16_ROUTINES.is_endian_detection_character_least_first */
T1 T1234f2(T0* C, T6 a1, T6 a2)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==((T6)(GE_int32(255))));
	if (t1) {
		R = ((a2)==((T6)(GE_int32(254))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* UC_UTF16_ROUTINES.is_endian_detection_character_most_first */
T1 T1234f1(T0* C, T6 a1, T6 a2)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==((T6)(GE_int32(254))));
	if (t1) {
		R = ((a2)==((T6)(GE_int32(255))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.read_character */
void T22f48(T0* C)
{
	T1 t1;
	t1 = ((((T22*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		((T22*)(C))->a9 = (((T72*)(GE_void(((T22*)(C))->a4)))->a1);
		((T22*)(C))->a4 = (((T72*)(GE_void(((T22*)(C))->a4)))->a2);
	} else {
		t1 = (T22f27(C));
		if (t1) {
			((T22*)(C))->a5 = EIF_TRUE;
		} else {
			T22f51(C);
			((T22*)(C))->a5 = (T22f27(C));
		}
	}
}

/* KL_TEXT_INPUT_FILE.old_read_character */
void T22f51(T0* C)
{
	((T22*)(C))->a9 = (T22f30(C, ((T22*)(C))->a6));
}

/* KL_TEXT_INPUT_FILE.file_gc */
T2 T22f30(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)(EIF_CHARACTER )file_gc((FILE *)a1);
	return R;
}

/* KL_STDIN_FILE.close */
void T955f21(T0* C)
{
}

/* XM_EIFFEL_INPUT_STREAM.close */
void T949f33(T0* C)
{
}

/* KL_TEXT_INPUT_FILE.close */
void T22f41(T0* C)
{
	GE_rescue r;
	T1 l1 = 0;
	T1 t1;
	if (GE_setjmp(r.jb) != 0) {
		t1 = ((T1)(!(l1)));
		if (t1) {
			l1 = EIF_TRUE;
			goto GE_retry;
		}
		GE_raise(8);
	}
GE_retry:
	r.previous = GE_last_rescue;
	GE_last_rescue = &r;
	t1 = ((T1)(!(l1)));
	if (t1) {
		T22f44(C);
		((T22*)(C))->a4 = EIF_VOID;
	}
	GE_last_rescue = r.previous;
}

/* KL_TEXT_INPUT_FILE.old_close */
void T22f44(T0* C)
{
	T22f45(C, ((T22*)(C))->a6);
	((T22*)(C))->a1 = (T6)(GE_int32(0));
	((T22*)(C))->a7 = EIF_FALSE;
}

/* KL_TEXT_INPUT_FILE.file_close */
void T22f45(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* ET_KEYWORD.position */
T0* T179f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_freeop */
T1 T680f15(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T680f37(C));
	t2 = ((T2)('\020'));
	R = ((((T680*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_freeop */
T1 T672f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_freeop */
T1 T474f36(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T474f9(C));
	t2 = ((T2)('\020'));
	R = ((((T474*)(C))->a1)==(t2));
	return R;
}

/* ET_ALIAS_FREE_NAME.free_operator_name */
T0* T680f8(T0* C)
{
	T0* R = 0;
	R = (T252x18046(GE_void(((T680*)(C))->a2)));
	return R;
}

/* ET_INFIX_FREE_NAME.free_operator_name */
T0* T674f8(T0* C)
{
	T0* R = 0;
	R = (T252x18046(GE_void(((T674*)(C))->a2)));
	return R;
}

/* ET_PREFIX_FREE_NAME.free_operator_name */
T0* T672f8(T0* C)
{
	T0* R = 0;
	R = (T252x18046(GE_void(((T672*)(C))->a2)));
	return R;
}

/* ET_REDECLARED_FEATURE.selected_count */
T6 T1220f25(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T1220f17(C));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_INHERITED_FEATURE.selected_count */
T6 T1218f27(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T1218f18(C));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_REDECLARED_FEATURE.has_replication */
T1 T1220f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INHERITED_FEATURE.has_replication */
T1 T1218f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REPLICATED_FEATURE.replicated_feature */
T0* T1257f4(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REDECLARED_FEATURE.replicated_feature */
T0* T1220f23(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INHERITED_FEATURE.replicated_feature */
T0* T1218f25(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_REPLICATED_FEATURE.first_feature */
T0* T1257f5(T0* C)
{
	T0* R = 0;
	R = (T1258f9(GE_void(((T1257*)(C))->a1)));
	return R;
}

/* DS_LINKED_LIST [ET_ADAPTED_FEATURE].first */
T0* T1258f9(T0* C)
{
	T0* R = 0;
	R = (((T1362*)(GE_void(((T1258*)(C))->a2)))->a1);
	return R;
}

/* ET_REDECLARED_FEATURE.first_feature */
T0* T1220f24(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INHERITED_FEATURE.first_feature */
T0* T1218f26(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REDECLARED_FEATURE.immediate_feature */
T0* T1220f10(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INHERITED_FEATURE.immediate_feature */
T0* T1218f11(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.immediate_feature */
T0* T667f53(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE.immediate_feature */
T0* T666f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DEFERRED_FUNCTION.immediate_feature */
T0* T661f55(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION.immediate_feature */
T0* T660f56(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION.immediate_feature */
T0* T658f56(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DEFERRED_PROCEDURE.immediate_feature */
T0* T327f49(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE.immediate_feature */
T0* T322f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ATTRIBUTE.immediate_feature */
T0* T254f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.immediate_feature */
T0* T253f53(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.immediate_feature */
T0* T251f53(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION.immediate_feature */
T0* T176f59(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INHERITED_FEATURE.is_redeclared */
T1 T1218f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_redeclared */
T1 T667f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_redeclared */
T1 T666f53(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_redeclared */
T1 T661f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_redeclared */
T1 T660f58(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_redeclared */
T1 T658f58(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_redeclared */
T1 T327f51(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_redeclared */
T1 T322f53(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_redeclared */
T1 T254f53(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_redeclared */
T1 T253f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_redeclared */
T1 T251f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_redeclared */
T1 T176f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REDECLARED_FEATURE.redeclared_feature */
T0* T1220f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INHERITED_FEATURE.redeclared_feature */
T0* T1218f14(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.redeclared_feature */
T0* T667f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.redeclared_feature */
T0* T666f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.redeclared_feature */
T0* T661f58(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.redeclared_feature */
T0* T660f59(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_FUNCTION.redeclared_feature */
T0* T658f59(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.redeclared_feature */
T0* T327f52(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_PROCEDURE.redeclared_feature */
T0* T322f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ATTRIBUTE.redeclared_feature */
T0* T254f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.redeclared_feature */
T0* T253f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.redeclared_feature */
T0* T251f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.redeclared_feature */
T0* T176f62(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_REDECLARED_FEATURE.is_inherited */
T1 T1220f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_inherited */
T1 T667f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_inherited */
T1 T666f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_inherited */
T1 T661f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_inherited */
T1 T660f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_inherited */
T1 T658f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_inherited */
T1 T327f53(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_inherited */
T1 T322f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_inherited */
T1 T254f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_inherited */
T1 T253f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_inherited */
T1 T251f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_inherited */
T1 T176f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REDECLARED_FEATURE.inherited_feature */
T0* T1220f15(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INHERITED_FEATURE.inherited_feature */
T0* T1218f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.inherited_feature */
T0* T667f58(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.inherited_feature */
T0* T666f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.inherited_feature */
T0* T661f60(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.inherited_feature */
T0* T660f61(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_FUNCTION.inherited_feature */
T0* T658f61(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.inherited_feature */
T0* T327f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_PROCEDURE.inherited_feature */
T0* T322f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ATTRIBUTE.inherited_feature */
T0* T254f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.inherited_feature */
T0* T253f58(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.inherited_feature */
T0* T251f58(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.inherited_feature */
T0* T176f64(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.flattened_feature */
T0* T667f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE.flattened_feature */
T0* T666f49(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DEFERRED_FUNCTION.flattened_feature */
T0* T661f53(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION.flattened_feature */
T0* T660f54(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION.flattened_feature */
T0* T658f54(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DEFERRED_PROCEDURE.flattened_feature */
T0* T327f47(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE.flattened_feature */
T0* T322f49(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ATTRIBUTE.flattened_feature */
T0* T254f49(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.flattened_feature */
T0* T253f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.flattened_feature */
T0* T251f51(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION.flattened_feature */
T0* T176f57(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_adapted */
T1 T667f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_adapted */
T1 T666f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_adapted */
T1 T661f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_adapted */
T1 T660f62(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_adapted */
T1 T658f62(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_adapted */
T1 T327f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_adapted */
T1 T322f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_adapted */
T1 T254f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_adapted */
T1 T253f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_adapted */
T1 T251f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_adapted */
T1 T176f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REDECLARED_FEATURE.adapted_feature */
T0* T1220f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INHERITED_FEATURE.adapted_feature */
T0* T1218f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.adapted_feature */
T0* T667f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.adapted_feature */
T0* T666f52(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.adapted_feature */
T0* T661f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.adapted_feature */
T0* T660f57(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_FUNCTION.adapted_feature */
T0* T658f57(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.adapted_feature */
T0* T327f50(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_PROCEDURE.adapted_feature */
T0* T322f52(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ATTRIBUTE.adapted_feature */
T0* T254f52(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.adapted_feature */
T0* T253f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.adapted_feature */
T0* T251f54(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.adapted_feature */
T0* T176f60(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_XACE_CLUSTER.is_none */
T1 T278f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_LACE_CLUSTER.is_none */
T1 T136f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_NONE_GROUP.is_dotnet_assembly */
T1 T310f5(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_XACE_CLUSTER.is_dotnet_assembly */
T1 T278f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_LACE_CLUSTER.is_dotnet_assembly */
T1 T136f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_NONE_GROUP.is_cluster */
T1 T310f4(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_NONE_GROUP.cluster */
T0* T310f6(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_XACE_CLUSTER.cluster */
T0* T278f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LACE_CLUSTER.cluster */
T0* T136f25(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_NONE_GROUP.full_pathname */
T0* T310f8(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	l1 = (T310f11(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = ((GE_void(l1), (T6)0));
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		R = l1;
	} else {
		R = ((T310*)(C))->a1;
	}
	return R;
}

/* ET_NONE_GROUP.pathname */
T0* T310f11(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_XACE_CLUSTER.full_pathname */
T0* T278f25(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l1 = ((T278*)(C))->a2;
	if (((T278*)(C))->a3) {
		t1 = ((((T278*)(C))->a15)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		l2 = (T278f25(GE_void(((T278*)(C))->a15)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T948*)(l1))->a1));
			t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		}
		if (t1) {
			l3 = l1;
		} else {
			l3 = ((T278*)(C))->a1;
		}
		t3 = (T278f33(C));
		R = (((((T0*)(GE_void(t3)))->id==70)?T70f8(t3, l2, l3):T71f7(t3, l2, l3)));
	} else {
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T948*)(l1))->a1));
			t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		}
		if (t1) {
			R = l1;
		} else {
			R = ((T278*)(C))->a1;
		}
	}
	return R;
}

/* ET_XACE_CLUSTER.file_system */
T0* T278f33(T0* C)
{
	T0* R = 0;
	T0* t1;
	T1 t2;
	if (ge306os1585) {
		return ge306ov1585;
	} else {
		ge306os1585 = '\1';
	}
	t1 = (T278f26(C));
	t2 = (T66f1(GE_void(t1)));
	if (t2) {
		R = (T278f34(C));
	} else {
		t1 = (T278f26(C));
		t2 = (T66f2(GE_void(t1)));
		if (t2) {
			R = (T278f35(C));
		} else {
			R = (T278f35(C));
		}
	}
	ge306ov1585 = R;
	return R;
}

/* ET_XACE_CLUSTER.unix_file_system */
T0* T278f35(T0* C)
{
	T0* R = 0;
	if (ge306os1588) {
		return ge306ov1588;
	} else {
		ge306os1588 = '\1';
	}
	R = T71c16();
	ge306ov1588 = R;
	return R;
}

/* ET_XACE_CLUSTER.windows_file_system */
T0* T278f34(T0* C)
{
	T0* R = 0;
	if (ge306os1586) {
		return ge306ov1586;
	} else {
		ge306os1586 = '\1';
	}
	R = T70c20();
	ge306ov1586 = R;
	return R;
}

/* ET_LACE_CLUSTER.full_pathname */
T0* T136f19(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	l1 = (T136f18(C));
	if (((T136*)(C))->a3) {
		t1 = ((((T136*)(C))->a10)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		l2 = (T136f19(GE_void(((T136*)(C))->a10)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T948*)(l1))->a1));
			t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		}
		if (t1) {
			l3 = l1;
		} else {
			l3 = (T136f20(C));
		}
		t3 = (T136f34(C));
		R = (((((T0*)(GE_void(t3)))->id==70)?T70f8(t3, l2, l3):T71f7(t3, l2, l3)));
	} else {
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T948*)(l1))->a1));
			t1 = (T6f1(&t2, (T6)(GE_int32(0))));
		}
		if (t1) {
			R = l1;
		} else {
			R = (T136f20(C));
		}
	}
	return R;
}

/* ET_LACE_CLUSTER.file_system */
T0* T136f34(T0* C)
{
	T0* R = 0;
	T0* t1;
	T1 t2;
	if (ge306os1585) {
		return ge306ov1585;
	} else {
		ge306os1585 = '\1';
	}
	t1 = (T136f15(C));
	t2 = (T66f1(GE_void(t1)));
	if (t2) {
		R = (T136f16(C));
	} else {
		t1 = (T136f15(C));
		t2 = (T66f2(GE_void(t1)));
		if (t2) {
			R = (T136f17(C));
		} else {
			R = (T136f17(C));
		}
	}
	ge306ov1585 = R;
	return R;
}

/* ET_LACE_CLUSTER.unix_file_system */
T0* T136f17(T0* C)
{
	T0* R = 0;
	if (ge306os1588) {
		return ge306ov1588;
	} else {
		ge306os1588 = '\1';
	}
	R = T71c16();
	ge306ov1588 = R;
	return R;
}

/* ET_LACE_CLUSTER.windows_file_system */
T0* T136f16(T0* C)
{
	T0* R = 0;
	if (ge306os1586) {
		return ge306ov1586;
	} else {
		ge306os1586 = '\1';
	}
	R = T70c20();
	ge306ov1586 = R;
	return R;
}

/* ET_LACE_CLUSTER.pathname */
T0* T136f18(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T136*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		R = (((T129*)(GE_void(((T136*)(C))->a2)))->a6);
	}
	return R;
}

/* ET_NONE_GROUP.full_lower_name */
T0* T310f7(T0* C, T2 a1)
{
	T0* R = 0;
	R = (T310f10(C));
	return R;
}

/* ET_NONE_GROUP.lower_name */
T0* T310f10(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = ((T310*)(C))->a1;
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f30(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_XACE_CLUSTER.full_lower_name */
T0* T278f22(T0* C, T2 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = ((((T278*)(C))->a15)!=(EIF_VOID));
	if (t1) {
		l1 = (T278f22(GE_void(((T278*)(C))->a15), a1));
		l2 = (T278f29(C));
		t2 = (T278f30(C));
		t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T948*)(l1))->a1));
		t4 = (((((T0*)(GE_void(l2)))->id==17)?((T17*)(l2))->a2:((T948*)(l2))->a1));
		t3 = ((T6)((t3)+(t4)));
		t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
		R = (T26f7(GE_void(t2), l1, t3));
		if (((T0*)(GE_void(R)))->id==17) {
			T17f41(R, l1);
		} else {
			T948f57(R, l1);
		}
		if (((T0*)(GE_void(R)))->id==17) {
			T17f39(R, a1);
		} else {
			T948f58(R, a1);
		}
		t2 = (T278f30(C));
		R = (T26f8(GE_void(t2), R, l2));
	} else {
		R = (T278f29(C));
	}
	return R;
}

/* ET_XACE_CLUSTER.lower_name */
T0* T278f29(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = ((T278*)(C))->a1;
	l2 = (((((T0*)(GE_void(R)))->id==17)?((T17*)(R))->a2:((T948*)(R))->a1));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (((((T0*)(GE_void(R)))->id==17)?T17f10(R, l1):T948f7(R, l1)));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (((((T0*)(GE_void(R)))->id==17)?T17f30(R):T948f22(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_LACE_CLUSTER.full_lower_name */
T0* T136f27(T0* C, T2 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T6 t4;
	t1 = ((((T136*)(C))->a10)!=(EIF_VOID));
	if (t1) {
		l1 = (T136f27(GE_void(((T136*)(C))->a10), a1));
		l2 = (T136f33(C));
		t2 = (T136f30(C));
		t3 = (((((T0*)(GE_void(l1)))->id==17)?((T17*)(l1))->a2:((T948*)(l1))->a1));
		t4 = (((((T0*)(GE_void(l2)))->id==17)?((T17*)(l2))->a2:((T948*)(l2))->a1));
		t3 = ((T6)((t3)+(t4)));
		t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
		R = (T26f7(GE_void(t2), l1, t3));
		if (((T0*)(GE_void(R)))->id==17) {
			T17f41(R, l1);
		} else {
			T948f57(R, l1);
		}
		if (((T0*)(GE_void(R)))->id==17) {
			T17f39(R, a1);
		} else {
			T948f58(R, a1);
		}
		t2 = (T136f30(C));
		R = (T26f8(GE_void(t2), R, l2));
	} else {
		R = (T136f33(C));
	}
	return R;
}

/* ET_LACE_CLUSTER.lower_name */
T0* T136f33(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = (T136f20(C));
	l2 = (((((T0*)(GE_void(R)))->id==17)?((T17*)(R))->a2:((T948*)(R))->a1));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (((((T0*)(GE_void(R)))->id==17)?T17f10(R, l1):T948f7(R, l1)));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (((((T0*)(GE_void(R)))->id==17)?T17f30(R):T948f22(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_NONE_GROUP.dotnet_assembly */
T0* T310f9(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_XACE_CLUSTER.dotnet_assembly */
T0* T278f23(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_LACE_CLUSTER.dotnet_assembly */
T0* T136f28(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_TAGGED_ASSERTION.assertion */
T0* T844f3(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.assertion */
T0* T834f15(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.assertion */
T0* T833f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.assertion */
T0* T832f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.assertion */
T0* T831f17(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.assertion */
T0* T830f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.assertion */
T0* T828f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TYPE.assertion */
T0* T818f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STRIP_EXPRESSION.assertion */
T0* T811f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_ARRAY.assertion */
T0* T809f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.assertion */
T0* T808f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_AGENT.assertion */
T0* T804f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_OLD_EXPRESSION.assertion */
T0* T803f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_EXPRESSION.assertion */
T0* T802f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EQUALITY_EXPRESSION.assertion */
T0* T801f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_EXPRESSION.assertion */
T0* T797f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXPRESSION_ADDRESS.assertion */
T0* T795f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT_ADDRESS.assertion */
T0* T794f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT_ADDRESS.assertion */
T0* T793f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FEATURE_ADDRESS.assertion */
T0* T792f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.assertion */
T0* T787f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PRECURSOR_EXPRESSION.assertion */
T0* T786f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.assertion */
T0* T771f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BRACKET_EXPRESSION.assertion */
T0* T723f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CREATE_EXPRESSION.assertion */
T0* T550f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.assertion */
T0* T521f17(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.assertion */
T0* T520f17(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FALSE_CONSTANT.assertion */
T0* T519f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TRUE_CONSTANT.assertion */
T0* T518f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.assertion */
T0* T516f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.assertion */
T0* T515f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.assertion */
T0* T514f28(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.assertion */
T0* T513f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.assertion */
T0* T512f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.assertion */
T0* T511f19(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VERBATIM_STRING.assertion */
T0* T510f23(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.assertion */
T0* T509f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.assertion */
T0* T508f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VOID.assertion */
T0* T496f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_CONSTANT.assertion */
T0* T460f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT.assertion */
T0* T221f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TUPLE.assertion */
T0* T204f15(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.assertion */
T0* T202f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT.assertion */
T0* T197f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.assertion */
T0* T129f75(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TAGGED_ASSERTION.position */
T0* T844f4(T0* C)
{
	T0* R = 0;
	R = (T129f33(GE_void(((T844*)(C))->a1)));
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.agent_actual_argument */
T0* T1419f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONVERT_EXPRESSION.agent_actual_argument */
T0* T1322f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_AGENT_TYPED_OPEN_ARGUMENT.agent_actual_argument */
T0* T842f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.agent_actual_argument */
T0* T834f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.agent_actual_argument */
T0* T833f14(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.agent_actual_argument */
T0* T832f14(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.agent_actual_argument */
T0* T831f15(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.agent_actual_argument */
T0* T830f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.agent_actual_argument */
T0* T828f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TYPE.agent_actual_argument */
T0* T818f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STRIP_EXPRESSION.agent_actual_argument */
T0* T811f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_ARRAY.agent_actual_argument */
T0* T809f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.agent_actual_argument */
T0* T808f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_AGENT.agent_actual_argument */
T0* T804f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_OLD_EXPRESSION.agent_actual_argument */
T0* T803f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_EXPRESSION.agent_actual_argument */
T0* T802f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EQUALITY_EXPRESSION.agent_actual_argument */
T0* T801f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_EXPRESSION.agent_actual_argument */
T0* T797f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXPRESSION_ADDRESS.agent_actual_argument */
T0* T795f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT_ADDRESS.agent_actual_argument */
T0* T794f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT_ADDRESS.agent_actual_argument */
T0* T793f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FEATURE_ADDRESS.agent_actual_argument */
T0* T792f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.agent_actual_argument */
T0* T787f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PRECURSOR_EXPRESSION.agent_actual_argument */
T0* T786f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.agent_actual_argument */
T0* T771f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BRACKET_EXPRESSION.agent_actual_argument */
T0* T723f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CREATE_EXPRESSION.agent_actual_argument */
T0* T550f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.agent_actual_argument */
T0* T521f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.agent_actual_argument */
T0* T520f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FALSE_CONSTANT.agent_actual_argument */
T0* T519f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TRUE_CONSTANT.agent_actual_argument */
T0* T518f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.agent_actual_argument */
T0* T516f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.agent_actual_argument */
T0* T515f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.agent_actual_argument */
T0* T514f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.agent_actual_argument */
T0* T513f22(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.agent_actual_argument */
T0* T512f22(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.agent_actual_argument */
T0* T511f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VERBATIM_STRING.agent_actual_argument */
T0* T510f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.agent_actual_argument */
T0* T509f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.agent_actual_argument */
T0* T508f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_QUESTION_MARK_SYMBOL.agent_actual_argument */
T0* T505f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VOID.agent_actual_argument */
T0* T496f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_CONSTANT.agent_actual_argument */
T0* T460f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT.agent_actual_argument */
T0* T221f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TUPLE.agent_actual_argument */
T0* T204f14(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.agent_actual_argument */
T0* T202f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT.agent_actual_argument */
T0* T197f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.agent_actual_argument */
T0* T129f74(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.type */
T0* T834f14(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.type */
T0* T833f15(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.type */
T0* T832f15(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.type */
T0* T831f16(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T831*)(C))->a7)));
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.type */
T0* T830f17(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T830*)(C))->a2)));
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.type */
T0* T828f17(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T828*)(C))->a2)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.locals */
T0* T834f23(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.locals */
T0* T831f24(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.choice */
T0* T771f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CHOICE_RANGE.choice */
T0* T769f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.choice */
T0* T521f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.choice */
T0* T520f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.choice */
T0* T514f20(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.choice */
T0* T513f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.choice */
T0* T512f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.choice */
T0* T508f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.choice */
T0* T202f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.choice */
T0* T129f73(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.lower */
T0* T771f19(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.lower */
T0* T521f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.lower */
T0* T520f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.lower */
T0* T514f36(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.lower */
T0* T513f37(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.lower */
T0* T512f37(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.lower */
T0* T508f30(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.lower */
T0* T202f19(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.lower */
T0* T129f88(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.is_range */
T1 T771f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_range */
T1 T521f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_range */
T1 T520f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_range */
T1 T514f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_range */
T1 T513f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_range */
T1 T512f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_range */
T1 T508f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CALL_EXPRESSION.is_range */
T1 T202f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_range */
T1 T129f89(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.upper */
T0* T771f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.upper */
T0* T521f31(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.upper */
T0* T520f31(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.upper */
T0* T514f38(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.upper */
T0* T513f39(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.upper */
T0* T512f39(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.upper */
T0* T508f32(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.upper */
T0* T202f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.upper */
T0* T129f90(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.last_leaf */
T0* T565f64(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T565*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T566f11(GE_void(((T565*)(C))->a3)));
	} else {
		R = (T167x6250(GE_void(((T565*)(C))->a2)));
	}
	return R;
}

/* ET_CONSTRAINT_CREATOR.last_leaf */
T0* T566f11(T0* C)
{
	T0* R = 0;
	R = ((T566*)(C))->a2;
	return R;
}

/* ET_FORMAL_PARAMETER.last_leaf */
T0* T557f62(T0* C)
{
	T0* R = 0;
	R = ((T557*)(C))->a1;
	return R;
}

/* ET_CLASS.last_leaf */
T0* T60f158(T0* C)
{
	T0* R = 0;
	R = ((T60*)(C))->a7;
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.is_tuple_label */
T1 T1419f15(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T1419f5(C));
	R = (T169x11705(GE_void(t1)));
	return R;
}

/* ET_PREFIX_EXPRESSION.is_tuple_label */
T1 T802f10(T0* C)
{
	T1 R = 0;
	R = (T798x11705(GE_void(((T802*)(C))->a1)));
	return R;
}

/* ET_INFIX_EXPRESSION.is_tuple_label */
T1 T797f10(T0* C)
{
	T1 R = 0;
	R = (T798x11705(GE_void(((T797*)(C))->a2)));
	return R;
}

/* ET_BRACKET_EXPRESSION.is_tuple_label */
T1 T723f8(T0* C)
{
	T1 R = 0;
	R = (T502f17(GE_void(((T723*)(C))->a2)));
	return R;
}

/* ET_CALL_EXPRESSION.is_tuple_label */
T1 T202f7(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T202f6(C));
	R = (T169x11705(GE_void(t1)));
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.arguments_count */
T6 T1419f16(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T1419f4(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_PREFIX_EXPRESSION.arguments_count */
T6 T802f14(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T802f9(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_BRACKET_EXPRESSION.arguments_count */
T6 T723f13(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T723*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T813*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_CALL_EXPRESSION.arguments_count */
T6 T202f16(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T202*)(C))->a4;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T198*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_LABELED_COMMA_ACTUAL_PARAMETER.named_parameter_with_type */
T0* T965f6(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T965f4(C));
	t2 = ((a1)==(t1));
	if (t2) {
		R = C;
	} else {
		l1 = T965c8(((T965*)(C))->a1, a1);
		R = l1;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.named_parameter_with_type */
T0* T956f38(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_CURRENT.named_parameter_with_type */
T0* T716f39(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_FEATURE.named_parameter_with_type */
T0* T714f34(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LABELED_ACTUAL_PARAMETER.named_parameter_with_type */
T0* T712f6(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T712f4(C));
	t2 = ((a1)==(t1));
	if (t2) {
		R = C;
	} else {
		l1 = T712c8(((T712*)(C))->a1, a1);
		R = l1;
	}
	return R;
}

/* ET_BIT_FEATURE.named_parameter_with_type */
T0* T578f36(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_BIT_N.named_parameter_with_type */
T0* T577f35(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.named_parameter_with_type */
T0* T565f54(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_FORMAL_PARAMETER.named_parameter_with_type */
T0* T557f51(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_TUPLE_TYPE.named_parameter_with_type */
T0* T312f23(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.named_parameter_with_type */
T0* T174f31(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CLASS_TYPE.named_parameter_with_type */
T0* T172f27(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CLASS.named_parameter_with_type */
T0* T60f91(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_prefix */
T1 T680f14(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T680f37(C));
	t2 = ((T2)('A'));
	R = ((((T680*)(C))->a3)==(t2));
	return R;
}

/* ET_ALIAS_NAME.is_prefix */
T1 T676f11(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	T1 t3;
	t1 = (T676f5(C));
	t2 = ((T2)('>'));
	t3 = (T2f4(&(((T676*)(C))->a3), t2));
	if (t3) {
		t1 = (T676f5(C));
		t2 = ((T2)('A'));
		R = (T2f7(&(((T676*)(C))->a3), t2));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.is_prefixable */
T1 T680f11(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_ALIAS_NAME.is_prefixable */
T1 T676f8(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = (T676f11(C));
	if (!(t1)) {
		t1 = (T676f34(C));
	}
	if (!(t1)) {
		R = (T676f35(C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infixable */
T1 T680f12(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_ALIAS_NAME.is_infixable */
T1 T676f9(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = (T676f10(C));
	if (!(t1)) {
		t1 = (T676f36(C));
	}
	if (!(t1)) {
		R = (T676f37(C));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix */
T1 T680f13(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T680f37(C));
	t2 = ((T2)('\020'));
	R = ((((T680*)(C))->a3)==(t2));
	return R;
}

/* ET_ALIAS_NAME.is_infix */
T1 T676f10(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	T1 t3;
	t1 = (T676f5(C));
	t2 = ((T2)('\001'));
	t3 = (T2f4(&(((T676*)(C))->a3), t2));
	if (t3) {
		t1 = (T676f5(C));
		t2 = ((T2)('\023'));
		R = (T2f7(&(((T676*)(C))->a3), t2));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ALIAS_NAME.hash_code */
T6 T676f38(T0* C)
{
	T6 R = 0;
	R = ((T6)(((T676*)(C))->a3));
	return R;
}

/* ET_ALIAS_FREE_NAME.position */
T0* T680f38(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T680*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T680*)(C))->a2)));
	}
	return R;
}

/* ET_ALIAS_NAME.position */
T0* T676f56(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T676*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T676*)(C))->a2)));
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.lower_name */
T0* T680f39(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = (T680f40(C));
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f30(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.name */
T0* T680f40(T0* C)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T680f8(C));
	t2 = (((((T0*)(GE_void(t1)))->id==17)?((T17*)(t1))->a2:((T948*)(t1))->a1));
	t2 = ((T6)((t2)+((T6)(GE_int32(8)))));
	R = T17c36(t2);
	T17f41(GE_void(R), ge777ov23134);
	t1 = (T680f8(C));
	T17f41(GE_void(R), t1);
	T17f39(GE_void(R), (T2)('\"'));
	return R;
}

/* ET_ALIAS_NAME.lower_name */
T0* T676f57(T0* C)
{
	T0* R = 0;
	R = (T676f58(C));
	return R;
}

/* ET_ALIAS_NAME.name */
T0* T676f58(T0* C)
{
	T0* R = 0;
	T0* t1;
	switch (((T676*)(C))->a3) {
	case (T2)(T2)('\024'):
		t1 = (T676f5(C));
		R = (ge773ov14158);
		break;
	case (T2)(T2)('\001'):
		t1 = (T676f5(C));
		R = (ge773ov14139);
		break;
	case (T2)(T2)('\021'):
		t1 = (T676f5(C));
		R = (ge773ov14155);
		break;
	case (T2)(T2)('\005'):
		t1 = (T676f5(C));
		R = (ge773ov14143);
		break;
	case (T2)(T2)('\006'):
		t1 = (T676f5(C));
		R = (ge773ov14144);
		break;
	case (T2)(T2)('\007'):
		t1 = (T676f5(C));
		R = (ge773ov14145);
		break;
	case (T2)(T2)('\010'):
		t1 = (T676f5(C));
		R = (ge773ov14146);
		break;
	case (T2)(T2)('\002'):
		t1 = (T676f5(C));
		R = (ge773ov14140);
		break;
	case (T2)(T2)('\t'):
		t1 = (T676f5(C));
		R = (ge773ov14147);
		break;
	case (T2)(T2)('\n'):
		t1 = (T676f5(C));
		R = (ge773ov14148);
		break;
	case (T2)(T2)('\013'):
		t1 = (T676f5(C));
		R = (ge773ov14149);
		break;
	case (T2)(T2)('\014'):
		t1 = (T676f5(C));
		R = (ge773ov14150);
		break;
	case (T2)(T2)('\003'):
		t1 = (T676f5(C));
		R = (ge773ov14141);
		break;
	case (T2)(T2)('\022'):
		t1 = (T676f5(C));
		R = (ge773ov14156);
		break;
	case (T2)(T2)('\r'):
		t1 = (T676f5(C));
		R = (ge773ov14151);
		break;
	case (T2)(T2)('\016'):
		t1 = (T676f5(C));
		R = (ge773ov14152);
		break;
	case (T2)(T2)('\017'):
		t1 = (T676f5(C));
		R = (ge773ov14153);
		break;
	case (T2)(T2)('\004'):
		t1 = (T676f5(C));
		R = (ge773ov14142);
		break;
	case (T2)(T2)('\023'):
		t1 = (T676f5(C));
		R = (ge773ov14154);
		break;
	case (T2)(T2)('?'):
		t1 = (T676f5(C));
		R = (ge773ov14149);
		break;
	case (T2)(T2)('@'):
		t1 = (T676f5(C));
		R = (ge773ov14151);
		break;
	case (T2)(T2)('>'):
		t1 = (T676f5(C));
		R = (ge773ov14157);
		break;
	default:
		t1 = (T676f5(C));
		R = (ge773ov14093);
		break;
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.same_call_name */
T1 T680f9(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	T1 t3;
	T0* t4;
	T0* t5;
	T0* t6;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		if ((a1)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(a1))->id) {
			case 672:
			case 674:
			case 680:
			case 474:
				l1 = a1;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (T1321x23(GE_void(l1)));
			t1 = ((((T680*)(C))->a4)==(t2));
			if (t1) {
				t1 = (T680f15(C));
				t3 = (T1321x11711(GE_void(l1)));
				t1 = ((t1)!=(t3));
				if (t1) {
					R = EIF_FALSE;
				} else {
					t4 = (T1321x21376(GE_void(l1)));
					t5 = (T680f8(C));
					t1 = ((t4)==(t5));
					if (t1) {
						R = EIF_TRUE;
					} else {
						t4 = (T680f7(C));
						t5 = (T680f8(C));
						t6 = (T1321x21376(GE_void(l1)));
						R = (T26f14(GE_void(t4), t5, t6));
					}
				}
			}
		}
	}
	return R;
}

/* ET_ALIAS_NAME.same_call_name */
T1 T676f6(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		switch (((T676*)(C))->a3) {
		case (T2)(T2)('\024'):
			R = (T224x11731(GE_void(a1)));
			break;
		case (T2)(T2)('\001'):
			R = (T224x11707(GE_void(a1)));
			break;
		case (T2)(T2)('\021'):
			R = (T224x11708(GE_void(a1)));
			break;
		case (T2)(T2)('\005'):
			R = (T224x11709(GE_void(a1)));
			break;
		case (T2)(T2)('\006'):
			R = (T224x11710(GE_void(a1)));
			break;
		case (T2)(T2)('\007'):
			R = (T224x11712(GE_void(a1)));
			break;
		case (T2)(T2)('\010'):
			R = (T224x11713(GE_void(a1)));
			break;
		case (T2)(T2)('\002'):
			R = (T224x11714(GE_void(a1)));
			break;
		case (T2)(T2)('\t'):
			R = (T224x11715(GE_void(a1)));
			break;
		case (T2)(T2)('\n'):
			R = (T224x11716(GE_void(a1)));
			break;
		case (T2)(T2)('\013'):
			R = (T224x11717(GE_void(a1)));
			break;
		case (T2)(T2)('\014'):
			R = (T224x11718(GE_void(a1)));
			break;
		case (T2)(T2)('\003'):
			R = (T224x11719(GE_void(a1)));
			break;
		case (T2)(T2)('\022'):
			R = (T224x11720(GE_void(a1)));
			break;
		case (T2)(T2)('\r'):
			R = (T224x11721(GE_void(a1)));
			break;
		case (T2)(T2)('\016'):
			R = (T224x11722(GE_void(a1)));
			break;
		case (T2)(T2)('\017'):
			R = (T224x11723(GE_void(a1)));
			break;
		case (T2)(T2)('\004'):
			R = (T224x11724(GE_void(a1)));
			break;
		case (T2)(T2)('\023'):
			R = (T224x11725(GE_void(a1)));
			break;
		case (T2)(T2)('?'):
			R = (T224x11727(GE_void(a1)));
			break;
		case (T2)(T2)('@'):
			R = (T224x11728(GE_void(a1)));
			break;
		case (T2)(T2)('>'):
			R = (T224x11730(GE_void(a1)));
			break;
		default:
			break;
		}
	}
	return R;
}

/* ET_ALIAS_FREE_NAME.same_alias_name */
T1 T680f42(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T0* t4;
	T0* t5;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T680f43(C));
		t2 = (T79f4(GE_void(t2), a1));
		if ((t2)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(t2))->id) {
			case 672:
			case 674:
			case 680:
				l1 = t2;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t3 = (T1321x23(GE_void(l1)));
			t1 = ((((T680*)(C))->a4)==(t3));
			if (t1) {
				t2 = (T1321x21376(GE_void(l1)));
				t4 = (T680f8(C));
				t1 = ((t2)==(t4));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t2 = (T680f7(C));
					t4 = (T680f8(C));
					t5 = (T1321x21376(GE_void(l1)));
					R = (T26f14(GE_void(t2), t4, t5));
				}
			}
		}
	}
	return R;
}

/* KL_ANY_ROUTINES.to_any */
T0* T79f4(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_ALIAS_FREE_NAME.any_ */
T0* T680f43(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_ALIAS_NAME.same_alias_name */
T1 T676f60(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T676f6(C, a1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			switch (((T676*)(C))->a3) {
			case (T2)(T2)('\r'):
				R = (T676x11728(GE_void(a1)));
				break;
			case (T2)(T2)('\013'):
				R = (T676x11727(GE_void(a1)));
				break;
			case (T2)(T2)('@'):
				R = (T676x11721(GE_void(a1)));
				break;
			case (T2)(T2)('?'):
				R = (T676x11717(GE_void(a1)));
				break;
			default:
				R = EIF_FALSE;
				break;
			}
		}
	}
	return R;
}

/* ET_INFIX_FREE_NAME.same_alias_name */
T1 T674f58(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T0* t4;
	T0* t5;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T674f44(C));
		t2 = (T79f4(GE_void(t2), a1));
		if ((t2)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(t2))->id) {
			case 672:
			case 674:
			case 680:
				l1 = t2;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t3 = (T1321x23(GE_void(l1)));
			t1 = ((((T674*)(C))->a4)==(t3));
			if (t1) {
				t2 = (T1321x21376(GE_void(l1)));
				t4 = (T674f8(C));
				t1 = ((t2)==(t4));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t2 = (T674f7(C));
					t4 = (T674f8(C));
					t5 = (T1321x21376(GE_void(l1)));
					R = (T26f14(GE_void(t2), t4, t5));
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_FREE_NAME.any_ */
T0* T674f44(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_INFIX_NAME.same_alias_name */
T1 T673f69(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T673f20(C, a1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			switch (((T673*)(C))->a3) {
			case (T2)(T2)('\r'):
				R = (T676x11728(GE_void(a1)));
				break;
			case (T2)(T2)('\013'):
				R = (T676x11727(GE_void(a1)));
				break;
			case (T2)(T2)('@'):
				R = (T676x11721(GE_void(a1)));
				break;
			case (T2)(T2)('?'):
				R = (T676x11717(GE_void(a1)));
				break;
			default:
				R = EIF_FALSE;
				break;
			}
		}
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.same_alias_name */
T1 T672f58(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	T0* t4;
	T0* t5;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T672f31(C));
		t2 = (T79f4(GE_void(t2), a1));
		if ((t2)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(t2))->id) {
			case 672:
			case 674:
			case 680:
				l1 = t2;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t3 = (T1321x23(GE_void(l1)));
			t1 = ((((T672*)(C))->a4)==(t3));
			if (t1) {
				t2 = (T1321x21376(GE_void(l1)));
				t4 = (T672f8(C));
				t1 = ((t2)==(t4));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t2 = (T672f7(C));
					t4 = (T672f8(C));
					t5 = (T1321x21376(GE_void(l1)));
					R = (T26f14(GE_void(t2), t4, t5));
				}
			}
		}
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.any_ */
T0* T672f31(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_PREFIX_NAME.same_alias_name */
T1 T671f55(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = (T671f17(C, a1));
		if (t1) {
			R = EIF_TRUE;
		} else {
			switch (((T671*)(C))->a3) {
			case (T2)(T2)('\r'):
				R = (T676x11728(GE_void(a1)));
				break;
			case (T2)(T2)('\013'):
				R = (T676x11727(GE_void(a1)));
				break;
			case (T2)(T2)('@'):
				R = (T676x11721(GE_void(a1)));
				break;
			case (T2)(T2)('?'):
				R = (T676x11717(GE_void(a1)));
				break;
			default:
				R = EIF_FALSE;
				break;
			}
		}
	}
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.manifest_string */
T0* T511f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VERBATIM_STRING.manifest_string */
T0* T510f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.manifest_string */
T0* T509f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SYMBOL.position */
T0* T455f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_AGENT_KEYWORD.position */
T0* T449f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.last_position */
T0* T521f33(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	t1 = (T521f22(C));
	t2 = (T521f23(C));
	t2 = ((T6)((t2)+((T6)(GE_int32(3)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_COMPRESSED_POSITION.make */
T0* T1326c9(T6 a1, T6 a2)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T1326));
	*(T1326*)C = GE_default1326;
	T1326f10(C, a1, a2);
	return C;
}

/* ET_COMPRESSED_POSITION.set_position */
void T1326f10(T0* C, T6 a1, T6 a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T6 t2;
	t1 = (T6f1(&a1, (T6)(GE_int32(8388607))));
	if (t1) {
		l1 = (T6)(GE_int32(0));
	} else {
		l1 = a1;
	}
	t1 = (T6f1(&a2, (T6)(GE_int32(255))));
	if (t1) {
		l2 = (T6)(GE_int32(0));
	} else {
		l2 = a2;
	}
	t2 = (T6)(GE_int32(256));
	t2 = ((T6)((t2)*(l1)));
	((T1326*)(C))->a1 = ((T6)((t2)+(l2)));
}

/* ET_C1_CHARACTER_CONSTANT.last_position */
T0* T520f33(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	t1 = (T520f22(C));
	t2 = (T520f23(C));
	t2 = ((T6)((t2)+((T6)(GE_int32(2)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_FALSE_CONSTANT.last_position */
T0* T519f29(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T519f22(C));
	t2 = (T519f23(C));
	t3 = (((T17*)(GE_void(((T519*)(C))->a3)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_TRUE_CONSTANT.last_position */
T0* T518f29(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T518f22(C));
	t2 = (T518f23(C));
	t3 = (((T17*)(GE_void(((T518*)(C))->a3)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.last_position */
T0* T516f31(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T516f24(C));
	t2 = (T516f25(C));
	t3 = (((((T0*)(GE_void(((T516*)(C))->a1)))->id==17)?((T17*)(((T516*)(C))->a1))->a2:((T948*)(((T516*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.last_position */
T0* T515f31(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T515f24(C));
	t2 = (T515f25(C));
	t3 = (((((T0*)(GE_void(((T515*)(C))->a1)))->id==17)?((T17*)(((T515*)(C))->a1))->a2:((T948*)(((T515*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.last_position */
T0* T514f35(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T514f17(C));
	t2 = (T514f18(C));
	t3 = (((((T0*)(GE_void(((T514*)(C))->a1)))->id==17)?((T17*)(((T514*)(C))->a1))->a2:((T948*)(((T514*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.last_position */
T0* T513f36(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T513f18(C));
	t2 = (T513f19(C));
	t3 = (((((T0*)(GE_void(((T513*)(C))->a1)))->id==17)?((T17*)(((T513*)(C))->a1))->a2:((T948*)(((T513*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.last_position */
T0* T512f36(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T512f18(C));
	t2 = (T512f19(C));
	t3 = (((((T0*)(GE_void(((T512*)(C))->a1)))->id==17)?((T17*)(((T512*)(C))->a1))->a2:((T948*)(((T512*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.last_position */
T0* T511f31(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T6 t4;
	T2 t5;
	l1 = (((((T0*)(GE_void(((T511*)(C))->a1)))->id==17)?T17f27(((T511*)(C))->a1, (T2)('\n')):T948f19(((T511*)(C))->a1, (T2)('\n'))));
	t1 = ((l1)==((T6)(GE_int32(0))));
	if (t1) {
		t2 = (T511f23(C));
		t3 = (T511f24(C));
		t4 = (((((T0*)(GE_void(((T511*)(C))->a1)))->id==17)?((T17*)(((T511*)(C))->a1))->a2:((T948*)(((T511*)(C))->a1))->a1));
		t3 = ((T6)((t3)+(t4)));
		t3 = ((T6)((t3)+((T6)(GE_int32(1)))));
		R = T1326c9(t2, t3);
	} else {
		l4 = (((((T0*)(GE_void(((T511*)(C))->a1)))->id==17)?((T17*)(((T511*)(C))->a1))->a2:((T948*)(((T511*)(C))->a1))->a1));
		l3 = l4;
		t5 = (((((T0*)(GE_void(((T511*)(C))->a1)))->id==17)?T17f10(((T511*)(C))->a1, l3):T948f7(((T511*)(C))->a1, l3)));
		t1 = ((t5)==((T2)('\n')));
		while (!(t1)) {
			l3 = ((T6)((l3)-((T6)(GE_int32(1)))));
			t5 = (((((T0*)(GE_void(((T511*)(C))->a1)))->id==17)?T17f10(((T511*)(C))->a1, l3):T948f7(((T511*)(C))->a1, l3)));
			t1 = ((t5)==((T2)('\n')));
		}
		l2 = ((T6)((l4)-(l3)));
		t2 = (T511f23(C));
		t2 = ((T6)((t2)+(l1)));
		R = T1326c9(t2, l2);
	}
	return R;
}

/* ET_VERBATIM_STRING.last_position */
T0* T510f35(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T510f27(C));
	t2 = (((((T0*)(GE_void(((T510*)(C))->a2)))->id==17)?T17f27(((T510*)(C))->a2, (T2)('\n')):T948f19(((T510*)(C))->a2, (T2)('\n'))));
	t1 = ((T6)((t1)+(t2)));
	t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
	t2 = (((((T0*)(GE_void(((T510*)(C))->a5)))->id==17)?((T17*)(((T510*)(C))->a5))->a2:((T948*)(((T510*)(C))->a5))->a1));
	t3 = (((((T0*)(GE_void(((T510*)(C))->a3)))->id==17)?((T17*)(((T510*)(C))->a3))->a2:((T948*)(((T510*)(C))->a3))->a1));
	t2 = ((T6)((t2)+(t3)));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.last_position */
T0* T509f30(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T509f22(C));
	t2 = (T509f23(C));
	t3 = (((((T0*)(GE_void(((T509*)(C))->a1)))->id==17)?((T17*)(((T509*)(C))->a1))->a2:((T948*)(((T509*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)+((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.last_position */
T0* T508f34(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T508f23(C));
	t2 = (T508f24(C));
	t3 = (((((T0*)(GE_void(((T508*)(C))->a1)))->id==17)?((T17*)(((T508*)(C))->a1))->a2:((T948*)(((T508*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)+((T6)(GE_int32(4)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_BRACKET_SYMBOL.last_position */
T0* T502f81(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T0* t3;
	T6 t4;
	t1 = (T502f10(C));
	t2 = (T502f19(C));
	t3 = (T502f44(C));
	t4 = (((T17*)(GE_void(t3)))->a2);
	t2 = ((T6)((t2)+(t4)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_VOID.last_position */
T0* T496f23(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T496f16(C));
	t2 = (T496f17(C));
	t3 = (((T17*)(GE_void(((T496*)(C))->a3)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_BIT_CONSTANT.last_position */
T0* T460f27(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T460f20(C));
	t2 = (T460f21(C));
	t3 = (((((T0*)(GE_void(((T460*)(C))->a1)))->id==17)?((T17*)(((T460*)(C))->a1))->a2:((T948*)(((T460*)(C))->a1))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_SYMBOL.last_position */
T0* T455f16(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T0* t3;
	T6 t4;
	t1 = (T455f10(C));
	t2 = (T455f12(C));
	t3 = (T455f15(C));
	t4 = (((T17*)(GE_void(t3)))->a2);
	t2 = ((T6)((t2)+(t4)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_PRECURSOR_KEYWORD.last_position */
T0* T452f17(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T452f13(C));
	t2 = (T452f14(C));
	t3 = (((T17*)(GE_void(((T452*)(C))->a3)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_RESULT.last_position */
T0* T221f23(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T221f17(C));
	t2 = (T221f18(C));
	t3 = (((T17*)(GE_void(((T221*)(C))->a3)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_CURRENT.last_position */
T0* T197f24(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T197f18(C));
	t2 = (T197f19(C));
	t3 = (((T17*)(GE_void(((T197*)(C))->a3)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_KEYWORD.last_position */
T0* T179f21(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T179f16(C));
	t2 = (T179f17(C));
	t3 = (((T17*)(GE_void(((T179*)(C))->a2)))->a2);
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_IDENTIFIER.last_position */
T0* T129f86(T0* C)
{
	T0* R = 0;
	T6 t1;
	T6 t2;
	T6 t3;
	t1 = (T129f35(C));
	t2 = (T129f36(C));
	t3 = (((((T0*)(GE_void(((T129*)(C))->a6)))->id==17)?((T17*)(((T129*)(C))->a6))->a2:((T948*)(((T129*)(C))->a6))->a1));
	t2 = ((T6)((t2)+(t3)));
	t2 = ((T6)((t2)-((T6)(GE_int32(1)))));
	R = T1326c9(t1, t2);
	return R;
}

/* ET_CONVERT_PROCEDURE.is_convert_to */
T1 T633f7(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BUILTIN_CONVERT_FEATURE.is_convert_to */
T1 T318f5(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONVERT_FUNCTION.is_convert_from */
T1 T631f7(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BUILTIN_CONVERT_FEATURE.is_convert_from */
T1 T318f4(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINT_GENERIC_NAMED_TYPE.position */
T0* T952f6(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T952*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T179f9(GE_void(((T952*)(C))->a1)));
	} else {
		R = (T129f33(GE_void(((T952*)(C))->a2)));
	}
	return R;
}

/* ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER.position */
T0* T585f4(T0* C)
{
	T0* R = 0;
	R = (T129f33(GE_void(((T585*)(C))->a1)));
	return R;
}

/* ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER.position */
T0* T584f4(T0* C)
{
	T0* R = 0;
	R = (T129f33(GE_void(((T584*)(C))->a1)));
	return R;
}

/* ET_CONSTRAINT_NAMED_TYPE.position */
T0* T573f5(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T573*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T179f9(GE_void(((T573*)(C))->a1)));
	} else {
		R = (T129f33(GE_void(((T573*)(C))->a2)));
	}
	return R;
}

/* ET_CONSTRAINT_GENERIC_NAMED_TYPE.type */
T0* T952f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINT_NAMED_TYPE.type */
T0* T573f4(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINT_GENERIC_NAMED_TYPE.resolved_syntactical_constraint_with_type */
T0* T952f7(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_CURRENT.resolved_syntactical_constraint_with_type */
T0* T716f54(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_FEATURE.resolved_syntactical_constraint_with_type */
T0* T714f58(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CONSTRAINT_LABELED_COMMA_ACTUAL_PARAMETER.resolved_syntactical_constraint_with_type */
T0* T585f5(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T171f895(a2, C, a1));
	return R;
}

/* ET_EIFFEL_PARSER.resolved_constraint_labeled_comma_actual_parameter */
T0* T171f895(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* t1;
	T0* t2;
	t1 = (((T585*)(a1))->a1);
	t2 = (((T585*)(a1))->a2);
	t1 = (T272f231(GE_void(((T171*)(C))->a12), t1, t2));
	R = (T272f232(GE_void(((T171*)(C))->a12), t1, a2));
	return R;
}

/* ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER.resolved_syntactical_constraint_with_type */
T0* T584f5(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T171f894(a2, C, a1));
	return R;
}

/* ET_EIFFEL_PARSER.resolved_constraint_labeled_actual_parameter */
T0* T171f894(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* t1;
	T0* t2;
	t1 = (((T584*)(a1))->a1);
	t2 = (((T584*)(a1))->a2);
	t2 = (T272f161(GE_void(((T171*)(C))->a12), t2, a2));
	R = (T272f230(GE_void(((T171*)(C))->a12), t1, t2));
	return R;
}

/* ET_BIT_FEATURE.resolved_syntactical_constraint_with_type */
T0* T578f88(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_BIT_N.resolved_syntactical_constraint_with_type */
T0* T577f87(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CONSTRAINT_NAMED_TYPE.resolved_syntactical_constraint_with_type */
T0* T573f6(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CONSTRAINT_GENERIC_NAMED_TYPE.resolved_syntactical_constraint */
T0* T952f4(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T171f892(a2, C, a1));
	return R;
}

/* ET_EIFFEL_PARSER.resolved_constraint_generic_named_type */
T0* T171f892(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	l1 = (((T952*)(a1))->a2);
	l2 = (((T952*)(a1))->a1);
	l3 = (T425f16(a2, l1));
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		t1 = ((l2)!=(EIF_VOID));
		if (t1) {
			t2 = (T179f9(GE_void(l2)));
			T171f952(C, t2);
		}
		t2 = (((T952*)(a1))->a3);
		t2 = (T571f9(GE_void(t2)));
		T171f952(C, t2);
		t3 = (((((T0*)(GE_void(l3)))->id==557)?((T557*)(l3))->a2:((T565*)(l3))->a6));
		R = (T272f327(GE_void(((T171*)(C))->a12), l1, t3));
	} else {
		l4 = (((((T0*)(GE_void(((T171*)(C))->a11)))->id==53)?T53f156(((T171*)(C))->a11, l1):T56f149(((T171*)(C))->a11, l1)));
		t2 = (((T952*)(a1))->a3);
		l5 = (T571f10(GE_void(t2), a2, C));
		t1 = ((l5)!=(EIF_VOID));
		if (t1) {
			if (((T171*)(C))->a21) {
				T435f42(GE_void(((T171*)(C))->a10), l4);
			}
			T60f182(GE_void(l4), EIF_TRUE);
			t2 = (((((T0*)(GE_void(((T171*)(C))->a11)))->id==53)?((T53*)(((T171*)(C))->a11))->a77:((T56*)(((T171*)(C))->a11))->a47));
			t1 = ((l4)==(t2));
			if (t1) {
				t1 = ((l2)!=(EIF_VOID));
				if (t1) {
					t2 = (T179f9(GE_void(l2)));
					T171f952(C, t2);
				}
				R = (T272f227(GE_void(((T171*)(C))->a12), l1, l5));
			} else {
				R = (T272f316(GE_void(((T171*)(C))->a12), l2, l1, l5, l4));
			}
		}
	}
	return R;
}

/* ET_CONSTRAINT_ACTUAL_PARAMETER_LIST.resolved_syntactical_constraint */
T0* T571f10(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T171f893(a2, C, a1));
	return R;
}

/* ET_EIFFEL_PARSER.resolved_constraint_actual_parameter_list */
T0* T171f893(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* t1;
	T0* t2;
	T1 t3;
	l2 = (((T571*)(a1))->a3);
	t1 = (((T571*)(a1))->a1);
	t2 = (((T571*)(a1))->a2);
	R = (T272f228(GE_void(((T171*)(C))->a12), t1, t2, l2));
	t3 = ((R)!=(EIF_VOID));
	if (t3) {
		l1 = l2;
		t3 = ((T1)((l1)<((T6)(GE_int32(1)))));
		while (!(t3)) {
			l7 = (T571f11(a1, l1));
			l3 = (T580x6271(GE_void(l7)));
			t3 = ((l3)!=(l4));
			if (t3) {
				l5 = (T562x6275T0T0(GE_void(l3), a2, C));
				l4 = l3;
			}
			l6 = (T580x6273T0T0(GE_void(l7), l5, C));
			t3 = ((l6)!=(EIF_VOID));
			if (t3) {
				T173f24(GE_void(R), l6);
			}
			l1 = ((T6)((l1)-((T6)(GE_int32(1)))));
			t3 = ((T1)((l1)<((T6)(GE_int32(1)))));
		}
	}
	return R;
}

/* ET_CONSTRAINT_ACTUAL_PARAMETER_LIST.item */
T0* T571f11(T0* C, T6 a1)
{
	T0* R = 0;
	T6 t1;
	t1 = ((T6)((((T571*)(C))->a3)-(a1)));
	R = (((T581*)(GE_void(((T571*)(C))->a4)))->z2[t1]);
	return R;
}

/* ET_CONSTRAINT_ACTUAL_PARAMETER_LIST.position */
T0* T571f9(T0* C)
{
	T0* R = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	R = (((((T0*)(GE_void(((T571*)(C))->a1)))->id==502)?T502f8(((T571*)(C))->a1):T455f8(((T571*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		t2 = (T571f7(C));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t3 = (T571f11(C, (T6)(GE_int32(1))));
		R = (T580x6272(GE_void(t3)));
	}
	return R;
}

/* ET_LIKE_CURRENT.resolved_syntactical_constraint */
T0* T716f18(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LIKE_FEATURE.resolved_syntactical_constraint */
T0* T714f37(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.resolved_syntactical_constraint */
T0* T578f6(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.resolved_syntactical_constraint */
T0* T577f10(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINT_NAMED_TYPE.resolved_syntactical_constraint */
T0* T573f3(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T171f891(a2, C, a1));
	return R;
}

/* ET_EIFFEL_PARSER.resolved_constraint_named_type */
T0* T171f891(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	l1 = (((T573*)(a1))->a2);
	l3 = (((T573*)(a1))->a1);
	l2 = (T425f16(a2, l1));
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			t2 = (T179f9(GE_void(l3)));
			T171f952(C, t2);
		}
		t3 = (((((T0*)(GE_void(l2)))->id==557)?((T557*)(l2))->a2:((T565*)(l2))->a6));
		R = (T272f327(GE_void(((T171*)(C))->a12), l1, t3));
	} else {
		l4 = (((((T0*)(GE_void(((T171*)(C))->a11)))->id==53)?T53f156(((T171*)(C))->a11, l1):T56f149(((T171*)(C))->a11, l1)));
		if (((T171*)(C))->a21) {
			T435f42(GE_void(((T171*)(C))->a10), l4);
		}
		T60f182(GE_void(l4), EIF_TRUE);
		t2 = (((((T0*)(GE_void(((T171*)(C))->a11)))->id==53)?((T53*)(((T171*)(C))->a11))->a77:((T56*)(((T171*)(C))->a11))->a47));
		t1 = ((l4)==(t2));
		if (t1) {
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t2 = (T179f9(GE_void(l3)));
				T171f952(C, t2);
			}
			R = (T272f227(GE_void(((T171*)(C))->a12), l1, EIF_VOID));
		} else {
			R = (T272f317(GE_void(((T171*)(C))->a12), l3, l1, l4));
		}
	}
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_negative */
T1 T514f31(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T514*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		R = (T493f9(GE_void(((T514*)(C))->a6)));
	}
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_negative */
T1 T513f30(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T513*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		R = (T493f9(GE_void(((T513*)(C))->a6)));
	}
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_negative */
T1 T512f30(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T512*)(C))->a6)!=(EIF_VOID));
	if (t1) {
		R = (T493f9(GE_void(((T512*)(C))->a6)));
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.error_position */
T0* T394f57(T0* C)
{
	T0* R = 0;
	R = T354c7(((T394*)(C))->a8, ((T394*)(C))->a17, ((T394*)(C))->a16, ((T394*)(C))->a15);
	return R;
}

/* XM_DEFAULT_POSITION.make */
T0* T354c7(T0* a1, T6 a2, T6 a3, T6 a4)
{
	T0* C;
	C = (T0*)GE_alloc(sizeof(T354));
	*(T354*)C = GE_default354;
	((T354*)(C))->a1 = a1;
	((T354*)(C))->a4 = a2;
	((T354*)(C))->a3 = a3;
	((T354*)(C))->a2 = a4;
	return C;
}

/* XM_EIFFEL_SCANNER_DTD.error_position */
T0* T392f55(T0* C)
{
	T0* R = 0;
	R = T354c7(((T392*)(C))->a3, ((T392*)(C))->a4, ((T392*)(C))->a5, ((T392*)(C))->a6);
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.error_position */
T0* T388f56(T0* C)
{
	T0* R = 0;
	R = T354c7(((T388*)(C))->a8, ((T388*)(C))->a17, ((T388*)(C))->a16, ((T388*)(C))->a15);
	return R;
}

/* XM_EIFFEL_SCANNER.error_position */
T0* T353f63(T0* C)
{
	T0* R = 0;
	R = T354c7(((T353*)(C))->a3, ((T353*)(C))->a4, ((T353*)(C))->a5, ((T353*)(C))->a6);
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.end_of_file */
T1 T394f60(T0* C)
{
	T1 R = 0;
	R = ((((T394*)(C))->a43)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.end_of_file */
T1 T392f61(T0* C)
{
	T1 R = 0;
	R = ((((T392*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.end_of_file */
T1 T388f59(T0* C)
{
	T1 R = 0;
	R = ((((T388*)(C))->a41)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_SCANNER.end_of_file */
T1 T353f65(T0* C)
{
	T1 R = 0;
	R = ((((T353*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.is_applicable_encoding */
T1 T394f61(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T949f13(GE_void(((T394*)(C))->a45), a1));
	if (t1) {
		R = (T949f20(GE_void(((T394*)(C))->a45), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_applicable_encoding */
T1 T949f20(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(6))));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T949f8(C));
		t1 = (T26f14(GE_void(t2), a1, ge1271ov25269));
		if (!(t1)) {
			t2 = (T949f8(C));
			t1 = (T26f14(GE_void(t2), a1, ge1271ov25268));
		}
		if (t1) {
			t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(2))));
			if (!(t1)) {
				t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(1))));
			}
			if (!(t1)) {
				R = ((((T949*)(C))->a2)==((T6)(GE_int32(3))));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t2 = (T949f8(C));
			t1 = (T26f14(GE_void(t2), a1, ge1271ov25270));
			if (t1) {
				t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(2))));
				if (!(t1)) {
					R = ((((T949*)(C))->a2)==((T6)(GE_int32(1))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t2 = (T949f8(C));
				t1 = (T26f14(GE_void(t2), a1, ge1271ov25271));
				if (t1) {
					t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(4))));
					if (!(t1)) {
						R = ((((T949*)(C))->a2)==((T6)(GE_int32(5))));
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
T1 T949f13(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T949f8(C));
		t1 = (T26f14(GE_void(t2), a1, ge1271ov25269));
		if (!(t1)) {
			t2 = (T949f8(C));
			t1 = (T26f14(GE_void(t2), a1, ge1271ov25268));
		}
		if (!(t1)) {
			t2 = (T949f8(C));
			t1 = (T26f14(GE_void(t2), a1, ge1271ov25270));
		}
		if (!(t1)) {
			t2 = (T949f8(C));
			R = (T26f14(GE_void(t2), a1, ge1271ov25271));
		} else {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.is_applicable_encoding */
T1 T392f48(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T949f13(GE_void(((T392*)(C))->a7), a1));
	if (t1) {
		R = (T949f20(GE_void(((T392*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.is_applicable_encoding */
T1 T388f60(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T949f13(GE_void(((T388*)(C))->a43), a1));
	if (t1) {
		R = (T949f20(GE_void(((T388*)(C))->a43), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_SCANNER.is_applicable_encoding */
T1 T353f66(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T949f13(GE_void(((T353*)(C))->a7), a1));
	if (t1) {
		R = (T949f20(GE_void(((T353*)(C))->a7), a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* XM_EIFFEL_PE_ENTITY_DEF.start_condition */
T6 T394f62(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T394*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER_DTD.start_condition */
T6 T392f50(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T392*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_ENTITY_DEF.start_condition */
T6 T388f61(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T388*)(C))->a11)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* XM_EIFFEL_SCANNER.start_condition */
T6 T353f43(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = ((T6)((((T353*)(C))->a8)-((T6)(GE_int32(1)))));
	R = ((T6)((t1)/((T6)(GE_int32(2)))));
	return R;
}

/* ET_ALIASED_FEATURE_NAME.same_extended_feature_name */
T1 T678f4(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((((T678*)(C))->a2)==(EIF_VOID));
	if (t1) {
		t2 = (T323x11741(GE_void(a1)));
		t1 = ((t2)==(EIF_VOID));
		if (t1) {
			t2 = (T323x11740(GE_void(a1)));
			R = (T129f44(GE_void(((T678*)(C))->a1), t2));
		}
	} else {
		t2 = (T323x11741(GE_void(a1)));
		t1 = ((t2)!=(EIF_VOID));
		if (t1) {
			t2 = (T323x11740(GE_void(a1)));
			t1 = (T129f44(GE_void(((T678*)(C))->a1), t2));
			if (t1) {
				t2 = (T678f5(C));
				t1 = (T79f3(GE_void(t2), ((T678*)(C))->a2, ((T678*)(C))->a1));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t2 = (T323x11741(GE_void(a1)));
					t1 = (T676x22780T0(GE_void(((T678*)(C))->a2), t2));
					if (t1) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* KL_ANY_ROUTINES.same_objects */
T1 T79f3(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = ((a1)==(a2));
	return R;
}

/* ET_ALIASED_FEATURE_NAME.any_ */
T0* T678f5(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_INFIX_FREE_NAME.same_extended_feature_name */
T1 T674f59(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T674f10(C));
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t1 = (T674f9(C));
			t3 = (T323x11740(GE_void(a1)));
			R = (T674f11(GE_void(t1), t3));
		}
	} else {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)!=(EIF_VOID));
		if (t2) {
			t1 = (T674f9(C));
			t3 = (T323x11740(GE_void(a1)));
			t2 = (T674f11(GE_void(t1), t3));
			if (t2) {
				t1 = (T674f44(C));
				t3 = (T674f10(C));
				t4 = (T674f9(C));
				t2 = (T79f3(GE_void(t1), t3, t4));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (T674f10(C));
					t3 = (T323x11741(GE_void(a1)));
					t2 = (T674f58(GE_void(t1), t3));
					if (t2) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_NAME.same_extended_feature_name */
T1 T673f70(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T673f7(C));
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t1 = (T673f6(C));
			t3 = (T323x11740(GE_void(a1)));
			R = (T673f8(GE_void(t1), t3));
		}
	} else {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)!=(EIF_VOID));
		if (t2) {
			t1 = (T673f6(C));
			t3 = (T323x11740(GE_void(a1)));
			t2 = (T673f8(GE_void(t1), t3));
			if (t2) {
				t1 = (T673f29(C));
				t3 = (T673f7(C));
				t4 = (T673f6(C));
				t2 = (T79f3(GE_void(t1), t3, t4));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (T673f7(C));
					t3 = (T323x11741(GE_void(a1)));
					t2 = (T673f69(GE_void(t1), t3));
					if (t2) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_NAME.any_ */
T0* T673f29(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_PREFIX_FREE_NAME.same_extended_feature_name */
T1 T672f59(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T672f10(C));
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t1 = (T672f9(C));
			t3 = (T323x11740(GE_void(a1)));
			R = (T672f11(GE_void(t1), t3));
		}
	} else {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)!=(EIF_VOID));
		if (t2) {
			t1 = (T672f9(C));
			t3 = (T323x11740(GE_void(a1)));
			t2 = (T672f11(GE_void(t1), t3));
			if (t2) {
				t1 = (T672f31(C));
				t3 = (T672f10(C));
				t4 = (T672f9(C));
				t2 = (T79f3(GE_void(t1), t3, t4));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (T672f10(C));
					t3 = (T323x11741(GE_void(a1)));
					t2 = (T672f58(GE_void(t1), t3));
					if (t2) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* ET_PREFIX_NAME.same_extended_feature_name */
T1 T671f56(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T671f7(C));
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t1 = (T671f6(C));
			t3 = (T323x11740(GE_void(a1)));
			R = (T671f8(GE_void(t1), t3));
		}
	} else {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)!=(EIF_VOID));
		if (t2) {
			t1 = (T671f6(C));
			t3 = (T323x11740(GE_void(a1)));
			t2 = (T671f8(GE_void(t1), t3));
			if (t2) {
				t1 = (T671f26(C));
				t3 = (T671f7(C));
				t4 = (T671f6(C));
				t2 = (T79f3(GE_void(t1), t3, t4));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (T671f7(C));
					t3 = (T323x11741(GE_void(a1)));
					t2 = (T671f55(GE_void(t1), t3));
					if (t2) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* ET_PREFIX_NAME.any_ */
T0* T671f26(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_IDENTIFIER.same_extended_feature_name */
T1 T129f92(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T129f51(C));
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t1 = (T129f29(C));
			t3 = (T323x11740(GE_void(a1)));
			R = (T129f44(GE_void(t1), t3));
		}
	} else {
		t1 = (T323x11741(GE_void(a1)));
		t2 = ((t1)!=(EIF_VOID));
		if (t2) {
			t1 = (T129f29(C));
			t3 = (T323x11740(GE_void(a1)));
			t2 = (T129f44(GE_void(t1), t3));
			if (t2) {
				t1 = (T129f46(C));
				t3 = (T129f51(C));
				t4 = (T129f29(C));
				t2 = (T79f3(GE_void(t1), t3, t4));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (T129f51(C));
					t3 = (T323x11741(GE_void(a1)));
					t2 = ((GE_void(t1), t3, (T1)0));
					if (t2) {
						R = EIF_TRUE;
					}
				}
			}
		}
	}
	return R;
}

/* ET_IDENTIFIER.any_ */
T0* T129f46(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* ET_ALIASED_FEATURE_NAME.position */
T0* T678f3(T0* C)
{
	T0* R = 0;
	R = (T129f33(GE_void(((T678*)(C))->a1)));
	return R;
}

/* ET_INFIX_FREE_NAME.alias_name */
T0* T674f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.alias_name */
T0* T673f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_FREE_NAME.alias_name */
T0* T672f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_NAME.alias_name */
T0* T671f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.alias_name */
T0* T129f51(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_FILE_POSITION.to_text */
T0* T954f10(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T954f12(C, R);
	return R;
}

/* ET_FILE_POSITION.append_to_string */
void T954f12(T0* C, T0* a1)
{
	T954f14(C, ((T954*)(C))->a1, a1);
}

/* ET_FILE_POSITION.append_to_string_with_filename */
void T954f14(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a2), GE_ms("line ", 5));
	t1 = (T954f3(C));
	t2 = (T954f4(C));
	T152f7(GE_void(t1), t2, a2);
	T17f41(GE_void(a2), GE_ms(" column ", 8));
	t1 = (T954f3(C));
	t2 = (T954f5(C));
	T152f7(GE_void(t1), t2, a2);
	T17f41(GE_void(a2), GE_ms(" in ", 4));
	T17f41(GE_void(a2), a1);
	T17f39(GE_void(a2), (T2)('\n'));
	T954f16(C, a1, a2);
}

/* ET_FILE_POSITION.append_context_to_string */
void T954f16(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T1 l6 = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	l5 = (T954f4(C));
	t1 = ((l5)==((T6)(GE_int32(0))));
	if (t1) {
	} else {
		l1 = T22c39(a1);
		T22f40(GE_void(l1));
		t1 = (T22f10(GE_void(l1)));
		if (t1) {
			t1 = (T6f1(&l5, (T6)(GE_int32(1))));
			if (t1) {
				t2 = ((T6)((l5)-((T6)(GE_int32(2)))));
				T954f17(C, l1, t2);
				T954f18(C, l1, a2);
				T17f39(GE_void(a2), (T2)('\n'));
			}
			l5 = (T954f5(C));
			t1 = ((l5)==((T6)(GE_int32(0))));
			if (t1) {
				T954f18(C, l1, a2);
				T17f39(GE_void(a2), (T2)('\n'));
				T17f39(GE_void(a2), (T2)('^'));
				T17f39(GE_void(a2), (T2)('\n'));
				T954f18(C, l1, a2);
				T17f39(GE_void(a2), (T2)('\n'));
			} else {
				l4 = (T6)(GE_int32(1));
				l2 = T17c36((T6)(GE_int32(80)));
				T22f48(GE_void(l1));
				t1 = (((T22*)(GE_void(l1)))->a5);
				if (!(t1)) {
					t1 = (l6);
				}
				while (!(t1)) {
					l3 = (((T22*)(GE_void(l1)))->a9);
					t1 = ((l3)==((T2)('\n')));
					if (t1) {
						l6 = EIF_TRUE;
					} else {
						T17f39(GE_void(a2), l3);
						T22f48(GE_void(l1));
					}
					t1 = ((T1)((l4)<(l5)));
					if (t1) {
						t1 = ((l3)==((T2)('\t')));
						if (t1) {
							T17f39(GE_void(l2), (T2)('\t'));
						} else {
							T17f39(GE_void(l2), (T2)(' '));
						}
					} else {
						t1 = ((l4)==(l5));
						if (t1) {
							T17f39(GE_void(l2), (T2)('^'));
						}
					}
					l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
					t1 = (((T22*)(GE_void(l1)))->a5);
					if (!(t1)) {
						t1 = (l6);
					}
				}
				T17f39(GE_void(a2), (T2)('\n'));
				T17f41(GE_void(a2), l2);
				t2 = (((T17*)(GE_void(l2)))->a2);
				t1 = ((t2)==((T6)(GE_int32(0))));
				if (!(t1)) {
					t2 = (((T17*)(GE_void(l2)))->a2);
					t3 = (T17f10(GE_void(l2), t2));
					t1 = ((t3)!=((T2)('^')));
				}
				if (t1) {
					T17f39(GE_void(a2), (T2)('^'));
				}
				T17f39(GE_void(a2), (T2)('\n'));
				T954f18(C, l1, a2);
				T17f39(GE_void(a2), (T2)('\n'));
			}
			T22f41(GE_void(l1));
		}
	}
}

/* ET_FILE_POSITION.append_line_to_string */
void T954f18(T0* C, T0* a1, T0* a2)
{
	T2 l1 = 0;
	T1 l2 = 0;
	T1 t1;
	t1 = (T22f25(GE_void(a1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		T22f48(GE_void(a1));
		t1 = (T22f25(GE_void(a1)));
		if (!(t1)) {
			t1 = (l2);
		}
		while (!(t1)) {
			l1 = (((T22*)(GE_void(a1)))->a9);
			t1 = ((l1)==((T2)('\n')));
			if (t1) {
				l2 = EIF_TRUE;
			} else {
				T17f39(GE_void(a2), l1);
				T22f48(GE_void(a1));
			}
			t1 = (T22f25(GE_void(a1)));
			if (!(t1)) {
				t1 = (l2);
			}
		}
	}
}

/* ET_FILE_POSITION.skip_lines */
void T954f17(T0* C, T0* a1, T6 a2)
{
	T6 l1 = 0;
	T1 t1;
	T2 t2;
	t1 = (T6f1(&a2, (T6)(GE_int32(0))));
	if (t1) {
		T22f48(GE_void(a1));
		t1 = (T22f25(GE_void(a1)));
		if (!(t1)) {
			t1 = ((l1)==(a2));
		}
		while (!(t1)) {
			t2 = (((T22*)(GE_void(a1)))->a9);
			t1 = ((t2)==((T2)('\n')));
			if (t1) {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				t1 = ((l1)!=(a2));
				if (t1) {
					T22f48(GE_void(a1));
				}
			} else {
				T22f48(GE_void(a1));
			}
			t1 = (T22f25(GE_void(a1)));
			if (!(t1)) {
				t1 = ((l1)==(a2));
			}
		}
	}
}

/* ET_FILE_POSITION.column */
T6 T954f5(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T954*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_FILE_POSITION.line */
T6 T954f4(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T954*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_FILE_POSITION.integer_ */
T0* T954f3(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.to_text */
T0* T514f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T514f48(C, R);
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.append_to_string */
void T514f48(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T514f16(C));
	t2 = (T514f17(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T514f16(C));
	t2 = (T514f18(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.integer_ */
T0* T514f16(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.to_text */
T0* T513f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T513f49(C, R);
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.append_to_string */
void T513f49(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T513f17(C));
	t2 = (T513f18(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T513f17(C));
	t2 = (T513f19(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.integer_ */
T0* T513f17(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.to_text */
T0* T512f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T512f49(C, R);
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.append_to_string */
void T512f49(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T512f17(C));
	t2 = (T512f18(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T512f17(C));
	t2 = (T512f19(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_REGULAR_INTEGER_CONSTANT.integer_ */
T0* T512f17(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_BRACKET_SYMBOL.to_text */
T0* T502f20(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T502f87(C, R);
	return R;
}

/* ET_BRACKET_SYMBOL.append_to_string */
void T502f87(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T502f43(C));
	t2 = (T502f10(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T502f43(C));
	t2 = (T502f19(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_BRACKET_SYMBOL.integer_ */
T0* T502f43(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_SYMBOL_OPERATOR.to_text */
T0* T493f17(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T493f76(C, R);
	return R;
}

/* ET_SYMBOL_OPERATOR.append_to_string */
void T493f76(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T493f21(C));
	t2 = (T493f18(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T493f21(C));
	t2 = (T493f19(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_SYMBOL_OPERATOR.integer_ */
T0* T493f21(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_SYMBOL.to_text */
T0* T455f13(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T455f73(C, R);
	return R;
}

/* ET_SYMBOL.append_to_string */
void T455f73(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T455f14(C));
	t2 = (T455f10(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T455f14(C));
	t2 = (T455f12(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_SYMBOL.integer_ */
T0* T455f14(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_CURRENT.to_text */
T0* T197f17(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T197f33(C, R);
	return R;
}

/* ET_CURRENT.append_to_string */
void T197f33(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T197f21(C));
	t2 = (T197f18(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T197f21(C));
	t2 = (T197f19(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_CURRENT.integer_ */
T0* T197f21(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_KEYWORD.to_text */
T0* T179f18(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T179f77(C, R);
	return R;
}

/* ET_KEYWORD.append_to_string */
void T179f77(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T179f19(C));
	t2 = (T179f16(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T179f19(C));
	t2 = (T179f17(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_KEYWORD.integer_ */
T0* T179f19(T0* C)
{
	T0* R = 0;
	if (ge274os2791) {
		return ge274ov2791;
	} else {
		ge274os2791 = '\1';
	}
	R = T152c6();
	ge274ov2791 = R;
	return R;
}

/* ET_IDENTIFIER.to_text */
T0* T129f55(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(50)));
	T129f110(C, R);
	return R;
}

/* ET_IDENTIFIER.append_to_string */
void T129f110(T0* C, T0* a1)
{
	T0* t1;
	T6 t2;
	T17f41(GE_void(a1), GE_ms("line ", 5));
	t1 = (T129f26(C));
	t2 = (T129f35(C));
	T152f7(GE_void(t1), t2, a1);
	T17f41(GE_void(a1), GE_ms(" column ", 8));
	t1 = (T129f26(C));
	t2 = (T129f36(C));
	T152f7(GE_void(t1), t2, a1);
}

/* ET_C2_CHARACTER_CONSTANT.is_null */
T1 T521f24(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T521f22(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_null */
T1 T520f24(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T520f22(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_FALSE_CONSTANT.is_null */
T1 T519f24(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T519f22(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_TRUE_CONSTANT.is_null */
T1 T518f24(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T518f22(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_null */
T1 T516f26(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T516f24(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_null */
T1 T515f26(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T515f24(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_null */
T1 T514f19(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T514f17(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_null */
T1 T513f20(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T513f18(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_null */
T1 T512f20(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T512f18(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_null */
T1 T511f25(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T511f23(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_VERBATIM_STRING.is_null */
T1 T510f29(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T510f27(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_null */
T1 T509f24(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T509f22(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_null */
T1 T508f25(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T508f23(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_BRACKET_SYMBOL.is_null */
T1 T502f9(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T502f10(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_VOID.is_null */
T1 T496f18(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T496f16(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_SYMBOL_OPERATOR.is_null */
T1 T493f20(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T493f18(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_null */
T1 T480f10(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T480f11(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_FREE_OPERATOR.is_null */
T1 T474f43(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T474f41(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_BIT_CONSTANT.is_null */
T1 T460f22(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T460f20(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_SYMBOL.is_null */
T1 T455f9(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T455f10(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_PRECURSOR_KEYWORD.is_null */
T1 T452f15(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T452f13(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_AGENT_KEYWORD.is_null */
T1 T449f12(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T449f10(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_RESULT.is_null */
T1 T221f19(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T221f17(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_CURRENT.is_null */
T1 T197f20(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T197f18(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_KEYWORD.is_null */
T1 T179f15(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T179f16(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_IDENTIFIER.is_null */
T1 T129f47(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T129f35(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_COMPRESSED_POSITION.line */
T6 T1326f3(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T1326*)(C))->a1)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.line */
T6 T521f22(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T521*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.line */
T6 T520f22(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T520*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_FALSE_CONSTANT.line */
T6 T519f22(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T519*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_TRUE_CONSTANT.line */
T6 T518f22(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T518*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.line */
T6 T516f24(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T516*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.line */
T6 T515f24(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T515*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.line */
T6 T514f17(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T514*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.line */
T6 T513f18(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T513*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.line */
T6 T512f18(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T512*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.line */
T6 T511f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T511*)(C))->a3)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_VERBATIM_STRING.line */
T6 T510f27(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T510*)(C))->a7)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.line */
T6 T509f22(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T509*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.line */
T6 T508f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T508*)(C))->a3)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_BRACKET_SYMBOL.line */
T6 T502f10(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T502*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_VOID.line */
T6 T496f16(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T496*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_SYMBOL_OPERATOR.line */
T6 T493f18(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T493*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_RETRY_INSTRUCTION.line */
T6 T490f10(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T490*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_KEYWORD_OPERATOR.line */
T6 T480f11(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T480*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_FREE_OPERATOR.line */
T6 T474f41(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T474*)(C))->a3)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_BIT_CONSTANT.line */
T6 T460f20(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T460*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_SYMBOL.line */
T6 T455f10(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T455*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_PRECURSOR_KEYWORD.line */
T6 T452f13(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T452*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_AGENT_KEYWORD.line */
T6 T449f10(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T449*)(C))->a2)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_RESULT.line */
T6 T221f17(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T221*)(C))->a4)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_CURRENT.line */
T6 T197f18(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T197*)(C))->a4)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_KEYWORD.line */
T6 T179f16(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T179*)(C))->a3)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_IDENTIFIER.line */
T6 T129f35(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T129*)(C))->a4)/((T6)(GE_int32(256)))));
	return R;
}

/* ET_COMPRESSED_POSITION.column */
T6 T1326f2(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T1326*)(C))->a1)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.column */
T6 T521f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T521*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.column */
T6 T520f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T520*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_FALSE_CONSTANT.column */
T6 T519f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T519*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_TRUE_CONSTANT.column */
T6 T518f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T518*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.column */
T6 T516f25(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T516*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.column */
T6 T515f25(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T515*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.column */
T6 T514f18(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T514*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.column */
T6 T513f19(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T513*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.column */
T6 T512f19(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T512*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.column */
T6 T511f24(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T511*)(C))->a3)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_VERBATIM_STRING.column */
T6 T510f28(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T510*)(C))->a7)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.column */
T6 T509f23(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T509*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.column */
T6 T508f24(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T508*)(C))->a3)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_BRACKET_SYMBOL.column */
T6 T502f19(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T502*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_VOID.column */
T6 T496f17(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T496*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_SYMBOL_OPERATOR.column */
T6 T493f19(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T493*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_RETRY_INSTRUCTION.column */
T6 T490f11(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T490*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_KEYWORD_OPERATOR.column */
T6 T480f19(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T480*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_FREE_OPERATOR.column */
T6 T474f42(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T474*)(C))->a3)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_BIT_CONSTANT.column */
T6 T460f21(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T460*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_SYMBOL.column */
T6 T455f12(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T455*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_PRECURSOR_KEYWORD.column */
T6 T452f14(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T452*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_AGENT_KEYWORD.column */
T6 T449f11(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T449*)(C))->a2)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_RESULT.column */
T6 T221f18(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T221*)(C))->a4)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_CURRENT.column */
T6 T197f19(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T197*)(C))->a4)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_KEYWORD.column */
T6 T179f17(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T179*)(C))->a3)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_IDENTIFIER.column */
T6 T129f36(T0* C)
{
	T6 R = 0;
	R = ((T6)((((T129*)(C))->a4)%((T6)(GE_int32(256)))));
	return R;
}

/* ET_INVARIANTS.clients */
unsigned char ge531os12640 = '\0';
T0* ge531ov12640;
T0* T533f20(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge531os12640) {
		return ge531ov12640;
	} else {
		ge531os12640 = '\1';
	}
	t1 = (T533f9(C));
	R = (T170f738(GE_void(t1)));
	ge531ov12640 = R;
	return R;
}

/* ET_INVARIANTS.first_precursor */
T0* T533f18(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INVARIANTS.type */
T0* T533f19(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INVARIANTS.is_feature */
T1 T533f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.as_feature */
T0* T667f47(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE.as_feature */
T0* T666f46(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DEFERRED_FUNCTION.as_feature */
T0* T661f50(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION.as_feature */
T0* T660f52(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION.as_feature */
T0* T658f52(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INVARIANTS.as_feature */
T0* T533f15(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.as_feature */
T0* T327f43(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE.as_feature */
T0* T322f46(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ATTRIBUTE.as_feature */
T0* T254f46(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.as_feature */
T0* T253f48(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.as_feature */
T0* T251f48(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION.as_feature */
T0* T176f54(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INVARIANTS.arguments */
T0* T533f17(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.locals */
T0* T667f48(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.locals */
T0* T661f51(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INVARIANTS.locals */
T0* T533f16(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.locals */
T0* T327f44(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ATTRIBUTE.locals */
T0* T254f47(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.locals */
T0* T253f49(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.locals */
T0* T251f49(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.locals */
T0* T176f55(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INVARIANTS.implementation_feature */
T0* T533f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TYPE_LIST.dynamic_type */
T0* T187f6(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T422*)(GE_void(((T187*)(C))->a2)))->z2[a1]);
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.is_open_operand */
T1 T1419f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONVERT_EXPRESSION.is_open_operand */
T1 T1322f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.is_open_operand */
T1 T834f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.is_open_operand */
T1 T833f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.is_open_operand */
T1 T832f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.is_open_operand */
T1 T831f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.is_open_operand */
T1 T830f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.is_open_operand */
T1 T828f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_MANIFEST_TYPE.is_open_operand */
T1 T818f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_STRIP_EXPRESSION.is_open_operand */
T1 T811f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_MANIFEST_ARRAY.is_open_operand */
T1 T809f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.is_open_operand */
T1 T808f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CALL_AGENT.is_open_operand */
T1 T804f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_OLD_EXPRESSION.is_open_operand */
T1 T803f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_EXPRESSION.is_open_operand */
T1 T802f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EQUALITY_EXPRESSION.is_open_operand */
T1 T801f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_EXPRESSION.is_open_operand */
T1 T797f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXPRESSION_ADDRESS.is_open_operand */
T1 T795f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_RESULT_ADDRESS.is_open_operand */
T1 T794f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CURRENT_ADDRESS.is_open_operand */
T1 T793f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FEATURE_ADDRESS.is_open_operand */
T1 T792f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PRECURSOR_EXPRESSION.is_open_operand */
T1 T786f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.is_open_operand */
T1 T771f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_EXPRESSION.is_open_operand */
T1 T723f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CREATE_EXPRESSION.is_open_operand */
T1 T550f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_open_operand */
T1 T521f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_open_operand */
T1 T520f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_open_operand */
T1 T519f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_open_operand */
T1 T518f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_open_operand */
T1 T516f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_open_operand */
T1 T515f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_open_operand */
T1 T514f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_open_operand */
T1 T513f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_open_operand */
T1 T512f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_open_operand */
T1 T511f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_open_operand */
T1 T510f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_open_operand */
T1 T509f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_open_operand */
T1 T508f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VOID.is_open_operand */
T1 T496f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_open_operand */
T1 T460f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_MANIFEST_TUPLE.is_open_operand */
T1 T204f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CALL_EXPRESSION.is_open_operand */
T1 T202f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_AGENT_IMPLICIT_CURRENT_TARGET.is_open_operand */
T1 T1171f3(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.is_open_operand */
T1 T787f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_RESULT.is_open_operand */
T1 T221f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CURRENT.is_open_operand */
T1 T197f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_open_operand */
T1 T129f80(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_AGENT_IMPLICIT_CURRENT_TARGET.position */
T0* T1171f4(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T227x17786(GE_void(((T1171*)(C))->a1)));
	R = (T1430x6246(GE_void(t1)));
	return R;
}

/* ET_AGENT_OPEN_TARGET.position */
T0* T827f7(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T455f8(GE_void(((T827*)(C))->a2)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T167x6246(GE_void(((T827*)(C))->a1)));
	}
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.expression_item */
T0* T1419f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_CAST_EXPRESSION.expression_item */
T0* T1323f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONVERT_EXPRESSION.expression_item */
T0* T1322f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.expression_item */
T0* T834f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.expression_item */
T0* T833f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.expression_item */
T0* T832f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.expression_item */
T0* T831f14(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.expression_item */
T0* T830f15(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.expression_item */
T0* T828f15(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TYPE.expression_item */
T0* T818f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STRIP_EXPRESSION.expression_item */
T0* T811f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_ARRAY.expression_item */
T0* T809f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.expression_item */
T0* T808f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_AGENT.expression_item */
T0* T804f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_OLD_EXPRESSION.expression_item */
T0* T803f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_EXPRESSION.expression_item */
T0* T802f4(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EQUALITY_EXPRESSION.expression_item */
T0* T801f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_EXPRESSION.expression_item */
T0* T797f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXPRESSION_ADDRESS.expression_item */
T0* T795f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT_ADDRESS.expression_item */
T0* T794f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT_ADDRESS.expression_item */
T0* T793f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FEATURE_ADDRESS.expression_item */
T0* T792f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.expression_item */
T0* T787f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PRECURSOR_EXPRESSION.expression_item */
T0* T786f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.expression_item */
T0* T771f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BRACKET_EXPRESSION.expression_item */
T0* T723f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CREATE_EXPRESSION.expression_item */
T0* T550f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.expression_item */
T0* T521f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.expression_item */
T0* T520f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FALSE_CONSTANT.expression_item */
T0* T519f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TRUE_CONSTANT.expression_item */
T0* T518f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.expression_item */
T0* T516f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.expression_item */
T0* T515f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.expression_item */
T0* T514f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.expression_item */
T0* T513f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.expression_item */
T0* T512f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.expression_item */
T0* T511f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VERBATIM_STRING.expression_item */
T0* T510f14(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.expression_item */
T0* T509f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.expression_item */
T0* T508f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VOID.expression_item */
T0* T496f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_CONSTANT.expression_item */
T0* T460f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT.expression_item */
T0* T221f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TUPLE.expression_item */
T0* T204f13(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.expression_item */
T0* T202f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT.expression_item */
T0* T197f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.expression_item */
T0* T129f48(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST.is_empty */
T1 T1427f3(T0* C)
{
	T1 R = 0;
	R = ((((T1427*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_AGENT_ARGUMENT_OPERAND_LIST.is_empty */
T1 T823f9(T0* C)
{
	T1 R = 0;
	R = ((((T823*)(C))->a3)==((T6)(GE_int32(0))));
	return R;
}

/* ET_ASSIGNER_INSTRUCTION.is_empty */
T1 T720f13(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T720f11(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_ASSIGNER_INSTRUCTION.count */
T6 T720f11(T0* C)
{
	T6 R = 0;
	T6 t1;
	t1 = (((((T0*)(GE_void(((T720*)(C))->a1)))->id==202)?T202f16(((T720*)(C))->a1):T723f13(((T720*)(C))->a1)));
	R = ((T6)((t1)+((T6)(GE_int32(1)))));
	return R;
}

/* ET_AGENT_IMPLICIT_OPEN_ARGUMENT_LIST.actual_argument */
T0* T1427f4(T0* C, T6 a1)
{
	T0* R = 0;
	R = (((T1462*)(GE_void(((T1427*)(C))->a2)))->z2[a1]);
	return R;
}

/* ET_AGENT_ARGUMENT_OPERAND_LIST.actual_argument */
T0* T823f7(T0* C, T6 a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T823f8(C, a1));
	R = (T838x11780(GE_void(t1)));
	return R;
}

/* ET_ASSIGNER_INSTRUCTION.actual_argument */
T0* T720f12(T0* C, T6 a1)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	t1 = ((a1)==((T6)(GE_int32(1))));
	if (t1) {
		R = ((T720*)(C))->a2;
	} else {
		t2 = (((((T0*)(GE_void(((T720*)(C))->a1)))->id==202)?((T202*)(((T720*)(C))->a1))->a4:((T723*)(((T720*)(C))->a1))->a3));
		t3 = ((T6)((a1)-((T6)(GE_int32(1)))));
		R = (((((T0*)(GE_void(t2)))->id==198)?T198f6(t2, t3):T813f7(t2, t3)));
	}
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.is_empty_actual_argument */
T1 T1419f9(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_INFIX_CAST_EXPRESSION.is_empty_actual_argument */
T1 T1323f7(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_CONVERT_EXPRESSION.is_empty_actual_argument */
T1 T1322f8(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.is_empty_actual_argument */
T1 T834f26(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.is_empty_actual_argument */
T1 T833f27(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.is_empty_actual_argument */
T1 T832f27(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.is_empty_actual_argument */
T1 T831f27(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.is_empty_actual_argument */
T1 T830f28(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.is_empty_actual_argument */
T1 T828f28(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_MANIFEST_TYPE.is_empty_actual_argument */
T1 T818f14(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_BRACKET_ARGUMENT_LIST.is_empty */
T1 T813f9(T0* C)
{
	T1 R = 0;
	R = ((((T813*)(C))->a3)==((T6)(GE_int32(0))));
	return R;
}

/* ET_STRIP_EXPRESSION.is_empty_actual_argument */
T1 T811f20(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_MANIFEST_ARRAY.is_empty_actual_argument */
T1 T809f19(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_ONCE_MANIFEST_STRING.is_empty_actual_argument */
T1 T808f15(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_CALL_AGENT.is_empty_actual_argument */
T1 T804f22(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_OLD_EXPRESSION.is_empty_actual_argument */
T1 T803f13(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_PREFIX_EXPRESSION.is_empty_actual_argument */
T1 T802f15(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_EQUALITY_EXPRESSION.is_empty_actual_argument */
T1 T801f13(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_INFIX_EXPRESSION.is_empty_actual_argument */
T1 T797f14(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_EXPRESSION_ADDRESS.is_empty_actual_argument */
T1 T795f13(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_RESULT_ADDRESS.is_empty_actual_argument */
T1 T794f13(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_CURRENT_ADDRESS.is_empty_actual_argument */
T1 T793f13(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_FEATURE_ADDRESS.is_empty_actual_argument */
T1 T792f13(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.is_empty_actual_argument */
T1 T787f14(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_PRECURSOR_EXPRESSION.is_empty_actual_argument */
T1 T786f16(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.is_empty_actual_argument */
T1 T771f18(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_BRACKET_EXPRESSION.is_empty_actual_argument */
T1 T723f15(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_CREATE_EXPRESSION.is_empty_actual_argument */
T1 T550f16(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_empty_actual_argument */
T1 T521f28(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_empty_actual_argument */
T1 T520f28(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_FALSE_CONSTANT.is_empty_actual_argument */
T1 T519f27(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_TRUE_CONSTANT.is_empty_actual_argument */
T1 T518f27(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_empty_actual_argument */
T1 T516f29(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_empty_actual_argument */
T1 T515f29(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_empty_actual_argument */
T1 T514f34(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_empty_actual_argument */
T1 T513f35(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_empty_actual_argument */
T1 T512f35(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_empty_actual_argument */
T1 T511f29(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_VERBATIM_STRING.is_empty_actual_argument */
T1 T510f33(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_empty_actual_argument */
T1 T509f28(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_empty_actual_argument */
T1 T508f29(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_VOID.is_empty_actual_argument */
T1 T496f21(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_BIT_CONSTANT.is_empty_actual_argument */
T1 T460f25(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_RESULT.is_empty_actual_argument */
T1 T221f21(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_MANIFEST_TUPLE.is_empty_actual_argument */
T1 T204f20(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_CALL_EXPRESSION.is_empty_actual_argument */
T1 T202f18(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_ACTUAL_ARGUMENT_LIST.is_empty */
T1 T198f10(T0* C)
{
	T1 R = 0;
	R = ((((T198*)(C))->a1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_CURRENT.is_empty_actual_argument */
T1 T197f23(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_IDENTIFIER.is_empty_actual_argument */
T1 T129f85(T0* C)
{
	T1 R = 0;
	R = (((T6)(GE_int32(1)))==((T6)(GE_int32(0))));
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.actual_argument */
T0* T1419f8(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_CAST_EXPRESSION.actual_argument */
T0* T1323f6(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONVERT_EXPRESSION.actual_argument */
T0* T1322f5(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.actual_argument */
T0* T834f17(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.actual_argument */
T0* T833f18(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.actual_argument */
T0* T832f18(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.actual_argument */
T0* T831f19(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.actual_argument */
T0* T830f20(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.actual_argument */
T0* T828f20(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TYPE.actual_argument */
T0* T818f10(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BRACKET_ARGUMENT_LIST.actual_argument */
T0* T813f7(T0* C, T6 a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T813f8(C, a1));
	R = (T237x11762(GE_void(t1)));
	return R;
}

/* ET_STRIP_EXPRESSION.actual_argument */
T0* T811f13(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_ARRAY.actual_argument */
T0* T809f12(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.actual_argument */
T0* T808f10(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_AGENT.actual_argument */
T0* T804f13(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_OLD_EXPRESSION.actual_argument */
T0* T803f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_EXPRESSION.actual_argument */
T0* T802f8(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EQUALITY_EXPRESSION.actual_argument */
T0* T801f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_EXPRESSION.actual_argument */
T0* T797f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXPRESSION_ADDRESS.actual_argument */
T0* T795f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT_ADDRESS.actual_argument */
T0* T794f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CURRENT_ADDRESS.actual_argument */
T0* T793f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FEATURE_ADDRESS.actual_argument */
T0* T792f9(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.actual_argument */
T0* T787f10(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PRECURSOR_EXPRESSION.actual_argument */
T0* T786f12(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.actual_argument */
T0* T771f13(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BRACKET_EXPRESSION.actual_argument */
T0* T723f10(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CREATE_EXPRESSION.actual_argument */
T0* T550f10(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.actual_argument */
T0* T521f19(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.actual_argument */
T0* T520f19(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FALSE_CONSTANT.actual_argument */
T0* T519f20(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TRUE_CONSTANT.actual_argument */
T0* T518f20(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.actual_argument */
T0* T516f22(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.actual_argument */
T0* T515f22(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.actual_argument */
T0* T514f30(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.actual_argument */
T0* T513f32(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.actual_argument */
T0* T512f32(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.actual_argument */
T0* T511f21(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VERBATIM_STRING.actual_argument */
T0* T510f25(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.actual_argument */
T0* T509f20(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.actual_argument */
T0* T508f20(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VOID.actual_argument */
T0* T496f14(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_CONSTANT.actual_argument */
T0* T460f18(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT.actual_argument */
T0* T221f14(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TUPLE.actual_argument */
T0* T204f11(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CALL_EXPRESSION.actual_argument */
T0* T202f14(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_ACTUAL_ARGUMENT_LIST.actual_argument */
T0* T198f6(T0* C, T6 a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T198f5(C, a1));
	R = (T237x11762(GE_void(t1)));
	return R;
}

/* ET_CURRENT.actual_argument */
T0* T197f15(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.actual_argument */
T0* T129f79(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_boolean_constant */
T1 T521f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_boolean_constant */
T1 T520f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_boolean_constant */
T1 T516f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_boolean_constant */
T1 T515f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_boolean_constant */
T1 T514f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_boolean_constant */
T1 T513f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_boolean_constant */
T1 T512f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_boolean_constant */
T1 T511f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_boolean_constant */
T1 T510f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_boolean_constant */
T1 T509f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_boolean_constant */
T1 T508f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_boolean_constant */
T1 T460f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_character_constant */
T1 T519f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_character_constant */
T1 T518f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_character_constant */
T1 T516f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_character_constant */
T1 T515f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_character_constant */
T1 T514f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_character_constant */
T1 T513f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_character_constant */
T1 T512f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_character_constant */
T1 T511f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_character_constant */
T1 T510f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_character_constant */
T1 T509f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_character_constant */
T1 T460f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_integer_constant */
T1 T521f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_integer_constant */
T1 T520f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_integer_constant */
T1 T519f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_integer_constant */
T1 T518f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_integer_constant */
T1 T516f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_integer_constant */
T1 T515f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_integer_constant */
T1 T511f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_integer_constant */
T1 T510f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_integer_constant */
T1 T509f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_integer_constant */
T1 T508f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_integer_constant */
T1 T460f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_real_constant */
T1 T521f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_real_constant */
T1 T520f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_real_constant */
T1 T519f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_real_constant */
T1 T518f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_real_constant */
T1 T514f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_real_constant */
T1 T513f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_real_constant */
T1 T512f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_real_constant */
T1 T511f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_real_constant */
T1 T510f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_real_constant */
T1 T509f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_real_constant */
T1 T508f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_real_constant */
T1 T460f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_string_constant */
T1 T521f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_string_constant */
T1 T520f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_string_constant */
T1 T519f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_string_constant */
T1 T518f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_string_constant */
T1 T516f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_string_constant */
T1 T515f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_string_constant */
T1 T514f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_string_constant */
T1 T513f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_string_constant */
T1 T512f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_string_constant */
T1 T508f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_string_constant */
T1 T460f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_bit_constant */
T1 T521f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_bit_constant */
T1 T520f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_bit_constant */
T1 T519f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_bit_constant */
T1 T518f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_bit_constant */
T1 T516f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_bit_constant */
T1 T515f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_bit_constant */
T1 T514f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_bit_constant */
T1 T513f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_bit_constant */
T1 T512f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_bit_constant */
T1 T511f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_bit_constant */
T1 T510f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_bit_constant */
T1 T509f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_bit_constant */
T1 T508f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CALL_AGENT.is_qualified_call */
T1 T804f14(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	if ((((T804*)(C))->a4)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T804*)(C))->a4))->id) {
		case 1171:
			l1 = ((T804*)(C))->a4;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	R = ((l1)==(EIF_VOID));
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.is_procedure */
T1 T833f23(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T833f15(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.is_procedure */
T1 T832f23(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T832f15(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.is_procedure */
T1 T830f24(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T830f17(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.is_procedure */
T1 T828f24(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T828f17(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.implicit_result */
T0* T834f19(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.implicit_result */
T0* T833f20(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.implicit_result */
T0* T832f20(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.implicit_target_position */
T0* T834f25(T0* C)
{
	T0* R = 0;
	R = (T834f27(C));
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.first_leaf */
T0* T834f27(T0* C)
{
	T0* R = 0;
	R = ((T834*)(C))->a2;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.implicit_target_position */
T0* T833f26(T0* C)
{
	T0* R = 0;
	R = (T833f28(C));
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.first_leaf */
T0* T833f28(T0* C)
{
	T0* R = 0;
	R = ((T833*)(C))->a3;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.implicit_target_position */
T0* T832f26(T0* C)
{
	T0* R = 0;
	R = (T832f28(C));
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.first_leaf */
T0* T832f28(T0* C)
{
	T0* R = 0;
	R = ((T832*)(C))->a3;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.implicit_target_position */
T0* T831f26(T0* C)
{
	T0* R = 0;
	R = (T831f28(C));
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.first_leaf */
T0* T831f28(T0* C)
{
	T0* R = 0;
	R = ((T831*)(C))->a2;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.implicit_target_position */
T0* T830f27(T0* C)
{
	T0* R = 0;
	R = (T830f29(C));
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.first_leaf */
T0* T830f29(T0* C)
{
	T0* R = 0;
	R = ((T830*)(C))->a5;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.implicit_target_position */
T0* T828f27(T0* C)
{
	T0* R = 0;
	R = (T828f29(C));
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.first_leaf */
T0* T828f29(T0* C)
{
	T0* R = 0;
	R = ((T828*)(C))->a5;
	return R;
}

/* ET_CALL_AGENT.implicit_target_position */
T0* T804f21(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T804f8(C));
	R = (T169x6249(GE_void(t1)));
	return R;
}

/* ET_CALL_AGENT.is_inline_agent */
T1 T804f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_bracket */
T1 T800f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_bracket */
T1 T799f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_bracket */
T1 T680f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_bracket */
T1 T676f7(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\024'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_bracket */
T1 T674f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_bracket */
T1 T673f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_bracket */
T1 T672f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_bracket */
T1 T671f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_bracket */
T1 T493f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_bracket */
T1 T480f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_bracket */
T1 T474f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_bracket */
T1 T129f71(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_and */
T1 T800f8(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_and */
T1 T799f8(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_and */
T1 T680f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_and */
T1 T676f39(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\001'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_and */
T1 T674f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_and */
T1 T673f15(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\001'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_and */
T1 T672f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_and */
T1 T671f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_and */
T1 T502f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_and */
T1 T493f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_and */
T1 T480f15(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T480f7(C));
	t2 = ((T2)('\001'));
	R = ((((T480*)(C))->a1)==(t2));
	return R;
}

/* ET_FREE_OPERATOR.is_infix_and */
T1 T474f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_and */
T1 T129f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_and_then */
T1 T800f5(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_and_then */
T1 T680f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_and_then */
T1 T676f40(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\021'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_and_then */
T1 T674f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_and_then */
T1 T673f12(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\021'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_and_then */
T1 T672f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_and_then */
T1 T671f9(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_and_then */
T1 T502f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_and_then */
T1 T493f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_and_then */
T1 T480f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_and_then */
T1 T474f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_and_then */
T1 T129f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_div */
T1 T800f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_div */
T1 T799f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_div */
T1 T680f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_div */
T1 T676f41(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\005'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_div */
T1 T674f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_div */
T1 T673f47(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\005'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_div */
T1 T672f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_div */
T1 T671f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_div */
T1 T502f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_div */
T1 T493f23(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\005'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_div */
T1 T480f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_div */
T1 T474f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_div */
T1 T129f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_divide */
T1 T800f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_divide */
T1 T799f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_divide */
T1 T680f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_divide */
T1 T676f42(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\006'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_divide */
T1 T674f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_divide */
T1 T673f48(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\006'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_divide */
T1 T672f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_divide */
T1 T671f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_divide */
T1 T502f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_divide */
T1 T493f24(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\006'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_divide */
T1 T480f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_divide */
T1 T474f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_divide */
T1 T129f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_ge */
T1 T800f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_ge */
T1 T799f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_ge */
T1 T680f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_ge */
T1 T676f43(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\007'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_ge */
T1 T674f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_ge */
T1 T673f49(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\007'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_ge */
T1 T672f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_ge */
T1 T671f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_ge */
T1 T502f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_ge */
T1 T493f25(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\007'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_ge */
T1 T480f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_ge */
T1 T474f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_ge */
T1 T129f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_gt */
T1 T800f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_gt */
T1 T799f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_gt */
T1 T680f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_gt */
T1 T676f44(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\010'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_gt */
T1 T674f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_gt */
T1 T673f50(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\010'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_gt */
T1 T672f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_gt */
T1 T671f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_gt */
T1 T502f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_gt */
T1 T493f26(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\010'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_gt */
T1 T480f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_gt */
T1 T474f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_gt */
T1 T129f62(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_implies */
T1 T800f7(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_implies */
T1 T799f7(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_implies */
T1 T680f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_implies */
T1 T676f45(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\002'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_implies */
T1 T674f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_implies */
T1 T673f14(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\002'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_implies */
T1 T672f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_implies */
T1 T671f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_implies */
T1 T502f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_implies */
T1 T493f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_implies */
T1 T480f14(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T480f7(C));
	t2 = ((T2)('\002'));
	R = ((((T480*)(C))->a1)==(t2));
	return R;
}

/* ET_FREE_OPERATOR.is_infix_implies */
T1 T474f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_implies */
T1 T129f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_le */
T1 T800f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_le */
T1 T799f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_le */
T1 T680f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_le */
T1 T676f46(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\t'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_le */
T1 T674f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_le */
T1 T673f51(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\t'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_le */
T1 T672f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_le */
T1 T671f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_le */
T1 T502f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_le */
T1 T493f27(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\t'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_le */
T1 T480f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_le */
T1 T474f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_le */
T1 T129f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_lt */
T1 T800f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_lt */
T1 T799f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_lt */
T1 T680f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_lt */
T1 T676f47(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\n'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_lt */
T1 T674f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_lt */
T1 T673f52(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\n'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_lt */
T1 T672f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_lt */
T1 T671f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_lt */
T1 T502f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_lt */
T1 T493f28(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\n'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_lt */
T1 T480f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_lt */
T1 T474f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_lt */
T1 T129f64(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_minus */
T1 T800f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_minus */
T1 T799f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_minus */
T1 T680f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_minus */
T1 T676f35(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\013'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_minus */
T1 T674f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_minus */
T1 T673f53(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\013'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_minus */
T1 T672f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_minus */
T1 T671f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_minus */
T1 T502f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_minus */
T1 T493f29(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\013'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_minus */
T1 T480f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_minus */
T1 T474f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_minus */
T1 T129f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_mod */
T1 T800f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_mod */
T1 T799f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_mod */
T1 T680f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_mod */
T1 T676f48(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\014'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_mod */
T1 T674f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_mod */
T1 T673f54(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\014'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_mod */
T1 T672f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_mod */
T1 T671f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_mod */
T1 T502f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_mod */
T1 T493f30(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\014'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_mod */
T1 T480f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_mod */
T1 T474f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_mod */
T1 T129f66(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_or */
T1 T800f9(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_or */
T1 T799f9(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_or */
T1 T680f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_or */
T1 T676f49(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\003'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_or */
T1 T674f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_or */
T1 T673f16(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\003'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_or */
T1 T672f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_or */
T1 T671f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_or */
T1 T502f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_or */
T1 T493f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_or */
T1 T480f16(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T480f7(C));
	t2 = ((T2)('\003'));
	R = ((((T480*)(C))->a1)==(t2));
	return R;
}

/* ET_FREE_OPERATOR.is_infix_or */
T1 T474f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_or */
T1 T129f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_or_else */
T1 T799f6(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_or_else */
T1 T680f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_or_else */
T1 T676f50(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\022'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_or_else */
T1 T674f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_or_else */
T1 T673f13(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\022'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_or_else */
T1 T672f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_or_else */
T1 T671f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_or_else */
T1 T502f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_or_else */
T1 T493f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_or_else */
T1 T480f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_or_else */
T1 T474f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_or_else */
T1 T129f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_plus */
T1 T800f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_plus */
T1 T799f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_plus */
T1 T680f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_plus */
T1 T676f34(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\r'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_plus */
T1 T674f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_plus */
T1 T673f55(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\r'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_plus */
T1 T672f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_plus */
T1 T671f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_plus */
T1 T502f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_plus */
T1 T493f31(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\r'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_plus */
T1 T480f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_plus */
T1 T474f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_plus */
T1 T129f67(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_power */
T1 T800f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_power */
T1 T799f21(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_power */
T1 T680f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_power */
T1 T676f51(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\016'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_power */
T1 T674f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_power */
T1 T673f56(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\016'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_power */
T1 T672f46(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_power */
T1 T671f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_power */
T1 T502f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_power */
T1 T493f32(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\016'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_power */
T1 T480f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_power */
T1 T474f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_power */
T1 T129f68(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_times */
T1 T800f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_times */
T1 T799f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_times */
T1 T680f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_times */
T1 T676f52(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\017'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_times */
T1 T674f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_times */
T1 T673f57(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\017'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_times */
T1 T672f47(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_times */
T1 T671f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_times */
T1 T502f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_times */
T1 T493f33(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\017'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_times */
T1 T480f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_times */
T1 T474f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_times */
T1 T129f69(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_xor */
T1 T800f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_xor */
T1 T799f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_xor */
T1 T680f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_xor */
T1 T676f53(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\004'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_xor */
T1 T674f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_xor */
T1 T673f58(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\004'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_xor */
T1 T672f48(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_xor */
T1 T671f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_xor */
T1 T502f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_xor */
T1 T493f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_xor */
T1 T480f32(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T480f7(C));
	t2 = ((T2)('\004'));
	R = ((((T480*)(C))->a1)==(t2));
	return R;
}

/* ET_FREE_OPERATOR.is_infix_xor */
T1 T474f31(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_xor */
T1 T129f70(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_infix_dotdot */
T1 T800f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_infix_dotdot */
T1 T799f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_infix_dotdot */
T1 T680f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_infix_dotdot */
T1 T676f54(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('\023'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_infix_dotdot */
T1 T674f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_infix_dotdot */
T1 T673f60(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T673f5(C));
	t2 = ((T2)('\023'));
	R = ((((T673*)(C))->a3)==(t2));
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix_dotdot */
T1 T672f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix_dotdot */
T1 T671f46(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_infix_dotdot */
T1 T502f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_infix_dotdot */
T1 T493f35(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('\023'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_infix_dotdot */
T1 T480f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_infix_dotdot */
T1 T474f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix_dotdot */
T1 T129f72(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_prefix_minus */
T1 T800f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_prefix_minus */
T1 T799f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_prefix_minus */
T1 T680f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_prefix_minus */
T1 T676f37(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('?'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_prefix_minus */
T1 T674f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_prefix_minus */
T1 T673f9(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_prefix_minus */
T1 T672f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_prefix_minus */
T1 T671f30(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T671f5(C));
	t2 = ((T2)('?'));
	R = ((((T671*)(C))->a3)==(t2));
	return R;
}

/* ET_BRACKET_SYMBOL.is_prefix_minus */
T1 T502f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_prefix_minus */
T1 T493f36(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('?'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_prefix_minus */
T1 T480f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_prefix_minus */
T1 T474f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_prefix_minus */
T1 T129f56(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_prefix_plus */
T1 T800f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_prefix_plus */
T1 T799f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_prefix_plus */
T1 T680f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_prefix_plus */
T1 T676f36(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('@'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_prefix_plus */
T1 T674f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_prefix_plus */
T1 T673f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_prefix_plus */
T1 T672f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_prefix_plus */
T1 T671f31(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T671f5(C));
	t2 = ((T2)('@'));
	R = ((((T671*)(C))->a3)==(t2));
	return R;
}

/* ET_BRACKET_SYMBOL.is_prefix_plus */
T1 T502f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_prefix_plus */
T1 T493f37(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T493f7(C));
	t2 = ((T2)('@'));
	R = ((((T493*)(C))->a1)==(t2));
	return R;
}

/* ET_KEYWORD_OPERATOR.is_prefix_plus */
T1 T480f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_prefix_plus */
T1 T474f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_prefix_plus */
T1 T129f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_prefix_not */
T1 T800f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_prefix_not */
T1 T799f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_FREE_NAME.is_prefix_not */
T1 T680f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ALIAS_NAME.is_prefix_not */
T1 T676f55(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T676f5(C));
	t2 = ((T2)('>'));
	R = ((((T676*)(C))->a3)==(t2));
	return R;
}

/* ET_INFIX_FREE_NAME.is_prefix_not */
T1 T674f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_prefix_not */
T1 T673f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_prefix_not */
T1 T672f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_prefix_not */
T1 T671f32(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T671f5(C));
	t2 = ((T2)('>'));
	R = ((((T671*)(C))->a3)==(t2));
	return R;
}

/* ET_BRACKET_SYMBOL.is_prefix_not */
T1 T502f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_prefix_not */
T1 T493f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_prefix_not */
T1 T480f36(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T480f7(C));
	t2 = ((T2)('>'));
	R = ((((T480*)(C))->a1)==(t2));
	return R;
}

/* ET_FREE_OPERATOR.is_prefix_not */
T1 T474f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_prefix_not */
T1 T129f58(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_precursor */
T1 T674f54(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_precursor */
T1 T673f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_precursor */
T1 T672f54(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_precursor */
T1 T671f51(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_precursor */
T1 T502f38(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_precursor */
T1 T493f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_precursor */
T1 T480f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_precursor */
T1 T474f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PRECURSOR_KEYWORD.is_precursor */
T1 T452f11(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T452f7(C));
	t2 = ((T2)('\''));
	R = ((((T452*)(C))->a1)==(t2));
	return R;
}

/* ET_IDENTIFIER.is_precursor */
T1 T129f83(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.precursor_keyword */
T0* T674f55(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_NAME.precursor_keyword */
T0* T673f66(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.precursor_keyword */
T0* T672f55(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_NAME.precursor_keyword */
T0* T671f52(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.precursor_keyword */
T0* T502f39(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.precursor_keyword */
T0* T493f40(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.precursor_keyword */
T0* T480f38(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_FREE_OPERATOR.precursor_keyword */
T0* T474f38(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PRECURSOR_KEYWORD.precursor_keyword */
T0* T452f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.precursor_keyword */
T0* T129f84(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.same_call_name */
T1 T800f29(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((C)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T129f39(GE_void(a1)));
	}
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.same_call_name */
T1 T799f29(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((C)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T129f38(GE_void(a1)));
	}
	return R;
}

/* ET_INFIX_FREE_NAME.same_call_name */
T1 T674f36(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	T0* t5;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		if ((a1)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(a1))->id) {
			case 672:
			case 674:
			case 680:
			case 474:
				l1 = a1;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (T1321x23(GE_void(l1)));
			t1 = ((((T674*)(C))->a4)==(t2));
			if (t1) {
				t1 = (T1321x11711(GE_void(l1)));
				t1 = ((EIF_TRUE)!=(t1));
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T1321x21376(GE_void(l1)));
					t4 = (T674f8(C));
					t1 = ((t3)==(t4));
					if (t1) {
						R = EIF_TRUE;
					} else {
						t3 = (T674f7(C));
						t4 = (T674f8(C));
						t5 = (T1321x21376(GE_void(l1)));
						R = (T26f14(GE_void(t3), t4, t5));
					}
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_NAME.same_call_name */
T1 T673f20(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		switch (((T673*)(C))->a3) {
		case (T2)(T2)('\001'):
			R = (T224x11707(GE_void(a1)));
			break;
		case (T2)(T2)('\021'):
			R = (T224x11708(GE_void(a1)));
			break;
		case (T2)(T2)('\005'):
			R = (T224x11709(GE_void(a1)));
			break;
		case (T2)(T2)('\006'):
			R = (T224x11710(GE_void(a1)));
			break;
		case (T2)(T2)('\007'):
			R = (T224x11712(GE_void(a1)));
			break;
		case (T2)(T2)('\010'):
			R = (T224x11713(GE_void(a1)));
			break;
		case (T2)(T2)('\002'):
			R = (T224x11714(GE_void(a1)));
			break;
		case (T2)(T2)('\t'):
			R = (T224x11715(GE_void(a1)));
			break;
		case (T2)(T2)('\n'):
			R = (T224x11716(GE_void(a1)));
			break;
		case (T2)(T2)('\013'):
			R = (T224x11717(GE_void(a1)));
			break;
		case (T2)(T2)('\014'):
			R = (T224x11718(GE_void(a1)));
			break;
		case (T2)(T2)('\003'):
			R = (T224x11719(GE_void(a1)));
			break;
		case (T2)(T2)('\022'):
			R = (T224x11720(GE_void(a1)));
			break;
		case (T2)(T2)('\r'):
			R = (T224x11721(GE_void(a1)));
			break;
		case (T2)(T2)('\016'):
			R = (T224x11722(GE_void(a1)));
			break;
		case (T2)(T2)('\017'):
			R = (T224x11723(GE_void(a1)));
			break;
		case (T2)(T2)('\004'):
			R = (T224x11724(GE_void(a1)));
			break;
		default:
			break;
		}
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.same_call_name */
T1 T672f20(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	T1 t3;
	T0* t4;
	T0* t5;
	T0* t6;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		if ((a1)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(a1))->id) {
			case 672:
			case 674:
			case 680:
			case 474:
				l1 = a1;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (T1321x23(GE_void(l1)));
			t1 = ((((T672*)(C))->a4)==(t2));
			if (t1) {
				t1 = (T672f32(C));
				t3 = (T1321x11711(GE_void(l1)));
				t1 = ((t1)!=(t3));
				if (t1) {
					R = EIF_FALSE;
				} else {
					t4 = (T1321x21376(GE_void(l1)));
					t5 = (T672f8(C));
					t1 = ((t4)==(t5));
					if (t1) {
						R = EIF_TRUE;
					} else {
						t4 = (T672f7(C));
						t5 = (T672f8(C));
						t6 = (T1321x21376(GE_void(l1)));
						R = (T26f14(GE_void(t4), t5, t6));
					}
				}
			}
		}
	}
	return R;
}

/* ET_PREFIX_NAME.same_call_name */
T1 T671f17(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		switch (((T671*)(C))->a3) {
		case (T2)(T2)('?'):
			R = (T224x11727(GE_void(a1)));
			break;
		case (T2)(T2)('@'):
			R = (T224x11728(GE_void(a1)));
			break;
		case (T2)(T2)('>'):
			R = (T224x11730(GE_void(a1)));
			break;
		default:
			break;
		}
	}
	return R;
}

/* ET_BRACKET_SYMBOL.same_call_name */
T1 T502f41(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((C)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T129f71(GE_void(a1)));
	}
	return R;
}

/* ET_SYMBOL_OPERATOR.same_call_name */
T1 T493f42(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((C)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		switch (((T493*)(C))->a1) {
		case (T2)(T2)('\005'):
			R = (T129f59(GE_void(a1)));
			break;
		case (T2)(T2)('\006'):
			R = (T129f60(GE_void(a1)));
			break;
		case (T2)(T2)('\007'):
			R = (T129f61(GE_void(a1)));
			break;
		case (T2)(T2)('\010'):
			R = (T129f62(GE_void(a1)));
			break;
		case (T2)(T2)('\t'):
			R = (T129f63(GE_void(a1)));
			break;
		case (T2)(T2)('\n'):
			R = (T129f64(GE_void(a1)));
			break;
		case (T2)(T2)('\013'):
			R = (T129f65(GE_void(a1)));
			break;
		case (T2)(T2)('\014'):
			R = (T129f66(GE_void(a1)));
			break;
		case (T2)(T2)('\r'):
			R = (T129f67(GE_void(a1)));
			break;
		case (T2)(T2)('\016'):
			R = (T129f68(GE_void(a1)));
			break;
		case (T2)(T2)('\017'):
			R = (T129f69(GE_void(a1)));
			break;
		case (T2)(T2)('\023'):
			R = (T129f72(GE_void(a1)));
			break;
		case (T2)(T2)('?'):
			R = (T129f56(GE_void(a1)));
			break;
		case (T2)(T2)('@'):
			R = (T129f57(GE_void(a1)));
			break;
		default:
			break;
		}
	}
	return R;
}

/* ET_KEYWORD_OPERATOR.same_call_name */
T1 T480f40(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((C)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		switch (((T480*)(C))->a1) {
		case (T2)(T2)('\001'):
			R = (T129f41(GE_void(a1)));
			break;
		case (T2)(T2)('\002'):
			R = (T129f40(GE_void(a1)));
			break;
		case (T2)(T2)('\003'):
			R = (T129f42(GE_void(a1)));
			break;
		case (T2)(T2)('\004'):
			R = (T129f70(GE_void(a1)));
			break;
		case (T2)(T2)('>'):
			R = (T129f58(GE_void(a1)));
			break;
		default:
			break;
		}
	}
	return R;
}

/* ET_FREE_OPERATOR.same_call_name */
T1 T474f40(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T6 t2;
	T1 t3;
	T0* t4;
	T0* t5;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = ((GE_void(l1), (T6)0));
			t1 = ((((T474*)(C))->a2)==(t2));
			if (t1) {
				t1 = (T474f36(C));
				t3 = ((GE_void(l1), (T1)0));
				t1 = ((t1)!=(t3));
				if (t1) {
					R = EIF_FALSE;
				} else {
					t4 = ((GE_void(l1), (T0*)0));
					t1 = ((t4)==(((T474*)(C))->a4));
					if (t1) {
						R = EIF_TRUE;
					} else {
						t4 = (T474f10(C));
						t5 = ((GE_void(l1), (T0*)0));
						R = (T26f14(GE_void(t4), ((T474*)(C))->a4, t5));
					}
				}
			}
		}
	}
	return R;
}

/* ET_IDENTIFIER.same_call_name */
T1 T129f52(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = a1;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T129*)(GE_void(l1)))->a5);
			t1 = ((((T129*)(C))->a5)==(t2));
			if (t1) {
				l2 = (((T129*)(GE_void(l1)))->a6);
				t1 = ((l2)==(((T129*)(C))->a6));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t3 = (T129f45(C));
					R = (T26f14(GE_void(t3), ((T129*)(C))->a6, l2));
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.is_tuple_label */
T1 T800f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.is_tuple_label */
T1 T799f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_SYMBOL.is_tuple_label */
T1 T502f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SYMBOL_OPERATOR.is_tuple_label */
T1 T493f16(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_KEYWORD_OPERATOR.is_tuple_label */
T1 T480f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FREE_OPERATOR.is_tuple_label */
T1 T474f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.position */
T0* T800f31(T0* C)
{
	T0* R = 0;
	R = (T480f9(GE_void(((T800*)(C))->a1)));
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.position */
T0* T799f31(T0* C)
{
	T0* R = 0;
	R = (T480f9(GE_void(((T799*)(C))->a1)));
	return R;
}

/* ET_BRACKET_SYMBOL.position */
T0* T502f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SYMBOL_OPERATOR.position */
T0* T493f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_KEYWORD_OPERATOR.position */
T0* T480f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FREE_OPERATOR.position */
T0* T474f18(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PRECURSOR_KEYWORD.position */
T0* T452f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.lower_name */
T0* T800f28(T0* C)
{
	T0* R = 0;
	R = (T800f30(C));
	return R;
}

/* ET_INFIX_OR_ELSE_OPERATOR.name */
T0* T800f30(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T800f4(C));
	R = (ge773ov14135);
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.lower_name */
T0* T799f28(T0* C)
{
	T0* R = 0;
	R = (T799f30(C));
	return R;
}

/* ET_INFIX_AND_THEN_OPERATOR.name */
T0* T799f30(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T799f4(C));
	R = (ge773ov14134);
	return R;
}

/* ET_BRACKET_SYMBOL.lower_name */
T0* T502f40(T0* C)
{
	T0* R = 0;
	R = (T502f42(C));
	return R;
}

/* ET_BRACKET_SYMBOL.name */
T0* T502f42(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T502f7(C));
	R = (ge773ov14158);
	return R;
}

/* ET_SYMBOL_OPERATOR.lower_name */
T0* T493f41(T0* C)
{
	T0* R = 0;
	R = (T493f43(C));
	return R;
}

/* ET_SYMBOL_OPERATOR.name */
T0* T493f43(T0* C)
{
	T0* R = 0;
	T0* t1;
	switch (((T493*)(C))->a1) {
	case (T2)(T2)('\005'):
		t1 = (T493f7(C));
		R = (ge773ov14122);
		break;
	case (T2)(T2)('\006'):
		t1 = (T493f7(C));
		R = (ge773ov14123);
		break;
	case (T2)(T2)('\007'):
		t1 = (T493f7(C));
		R = (ge773ov14124);
		break;
	case (T2)(T2)('\010'):
		t1 = (T493f7(C));
		R = (ge773ov14125);
		break;
	case (T2)(T2)('\t'):
		t1 = (T493f7(C));
		R = (ge773ov14126);
		break;
	case (T2)(T2)('\n'):
		t1 = (T493f7(C));
		R = (ge773ov14127);
		break;
	case (T2)(T2)('\013'):
		t1 = (T493f7(C));
		R = (ge773ov14128);
		break;
	case (T2)(T2)('\014'):
		t1 = (T493f7(C));
		R = (ge773ov14129);
		break;
	case (T2)(T2)('\r'):
		t1 = (T493f7(C));
		R = (ge773ov14130);
		break;
	case (T2)(T2)('\016'):
		t1 = (T493f7(C));
		R = (ge773ov14131);
		break;
	case (T2)(T2)('\017'):
		t1 = (T493f7(C));
		R = (ge773ov14132);
		break;
	case (T2)(T2)('\023'):
		t1 = (T493f7(C));
		R = (ge773ov14133);
		break;
	case (T2)(T2)('?'):
		t1 = (T493f7(C));
		R = (ge773ov14137);
		break;
	case (T2)(T2)('@'):
		t1 = (T493f7(C));
		R = (ge773ov14138);
		break;
	default:
		t1 = (T493f7(C));
		R = (ge773ov14093);
		break;
	}
	return R;
}

/* ET_KEYWORD_OPERATOR.lower_name */
T0* T480f39(T0* C)
{
	T0* R = 0;
	R = (T480f41(C));
	return R;
}

/* ET_KEYWORD_OPERATOR.name */
T0* T480f41(T0* C)
{
	T0* R = 0;
	T0* t1;
	switch (((T480*)(C))->a1) {
	case (T2)(T2)('\001'):
		t1 = (T480f7(C));
		R = (ge773ov14118);
		break;
	case (T2)(T2)('\002'):
		t1 = (T480f7(C));
		R = (ge773ov14119);
		break;
	case (T2)(T2)('\003'):
		t1 = (T480f7(C));
		R = (ge773ov14120);
		break;
	case (T2)(T2)('\004'):
		t1 = (T480f7(C));
		R = (ge773ov14121);
		break;
	case (T2)(T2)('>'):
		t1 = (T480f7(C));
		R = (ge773ov14136);
		break;
	default:
		t1 = (T480f7(C));
		R = (ge773ov14093);
		break;
	}
	return R;
}

/* ET_FREE_OPERATOR.lower_name */
T0* T474f39(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = (T474f44(C));
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f30(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_FREE_OPERATOR.name */
T0* T474f44(T0* C)
{
	T0* R = 0;
	T1 t1;
	T6 t2;
	t1 = (T474f36(C));
	if (t1) {
		t2 = (((((T0*)(GE_void(((T474*)(C))->a4)))->id==17)?((T17*)(((T474*)(C))->a4))->a2:((T948*)(((T474*)(C))->a4))->a1));
		t2 = ((T6)((t2)+((T6)(GE_int32(8)))));
		R = T17c36(t2);
		T17f41(GE_void(R), ge799ov21373);
	} else {
		t2 = (((((T0*)(GE_void(((T474*)(C))->a4)))->id==17)?((T17*)(((T474*)(C))->a4))->a2:((T948*)(((T474*)(C))->a4))->a1));
		t2 = ((T6)((t2)+((T6)(GE_int32(9)))));
		R = T17c36(t2);
		T17f41(GE_void(R), ge799ov21372);
	}
	T17f41(GE_void(R), ((T474*)(C))->a4);
	T17f39(GE_void(R), (T2)('\"'));
	return R;
}

/* ET_PRECURSOR_KEYWORD.lower_name */
T0* T452f16(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T452f7(C));
	R = (ge773ov14037);
	return R;
}

/* ET_ASSIGNER_INSTRUCTION.position */
T0* T720f10(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T720*)(C))->a1)))->id==202)?T202f9(((T720*)(C))->a1):T723f11(((T720*)(C))->a1)));
	return R;
}

/* ET_CALL_INSTRUCTION.position */
T0* T199f8(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T199*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T196x6246(GE_void(((T199*)(C))->a1)));
	} else {
		R = (T201x6246(GE_void(((T199*)(C))->a2)));
	}
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.name */
T0* T1419f5(T0* C)
{
	T0* R = 0;
	R = (T624x19594(GE_void(((T1419*)(C))->a2)));
	return R;
}

/* ET_CALL_AGENT.name */
T0* T804f8(T0* C)
{
	T0* R = 0;
	R = (T201x11743(GE_void(((T804*)(C))->a2)));
	return R;
}

/* ET_CALL_EXPRESSION.name */
T0* T202f6(T0* C)
{
	T0* R = 0;
	R = (T201x11743(GE_void(((T202*)(C))->a3)));
	return R;
}

/* ET_CALL_INSTRUCTION.name */
T0* T199f4(T0* C)
{
	T0* R = 0;
	R = (T201x11743(GE_void(((T199*)(C))->a2)));
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.arguments */
T0* T1419f4(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_EXPRESSION.arguments */
T0* T802f9(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ASSIGNER_INSTRUCTION.arguments */
T0* T720f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_FREE_NAME.feature_name */
T0* T674f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.feature_name */
T0* T673f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_FREE_NAME.feature_name */
T0* T672f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_PREFIX_NAME.feature_name */
T0* T671f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_IDENTIFIER.feature_name */
T0* T129f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_query */
T1 T667f63(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T667f36(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_ONCE_PROCEDURE.is_query */
T1 T666f60(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T666f35(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_DEFERRED_FUNCTION.is_query */
T1 T661f36(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T661f41(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_ONCE_FUNCTION.is_query */
T1 T660f38(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T660f43(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_DO_FUNCTION.is_query */
T1 T658f38(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T658f43(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_query */
T1 T327f59(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T327f31(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_DO_PROCEDURE.is_query */
T1 T322f60(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T322f40(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_ATTRIBUTE.is_query */
T1 T254f29(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T254f34(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_query */
T1 T253f32(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T253f37(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_query */
T1 T251f31(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T251f36(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_query */
T1 T176f50(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T176f41(C));
	R = ((t1)!=(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_once */
T1 T667f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_once */
T1 T327f56(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_once */
T1 T322f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_dotnet */
T1 T667f71(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_dotnet */
T1 T666f68(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_dotnet */
T1 T661f68(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_dotnet */
T1 T660f69(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_dotnet */
T1 T658f69(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_dotnet */
T1 T327f67(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_dotnet */
T1 T322f68(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_dotnet */
T1 T254f64(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_dotnet */
T1 T253f66(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_dotnet */
T1 T251f66(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_dotnet */
T1 T176f72(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.same_version */
T1 T667f65(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T667*)(C))->a26)==(t1));
	return R;
}

/* ET_ONCE_PROCEDURE.same_version */
T1 T666f62(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T666*)(C))->a26)==(t1));
	return R;
}

/* ET_DEFERRED_FUNCTION.same_version */
T1 T661f65(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T661*)(C))->a26)==(t1));
	return R;
}

/* ET_ONCE_FUNCTION.same_version */
T1 T660f66(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T660*)(C))->a28)==(t1));
	return R;
}

/* ET_DO_FUNCTION.same_version */
T1 T658f66(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T658*)(C))->a28)==(t1));
	return R;
}

/* ET_DEFERRED_PROCEDURE.same_version */
T1 T327f61(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T327*)(C))->a24)==(t1));
	return R;
}

/* ET_DO_PROCEDURE.same_version */
T1 T322f62(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T322*)(C))->a26)==(t1));
	return R;
}

/* ET_ATTRIBUTE.same_version */
T1 T254f61(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T254*)(C))->a17)==(t1));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.same_version */
T1 T253f63(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T253*)(C))->a19)==(t1));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.same_version */
T1 T251f63(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T251*)(C))->a19)==(t1));
	return R;
}

/* ET_EXTERNAL_FUNCTION.same_version */
T1 T176f69(T0* C, T0* a1)
{
	T1 R = 0;
	T6 t1;
	t1 = (T200x12558(GE_void(a1)));
	R = ((((T176*)(C))->a26)==(t1));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.undefined_feature */
T0* T667f69(T0* C, T0* a1)
{
	T0* R = 0;
	R = T327c68(a1, ((T667*)(C))->a3, ((T667*)(C))->a2);
	T327f70(GE_void(R), ((T667*)(C))->a11);
	T327f71(GE_void(R), ((T667*)(C))->a12);
	T327f72(GE_void(R), ((T667*)(C))->a13);
	T327f73(GE_void(R), ((T667*)(C))->a7);
	T327f95(GE_void(R), ((T667*)(C))->a8);
	T327f97(GE_void(R), C);
	T327f69(GE_void(R), ((T667*)(C))->a10);
	T327f86(GE_void(R), ((T667*)(C))->a6);
	T327f87(GE_void(R), ((T667*)(C))->a23);
	T327f88(GE_void(R), ((T667*)(C))->a24);
	T327f74(GE_void(R), ((T667*)(C))->a15);
	T327f90(GE_void(R), ((T667*)(C))->a16);
	T327f100(GE_void(R), ((T667*)(C))->a21);
	return R;
}

/* ET_DEFERRED_PROCEDURE.set_feature_clause */
void T327f88(T0* C, T0* a1)
{
	((T327*)(C))->a20 = a1;
}

/* ET_DEFERRED_PROCEDURE.set_semicolon */
void T327f87(T0* C, T0* a1)
{
	((T327*)(C))->a19 = a1;
}

/* ET_DEFERRED_PROCEDURE.set_end_keyword */
void T327f86(T0* C, T0* a1)
{
	((T327*)(C))->a6 = a1;
}

/* ET_ONCE_PROCEDURE.undefined_feature */
T0* T666f66(T0* C, T0* a1)
{
	T0* R = 0;
	R = T327c68(a1, ((T666*)(C))->a3, ((T666*)(C))->a6);
	T327f70(GE_void(R), ((T666*)(C))->a9);
	T327f71(GE_void(R), ((T666*)(C))->a10);
	T327f72(GE_void(R), ((T666*)(C))->a13);
	T327f73(GE_void(R), ((T666*)(C))->a5);
	T327f95(GE_void(R), ((T666*)(C))->a7);
	T327f97(GE_void(R), C);
	T327f69(GE_void(R), ((T666*)(C))->a8);
	T327f86(GE_void(R), ((T666*)(C))->a4);
	T327f87(GE_void(R), ((T666*)(C))->a22);
	T327f88(GE_void(R), ((T666*)(C))->a23);
	T327f74(GE_void(R), ((T666*)(C))->a15);
	T327f90(GE_void(R), ((T666*)(C))->a16);
	T327f100(GE_void(R), ((T666*)(C))->a21);
	return R;
}

/* ET_DEFERRED_FUNCTION.undefined_feature */
T0* T661f66(T0* C, T0* a1)
{
	T0* R = 0;
	R = T661c69(a1, ((T661*)(C))->a4, ((T661*)(C))->a5, ((T661*)(C))->a8);
	T661f71(GE_void(R), ((T661*)(C))->a11);
	T661f72(GE_void(R), ((T661*)(C))->a12);
	T661f73(GE_void(R), ((T661*)(C))->a13);
	T661f74(GE_void(R), ((T661*)(C))->a14);
	T661f75(GE_void(R), ((T661*)(C))->a7);
	T661f97(GE_void(R), ((T661*)(C))->a9);
	T661f99(GE_void(R), C);
	T661f70(GE_void(R), ((T661*)(C))->a10);
	T661f88(GE_void(R), ((T661*)(C))->a6);
	T661f89(GE_void(R), ((T661*)(C))->a22);
	T661f90(GE_void(R), ((T661*)(C))->a23);
	T661f76(GE_void(R), ((T661*)(C))->a15);
	T661f92(GE_void(R), ((T661*)(C))->a16);
	T661f102(GE_void(R), ((T661*)(C))->a21);
	return R;
}

/* ET_DEFERRED_FUNCTION.set_feature_clause */
void T661f90(T0* C, T0* a1)
{
	((T661*)(C))->a23 = a1;
}

/* ET_DEFERRED_FUNCTION.set_semicolon */
void T661f89(T0* C, T0* a1)
{
	((T661*)(C))->a22 = a1;
}

/* ET_DEFERRED_FUNCTION.set_end_keyword */
void T661f88(T0* C, T0* a1)
{
	((T661*)(C))->a6 = a1;
}

/* ET_ONCE_FUNCTION.undefined_feature */
T0* T660f67(T0* C, T0* a1)
{
	T0* R = 0;
	R = T661c69(a1, ((T660*)(C))->a3, ((T660*)(C))->a4, ((T660*)(C))->a7);
	T661f71(GE_void(R), ((T660*)(C))->a10);
	T661f72(GE_void(R), ((T660*)(C))->a11);
	T661f73(GE_void(R), ((T660*)(C))->a12);
	T661f74(GE_void(R), ((T660*)(C))->a15);
	T661f75(GE_void(R), ((T660*)(C))->a6);
	T661f97(GE_void(R), ((T660*)(C))->a8);
	T661f99(GE_void(R), C);
	T661f70(GE_void(R), ((T660*)(C))->a9);
	T661f88(GE_void(R), ((T660*)(C))->a5);
	T661f89(GE_void(R), ((T660*)(C))->a24);
	T661f90(GE_void(R), ((T660*)(C))->a25);
	T661f76(GE_void(R), ((T660*)(C))->a17);
	T661f92(GE_void(R), ((T660*)(C))->a18);
	T661f102(GE_void(R), ((T660*)(C))->a23);
	return R;
}

/* ET_DO_FUNCTION.undefined_feature */
T0* T658f67(T0* C, T0* a1)
{
	T0* R = 0;
	R = T661c69(a1, ((T658*)(C))->a3, ((T658*)(C))->a4, ((T658*)(C))->a7);
	T661f71(GE_void(R), ((T658*)(C))->a10);
	T661f72(GE_void(R), ((T658*)(C))->a11);
	T661f73(GE_void(R), ((T658*)(C))->a12);
	T661f74(GE_void(R), ((T658*)(C))->a15);
	T661f75(GE_void(R), ((T658*)(C))->a6);
	T661f97(GE_void(R), ((T658*)(C))->a8);
	T661f99(GE_void(R), C);
	T661f70(GE_void(R), ((T658*)(C))->a9);
	T661f88(GE_void(R), ((T658*)(C))->a5);
	T661f89(GE_void(R), ((T658*)(C))->a24);
	T661f90(GE_void(R), ((T658*)(C))->a25);
	T661f76(GE_void(R), ((T658*)(C))->a17);
	T661f92(GE_void(R), ((T658*)(C))->a18);
	T661f102(GE_void(R), ((T658*)(C))->a23);
	return R;
}

/* ET_DEFERRED_PROCEDURE.undefined_feature */
T0* T327f65(T0* C, T0* a1)
{
	T0* R = 0;
	R = T327c68(a1, ((T327*)(C))->a2, ((T327*)(C))->a8);
	T327f70(GE_void(R), ((T327*)(C))->a10);
	T327f71(GE_void(R), ((T327*)(C))->a11);
	T327f72(GE_void(R), ((T327*)(C))->a12);
	T327f73(GE_void(R), ((T327*)(C))->a7);
	T327f95(GE_void(R), ((T327*)(C))->a1);
	T327f97(GE_void(R), C);
	T327f69(GE_void(R), ((T327*)(C))->a9);
	T327f86(GE_void(R), ((T327*)(C))->a6);
	T327f87(GE_void(R), ((T327*)(C))->a19);
	T327f88(GE_void(R), ((T327*)(C))->a20);
	T327f74(GE_void(R), ((T327*)(C))->a13);
	T327f90(GE_void(R), ((T327*)(C))->a14);
	T327f100(GE_void(R), ((T327*)(C))->a21);
	return R;
}

/* ET_DO_PROCEDURE.undefined_feature */
T0* T322f66(T0* C, T0* a1)
{
	T0* R = 0;
	R = T327c68(a1, ((T322*)(C))->a2, ((T322*)(C))->a7);
	T327f70(GE_void(R), ((T322*)(C))->a9);
	T327f71(GE_void(R), ((T322*)(C))->a10);
	T327f72(GE_void(R), ((T322*)(C))->a13);
	T327f73(GE_void(R), ((T322*)(C))->a6);
	T327f95(GE_void(R), ((T322*)(C))->a1);
	T327f97(GE_void(R), C);
	T327f69(GE_void(R), ((T322*)(C))->a8);
	T327f86(GE_void(R), ((T322*)(C))->a5);
	T327f87(GE_void(R), ((T322*)(C))->a21);
	T327f88(GE_void(R), ((T322*)(C))->a22);
	T327f74(GE_void(R), ((T322*)(C))->a15);
	T327f90(GE_void(R), ((T322*)(C))->a16);
	T327f100(GE_void(R), ((T322*)(C))->a23);
	return R;
}

/* ET_ATTRIBUTE.undefined_feature */
T0* T254f62(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T254f36(C));
	R = T661c69(a1, t1, ((T254*)(C))->a3, ((T254*)(C))->a5);
	T661f71(GE_void(R), ((T254*)(C))->a7);
	t1 = (T254f65(C));
	T661f72(GE_void(R), t1);
	t1 = (T254f41(C));
	T661f73(GE_void(R), t1);
	t1 = (T254f42(C));
	T661f74(GE_void(R), t1);
	T661f75(GE_void(R), ((T254*)(C))->a4);
	T661f97(GE_void(R), ((T254*)(C))->a6);
	T661f99(GE_void(R), C);
	T661f89(GE_void(R), ((T254*)(C))->a12);
	T661f90(GE_void(R), ((T254*)(C))->a13);
	T661f76(GE_void(R), ((T254*)(C))->a14);
	T661f92(GE_void(R), ((T254*)(C))->a8);
	T661f102(GE_void(R), ((T254*)(C))->a11);
	return R;
}

/* ET_ATTRIBUTE.obsolete_message */
T0* T254f65(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.undefined_feature */
T0* T253f64(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T253f39(C));
	R = T661c69(a1, t1, ((T253*)(C))->a3, ((T253*)(C))->a7);
	T661f71(GE_void(R), ((T253*)(C))->a9);
	t1 = (T253f67(C));
	T661f72(GE_void(R), t1);
	t1 = (T253f43(C));
	T661f73(GE_void(R), t1);
	t1 = (T253f44(C));
	T661f74(GE_void(R), t1);
	T661f75(GE_void(R), ((T253*)(C))->a6);
	T661f97(GE_void(R), ((T253*)(C))->a8);
	T661f99(GE_void(R), C);
	T661f89(GE_void(R), ((T253*)(C))->a15);
	T661f90(GE_void(R), ((T253*)(C))->a16);
	T661f76(GE_void(R), ((T253*)(C))->a17);
	T661f92(GE_void(R), ((T253*)(C))->a10);
	T661f102(GE_void(R), ((T253*)(C))->a14);
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.obsolete_message */
T0* T253f67(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.undefined_feature */
T0* T251f64(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T251f38(C));
	R = T661c69(a1, t1, ((T251*)(C))->a3, ((T251*)(C))->a7);
	T661f71(GE_void(R), ((T251*)(C))->a9);
	t1 = (T251f67(C));
	T661f72(GE_void(R), t1);
	t1 = (T251f43(C));
	T661f73(GE_void(R), t1);
	t1 = (T251f44(C));
	T661f74(GE_void(R), t1);
	T661f75(GE_void(R), ((T251*)(C))->a6);
	T661f97(GE_void(R), ((T251*)(C))->a8);
	T661f99(GE_void(R), C);
	T661f89(GE_void(R), ((T251*)(C))->a14);
	T661f90(GE_void(R), ((T251*)(C))->a15);
	T661f76(GE_void(R), ((T251*)(C))->a16);
	T661f92(GE_void(R), ((T251*)(C))->a10);
	T661f102(GE_void(R), ((T251*)(C))->a13);
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.obsolete_message */
T0* T251f67(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.undefined_feature */
T0* T176f70(T0* C, T0* a1)
{
	T0* R = 0;
	R = T661c69(a1, ((T176*)(C))->a3, ((T176*)(C))->a5, ((T176*)(C))->a2);
	T661f71(GE_void(R), ((T176*)(C))->a12);
	T661f72(GE_void(R), ((T176*)(C))->a13);
	T661f73(GE_void(R), ((T176*)(C))->a14);
	T661f74(GE_void(R), ((T176*)(C))->a15);
	T661f75(GE_void(R), ((T176*)(C))->a8);
	T661f97(GE_void(R), ((T176*)(C))->a9);
	T661f99(GE_void(R), C);
	T661f70(GE_void(R), ((T176*)(C))->a11);
	T661f88(GE_void(R), ((T176*)(C))->a7);
	T661f89(GE_void(R), ((T176*)(C))->a21);
	T661f90(GE_void(R), ((T176*)(C))->a22);
	T661f76(GE_void(R), ((T176*)(C))->a17);
	T661f92(GE_void(R), ((T176*)(C))->a18);
	T661f102(GE_void(R), ((T176*)(C))->a23);
	return R;
}

/* ET_EXTERNAL_PROCEDURE.renamed_feature */
T0* T667f70(T0* C, T0* a1)
{
	T0* R = 0;
	R = T667c72(a1, ((T667*)(C))->a3, ((T667*)(C))->a1, ((T667*)(C))->a2);
	T667f75(GE_void(R), ((T667*)(C))->a11);
	T667f76(GE_void(R), ((T667*)(C))->a12);
	T667f77(GE_void(R), ((T667*)(C))->a13);
	T667f78(GE_void(R), ((T667*)(C))->a14);
	T667f79(GE_void(R), ((T667*)(C))->a7);
	T667f100(GE_void(R), ((T667*)(C))->a8);
	T667f102(GE_void(R), ((T667*)(C))->a19);
	T667f103(GE_void(R), ((T667*)(C))->a20);
	T667f74(GE_void(R), ((T667*)(C))->a10);
	T667f91(GE_void(R), ((T667*)(C))->a6);
	T667f96(GE_void(R), ((T667*)(C))->a26);
	T667f82(GE_void(R), ((T667*)(C))->a22);
	T667f92(GE_void(R), ((T667*)(C))->a23);
	T667f93(GE_void(R), ((T667*)(C))->a24);
	T667f80(GE_void(R), ((T667*)(C))->a15);
	T667f95(GE_void(R), ((T667*)(C))->a16);
	T667f105(GE_void(R), ((T667*)(C))->a21);
	T667f73(GE_void(R), ((T667*)(C))->a9);
	return R;
}

/* ET_EXTERNAL_PROCEDURE.set_feature_clause */
void T667f93(T0* C, T0* a1)
{
	((T667*)(C))->a24 = a1;
}

/* ET_EXTERNAL_PROCEDURE.set_semicolon */
void T667f92(T0* C, T0* a1)
{
	((T667*)(C))->a23 = a1;
}

/* ET_EXTERNAL_PROCEDURE.set_end_keyword */
void T667f91(T0* C, T0* a1)
{
	((T667*)(C))->a6 = a1;
}

/* ET_ONCE_PROCEDURE.renamed_feature */
T0* T666f67(T0* C, T0* a1)
{
	T0* R = 0;
	R = T666c69(a1, ((T666*)(C))->a3, ((T666*)(C))->a6);
	T666f71(GE_void(R), ((T666*)(C))->a9);
	T666f72(GE_void(R), ((T666*)(C))->a10);
	T666f73(GE_void(R), ((T666*)(C))->a11);
	T666f74(GE_void(R), ((T666*)(C))->a12);
	T666f75(GE_void(R), ((T666*)(C))->a13);
	T666f76(GE_void(R), ((T666*)(C))->a14);
	T666f77(GE_void(R), ((T666*)(C))->a5);
	T666f98(GE_void(R), ((T666*)(C))->a7);
	T666f100(GE_void(R), ((T666*)(C))->a19);
	T666f101(GE_void(R), ((T666*)(C))->a20);
	T666f70(GE_void(R), ((T666*)(C))->a8);
	T666f89(GE_void(R), ((T666*)(C))->a4);
	T666f94(GE_void(R), ((T666*)(C))->a26);
	T666f80(GE_void(R), ((T666*)(C))->a24);
	T666f90(GE_void(R), ((T666*)(C))->a22);
	T666f91(GE_void(R), ((T666*)(C))->a23);
	T666f78(GE_void(R), ((T666*)(C))->a15);
	T666f93(GE_void(R), ((T666*)(C))->a16);
	T666f103(GE_void(R), ((T666*)(C))->a21);
	return R;
}

/* ET_ONCE_PROCEDURE.set_feature_clause */
void T666f91(T0* C, T0* a1)
{
	((T666*)(C))->a23 = a1;
}

/* ET_ONCE_PROCEDURE.set_semicolon */
void T666f90(T0* C, T0* a1)
{
	((T666*)(C))->a22 = a1;
}

/* ET_ONCE_PROCEDURE.set_end_keyword */
void T666f89(T0* C, T0* a1)
{
	((T666*)(C))->a4 = a1;
}

/* ET_DEFERRED_FUNCTION.renamed_feature */
T0* T661f67(T0* C, T0* a1)
{
	T0* R = 0;
	R = T661c69(a1, ((T661*)(C))->a4, ((T661*)(C))->a5, ((T661*)(C))->a8);
	T661f71(GE_void(R), ((T661*)(C))->a11);
	T661f72(GE_void(R), ((T661*)(C))->a12);
	T661f73(GE_void(R), ((T661*)(C))->a13);
	T661f74(GE_void(R), ((T661*)(C))->a14);
	T661f75(GE_void(R), ((T661*)(C))->a7);
	T661f97(GE_void(R), ((T661*)(C))->a9);
	T661f99(GE_void(R), ((T661*)(C))->a19);
	T661f100(GE_void(R), ((T661*)(C))->a20);
	T661f70(GE_void(R), ((T661*)(C))->a10);
	T661f87(GE_void(R), ((T661*)(C))->a1);
	T661f88(GE_void(R), ((T661*)(C))->a6);
	T661f93(GE_void(R), ((T661*)(C))->a26);
	T661f78(GE_void(R), ((T661*)(C))->a24);
	T661f89(GE_void(R), ((T661*)(C))->a22);
	T661f90(GE_void(R), ((T661*)(C))->a23);
	T661f76(GE_void(R), ((T661*)(C))->a15);
	T661f92(GE_void(R), ((T661*)(C))->a16);
	T661f102(GE_void(R), ((T661*)(C))->a21);
	return R;
}

/* ET_DEFERRED_FUNCTION.set_deferred_keyword */
void T661f87(T0* C, T0* a1)
{
	((T661*)(C))->a1 = a1;
}

/* ET_ONCE_FUNCTION.renamed_feature */
T0* T660f68(T0* C, T0* a1)
{
	T0* R = 0;
	R = T660c70(a1, ((T660*)(C))->a3, ((T660*)(C))->a4, ((T660*)(C))->a7);
	T660f72(GE_void(R), ((T660*)(C))->a10);
	T660f73(GE_void(R), ((T660*)(C))->a11);
	T660f74(GE_void(R), ((T660*)(C))->a12);
	T660f75(GE_void(R), ((T660*)(C))->a13);
	T660f76(GE_void(R), ((T660*)(C))->a14);
	T660f77(GE_void(R), ((T660*)(C))->a15);
	T660f78(GE_void(R), ((T660*)(C))->a16);
	T660f79(GE_void(R), ((T660*)(C))->a6);
	T660f100(GE_void(R), ((T660*)(C))->a8);
	T660f102(GE_void(R), ((T660*)(C))->a21);
	T660f103(GE_void(R), ((T660*)(C))->a22);
	T660f71(GE_void(R), ((T660*)(C))->a9);
	T660f91(GE_void(R), ((T660*)(C))->a5);
	T660f96(GE_void(R), ((T660*)(C))->a28);
	T660f82(GE_void(R), ((T660*)(C))->a26);
	T660f92(GE_void(R), ((T660*)(C))->a24);
	T660f93(GE_void(R), ((T660*)(C))->a25);
	T660f80(GE_void(R), ((T660*)(C))->a17);
	T660f95(GE_void(R), ((T660*)(C))->a18);
	T660f105(GE_void(R), ((T660*)(C))->a23);
	return R;
}

/* ET_ONCE_FUNCTION.set_feature_clause */
void T660f93(T0* C, T0* a1)
{
	((T660*)(C))->a25 = a1;
}

/* ET_ONCE_FUNCTION.set_semicolon */
void T660f92(T0* C, T0* a1)
{
	((T660*)(C))->a24 = a1;
}

/* ET_ONCE_FUNCTION.set_end_keyword */
void T660f91(T0* C, T0* a1)
{
	((T660*)(C))->a5 = a1;
}

/* ET_DO_FUNCTION.renamed_feature */
T0* T658f68(T0* C, T0* a1)
{
	T0* R = 0;
	R = T658c70(a1, ((T658*)(C))->a3, ((T658*)(C))->a4, ((T658*)(C))->a7);
	T658f72(GE_void(R), ((T658*)(C))->a10);
	T658f73(GE_void(R), ((T658*)(C))->a11);
	T658f74(GE_void(R), ((T658*)(C))->a12);
	T658f75(GE_void(R), ((T658*)(C))->a13);
	T658f76(GE_void(R), ((T658*)(C))->a14);
	T658f77(GE_void(R), ((T658*)(C))->a15);
	T658f78(GE_void(R), ((T658*)(C))->a16);
	T658f79(GE_void(R), ((T658*)(C))->a6);
	T658f100(GE_void(R), ((T658*)(C))->a8);
	T658f102(GE_void(R), ((T658*)(C))->a21);
	T658f103(GE_void(R), ((T658*)(C))->a22);
	T658f71(GE_void(R), ((T658*)(C))->a9);
	T658f91(GE_void(R), ((T658*)(C))->a5);
	T658f96(GE_void(R), ((T658*)(C))->a28);
	T658f82(GE_void(R), ((T658*)(C))->a26);
	T658f92(GE_void(R), ((T658*)(C))->a24);
	T658f93(GE_void(R), ((T658*)(C))->a25);
	T658f80(GE_void(R), ((T658*)(C))->a17);
	T658f95(GE_void(R), ((T658*)(C))->a18);
	T658f105(GE_void(R), ((T658*)(C))->a23);
	return R;
}

/* ET_DO_FUNCTION.set_feature_clause */
void T658f93(T0* C, T0* a1)
{
	((T658*)(C))->a25 = a1;
}

/* ET_DO_FUNCTION.set_semicolon */
void T658f92(T0* C, T0* a1)
{
	((T658*)(C))->a24 = a1;
}

/* ET_DO_FUNCTION.set_end_keyword */
void T658f91(T0* C, T0* a1)
{
	((T658*)(C))->a5 = a1;
}

/* ET_DEFERRED_PROCEDURE.renamed_feature */
T0* T327f66(T0* C, T0* a1)
{
	T0* R = 0;
	R = T327c68(a1, ((T327*)(C))->a2, ((T327*)(C))->a8);
	T327f70(GE_void(R), ((T327*)(C))->a10);
	T327f71(GE_void(R), ((T327*)(C))->a11);
	T327f72(GE_void(R), ((T327*)(C))->a12);
	T327f73(GE_void(R), ((T327*)(C))->a7);
	T327f95(GE_void(R), ((T327*)(C))->a1);
	T327f97(GE_void(R), ((T327*)(C))->a17);
	T327f98(GE_void(R), ((T327*)(C))->a18);
	T327f69(GE_void(R), ((T327*)(C))->a9);
	T327f85(GE_void(R), ((T327*)(C))->a4);
	T327f86(GE_void(R), ((T327*)(C))->a6);
	T327f91(GE_void(R), ((T327*)(C))->a24);
	T327f76(GE_void(R), ((T327*)(C))->a22);
	T327f87(GE_void(R), ((T327*)(C))->a19);
	T327f88(GE_void(R), ((T327*)(C))->a20);
	T327f74(GE_void(R), ((T327*)(C))->a13);
	T327f90(GE_void(R), ((T327*)(C))->a14);
	T327f100(GE_void(R), ((T327*)(C))->a21);
	return R;
}

/* ET_DEFERRED_PROCEDURE.set_deferred_keyword */
void T327f85(T0* C, T0* a1)
{
	((T327*)(C))->a4 = a1;
}

/* ET_DO_PROCEDURE.renamed_feature */
T0* T322f67(T0* C, T0* a1)
{
	T0* R = 0;
	R = T322c69(a1, ((T322*)(C))->a2, ((T322*)(C))->a7);
	T322f71(GE_void(R), ((T322*)(C))->a9);
	T322f72(GE_void(R), ((T322*)(C))->a10);
	T322f73(GE_void(R), ((T322*)(C))->a11);
	T322f74(GE_void(R), ((T322*)(C))->a12);
	T322f75(GE_void(R), ((T322*)(C))->a13);
	T322f76(GE_void(R), ((T322*)(C))->a14);
	T322f77(GE_void(R), ((T322*)(C))->a6);
	T322f98(GE_void(R), ((T322*)(C))->a1);
	T322f100(GE_void(R), ((T322*)(C))->a19);
	T322f101(GE_void(R), ((T322*)(C))->a20);
	T322f70(GE_void(R), ((T322*)(C))->a8);
	T322f89(GE_void(R), ((T322*)(C))->a5);
	T322f94(GE_void(R), ((T322*)(C))->a26);
	T322f80(GE_void(R), ((T322*)(C))->a24);
	T322f90(GE_void(R), ((T322*)(C))->a21);
	T322f91(GE_void(R), ((T322*)(C))->a22);
	T322f78(GE_void(R), ((T322*)(C))->a15);
	T322f93(GE_void(R), ((T322*)(C))->a16);
	T322f103(GE_void(R), ((T322*)(C))->a23);
	return R;
}

/* ET_DO_PROCEDURE.set_feature_clause */
void T322f91(T0* C, T0* a1)
{
	((T322*)(C))->a22 = a1;
}

/* ET_DO_PROCEDURE.set_semicolon */
void T322f90(T0* C, T0* a1)
{
	((T322*)(C))->a21 = a1;
}

/* ET_DO_PROCEDURE.set_end_keyword */
void T322f89(T0* C, T0* a1)
{
	((T322*)(C))->a5 = a1;
}

/* ET_ATTRIBUTE.renamed_feature */
T0* T254f63(T0* C, T0* a1)
{
	T0* R = 0;
	R = T254c66(a1, ((T254*)(C))->a3, ((T254*)(C))->a5);
	T254f67(GE_void(R), ((T254*)(C))->a7);
	T254f68(GE_void(R), ((T254*)(C))->a4);
	T254f88(GE_void(R), ((T254*)(C))->a6);
	T254f90(GE_void(R), ((T254*)(C))->a18);
	T254f91(GE_void(R), ((T254*)(C))->a19);
	T254f80(GE_void(R), ((T254*)(C))->a17);
	T254f70(GE_void(R), ((T254*)(C))->a15);
	T254f75(GE_void(R), ((T254*)(C))->a12);
	T254f76(GE_void(R), ((T254*)(C))->a13);
	T254f77(GE_void(R), ((T254*)(C))->a14);
	T254f79(GE_void(R), ((T254*)(C))->a8);
	T254f93(GE_void(R), ((T254*)(C))->a11);
	return R;
}

/* ET_ATTRIBUTE.set_first_indexing */
void T254f77(T0* C, T0* a1)
{
	((T254*)(C))->a14 = a1;
}

/* ET_ATTRIBUTE.set_feature_clause */
void T254f76(T0* C, T0* a1)
{
	((T254*)(C))->a13 = a1;
}

/* ET_ATTRIBUTE.set_semicolon */
void T254f75(T0* C, T0* a1)
{
	((T254*)(C))->a12 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.renamed_feature */
T0* T253f65(T0* C, T0* a1)
{
	T0* R = 0;
	R = T253c68(a1, ((T253*)(C))->a3, ((T253*)(C))->a7);
	T253f69(GE_void(R), ((T253*)(C))->a9);
	T253f70(GE_void(R), ((T253*)(C))->a6);
	T253f92(GE_void(R), ((T253*)(C))->a8);
	T253f94(GE_void(R), ((T253*)(C))->a20);
	T253f95(GE_void(R), ((T253*)(C))->a21);
	T253f77(GE_void(R), ((T253*)(C))->a4);
	T253f78(GE_void(R), ((T253*)(C))->a5);
	T253f84(GE_void(R), ((T253*)(C))->a19);
	T253f72(GE_void(R), ((T253*)(C))->a18);
	T253f79(GE_void(R), ((T253*)(C))->a15);
	T253f80(GE_void(R), ((T253*)(C))->a16);
	T253f81(GE_void(R), ((T253*)(C))->a17);
	T253f83(GE_void(R), ((T253*)(C))->a10);
	T253f97(GE_void(R), ((T253*)(C))->a14);
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.set_first_indexing */
void T253f81(T0* C, T0* a1)
{
	((T253*)(C))->a17 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.set_feature_clause */
void T253f80(T0* C, T0* a1)
{
	((T253*)(C))->a16 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.set_semicolon */
void T253f79(T0* C, T0* a1)
{
	((T253*)(C))->a15 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.set_unique_keyword */
void T253f78(T0* C, T0* a1)
{
	((T253*)(C))->a5 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.set_is_keyword */
void T253f77(T0* C, T0* a1)
{
	((T253*)(C))->a4 = a1;
}

/* ET_CONSTANT_ATTRIBUTE.renamed_feature */
T0* T251f65(T0* C, T0* a1)
{
	T0* R = 0;
	R = T251c68(a1, ((T251*)(C))->a3, ((T251*)(C))->a5, ((T251*)(C))->a7);
	T251f69(GE_void(R), ((T251*)(C))->a9);
	T251f70(GE_void(R), ((T251*)(C))->a6);
	T251f91(GE_void(R), ((T251*)(C))->a8);
	T251f93(GE_void(R), ((T251*)(C))->a20);
	T251f94(GE_void(R), ((T251*)(C))->a21);
	T251f77(GE_void(R), ((T251*)(C))->a4);
	T251f83(GE_void(R), ((T251*)(C))->a19);
	T251f72(GE_void(R), ((T251*)(C))->a17);
	T251f78(GE_void(R), ((T251*)(C))->a14);
	T251f79(GE_void(R), ((T251*)(C))->a15);
	T251f80(GE_void(R), ((T251*)(C))->a16);
	T251f82(GE_void(R), ((T251*)(C))->a10);
	T251f96(GE_void(R), ((T251*)(C))->a13);
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.set_first_indexing */
void T251f80(T0* C, T0* a1)
{
	((T251*)(C))->a16 = a1;
}

/* ET_CONSTANT_ATTRIBUTE.set_feature_clause */
void T251f79(T0* C, T0* a1)
{
	((T251*)(C))->a15 = a1;
}

/* ET_CONSTANT_ATTRIBUTE.set_semicolon */
void T251f78(T0* C, T0* a1)
{
	((T251*)(C))->a14 = a1;
}

/* ET_CONSTANT_ATTRIBUTE.set_is_keyword */
void T251f77(T0* C, T0* a1)
{
	((T251*)(C))->a4 = a1;
}

/* ET_EXTERNAL_FUNCTION.renamed_feature */
T0* T176f71(T0* C, T0* a1)
{
	T0* R = 0;
	R = T176c73(a1, ((T176*)(C))->a3, ((T176*)(C))->a5, ((T176*)(C))->a1, ((T176*)(C))->a2);
	T176f76(GE_void(R), ((T176*)(C))->a12);
	T176f77(GE_void(R), ((T176*)(C))->a13);
	T176f78(GE_void(R), ((T176*)(C))->a14);
	T176f79(GE_void(R), ((T176*)(C))->a15);
	T176f80(GE_void(R), ((T176*)(C))->a16);
	T176f81(GE_void(R), ((T176*)(C))->a8);
	T176f102(GE_void(R), ((T176*)(C))->a9);
	T176f104(GE_void(R), ((T176*)(C))->a27);
	T176f105(GE_void(R), ((T176*)(C))->a28);
	T176f75(GE_void(R), ((T176*)(C))->a11);
	T176f89(GE_void(R), ((T176*)(C))->a7);
	T176f94(GE_void(R), ((T176*)(C))->a26);
	T176f84(GE_void(R), ((T176*)(C))->a24);
	T176f90(GE_void(R), ((T176*)(C))->a21);
	T176f91(GE_void(R), ((T176*)(C))->a22);
	T176f82(GE_void(R), ((T176*)(C))->a17);
	T176f93(GE_void(R), ((T176*)(C))->a18);
	T176f107(GE_void(R), ((T176*)(C))->a23);
	T176f74(GE_void(R), ((T176*)(C))->a10);
	return R;
}

/* ET_EXTERNAL_FUNCTION.set_feature_clause */
void T176f91(T0* C, T0* a1)
{
	((T176*)(C))->a22 = a1;
}

/* ET_EXTERNAL_FUNCTION.set_semicolon */
void T176f90(T0* C, T0* a1)
{
	((T176*)(C))->a21 = a1;
}

/* ET_EXTERNAL_FUNCTION.set_end_keyword */
void T176f89(T0* C, T0* a1)
{
	((T176*)(C))->a7 = a1;
}

/* ET_EXTERNAL_PROCEDURE.is_bracketable */
T1 T667f68(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_bracketable */
T1 T666f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_bracketable */
T1 T327f64(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_bracketable */
T1 T322f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_prefixable */
T1 T667f67(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_prefixable */
T1 T666f64(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_prefixable */
T1 T327f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_prefixable */
T1 T322f64(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_infixable */
T1 T667f66(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_infixable */
T1 T666f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_infixable */
T1 T327f62(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_infixable */
T1 T322f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.preconditions */
T0* T254f41(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.preconditions */
T0* T253f43(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.preconditions */
T0* T251f43(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ATTRIBUTE.postconditions */
T0* T254f42(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.postconditions */
T0* T253f44(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.postconditions */
T0* T251f44(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_attribute */
T1 T667f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_attribute */
T1 T666f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_attribute */
T1 T327f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_attribute */
T1 T322f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.type */
T0* T667f36(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.type */
T0* T666f35(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.type */
T0* T327f31(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DO_PROCEDURE.type */
T0* T322f40(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_constant_attribute */
T1 T667f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_constant_attribute */
T1 T666f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_constant_attribute */
T1 T327f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_constant_attribute */
T1 T322f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_unique_attribute */
T1 T667f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_unique_attribute */
T1 T666f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_unique_attribute */
T1 T327f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_unique_attribute */
T1 T322f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_procedure */
T1 T667f44(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T667f36(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_ONCE_PROCEDURE.is_procedure */
T1 T666f44(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T666f35(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_DEFERRED_FUNCTION.is_procedure */
T1 T661f48(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T661f41(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_ONCE_FUNCTION.is_procedure */
T1 T660f50(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T660f43(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_DO_FUNCTION.is_procedure */
T1 T658f50(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T658f43(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_procedure */
T1 T327f41(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T327f31(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_DO_PROCEDURE.is_procedure */
T1 T322f44(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T322f40(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_ATTRIBUTE.is_procedure */
T1 T254f44(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T254f34(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_procedure */
T1 T253f46(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T253f37(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_procedure */
T1 T251f46(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T251f36(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_procedure */
T1 T176f51(T0* C)
{
	T1 R = 0;
	T0* t1;
	t1 = (T176f41(C));
	R = ((t1)==(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.lower_name */
T0* T667f41(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T667f40(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_ONCE_PROCEDURE.lower_name */
T0* T666f32(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T666f39(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.lower_name */
T0* T327f38(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T327f37(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_DO_PROCEDURE.lower_name */
T0* T322f34(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T322f36(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.is_current */
T1 T1419f11(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_CAST_EXPRESSION.is_current */
T1 T1323f4(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONVERT_EXPRESSION.is_current */
T1 T1322f10(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.is_current */
T1 T834f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.is_current */
T1 T833f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.is_current */
T1 T832f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.is_current */
T1 T831f23(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.is_current */
T1 T830f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.is_current */
T1 T828f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_MANIFEST_TYPE.is_current */
T1 T818f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_STRIP_EXPRESSION.is_current */
T1 T811f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_MANIFEST_ARRAY.is_current */
T1 T809f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.is_current */
T1 T808f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CALL_AGENT.is_current */
T1 T804f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_OLD_EXPRESSION.is_current */
T1 T803f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_EXPRESSION.is_current */
T1 T802f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EQUALITY_EXPRESSION.is_current */
T1 T801f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_EXPRESSION.is_current */
T1 T797f13(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXPRESSION_ADDRESS.is_current */
T1 T795f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_RESULT_ADDRESS.is_current */
T1 T794f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CURRENT_ADDRESS.is_current */
T1 T793f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FEATURE_ADDRESS.is_current */
T1 T792f12(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.is_current */
T1 T787f13(T0* C)
{
	T1 R = 0;
	R = (T196x11760(GE_void(((T787*)(C))->a2)));
	return R;
}

/* ET_PRECURSOR_EXPRESSION.is_current */
T1 T786f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.is_current */
T1 T771f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BRACKET_EXPRESSION.is_current */
T1 T723f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CREATE_EXPRESSION.is_current */
T1 T550f14(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.is_current */
T1 T521f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.is_current */
T1 T520f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FALSE_CONSTANT.is_current */
T1 T519f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TRUE_CONSTANT.is_current */
T1 T518f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.is_current */
T1 T516f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.is_current */
T1 T515f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.is_current */
T1 T514f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.is_current */
T1 T513f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.is_current */
T1 T512f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.is_current */
T1 T511f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VERBATIM_STRING.is_current */
T1 T510f32(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.is_current */
T1 T509f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.is_current */
T1 T508f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_VOID.is_current */
T1 T496f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_CONSTANT.is_current */
T1 T460f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_RESULT.is_current */
T1 T221f20(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_MANIFEST_TUPLE.is_current */
T1 T204f19(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CALL_EXPRESSION.is_current */
T1 T202f17(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_current */
T1 T129f82(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.position */
T0* T1419f6(T0* C)
{
	T0* R = 0;
	R = (T196x6246(GE_void(((T1419*)(C))->a3)));
	return R;
}

/* ET_INFIX_CAST_EXPRESSION.position */
T0* T1323f8(T0* C)
{
	T0* R = 0;
	R = (T196x6246(GE_void(((T1323*)(C))->a2)));
	return R;
}

/* ET_CONVERT_EXPRESSION.position */
T0* T1322f6(T0* C)
{
	T0* R = 0;
	R = (T196x6246(GE_void(((T1322*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.position */
T0* T834f20(T0* C)
{
	T0* R = 0;
	R = (T449f9(GE_void(((T834*)(C))->a2)));
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.position */
T0* T833f22(T0* C)
{
	T0* R = 0;
	R = (T449f9(GE_void(((T833*)(C))->a3)));
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.position */
T0* T832f22(T0* C)
{
	T0* R = 0;
	R = (T449f9(GE_void(((T832*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.position */
T0* T831f21(T0* C)
{
	T0* R = 0;
	R = (T449f9(GE_void(((T831*)(C))->a2)));
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.position */
T0* T830f23(T0* C)
{
	T0* R = 0;
	R = (T449f9(GE_void(((T830*)(C))->a5)));
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.position */
T0* T828f23(T0* C)
{
	T0* R = 0;
	R = (T449f9(GE_void(((T828*)(C))->a5)));
	return R;
}

/* ET_MANIFEST_TYPE.position */
T0* T818f11(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T455f8(GE_void(((T818*)(C))->a2)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T167x6246(GE_void(((T818*)(C))->a1)));
	}
	return R;
}

/* ET_STRIP_EXPRESSION.position */
T0* T811f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	R = (T179f9(GE_void(((T811*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T455f8(GE_void(((T811*)(C))->a2)));
		t1 = (T269x11814(GE_void(R)));
		if (t1) {
			t2 = (T811f15(C));
			t1 = ((T1)(!(t2)));
		}
		if (t1) {
			t3 = (T811f16(C, (T6)(GE_int32(1))));
			R = (T569x6246(GE_void(t3)));
		}
	}
	return R;
}

/* ET_STRIP_EXPRESSION.is_empty */
T1 T811f15(T0* C)
{
	T1 R = 0;
	R = ((((T811*)(C))->a4)==((T6)(GE_int32(0))));
	return R;
}

/* ET_MANIFEST_ARRAY.position */
T0* T809f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	R = (((((T0*)(GE_void(((T809*)(C))->a1)))->id==455)?T455f8(((T809*)(C))->a1):T502f8(((T809*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		t2 = (T809f16(C));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t3 = (T809f15(C, (T6)(GE_int32(1))));
		R = (T237x6246(GE_void(t3)));
	}
	return R;
}

/* ET_MANIFEST_ARRAY.is_empty */
T1 T809f16(T0* C)
{
	T1 R = 0;
	R = ((((T809*)(C))->a3)==((T6)(GE_int32(0))));
	return R;
}

/* ET_ONCE_MANIFEST_STRING.position */
T0* T808f11(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T808*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T808*)(C))->a2)));
	}
	return R;
}

/* ET_CALL_AGENT.position */
T0* T804f15(T0* C)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	t1 = (T804f14(C));
	if (t1) {
		t1 = (T804f16(C));
	}
	if (t1) {
		R = (T241x6246(GE_void(((T804*)(C))->a4)));
	} else {
		R = (T649x6246(GE_void(((T804*)(C))->a1)));
		t1 = (T269x11814(GE_void(R)));
		if (t1) {
			R = (T241x6246(GE_void(((T804*)(C))->a4)));
		}
	}
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		t2 = (T804f8(C));
		R = (T169x6246(GE_void(t2)));
	}
	return R;
}

/* ET_CALL_AGENT.use_tilde */
T1 T804f16(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	if ((((T804*)(C))->a1)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T804*)(C))->a1))->id) {
		case 449:
			l1 = EIF_VOID;
			break;
		default:
			l1 = ((T804*)(C))->a1;
		}
	}
	R = ((l1)!=(EIF_VOID));
	return R;
}

/* ET_OLD_EXPRESSION.position */
T0* T803f10(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T803*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T196x6246(GE_void(((T803*)(C))->a2)));
	}
	return R;
}

/* ET_PREFIX_EXPRESSION.position */
T0* T802f11(T0* C)
{
	T0* R = 0;
	R = (T798x6246(GE_void(((T802*)(C))->a1)));
	return R;
}

/* ET_EQUALITY_EXPRESSION.position */
T0* T801f10(T0* C)
{
	T0* R = 0;
	R = (T196x6246(GE_void(((T801*)(C))->a1)));
	return R;
}

/* ET_INFIX_EXPRESSION.position */
T0* T797f11(T0* C)
{
	T0* R = 0;
	R = (T196x6246(GE_void(((T797*)(C))->a1)));
	return R;
}

/* ET_EXPRESSION_ADDRESS.position */
T0* T795f10(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T795*)(C))->a1)))->id==455)?T455f8(((T795*)(C))->a1):T502f8(((T795*)(C))->a1)));
	return R;
}

/* ET_RESULT_ADDRESS.position */
T0* T794f10(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T794*)(C))->a1)))->id==455)?T455f8(((T794*)(C))->a1):T502f8(((T794*)(C))->a1)));
	return R;
}

/* ET_CURRENT_ADDRESS.position */
T0* T793f10(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T793*)(C))->a1)))->id==455)?T455f8(((T793*)(C))->a1):T502f8(((T793*)(C))->a1)));
	return R;
}

/* ET_FEATURE_ADDRESS.position */
T0* T792f10(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T792*)(C))->a1)))->id==455)?T455f8(((T792*)(C))->a1):T502f8(((T792*)(C))->a1)));
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.position */
T0* T787f12(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (((((T0*)(GE_void(((T787*)(C))->a1)))->id==455)?T455f8(((T787*)(C))->a1):T502f8(((T787*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T196x6246(GE_void(((T787*)(C))->a2)));
	}
	return R;
}

/* ET_PRECURSOR_EXPRESSION.position */
T0* T786f13(T0* C)
{
	T0* R = 0;
	T1 t1;
	if (((T786*)(C))->a4) {
		t1 = ((((T786*)(C))->a1)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		R = (T129f33(GE_void(((T786*)(C))->a1)));
	} else {
		R = (T452f10(GE_void(((T786*)(C))->a3)));
	}
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.position */
T0* T771f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	t1 = ((((T771*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		t2 = (T179f9(GE_void(((T771*)(C))->a2)));
		t3 = (T179f15(GE_void(t2)));
		t1 = ((T1)(!(t3)));
	}
	if (t1) {
		R = (T179f9(GE_void(((T771*)(C))->a2)));
	} else {
		R = (T741x6246(GE_void(((T771*)(C))->a1)));
	}
	return R;
}

/* ET_BRACKET_EXPRESSION.position */
T0* T723f11(T0* C)
{
	T0* R = 0;
	R = (T196x6246(GE_void(((T723*)(C))->a1)));
	return R;
}

/* ET_CREATE_EXPRESSION.position */
T0* T550f11(T0* C)
{
	T0* R = 0;
	T0* t1;
	T1 t2;
	t1 = (T179f9(GE_void(((T550*)(C))->a3)));
	t2 = (T179f15(GE_void(t1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		R = (T179f9(GE_void(((T550*)(C))->a3)));
	} else {
		R = (T741x6246(GE_void(((T550*)(C))->a1)));
	}
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.position */
T0* T521f20(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T521*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T521*)(C))->a4), (T0*)0));
	} else {
		R = C;
	}
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.position */
T0* T520f20(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T520*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T520*)(C))->a4), (T0*)0));
	} else {
		R = C;
	}
	return R;
}

/* ET_FALSE_CONSTANT.position */
T0* T519f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TRUE_CONSTANT.position */
T0* T518f21(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.position */
T0* T516f23(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T516*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		R = (T741x6246(GE_void(((T516*)(C))->a5)));
	} else {
		t1 = ((((T516*)(C))->a4)!=(EIF_VOID));
		if (t1) {
			R = (T493f8(GE_void(((T516*)(C))->a4)));
		} else {
			R = C;
		}
	}
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.position */
T0* T515f23(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T515*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		R = (T741x6246(GE_void(((T515*)(C))->a5)));
	} else {
		t1 = ((((T515*)(C))->a4)!=(EIF_VOID));
		if (t1) {
			R = (T493f8(GE_void(((T515*)(C))->a4)));
		} else {
			R = C;
		}
	}
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.position */
T0* T514f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T514*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		R = (T741x6246(GE_void(((T514*)(C))->a7)));
	} else {
		t1 = ((((T514*)(C))->a6)!=(EIF_VOID));
		if (t1) {
			R = (T493f8(GE_void(((T514*)(C))->a6)));
		} else {
			R = C;
		}
	}
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.position */
T0* T513f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T513*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		R = (T741x6246(GE_void(((T513*)(C))->a7)));
	} else {
		t1 = ((((T513*)(C))->a6)!=(EIF_VOID));
		if (t1) {
			R = (T493f8(GE_void(((T513*)(C))->a6)));
		} else {
			R = C;
		}
	}
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.position */
T0* T512f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T512*)(C))->a7)!=(EIF_VOID));
	if (t1) {
		R = (T741x6246(GE_void(((T512*)(C))->a7)));
	} else {
		t1 = ((((T512*)(C))->a6)!=(EIF_VOID));
		if (t1) {
			R = (T493f8(GE_void(((T512*)(C))->a6)));
		} else {
			R = C;
		}
	}
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.position */
T0* T511f11(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T511*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T511*)(C))->a5), (T0*)0));
	} else {
		R = C;
	}
	return R;
}

/* ET_VERBATIM_STRING.position */
T0* T510f15(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T510*)(C))->a9)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T510*)(C))->a9), (T0*)0));
	} else {
		R = C;
	}
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.position */
T0* T509f10(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T509*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T509*)(C))->a4), (T0*)0));
	} else {
		R = C;
	}
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.position */
T0* T508f21(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T508*)(C))->a5)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T508*)(C))->a5), (T0*)0));
	} else {
		R = C;
	}
	return R;
}

/* ET_VOID.position */
T0* T496f15(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_CONSTANT.position */
T0* T460f19(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT.position */
T0* T221f16(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TUPLE.position */
T0* T204f16(T0* C)
{
	T0* R = 0;
	T1 t1;
	T1 t2;
	T0* t3;
	R = (((((T0*)(GE_void(((T204*)(C))->a1)))->id==502)?T502f8(((T204*)(C))->a1):T455f8(((T204*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		t2 = (T204f17(C));
		t1 = ((T1)(!(t2)));
	}
	if (t1) {
		t3 = (T204f12(C, (T6)(GE_int32(1))));
		R = (T237x6246(GE_void(t3)));
	}
	return R;
}

/* ET_MANIFEST_TUPLE.is_empty */
T1 T204f17(T0* C)
{
	T1 R = 0;
	R = ((((T204*)(C))->a3)==((T6)(GE_int32(0))));
	return R;
}

/* ET_CALL_EXPRESSION.position */
T0* T202f9(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T202*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T196x6246(GE_void(((T202*)(C))->a1)));
	} else {
		R = (T201x6246(GE_void(((T202*)(C))->a3)));
	}
	return R;
}

/* ET_CURRENT.position */
T0* T197f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONVERT_TO_EXPRESSION.last_leaf */
T0* T1419f13(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T1419*)(C))->a3)));
	return R;
}

/* ET_INFIX_CAST_EXPRESSION.last_leaf */
T0* T1323f10(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T1323*)(C))->a2)));
	return R;
}

/* ET_CONVERT_EXPRESSION.last_leaf */
T0* T1322f12(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T1322*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE_INLINE_AGENT.last_leaf */
T0* T834f28(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T834*)(C))->a9)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T834*)(C))->a9))->id) {
		case 823:
			l1 = ((T834*)(C))->a9;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = ((T834*)(C))->a7;
	}
	return R;
}

/* ET_AGENT_ARGUMENT_OPERAND_LIST.last_leaf */
T0* T823f10(T0* C)
{
	T0* R = 0;
	R = ((T823*)(C))->a2;
	return R;
}

/* ET_ONCE_PROCEDURE_INLINE_AGENT.last_leaf */
T0* T833f29(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T833*)(C))->a10)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T833*)(C))->a10))->id) {
		case 823:
			l1 = ((T833*)(C))->a10;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = ((T833*)(C))->a2;
	}
	return R;
}

/* ET_DO_PROCEDURE_INLINE_AGENT.last_leaf */
T0* T832f29(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T832*)(C))->a10)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T832*)(C))->a10))->id) {
		case 823:
			l1 = ((T832*)(C))->a10;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = ((T832*)(C))->a2;
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION_INLINE_AGENT.last_leaf */
T0* T831f29(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T831*)(C))->a11)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T831*)(C))->a11))->id) {
		case 823:
			l1 = ((T831*)(C))->a11;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = ((T831*)(C))->a8;
	}
	return R;
}

/* ET_ONCE_FUNCTION_INLINE_AGENT.last_leaf */
T0* T830f30(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T830*)(C))->a12)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T830*)(C))->a12))->id) {
		case 823:
			l1 = ((T830*)(C))->a12;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = ((T830*)(C))->a3;
	}
	return R;
}

/* ET_DO_FUNCTION_INLINE_AGENT.last_leaf */
T0* T828f30(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T828*)(C))->a12)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T828*)(C))->a12))->id) {
		case 823:
			l1 = ((T828*)(C))->a12;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = ((T828*)(C))->a3;
	}
	return R;
}

/* ET_MANIFEST_TYPE.last_leaf */
T0* T818f15(T0* C)
{
	T0* R = 0;
	R = ((T818*)(C))->a3;
	return R;
}

/* ET_STRIP_EXPRESSION.last_leaf */
T0* T811f21(T0* C)
{
	T0* R = 0;
	R = ((T811*)(C))->a3;
	return R;
}

/* ET_MANIFEST_ARRAY.last_leaf */
T0* T809f20(T0* C)
{
	T0* R = 0;
	R = ((T809*)(C))->a2;
	return R;
}

/* ET_ONCE_MANIFEST_STRING.last_leaf */
T0* T808f17(T0* C)
{
	T0* R = 0;
	R = ((T808*)(C))->a2;
	return R;
}

/* ET_CALL_AGENT.last_leaf */
T0* T804f23(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	if ((((T804*)(C))->a3)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch (((T0*)(((T804*)(C))->a3))->id) {
		case 823:
			l1 = ((T804*)(C))->a3;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T823f10(GE_void(l1)));
	} else {
		R = (T201x6250(GE_void(((T804*)(C))->a2)));
	}
	return R;
}

/* ET_OLD_EXPRESSION.last_leaf */
T0* T803f14(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T803*)(C))->a2)));
	return R;
}

/* ET_PREFIX_EXPRESSION.last_leaf */
T0* T802f16(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T802*)(C))->a2)));
	return R;
}

/* ET_EQUALITY_EXPRESSION.last_leaf */
T0* T801f14(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T801*)(C))->a3)));
	return R;
}

/* ET_INFIX_EXPRESSION.last_leaf */
T0* T797f15(T0* C)
{
	T0* R = 0;
	R = (T196x6250(GE_void(((T797*)(C))->a3)));
	return R;
}

/* ET_EXPRESSION_ADDRESS.last_leaf */
T0* T795f14(T0* C)
{
	T0* R = 0;
	R = (T787f15(GE_void(((T795*)(C))->a2)));
	return R;
}

/* ET_RESULT_ADDRESS.last_leaf */
T0* T794f14(T0* C)
{
	T0* R = 0;
	R = ((T794*)(C))->a2;
	return R;
}

/* ET_CURRENT_ADDRESS.last_leaf */
T0* T793f14(T0* C)
{
	T0* R = 0;
	R = ((T793*)(C))->a2;
	return R;
}

/* ET_FEATURE_ADDRESS.last_leaf */
T0* T792f14(T0* C)
{
	T0* R = 0;
	R = (T169x6250(GE_void(((T792*)(C))->a2)));
	return R;
}

/* ET_PARENTHESIZED_EXPRESSION.last_leaf */
T0* T787f15(T0* C)
{
	T0* R = 0;
	R = ((T787*)(C))->a3;
	return R;
}

/* ET_PRECURSOR_EXPRESSION.last_leaf */
T0* T786f17(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T786*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		R = (T198f11(GE_void(((T786*)(C))->a2)));
	} else {
		t1 = ((T1)(!(((T786*)(C))->a4)));
		if (t1) {
			t1 = ((((T786*)(C))->a1)!=(EIF_VOID));
		}
		if (t1) {
			R = (T129f87(GE_void(((T786*)(C))->a1)));
		} else {
			R = ((T786*)(C))->a3;
		}
	}
	return R;
}

/* ET_STATIC_CALL_EXPRESSION.last_leaf */
T0* T771f22(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T771*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = (T198f11(GE_void(((T771*)(C))->a4)));
	} else {
		R = (T201x6250(GE_void(((T771*)(C))->a3)));
	}
	return R;
}

/* ET_BRACKET_EXPRESSION.last_leaf */
T0* T723f16(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T723*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T813f10(GE_void(((T723*)(C))->a3)));
	} else {
		R = (T502f80(GE_void(((T723*)(C))->a2)));
	}
	return R;
}

/* ET_BRACKET_SYMBOL.last_leaf */
T0* T502f80(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BRACKET_ARGUMENT_LIST.last_leaf */
T0* T813f10(T0* C)
{
	T0* R = 0;
	R = ((T813*)(C))->a2;
	return R;
}

/* ET_CREATE_EXPRESSION.last_leaf */
T0* T550f17(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T550*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		R = (T739f5(GE_void(((T550*)(C))->a2)));
	} else {
		R = (T741x6250(GE_void(((T550*)(C))->a1)));
	}
	return R;
}

/* ET_C2_CHARACTER_CONSTANT.last_leaf */
T0* T521f32(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C1_CHARACTER_CONSTANT.last_leaf */
T0* T520f32(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FALSE_CONSTANT.last_leaf */
T0* T519f28(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TRUE_CONSTANT.last_leaf */
T0* T518f28(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_REAL_CONSTANT.last_leaf */
T0* T516f30(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_REAL_CONSTANT.last_leaf */
T0* T515f30(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_HEXADECIMAL_INTEGER_CONSTANT.last_leaf */
T0* T514f39(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_UNDERSCORED_INTEGER_CONSTANT.last_leaf */
T0* T513f40(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_INTEGER_CONSTANT.last_leaf */
T0* T512f40(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_SPECIAL_MANIFEST_STRING.last_leaf */
T0* T511f30(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VERBATIM_STRING.last_leaf */
T0* T510f34(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_REGULAR_MANIFEST_STRING.last_leaf */
T0* T509f29(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_C3_CHARACTER_CONSTANT.last_leaf */
T0* T508f33(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_VOID.last_leaf */
T0* T496f22(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_CONSTANT.last_leaf */
T0* T460f26(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_RESULT.last_leaf */
T0* T221f22(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_MANIFEST_TUPLE.last_leaf */
T0* T204f21(T0* C)
{
	T0* R = 0;
	R = ((T204*)(C))->a2;
	return R;
}

/* ET_CALL_EXPRESSION.last_leaf */
T0* T202f22(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T202*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = (T198f11(GE_void(((T202*)(C))->a4)));
	} else {
		R = (T201x6250(GE_void(((T202*)(C))->a3)));
	}
	return R;
}

/* ET_CURRENT.last_leaf */
T0* T197f25(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LABELED_COMMA_ACTUAL_PARAMETER.actual_parameter */
T0* T965f3(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.actual_parameter */
T0* T956f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LIKE_CURRENT.actual_parameter */
T0* T716f10(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LIKE_FEATURE.actual_parameter */
T0* T714f7(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LABELED_ACTUAL_PARAMETER.actual_parameter */
T0* T712f3(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.actual_parameter */
T0* T578f9(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.actual_parameter */
T0* T577f12(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.actual_parameter */
T0* T565f33(T0* C)
{
	T0* R = 0;
	R = (T565f9(C));
	return R;
}

/* ET_FORMAL_PARAMETER.actual_parameter */
T0* T557f31(T0* C)
{
	T0* R = 0;
	R = (T557f5(C));
	return R;
}

/* ET_TUPLE_TYPE.actual_parameter */
T0* T312f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.actual_parameter */
T0* T174f20(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.actual_parameter */
T0* T172f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.actual_parameter */
T0* T60f84(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LABELED_COMMA_ACTUAL_PARAMETER.resolved_formal_parameters_with_type */
T0* T965f5(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T965f4(C));
	t2 = ((a1)==(t1));
	if (t2) {
		R = C;
	} else {
		l1 = T965c8(((T965*)(C))->a1, a1);
		R = l1;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.resolved_formal_parameters_with_type */
T0* T956f17(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_CURRENT.resolved_formal_parameters_with_type */
T0* T716f17(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_FEATURE.resolved_formal_parameters_with_type */
T0* T714f8(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LABELED_ACTUAL_PARAMETER.resolved_formal_parameters_with_type */
T0* T712f5(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T712f4(C));
	t2 = ((a1)==(t1));
	if (t2) {
		R = C;
	} else {
		l1 = T712c8(((T712*)(C))->a1, a1);
		R = l1;
	}
	return R;
}

/* ET_BIT_FEATURE.resolved_formal_parameters_with_type */
T0* T578f10(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_BIT_N.resolved_formal_parameters_with_type */
T0* T577f13(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.resolved_formal_parameters_with_type */
T0* T565f35(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_FORMAL_PARAMETER.resolved_formal_parameters_with_type */
T0* T557f33(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_TUPLE_TYPE.resolved_formal_parameters_with_type */
T0* T312f7(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.resolved_formal_parameters_with_type */
T0* T174f21(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CLASS_TYPE.resolved_formal_parameters_with_type */
T0* T172f18(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_CLASS.resolved_formal_parameters_with_type */
T0* T60f86(T0* C, T0* a1)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LABELED_COMMA_ACTUAL_PARAMETER.type */
T0* T965f4(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T965*)(C))->a2)));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.type */
T0* T956f3(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LIKE_CURRENT.type */
T0* T716f4(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LIKE_FEATURE.type */
T0* T714f6(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LABELED_ACTUAL_PARAMETER.type */
T0* T712f4(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T712*)(C))->a2)));
	return R;
}

/* ET_BIT_FEATURE.type */
T0* T578f8(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.type */
T0* T577f11(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.type */
T0* T565f9(T0* C)
{
	T0* R = 0;
	R = (T565f8(C));
	return R;
}

/* ET_FORMAL_PARAMETER.type */
T0* T557f5(T0* C)
{
	T0* R = 0;
	R = (T557f4(C));
	return R;
}

/* ET_TUPLE_TYPE.type */
T0* T312f5(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.type */
T0* T174f19(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.type */
T0* T172f4(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.type */
T0* T60f45(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LABELED_COMMA_ACTUAL_PARAMETER.label */
T0* T965f7(T0* C)
{
	T0* R = 0;
	R = (T129f53(GE_void(((T965*)(C))->a1)));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.label */
T0* T956f56(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_LIKE_CURRENT.label */
T0* T716f58(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_LIKE_FEATURE.label */
T0* T714f63(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_LABELED_ACTUAL_PARAMETER.label */
T0* T712f7(T0* C)
{
	T0* R = 0;
	R = (T129f53(GE_void(((T712*)(C))->a1)));
	return R;
}

/* ET_BIT_FEATURE.label */
T0* T578f96(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_N.label */
T0* T577f95(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.label */
T0* T565f66(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER.label */
T0* T557f64(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_TUPLE_TYPE.label */
T0* T312f88(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.label */
T0* T174f92(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CLASS_TYPE.label */
T0* T172f93(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CLASS.label */
T0* T60f161(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.has_type */
T1 T942f7(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T942*)(C))->a6;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T942f8(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PUSH_TYPE_SET.has_type */
T1 T328f11(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T328*)(C))->a5;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T328f7(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.has_type */
T1 T233f18(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T233f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T233f54(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.has_type */
T1 T232f60(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T232f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T232f54(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.has_type */
T1 T228f18(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T228f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T228f54(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.has_type */
T1 T214f60(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T214f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T214f54(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_STANDALONE_TYPE_SET.has_type */
T1 T188f9(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T188*)(C))->a3;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T188f5(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_TYPE.has_type */
T1 T157f18(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T157f29(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T157f55(C, l1));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.dynamic_types */
T0* T233f62(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.dynamic_types */
T0* T232f63(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.dynamic_types */
T0* T228f62(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.dynamic_types */
T0* T214f63(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TYPE.dynamic_types */
T0* T157f60(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.special_type */
T0* T942f12(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = ((T942*)(C))->a6;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T942f8(C, l1));
		t1 = (T157x12170(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PUSH_TYPE_SET.special_type */
T0* T328f12(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = ((T328*)(C))->a5;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T328f7(C, l1));
		t1 = (T157x12170(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.special_type */
T0* T233f63(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = (T233f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T233f54(C, l1));
		t1 = (T233f60(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.special_type */
T0* T232f64(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = (T232f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T232f54(C, l1));
		t1 = (T232f61(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.special_type */
T0* T228f63(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = (T228f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T228f54(C, l1));
		t1 = (EIF_TRUE);
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.special_type */
T0* T214f64(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = (T214f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T214f54(C, l1));
		t1 = (T214f61(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_STANDALONE_TYPE_SET.special_type */
T0* T188f10(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = ((T188*)(C))->a3;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T188f5(C, l1));
		t1 = (T157x12170(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_TYPE.special_type */
T0* T157f61(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	l2 = (T157f29(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T157f55(C, l1));
		t1 = (T157f58(GE_void(l3)));
		if (t1) {
			R = l3;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.is_empty */
T1 T942f10(T0* C)
{
	T1 R = 0;
	R = ((((T942*)(C))->a6)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_PUSH_TYPE_SET.is_empty */
T1 T328f8(T0* C)
{
	T1 R = 0;
	R = ((((T328*)(C))->a5)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_empty */
T1 T233f58(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T233f53(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_empty */
T1 T232f58(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T232f53(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_empty */
T1 T228f58(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T228f53(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_empty */
T1 T214f58(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T214f53(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_STANDALONE_TYPE_SET.is_empty */
T1 T188f7(T0* C)
{
	T1 R = 0;
	R = ((((T188*)(C))->a3)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_TYPE.is_empty */
T1 T157f57(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T157f29(C));
	R = ((t1)==((T6)(GE_int32(0))));
	return R;
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.is_expanded */
T1 T942f11(T0* C)
{
	T1 R = 0;
	R = (T157x12216(GE_void(((T942*)(C))->a1)));
	return R;
}

/* ET_DYNAMIC_PUSH_TYPE_SET.is_expanded */
T1 T328f10(T0* C)
{
	T1 R = 0;
	R = (T157x12216(GE_void(((T328*)(C))->a1)));
	return R;
}

/* ET_DYNAMIC_STANDALONE_TYPE_SET.is_expanded */
T1 T188f8(T0* C)
{
	T1 R = 0;
	R = (T157x12216(GE_void(((T188*)(C))->a1)));
	return R;
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.has_expanded */
T1 T942f9(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T942*)(C))->a6;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T942f8(C, l1));
		t1 = (T157x12216(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PUSH_TYPE_SET.has_expanded */
T1 T328f9(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T328*)(C))->a5;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T328f7(C, l1));
		t1 = (T157x12216(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.has_expanded */
T1 T233f57(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T233f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T233f54(C, l1));
		t1 = (T233f23(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.has_expanded */
T1 T232f55(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T232f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T232f54(C, l1));
		t1 = (T232f23(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.has_expanded */
T1 T228f57(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T228f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T228f54(C, l1));
		t1 = (T228f23(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.has_expanded */
T1 T214f55(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T214f53(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T214f54(C, l1));
		t1 = (T214f23(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_STANDALONE_TYPE_SET.has_expanded */
T1 T188f6(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T188*)(C))->a3;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T188f5(C, l1));
		t1 = (T157x12216(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_TYPE.has_expanded */
T1 T157f56(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = (T157f29(C));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (T157f55(C, l1));
		t1 = (T157f21(GE_void(t2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.count */
T6 T233f53(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T60f49(GE_void(((T233*)(C))->a6)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.count */
T6 T232f53(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T60f49(GE_void(((T232*)(C))->a6)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.count */
T6 T228f53(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T60f49(GE_void(((T228*)(C))->a6)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.count */
T6 T214f53(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T60f49(GE_void(((T214*)(C))->a6)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_DYNAMIC_TYPE.count */
T6 T157f29(T0* C)
{
	T6 R = 0;
	T1 t1;
	t1 = (T60f49(GE_void(((T157*)(C))->a6)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		R = (T6)(GE_int32(1));
	}
	return R;
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.dynamic_type */
T0* T942f8(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T250x12229T6(GE_void(((T942*)(C))->a4), a1));
	return R;
}

/* ET_DYNAMIC_PUSH_TYPE_SET.dynamic_type */
T0* T328f7(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T250x12229T6(GE_void(((T328*)(C))->a3), a1));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.dynamic_type */
T0* T233f54(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.dynamic_type */
T0* T232f54(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.dynamic_type */
T0* T228f54(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.dynamic_type */
T0* T214f54(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_STANDALONE_TYPE_SET.dynamic_type */
T0* T188f5(T0* C, T6 a1)
{
	T0* R = 0;
	R = (T187f6(GE_void(((T188*)(C))->a4), a1));
	return R;
}

/* ET_DYNAMIC_TYPE.dynamic_type */
T0* T157f55(T0* C, T6 a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_separate */
T1 T174f24(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T174*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T179f14(GE_void(((T174*)(C))->a3)));
	} else {
		R = (T60f92(GE_void(((T174*)(C))->a1)));
	}
	return R;
}

/* ET_KEYWORD.is_separate */
T1 T179f14(T0* C)
{
	T1 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T179f4(C));
	t2 = ((T2)('2'));
	R = ((((T179*)(C))->a1)==(t2));
	return R;
}

/* ET_CLASS_TYPE.is_separate */
T1 T172f23(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T172*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T179f14(GE_void(((T172*)(C))->a1)));
	} else {
		R = (T60f92(GE_void(((T172*)(C))->a3)));
	}
	return R;
}

/* ET_CLASS.is_separate */
T1 T60f92(T0* C)
{
	T1 R = 0;
	R = (T60f93(C));
	return R;
}

/* ET_CLASS.has_separate_mark */
T1 T60f93(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T60*)(C))->a13)!=(EIF_VOID));
	if (t1) {
		R = (T179f14(GE_void(((T60*)(C))->a13)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.is_infix */
T1 T672f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_infix */
T1 T671f22(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_infix */
T1 T129f50(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.is_prefix */
T1 T674f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_prefix */
T1 T673f24(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_prefix */
T1 T129f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_FREE_NAME.argument_name */
T0* T674f51(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_NAME.argument_name */
T0* T673f62(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.argument_name */
T0* T672f51(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_NAME.argument_name */
T0* T671f48(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_IDENTIFIER.argument_name */
T0* T129f76(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_FREE_NAME.local_name */
T0* T674f53(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_INFIX_NAME.local_name */
T0* T673f64(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.local_name */
T0* T672f53(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_PREFIX_NAME.local_name */
T0* T671f50(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_IDENTIFIER.local_name */
T0* T129f77(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_NAME.hash_code */
T6 T673f21(T0* C)
{
	T6 R = 0;
	R = ((T6)(((T673*)(C))->a3));
	return R;
}

/* ET_PREFIX_NAME.hash_code */
T6 T671f18(T0* C)
{
	T6 R = 0;
	R = ((T6)(((T671*)(C))->a3));
	return R;
}

/* ET_INFIX_FREE_NAME.is_argument */
T1 T674f50(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_argument */
T1 T673f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_argument */
T1 T672f50(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_argument */
T1 T671f47(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_argument */
T1 T129f19(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a3)==((T2)('a')));
	return R;
}

/* ET_INFIX_FREE_NAME.is_local */
T1 T674f52(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_local */
T1 T673f63(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_local */
T1 T672f52(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_local */
T1 T671f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_local */
T1 T129f21(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a3)==((T2)('l')));
	return R;
}

/* ET_INFIX_FREE_NAME.first_leaf */
T0* T674f57(T0* C)
{
	T0* R = 0;
	R = ((T674*)(C))->a1;
	return R;
}

/* ET_INFIX_NAME.first_leaf */
T0* T673f68(T0* C)
{
	T0* R = 0;
	R = ((T673*)(C))->a1;
	return R;
}

/* ET_PREFIX_FREE_NAME.first_leaf */
T0* T672f57(T0* C)
{
	T0* R = 0;
	R = ((T672*)(C))->a1;
	return R;
}

/* ET_PREFIX_NAME.first_leaf */
T0* T671f54(T0* C)
{
	T0* R = 0;
	R = ((T671*)(C))->a1;
	return R;
}

/* ET_IDENTIFIER.first_leaf */
T0* T129f91(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_FREE_NAME.position */
T0* T674f37(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T674*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T674*)(C))->a2)));
	}
	return R;
}

/* ET_INFIX_NAME.position */
T0* T673f22(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T673*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T673*)(C))->a2)));
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.position */
T0* T672f21(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T672*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T672*)(C))->a2)));
	}
	return R;
}

/* ET_PREFIX_NAME.position */
T0* T671f19(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T671*)(C))->a1)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T252x6246(GE_void(((T671*)(C))->a2)));
	}
	return R;
}

/* ET_IDENTIFIER.position */
T0* T129f33(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_FREE_NAME.lower_name */
T0* T674f35(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = (T674f38(C));
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f30(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_INFIX_NAME.lower_name */
T0* T673f19(T0* C)
{
	T0* R = 0;
	R = (T673f23(C));
	return R;
}

/* ET_PREFIX_FREE_NAME.lower_name */
T0* T672f19(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = (T672f22(C));
	l2 = (((T17*)(GE_void(R)))->a2);
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (T17f10(GE_void(R), l1));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (T17f30(GE_void(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_PREFIX_NAME.lower_name */
T0* T671f16(T0* C)
{
	T0* R = 0;
	R = (T671f20(C));
	return R;
}

/* ET_IDENTIFIER.lower_name */
T0* T129f37(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T2 l3 = 0;
	T1 t1;
	R = ((T129*)(C))->a6;
	l2 = (((((T0*)(GE_void(R)))->id==17)?((T17*)(R))->a2:((T948*)(R))->a1));
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		l3 = (((((T0*)(GE_void(R)))->id==17)?T17f10(R, l1):T948f7(R, l1)));
		t1 = (T2f4(&l3, (T2)('A')));
		if (t1) {
			t1 = (T2f7(&l3, (T2)('Z')));
		}
		if (t1) {
			R = (((((T0*)(GE_void(R)))->id==17)?T17f30(R):T948f22(R)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_INFIX_FREE_NAME.same_feature_name */
T1 T674f11(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T674f44(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T674f36(C, a1));
		}
	}
	return R;
}

/* ET_INFIX_NAME.same_feature_name */
T1 T673f8(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T673f29(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T673f20(C, a1));
		}
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.same_feature_name */
T1 T672f11(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T672f31(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T672f20(C, a1));
		}
	}
	return R;
}

/* ET_PREFIX_NAME.same_feature_name */
T1 T671f8(T0* C, T0* a1)
{
	T1 R = 0;
	T1 t1;
	T0* t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (T671f26(C));
		t1 = (T79f1(GE_void(t2), C, a1));
		if (t1) {
			R = (T671f17(C, a1));
		}
	}
	return R;
}

/* ET_IDENTIFIER.same_feature_name */
T1 T129f44(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		if ((a1)==EIF_VOID) {
			l1 = EIF_VOID;
		} else {
			switch (((T0*)(a1))->id) {
			case 129:
				l1 = a1;
				break;
			default:
				l1 = EIF_VOID;
			}
		}
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T129*)(GE_void(l1)))->a5);
			t1 = ((((T129*)(C))->a5)==(t2));
			if (t1) {
				l2 = (((T129*)(GE_void(l1)))->a6);
				t1 = ((l2)==(((T129*)(C))->a6));
				if (t1) {
					R = EIF_TRUE;
				} else {
					t3 = (T129f45(C));
					R = (T26f14(GE_void(t3), ((T129*)(C))->a6, l2));
				}
			}
		}
	}
	return R;
}

/* ET_INFIX_FREE_NAME.last_leaf */
T0* T674f56(T0* C)
{
	T0* R = 0;
	R = ((T674*)(C))->a2;
	return R;
}

/* ET_INFIX_NAME.last_leaf */
T0* T673f67(T0* C)
{
	T0* R = 0;
	R = ((T673*)(C))->a2;
	return R;
}

/* ET_PREFIX_FREE_NAME.last_leaf */
T0* T672f56(T0* C)
{
	T0* R = 0;
	R = ((T672*)(C))->a2;
	return R;
}

/* ET_PREFIX_NAME.last_leaf */
T0* T671f53(T0* C)
{
	T0* R = 0;
	R = ((T671*)(C))->a2;
	return R;
}

/* ET_IDENTIFIER.last_leaf */
T0* T129f87(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_INFIX_FREE_NAME.is_tuple_label */
T1 T674f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_INFIX_NAME.is_tuple_label */
T1 T673f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_FREE_NAME.is_tuple_label */
T1 T672f18(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_PREFIX_NAME.is_tuple_label */
T1 T671f15(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_IDENTIFIER.is_tuple_label */
T1 T129f43(T0* C)
{
	T1 R = 0;
	R = ((((T129*)(C))->a3)==((T2)('t')));
	return R;
}

/* ET_INFIX_FREE_NAME.name */
T0* T674f38(T0* C)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T674f8(C));
	t2 = (((((T0*)(GE_void(t1)))->id==17)?((T17*)(t1))->a2:((T948*)(t1))->a1));
	t2 = ((T6)((t2)+((T6)(GE_int32(8)))));
	R = T17c36(t2);
	T17f41(GE_void(R), ge804ov23227);
	t1 = (T674f8(C));
	T17f41(GE_void(R), t1);
	T17f39(GE_void(R), (T2)('\"'));
	return R;
}

/* ET_INFIX_NAME.name */
T0* T673f23(T0* C)
{
	T0* R = 0;
	T0* t1;
	switch (((T673*)(C))->a3) {
	case (T2)(T2)('\001'):
		t1 = (T673f5(C));
		R = (ge773ov14118);
		break;
	case (T2)(T2)('\021'):
		t1 = (T673f5(C));
		R = (ge773ov14134);
		break;
	case (T2)(T2)('\005'):
		t1 = (T673f5(C));
		R = (ge773ov14122);
		break;
	case (T2)(T2)('\006'):
		t1 = (T673f5(C));
		R = (ge773ov14123);
		break;
	case (T2)(T2)('\007'):
		t1 = (T673f5(C));
		R = (ge773ov14124);
		break;
	case (T2)(T2)('\010'):
		t1 = (T673f5(C));
		R = (ge773ov14125);
		break;
	case (T2)(T2)('\002'):
		t1 = (T673f5(C));
		R = (ge773ov14119);
		break;
	case (T2)(T2)('\t'):
		t1 = (T673f5(C));
		R = (ge773ov14126);
		break;
	case (T2)(T2)('\n'):
		t1 = (T673f5(C));
		R = (ge773ov14127);
		break;
	case (T2)(T2)('\013'):
		t1 = (T673f5(C));
		R = (ge773ov14128);
		break;
	case (T2)(T2)('\014'):
		t1 = (T673f5(C));
		R = (ge773ov14129);
		break;
	case (T2)(T2)('\003'):
		t1 = (T673f5(C));
		R = (ge773ov14120);
		break;
	case (T2)(T2)('\022'):
		t1 = (T673f5(C));
		R = (ge773ov14135);
		break;
	case (T2)(T2)('\r'):
		t1 = (T673f5(C));
		R = (ge773ov14130);
		break;
	case (T2)(T2)('\016'):
		t1 = (T673f5(C));
		R = (ge773ov14131);
		break;
	case (T2)(T2)('\017'):
		t1 = (T673f5(C));
		R = (ge773ov14132);
		break;
	case (T2)(T2)('\004'):
		t1 = (T673f5(C));
		R = (ge773ov14121);
		break;
	default:
		t1 = (T673f5(C));
		R = (ge773ov14093);
		break;
	}
	return R;
}

/* ET_PREFIX_FREE_NAME.name */
T0* T672f22(T0* C)
{
	T0* R = 0;
	T0* t1;
	T6 t2;
	t1 = (T672f8(C));
	t2 = (((((T0*)(GE_void(t1)))->id==17)?((T17*)(t1))->a2:((T948*)(t1))->a1));
	t2 = ((T6)((t2)+((T6)(GE_int32(9)))));
	R = T17c36(t2);
	T17f41(GE_void(R), ge814ov23119);
	t1 = (T672f8(C));
	T17f41(GE_void(R), t1);
	T17f39(GE_void(R), (T2)('\"'));
	return R;
}

/* ET_PREFIX_NAME.name */
T0* T671f20(T0* C)
{
	T0* R = 0;
	T0* t1;
	switch (((T671*)(C))->a3) {
	case (T2)(T2)('?'):
		t1 = (T671f5(C));
		R = (ge773ov14137);
		break;
	case (T2)(T2)('@'):
		t1 = (T671f5(C));
		R = (ge773ov14138);
		break;
	case (T2)(T2)('>'):
		t1 = (T671f5(C));
		R = (ge773ov14136);
		break;
	default:
		t1 = (T671f5(C));
		R = (ge773ov14093);
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.base_type */
T0* T268f28(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6283T0(GE_void(((T268*)(C))->a1), a1));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6186T0T0(GE_void(t1), ((T268*)(C))->a1, a1));
		break;
	default:
		l1 = (T268f10(C));
		T268f39(C);
		R = (T167x6186T0T0(GE_void(l1), C, a1));
		T268f40(C, l1);
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_named_type */
T1 T268f6(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6298T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6210T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6210T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6210T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.cloned_type_context */
T0* T268f11(T0* C)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T268f5(C));
	R = T268c33(((T268*)(C))->a1, t1);
	l2 = ((T268*)(C))->a2;
	l1 = (T6)(GE_int32(1));
	t2 = (T6f1(&l1, l2));
	while (!(t2)) {
		t3 = (T268f17(C, l1));
		T268f40(GE_void(R), t3);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.conforms_from_class_type */
T1 T268f24(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6312T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6228T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6228T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6228T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.conforms_to_type */
T1 T268f22(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6309T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6226T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6226T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6226T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_base_class_type */
T1 T268f29(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6306T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6223T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6223T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6223T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_named_class_type */
T1 T268f14(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6302T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6219T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6219T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6219T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_named_tuple_type */
T1 T268f15(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6304T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6221T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6221T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6221T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.conforms_from_tuple_type */
T1 T268f26(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6314T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6230T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6230T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6230T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_base_tuple_type */
T1 T268f30(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6308T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6225T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6225T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6225T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.conforms_from_formal_parameter_type */
T1 T268f25(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6313T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6229T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6229T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6229T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_named_formal_parameter_type */
T1 T268f12(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6303T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6220T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6220T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6220T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_named_bit_type */
T1 T268f16(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6301T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6218T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6218T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6218T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.conforms_from_bit_type */
T1 T268f27(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6311T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6227T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6227T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6227T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.same_base_bit_type */
T1 T268f31(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6305T0T0T0(GE_void(((T268*)(C))->a1), a1, a2, a3));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6222T0T0T0T0(GE_void(t1), a1, a2, ((T268*)(C))->a1, a3));
		break;
	default:
		t2 = ((a2)!=(C));
		if (t2) {
			l1 = (T268f10(C));
			T268f39(C);
			R = (T167x6222T0T0T0T0(GE_void(l1), a1, a2, C, a3));
			T268f40(C, l1);
		} else {
			l1 = (T268f10(C));
			l2 = (T268f11(C));
			T268f39(GE_void(l2));
			R = (T167x6222T0T0T0T0(GE_void(l1), a1, a2, l2, a3));
		}
		break;
	}
	return R;
}

/* ET_BIT_FEATURE.reference_context_conforms_to_type */
T1 T578f86(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f60(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.reference_context_conforms_to_type */
T1 T577f85(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f59(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.reference_context_conforms_to_type */
T1 T312f79(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f47(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_context_conforms_to_type */
T1 T174f84(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f57(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.reference_context_conforms_to_type */
T1 T172f84(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f51(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.reference_context_conforms_to_type */
T1 T60f143(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f131(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.reference_context_conforms_from_class_type */
T1 T578f78(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f62(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.reference_context_conforms_from_class_type */
T1 T577f77(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f61(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.reference_context_conforms_from_class_type */
T1 T312f71(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f56(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_context_conforms_from_class_type */
T1 T174f76(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f61(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.reference_context_conforms_from_class_type */
T1 T172f76(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f57(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.reference_context_conforms_from_class_type */
T1 T60f144(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f137(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_same_base_type */
T1 T578f76(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f43(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_base_type */
T1 T577f75(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f41(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_type */
T1 T312f69(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f25(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_type */
T1 T174f74(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f18(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_type */
T1 T172f74(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f25(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_base_type */
T1 T60f145(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f81(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.reference_context_conforms_from_tuple_type */
T1 T578f81(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f73(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.reference_context_conforms_from_tuple_type */
T1 T577f80(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f72(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.reference_context_conforms_from_tuple_type */
T1 T312f74(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f66(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_context_conforms_from_tuple_type */
T1 T174f79(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f71(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.reference_context_conforms_from_tuple_type */
T1 T172f79(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f71(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.reference_context_conforms_from_tuple_type */
T1 T60f146(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f139(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.reference_context_conforms_from_formal_parameter_type */
T1 T578f80(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f74(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.reference_context_conforms_from_formal_parameter_type */
T1 T577f79(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f73(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.reference_context_conforms_from_formal_parameter_type */
T1 T312f73(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f67(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_context_conforms_from_formal_parameter_type */
T1 T174f78(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f72(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.reference_context_conforms_from_formal_parameter_type */
T1 T172f78(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f72(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.reference_context_conforms_from_formal_parameter_type */
T1 T60f147(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f141(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.reference_context_conforms_from_bit_type */
T1 T578f79(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f75(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.reference_context_conforms_from_bit_type */
T1 T577f78(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f74(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.reference_context_conforms_from_bit_type */
T1 T312f72(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f68(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_context_conforms_from_bit_type */
T1 T174f77(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f73(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.reference_context_conforms_from_bit_type */
T1 T172f77(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f73(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.reference_context_conforms_from_bit_type */
T1 T60f148(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f142(C, a1, a2, C, a3));
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.base_class */
T0* T268f13(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6282T0(GE_void(((T268*)(C))->a1), a1));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6185T0T0(GE_void(t1), ((T268*)(C))->a1, a1));
		break;
	default:
		l1 = (T268f10(C));
		T268f39(C);
		R = (T167x6185T0T0(GE_void(l1), C, a1));
		T268f40(C, l1);
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.base_type_index_of_label */
T6 T268f18(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* t1;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6286T0T0(GE_void(((T268*)(C))->a1), a1, a2));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6190T0T0T0(GE_void(t1), a1, ((T268*)(C))->a1, a2));
		break;
	default:
		l1 = (T268f10(C));
		T268f39(C);
		R = (T167x6190T0T0T0(GE_void(l1), a1, C, a2));
		T268f40(C, l1);
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.base_type_actual_count */
T6 T268f8(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* t1;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6288T0(GE_void(((T268*)(C))->a1), a1));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6196T0T0(GE_void(t1), ((T268*)(C))->a1, a1));
		break;
	default:
		l1 = (T268f10(C));
		T268f39(C);
		R = (T167x6196T0T0(GE_void(l1), C, a1));
		T268f40(C, l1);
		break;
	}
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.base_type_actual */
T0* T268f9(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6284T6T0(GE_void(((T268*)(C))->a1), a1, a2));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6188T6T0T0(GE_void(t1), a1, ((T268*)(C))->a1, a2));
		break;
	default:
		l1 = (T268f10(C));
		T268f39(C);
		R = (T167x6188T6T0T0(GE_void(l1), a1, C, a2));
		T268f40(C, l1);
		break;
	}
	return R;
}

/* ET_BIT_FEATURE.root_context */
T0* T578f41(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.root_context */
T0* T577f39(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TUPLE_TYPE.root_context */
T0* T312f34(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.root_context */
T0* T174f40(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.root_context */
T0* T172f37(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.root_context */
T0* T60f103(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_NESTED_TYPE_CONTEXT.named_type */
T0* T268f7(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	switch (((T268*)(C))->a2) {
	case (T6)(T6)(GE_int32(0)):
		R = (T158x6287T0(GE_void(((T268*)(C))->a1), a1));
		break;
	case (T6)(T6)(GE_int32(1)):
		t1 = (T268f10(C));
		R = (T167x6191T0T0(GE_void(t1), ((T268*)(C))->a1, a1));
		break;
	default:
		l1 = (T268f10(C));
		T268f39(C);
		R = (T167x6191T0T0(GE_void(l1), C, a1));
		T268f40(C, l1);
		break;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.unaliased_to_text */
T0* T956f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T956f59(C, R);
	return R;
}

/* ET_LIKE_CURRENT.unaliased_to_text */
T0* T716f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T716f61(C, R);
	return R;
}

/* ET_LIKE_FEATURE.unaliased_to_text */
T0* T714f25(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T714f69(C, R);
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.unaliased_to_text */
T0* T565f17(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T565f72(C, R);
	return R;
}

/* ET_FORMAL_PARAMETER.unaliased_to_text */
T0* T557f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T557f68(C, R);
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_class_type */
T1 T956f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6213T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_class_type */
T1 T716f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_class_type */
T1 T714f47(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_class_type */
T1 T578f69(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_syntactical_class_type */
T1 T577f68(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_class_type */
T1 T565f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6213T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_class_type */
T1 T557f39(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6213T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_class_type */
T1 T312f58(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_class_type */
T1 T174f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T174*)(C))->a1)==(l2));
			if (t2) {
				t3 = (T174f6(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T174f24(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T174f12(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T174f12(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						R = (((((T0*)(GE_void(((T174*)(C))->a2)))->id==173)?T173f16(((T174*)(C))->a2, l1, a2, a3, a4):T425f19(((T174*)(C))->a2, l1, a2, a3, a4)));
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.same_syntactical_types */
T1 T425f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a1:((T173*)(a1))->a3));
		t1 = ((t2)!=(((T425*)(C))->a1));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a2:((T173*)(a1))->a4));
			l2 = ((T6)((((T425*)(C))->a1)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t3 = (((T560*)(GE_void(((T425*)(C))->a2)))->z2[l1]);
				t3 = (((((T0*)(GE_void(t3)))->id==557)?T557f5(t3):T565f9(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==560)?((T560*)(l3))->z2[l1]:((T709*)(l3))->z2[l1]));
				t4 = (T177x6264(GE_void(t4)));
				t1 = (((((T0*)(GE_void(t3)))->id==557)?T557f20(t3, t4, a2, a3, a4):T565f24(t3, t4, a2, a3, a4)));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.same_syntactical_types */
T1 T173f16(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a1:((T173*)(a1))->a3));
		t1 = ((t2)!=(((T173*)(C))->a3));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a2:((T173*)(a1))->a4));
			l2 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t3 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
				t3 = (T177x6264(GE_void(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==560)?((T560*)(l3))->z2[l1]:((T709*)(l3))->z2[l1]));
				t4 = (T177x6264(GE_void(t4)));
				t1 = (T167x6209T0T0T0T0(GE_void(t3), t4, a2, a3, a4));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_class_type */
T1 T172f56(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T172*)(C))->a3)==(l2));
			if (t2) {
				t3 = (T172f22(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T172f23(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T172f24(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T172f24(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						t1 = (T172f5(C));
						R = ((GE_void(t1), l1, a2, a3, a4, (T1)0));
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.same_syntactical_class_type */
T1 T60f88(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T60*)(C))->a8)==(l2));
			if (t2) {
				t3 = (T60f63(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T60f92(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T60f72(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T60f72(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						R = (T425f19(GE_void(((T60*)(C))->a11), l1, a2, a3, a4));
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_tuple_type */
T1 T956f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6217T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_tuple_type */
T1 T716f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_tuple_type */
T1 T714f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_tuple_type */
T1 T578f68(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_syntactical_tuple_type */
T1 T577f67(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_tuple_type */
T1 T565f43(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6217T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_tuple_type */
T1 T557f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6217T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_tuple_type */
T1 T312f57(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T312*)(a1))->a2);
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			t1 = ((((T312*)(C))->a2)==(EIF_VOID));
			if (!(t1)) {
				R = (T173f10(GE_void(((T312*)(C))->a2)));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t1 = ((((T312*)(C))->a2)==(EIF_VOID));
			if (t1) {
				R = (T173f10(GE_void(l1)));
			} else {
				R = (T173f16(GE_void(((T312*)(C))->a2), l1, a2, a3, a4));
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_tuple_type */
T1 T174f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_tuple_type */
T1 T172f66(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_syntactical_tuple_type */
T1 T60f96(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_bit_type */
T1 T956f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6212T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_bit_type */
T1 T716f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_bit_type */
T1 T714f49(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_bit_type */
T1 T578f44(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		T578f103(C);
		t1 = (T578f45(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (((T0*)(a1))->id==577) {
				T577f97(a1);
			} else {
				T578f103(a1);
			}
			t1 = (((((T0*)(a1))->id==577)?T577f5(a1):T578f45(a1)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (((((T0*)(a1))->id==577)?((T577*)(a1))->a2:((T578*)(a1))->a3));
				R = ((t2)==(((T578*)(C))->a3));
			}
		}
	}
	return R;
}

/* ET_BIT_N.same_syntactical_bit_type */
T1 T577f49(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		T577f97(C);
		t1 = (T577f5(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (((T0*)(a1))->id==577) {
				T577f97(a1);
			} else {
				T578f103(a1);
			}
			t1 = (((((T0*)(a1))->id==577)?T577f5(a1):T578f45(a1)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (((((T0*)(a1))->id==577)?((T577*)(a1))->a2:((T578*)(a1))->a3));
				R = ((t2)==(((T577*)(C))->a2));
			}
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_bit_type */
T1 T565f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6212T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_bit_type */
T1 T557f43(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6212T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_bit_type */
T1 T312f60(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_bit_type */
T1 T174f44(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_bit_type */
T1 T172f68(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_syntactical_bit_type */
T1 T60f108(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_like_feature */
T1 T956f36(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6216T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_like_feature */
T1 T716f37(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_like_feature */
T1 T714f50(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 l4 = 0;
	T1 t1;
	T6 t2;
	T6 t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
		if (t1) {
		} else {
			t1 = (T714f36(C));
			if (t1) {
				t1 = (T714f36(a1));
				if (t1) {
					t2 = (T714f38(a1));
					t3 = (T714f38(C));
					t1 = ((t2)==(t3));
				}
				if (t1) {
					t2 = (((T714*)(a1))->a3);
					t1 = ((t2)==(((T714*)(C))->a3));
					if (t1) {
						R = EIF_TRUE;
					} else {
						l3 = (T168x6282T0(GE_void(a2), a4));
						l4 = (((T714*)(a1))->a3);
						t1 = (((T714*)(a1))->a4);
						if (t1) {
							l1 = (T60f66(GE_void(l3), l4));
						} else {
							l1 = (T60f70(GE_void(l3), l4));
						}
						t1 = ((l1)!=(EIF_VOID));
						if (t1) {
							R = (T200x12623T6(GE_void(l1), ((T714*)(C))->a3));
						} else {
							R = EIF_FALSE;
						}
						t1 = ((T1)(!(R)));
						if (t1) {
							l3 = (T168x6282T0(GE_void(a3), a4));
							if (((T714*)(C))->a4) {
								l1 = (T60f66(GE_void(l3), ((T714*)(C))->a3));
							} else {
								l1 = (T60f70(GE_void(l3), ((T714*)(C))->a3));
							}
							t1 = ((l1)!=(EIF_VOID));
							if (t1) {
								R = (T200x12623T6(GE_void(l1), l4));
							} else {
								R = EIF_FALSE;
							}
						}
					}
				}
			} else {
				t1 = (T714f36(a1));
				t1 = ((T1)(!(t1)));
				if (t1) {
					t2 = (((T714*)(a1))->a3);
					t1 = ((t2)==(((T714*)(C))->a3));
					if (t1) {
						R = EIF_TRUE;
					} else {
						t4 = (T168x6282T0(GE_void(a2), a4));
						t2 = (((T714*)(a1))->a3);
						l2 = (T60f70(GE_void(t4), t2));
						t1 = ((l2)!=(EIF_VOID));
						if (t1) {
							R = (T160x12623T6(GE_void(l2), ((T714*)(C))->a3));
						} else {
							R = EIF_FALSE;
						}
						t1 = ((T1)(!(R)));
						if (t1) {
							t4 = (T168x6282T0(GE_void(a3), a4));
							l2 = (T60f70(GE_void(t4), ((T714*)(C))->a3));
							t1 = ((l2)!=(EIF_VOID));
							if (t1) {
								t2 = (((T714*)(a1))->a3);
								R = (T160x12623T6(GE_void(l2), t2));
							} else {
								R = EIF_FALSE;
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_like_feature */
T1 T578f71(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_syntactical_like_feature */
T1 T577f70(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_like_feature */
T1 T565f47(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6216T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_like_feature */
T1 T557f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6216T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_like_feature */
T1 T312f61(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_like_feature */
T1 T174f48(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_like_feature */
T1 T172f69(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_syntactical_like_feature */
T1 T60f112(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_like_current */
T1 T956f37(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6215T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_like_current */
T1 T716f38(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_like_current */
T1 T714f48(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_like_current */
T1 T578f70(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_syntactical_like_current */
T1 T577f69(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_like_current */
T1 T565f48(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6215T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_like_current */
T1 T557f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6215T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_like_current */
T1 T312f59(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_like_current */
T1 T174f50(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_like_current */
T1 T172f67(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_syntactical_like_current */
T1 T60f114(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_formal_parameter_type */
T1 T956f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T956x22307(GE_void(l2)));
			t3 = (T956x22307(GE_void(a1)));
			R = ((t1)==(t3));
		} else {
			t4 = (T168x6280(GE_void(a3)));
			R = (T959x6214T0T0T0T0(GE_void(l1), a1, a2, t4, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_formal_parameter_type */
T1 T716f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_formal_parameter_type */
T1 T714f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_formal_parameter_type */
T1 T578f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_syntactical_formal_parameter_type */
T1 T577f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_formal_parameter_type */
T1 T565f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T956x22307(GE_void(l2)));
			t3 = (T956x22307(GE_void(a1)));
			R = ((t1)==(t3));
		} else {
			t4 = (T168x6280(GE_void(a3)));
			R = (T959x6214T0T0T0T0(GE_void(l1), a1, a2, t4, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_formal_parameter_type */
T1 T557f26(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T956x22307(GE_void(l2)));
			t3 = (T956x22307(GE_void(a1)));
			R = ((t1)==(t3));
		} else {
			t4 = (T168x6280(GE_void(a3)));
			R = (T959x6214T0T0T0T0(GE_void(l1), a1, a2, t4, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_formal_parameter_type */
T1 T312f37(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_formal_parameter_type */
T1 T174f43(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_formal_parameter_type */
T1 T172f40(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_syntactical_formal_parameter_type */
T1 T60f107(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.shallow_base_type */
T0* T956f14(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f104(GE_void(a1)));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		t3 = (((T60*)(GE_void(a1)))->a11);
		l1 = (T425f10(GE_void(t3), ((T956*)(C))->a2));
		l2 = l1;
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T60f52(GE_void(a1), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (((((T0*)(GE_void(l2)))->id==557)?((T557*)(l2))->a2:((T565*)(l2))->a6));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = l6;
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a89:((T56*)(a2))->a88));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			R = EIF_VOID;
			t2 = ((R)==(EIF_VOID));
			if (t2) {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_LIKE_CURRENT.shallow_base_type */
T0* T716f14(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = a1;
	return R;
}

/* ET_LIKE_FEATURE.shallow_base_type */
T0* T714f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T60f52(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6187T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			l1 = (T60f52(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6187T0T0(GE_void(t3), a1, a2));
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.shallow_base_type */
T0* T578f26(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T578f14(C, a1, a2));
	return R;
}

/* ET_BIT_N.shallow_base_type */
T0* T577f26(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T577f16(C, a1, a2));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.shallow_base_type */
T0* T565f16(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f104(GE_void(a1)));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		t3 = (((T60*)(GE_void(a1)))->a11);
		l1 = (T425f10(GE_void(t3), ((T565*)(C))->a6));
		l2 = l1;
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T60f52(GE_void(a1), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (((((T0*)(GE_void(l2)))->id==557)?((T557*)(l2))->a2:((T565*)(l2))->a6));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = l6;
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a89:((T56*)(a2))->a88));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			R = EIF_VOID;
			t2 = ((R)==(EIF_VOID));
			if (t2) {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.shallow_base_type */
T0* T557f14(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f104(GE_void(a1)));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		t3 = (((T60*)(GE_void(a1)))->a11);
		l1 = (T425f10(GE_void(t3), ((T557*)(C))->a2));
		l2 = l1;
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T60f52(GE_void(a1), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (((((T0*)(GE_void(l2)))->id==557)?((T557*)(l2))->a2:((T565*)(l2))->a6));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = l6;
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a89:((T56*)(a2))->a88));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			R = EIF_VOID;
			t2 = ((R)==(EIF_VOID));
			if (t2) {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_TUPLE_TYPE.shallow_base_type */
T0* T312f18(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.shallow_base_type */
T0* T174f29(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.shallow_base_type */
T0* T172f15(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.shallow_base_type */
T0* T60f85(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_syntactical_type */
T1 T956f6(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6214T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6209T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_syntactical_type */
T1 T716f6(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6215T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_LIKE_FEATURE.same_syntactical_type */
T1 T714f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6216T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_BIT_FEATURE.same_syntactical_type */
T1 T578f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6212T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_BIT_N.same_syntactical_type */
T1 T577f14(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6212T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_syntactical_type */
T1 T565f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6214T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6209T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_syntactical_type */
T1 T557f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6214T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6209T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_syntactical_type */
T1 T312f8(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6217T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.has_anchored_type */
T1 T956f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f101(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T60f102(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T60f103(GE_void(a1)));
			R = (T959x6202T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.has_anchored_type */
T1 T716f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_LIKE_FEATURE.has_anchored_type */
T1 T714f18(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_BIT_FEATURE.has_anchored_type */
T1 T578f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T578f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, a2, (T1)0));
	}
	return R;
}

/* ET_BIT_N.has_anchored_type */
T1 T577f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T577f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, a2, (T1)0));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.has_anchored_type */
T1 T565f26(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f101(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T60f102(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T60f103(GE_void(a1)));
			R = (T959x6202T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.has_anchored_type */
T1 T557f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f101(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T60f102(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T60f103(GE_void(a1)));
			R = (T959x6202T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.has_anchored_type */
T1 T312f14(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T173f17(GE_void(l1), a1, a2));
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.has_anchored_type */
T1 T173f17(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
		t2 = (T177x6264(GE_void(t2)));
		t1 = (T167x6202T0T0(GE_void(t2), a1, a2));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.has_anchored_type */
T1 T174f27(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==173)?T173f17(l1, a1, a2):T425f20(l1, a1, a2)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.has_anchored_type */
T1 T425f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T6)((((T425*)(C))->a1)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T560*)(GE_void(((T425*)(C))->a2)))->z2[l1]);
		t2 = (((((T0*)(GE_void(t2)))->id==557)?T557f5(t2):T565f9(t2)));
		t1 = (((((T0*)(GE_void(t2)))->id==557)?T557f21(t2, a1, a2):T565f26(t2, a1, a2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_CLASS_TYPE.has_anchored_type */
T1 T172f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, a2, (T1)0));
	}
	return R;
}

/* ET_CLASS.has_anchored_type */
T1 T60f94(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T425f20(GE_void(l1), a1, a2));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.has_formal_types */
T1 T956f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f101(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T60f102(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t3 = (T60f103(GE_void(a1)));
			R = (T959x6204T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.has_formal_types */
T1 T716f22(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f120(GE_void(a1), a2));
	return R;
}

/* ET_CLASS.context_has_formal_types */
T1 T60f120(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T60f95(C, C, a1));
	return R;
}

/* ET_LIKE_FEATURE.has_formal_types */
T1 T714f19(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T60f113(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6204T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T60f113(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6204T0T0(GE_void(t3), a1, a2));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.has_formal_types */
T1 T578f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T578f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, a2, (T1)0));
	}
	return R;
}

/* ET_BIT_N.has_formal_types */
T1 T577f22(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T577f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, a2, (T1)0));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.has_formal_types */
T1 T565f27(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f101(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T60f102(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t3 = (T60f103(GE_void(a1)));
			R = (T959x6204T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.has_formal_types */
T1 T557f22(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T60f101(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T60f102(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t3 = (T60f103(GE_void(a1)));
			R = (T959x6204T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.has_formal_types */
T1 T312f15(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T173f18(GE_void(l1), a1, a2));
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.has_formal_types */
T1 T173f18(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
		t2 = (T177x6264(GE_void(t2)));
		t1 = (T167x6204T0T0(GE_void(t2), a1, a2));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.has_formal_types */
T1 T174f28(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==173)?T173f18(l1, a1, a2):T425f21(l1, a1, a2)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.has_formal_types */
T1 T425f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T6)((((T425*)(C))->a1)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T560*)(GE_void(((T425*)(C))->a2)))->z2[l1]);
		t2 = (((((T0*)(GE_void(t2)))->id==557)?T557f5(t2):T565f9(t2)));
		t1 = (((((T0*)(GE_void(t2)))->id==557)?T557f22(t2, a1, a2):T565f27(t2, a1, a2)));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_CLASS_TYPE.has_formal_types */
T1 T172f21(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, a2, (T1)0));
	}
	return R;
}

/* ET_CLASS.has_formal_types */
T1 T60f95(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T425f21(GE_void(l1), a1, a2));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.direct_base_class */
T0* T956f12(T0* C, T0* a1)
{
	T0* R = 0;
	return R;
}

/* ET_LIKE_CURRENT.direct_base_class */
T0* T716f11(T0* C, T0* a1)
{
	T0* R = 0;
	return R;
}

/* ET_LIKE_FEATURE.direct_base_class */
T0* T714f13(T0* C, T0* a1)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.direct_base_class */
T0* T565f13(T0* C, T0* a1)
{
	T0* R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER.direct_base_class */
T0* T557f11(T0* C, T0* a1)
{
	T0* R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_named_formal_parameter_type */
T1 T956f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T956x22307(GE_void(l2)));
			t3 = (T956x22307(GE_void(a1)));
			R = ((t1)==(t3));
		} else {
			t4 = (T168x6280(GE_void(a3)));
			R = (T959x6220T0T0T0T0(GE_void(l1), a1, a2, t4, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_named_formal_parameter_type */
T1 T716f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6303T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_named_formal_parameter_type */
T1 T714f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6220T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6220T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_formal_parameter_type */
T1 T578f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_named_formal_parameter_type */
T1 T577f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_named_formal_parameter_type */
T1 T565f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T956x22307(GE_void(l2)));
			t3 = (T956x22307(GE_void(a1)));
			R = ((t1)==(t3));
		} else {
			t4 = (T168x6280(GE_void(a3)));
			R = (T959x6220T0T0T0T0(GE_void(l1), a1, a2, t4, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_named_formal_parameter_type */
T1 T557f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T6 t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T956x22307(GE_void(l2)));
			t3 = (T956x22307(GE_void(a1)));
			R = ((t1)==(t3));
		} else {
			t4 = (T168x6280(GE_void(a3)));
			R = (T959x6220T0T0T0T0(GE_void(l1), a1, a2, t4, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_formal_parameter_type */
T1 T312f36(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_formal_parameter_type */
T1 T174f42(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_named_formal_parameter_type */
T1 T172f39(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_named_formal_parameter_type */
T1 T60f106(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_named_class_type */
T1 T956f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6219T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_named_class_type */
T1 T716f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6302T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_named_class_type */
T1 T714f28(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6219T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6219T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_class_type */
T1 T578f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_named_class_type */
T1 T577f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_named_class_type */
T1 T565f42(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6219T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_named_class_type */
T1 T557f40(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6219T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_class_type */
T1 T312f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_class_type */
T1 T174f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T174*)(C))->a1)==(l2));
			if (t2) {
				t3 = (T174f6(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T174f24(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T174f12(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T174f12(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						R = (((((T0*)(GE_void(((T174*)(C))->a2)))->id==173)?T173f15(((T174*)(C))->a2, l1, a2, a3, a4):T425f18(((T174*)(C))->a2, l1, a2, a3, a4)));
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.same_named_types */
T1 T425f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a1:((T173*)(a1))->a3));
		t1 = ((t2)!=(((T425*)(C))->a1));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a2:((T173*)(a1))->a4));
			l2 = ((T6)((((T425*)(C))->a1)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t3 = (((T560*)(GE_void(((T425*)(C))->a2)))->z2[l1]);
				t3 = (((((T0*)(GE_void(t3)))->id==557)?T557f5(t3):T565f9(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==560)?((T560*)(l3))->z2[l1]:((T709*)(l3))->z2[l1]));
				t4 = (T177x6264(GE_void(t4)));
				t1 = (((((T0*)(GE_void(t3)))->id==557)?T557f19(t3, t4, a2, a3, a4):T565f22(t3, t4, a2, a3, a4)));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.same_named_types */
T1 T173f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a1:((T173*)(a1))->a3));
		t1 = ((t2)!=(((T173*)(C))->a3));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==425)?((T425*)(a1))->a2:((T173*)(a1))->a4));
			l2 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t3 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
				t3 = (T177x6264(GE_void(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==560)?((T560*)(l3))->z2[l1]:((T709*)(l3))->z2[l1]));
				t4 = (T177x6264(GE_void(t4)));
				t1 = (T167x6210T0T0T0T0(GE_void(t3), t4, a2, a3, a4));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_named_class_type */
T1 T172f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T172*)(C))->a3)==(l2));
			if (t2) {
				t3 = (T172f22(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T172f23(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T172f24(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T172f24(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						t1 = (T172f5(C));
						R = ((GE_void(t1), l1, a2, a3, a4, (T1)0));
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.same_named_class_type */
T1 T60f89(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T60*)(C))->a8)==(l2));
			if (t2) {
				t3 = (T60f63(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T60f92(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T60f72(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T60f72(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						R = (T425f18(GE_void(((T60*)(C))->a11), l1, a2, a3, a4));
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_named_tuple_type */
T1 T956f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6221T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_named_tuple_type */
T1 T716f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6304T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_named_tuple_type */
T1 T714f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6221T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6221T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_tuple_type */
T1 T578f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_named_tuple_type */
T1 T577f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_named_tuple_type */
T1 T565f44(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6221T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_named_tuple_type */
T1 T557f42(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6221T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_tuple_type */
T1 T312f26(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T312*)(a1))->a2);
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			t1 = ((((T312*)(C))->a2)==(EIF_VOID));
			if (!(t1)) {
				R = (T173f10(GE_void(((T312*)(C))->a2)));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t1 = ((((T312*)(C))->a2)==(EIF_VOID));
			if (t1) {
				R = (T173f10(GE_void(l1)));
			} else {
				R = (T173f15(GE_void(((T312*)(C))->a2), l1, a2, a3, a4));
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_tuple_type */
T1 T174f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_named_tuple_type */
T1 T172f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_named_tuple_type */
T1 T60f97(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_named_bit_type */
T1 T956f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6218T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_named_bit_type */
T1 T716f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6301T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_named_bit_type */
T1 T714f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6218T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6218T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_bit_type */
T1 T578f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T578f44(C, a1, a2, a3, a4));
	return R;
}

/* ET_BIT_N.same_named_bit_type */
T1 T577f42(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T577f49(C, a1, a2, a3, a4));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_named_bit_type */
T1 T565f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6218T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_named_bit_type */
T1 T557f44(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6218T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_bit_type */
T1 T312f38(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_bit_type */
T1 T174f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_named_bit_type */
T1 T172f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_named_bit_type */
T1 T60f109(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.reference_conforms_from_class_type */
T1 T956f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t2 = (T956f39(C, a3, a4));
			if (t2) {
				t3 = (T172x6184T0(a1, a4));
				t4 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6233T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.reference_conforms_from_class_type */
T1 T716f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6317T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.reference_conforms_from_class_type */
T1 T714f44(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6233T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6233T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.reference_conforms_from_class_type */
T1 T578f62(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.reference_conforms_from_class_type */
T1 T577f61(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.reference_conforms_from_class_type */
T1 T565f49(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t2 = (T565f28(C, a3, a4));
			if (t2) {
				t3 = (T172x6184T0(a1, a4));
				t4 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6233T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.reference_conforms_from_class_type */
T1 T557f47(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t2 = (T557f23(C, a3, a4));
			if (t2) {
				t3 = (T172x6184T0(a1, a4));
				t4 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6233T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.reference_conforms_from_class_type */
T1 T312f56(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		t2 = ((l1)==(t1));
		if (t2) {
			t3 = (T312f27(C));
			t2 = ((t3)==((T6)(GE_int32(0))));
		}
		if (t2) {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_conforms_from_class_type */
T1 T174f61(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T174*)(C))->a1)==(l1));
			if (t2) {
				t2 = (T172x6127(GE_void(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T174f12(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T174f12(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
						R = EIF_FALSE;
					} else {
						l3 = (T172x6119(GE_void(a1)));
						t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a80:((T56*)(a4))->a52));
						t2 = ((((T174*)(C))->a1)==(t1));
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a81:((T56*)(a4))->a48));
							t2 = ((((T174*)(C))->a1)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a83:((T56*)(a4))->a49));
							t2 = ((((T174*)(C))->a1)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a82:((T56*)(a4))->a50));
							t2 = ((((T174*)(C))->a1)==(t1));
						}
						if (t2) {
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, ((T174*)(C))->a2, a3, a2, a4):T173f9(l3, ((T174*)(C))->a2, a3, a2, a4)));
						} else {
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, ((T174*)(C))->a2, a3, a2, a4):T173f9(l3, ((T174*)(C))->a2, a3, a2, a4)));
						}
					}
				}
			} else {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((l1)==(t1));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a61:((T56*)(a4))->a53));
					T60f164(GE_void(l1), t1);
					l2 = (T60f57(GE_void(l1), C, a4));
					t2 = ((l2)!=(EIF_VOID));
					if (t2) {
						l3 = (T172x6119(GE_void(a1)));
						t2 = ((l3)!=(EIF_VOID));
						if (t2) {
							l2 = (T158x6278T0(GE_void(l2), l3));
						}
						R = (T158x6231T0T0T0T0(GE_void(l2), C, a3, a2, a4));
					}
				}
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.conforms_to_types */
T1 T173f9(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a3:((T425*)(a1))->a1));
		t1 = ((t2)!=(((T173*)(C))->a3));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a4:((T425*)(a1))->a2));
			l2 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t3 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
				t3 = (T177x6264(GE_void(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==560)?((T560*)(l3))->z2[l1]:((T709*)(l3))->z2[l1]));
				t4 = (T177x6264(GE_void(t4)));
				t1 = (T167x6226T0T0T0T0(GE_void(t3), t4, a2, a3, a4));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.conforms_to_types */
T1 T425f11(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	T0* t4;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t2 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a3:((T425*)(a1))->a1));
		t1 = ((t2)!=(((T425*)(C))->a1));
		if (t1) {
			R = EIF_FALSE;
		} else {
			R = EIF_TRUE;
			l3 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a4:((T425*)(a1))->a2));
			l2 = ((T6)((((T425*)(C))->a1)-((T6)(GE_int32(1)))));
			l1 = (T6)(GE_int32(0));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t3 = (((T560*)(GE_void(((T425*)(C))->a2)))->z2[l1]);
				t3 = (((((T0*)(GE_void(t3)))->id==557)?T557f5(t3):T565f9(t3)));
				t4 = (((((T0*)(GE_void(l3)))->id==560)?((T560*)(l3))->z2[l1]:((T709*)(l3))->z2[l1]));
				t4 = (T177x6264(GE_void(t4)));
				t1 = (((((T0*)(GE_void(t3)))->id==557)?T557f18(t3, t4, a2, a3, a4):T565f21(t3, t4, a2, a3, a4)));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.reference_conforms_from_class_type */
T1 T172f57(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T172*)(C))->a3)==(l1));
			if (t2) {
				t2 = (T172x6127(GE_void(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T172f24(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T172f24(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
						R = EIF_FALSE;
					} else {
						l3 = (T172x6119(GE_void(a1)));
						t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a80:((T56*)(a4))->a52));
						t2 = ((((T172*)(C))->a3)==(t1));
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a81:((T56*)(a4))->a48));
							t2 = ((((T172*)(C))->a3)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a83:((T56*)(a4))->a49));
							t2 = ((((T172*)(C))->a3)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a82:((T56*)(a4))->a50));
							t2 = ((((T172*)(C))->a3)==(t1));
						}
						if (t2) {
							t1 = (T172f5(C));
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, t1, a3, a2, a4):T173f9(l3, t1, a3, a2, a4)));
						} else {
							t1 = (T172f5(C));
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, t1, a3, a2, a4):T173f9(l3, t1, a3, a2, a4)));
						}
					}
				}
			} else {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((l1)==(t1));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a61:((T56*)(a4))->a53));
					T60f164(GE_void(l1), t1);
					l2 = (T60f57(GE_void(l1), C, a4));
					t2 = ((l2)!=(EIF_VOID));
					if (t2) {
						l3 = (T172x6119(GE_void(a1)));
						t2 = ((l3)!=(EIF_VOID));
						if (t2) {
							l2 = (T158x6278T0(GE_void(l2), l3));
						}
						R = (T158x6231T0T0T0T0(GE_void(l2), C, a3, a2, a4));
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.reference_conforms_from_class_type */
T1 T60f137(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T60*)(C))->a8)==(l1));
			if (t2) {
				t2 = (T172x6127(GE_void(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T60f72(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T60f72(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
						R = EIF_FALSE;
					} else {
						l3 = (T172x6119(GE_void(a1)));
						t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a80:((T56*)(a4))->a52));
						t2 = ((((T60*)(C))->a8)==(t1));
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a81:((T56*)(a4))->a48));
							t2 = ((((T60*)(C))->a8)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a83:((T56*)(a4))->a49));
							t2 = ((((T60*)(C))->a8)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a82:((T56*)(a4))->a50));
							t2 = ((((T60*)(C))->a8)==(t1));
						}
						if (t2) {
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, ((T60*)(C))->a11, a3, a2, a4):T173f9(l3, ((T60*)(C))->a11, a3, a2, a4)));
						} else {
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, ((T60*)(C))->a11, a3, a2, a4):T173f9(l3, ((T60*)(C))->a11, a3, a2, a4)));
						}
					}
				}
			} else {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((l1)==(t1));
				if (t2) {
					R = EIF_TRUE;
				} else {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a61:((T56*)(a4))->a53));
					T60f164(GE_void(l1), t1);
					l2 = (T60f57(GE_void(l1), C, a4));
					t2 = ((l2)!=(EIF_VOID));
					if (t2) {
						l3 = (T172x6119(GE_void(a1)));
						t2 = ((l3)!=(EIF_VOID));
						if (t2) {
							l2 = (T158x6278T0(GE_void(l2), l3));
						}
						R = (T158x6231T0T0T0T0(GE_void(l2), C, a3, a2, a4));
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_base_type */
T1 T956f44(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T60f149(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6211T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS.same_base_formal_parameter_type */
T1 T60f149(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_CURRENT.same_base_type */
T1 T716f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T168x6300T0T0T0(GE_void(a3), a1, a2, a4));
	}
	return R;
}

/* ET_LIKE_FEATURE.same_base_type */
T1 T714f45(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T714f36(C));
			if (t1) {
				l1 = (T168x6282T0(GE_void(a3), a4));
				if (((T714*)(C))->a4) {
					l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
				} else {
					l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				}
				t1 = ((l2)!=(EIF_VOID));
				if (t1) {
					l4 = (T200x12627(GE_void(l2)));
					l5 = (T714f38(C));
					t1 = ((l4)==(EIF_VOID));
					if (!(t1)) {
						t2 = (((T235*)(GE_void(l4)))->a3);
						t1 = (T6f1(&l5, t2));
					}
					if (t1) {
						R = EIF_FALSE;
					} else {
						t3 = (T235f11(GE_void(l4), l5));
						t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
						R = (T167x6211T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
					}
				} else {
					R = EIF_FALSE;
				}
			} else {
				l1 = (T168x6282T0(GE_void(a3), a4));
				l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				t1 = ((l3)!=(EIF_VOID));
				if (t1) {
					t3 = (T160x12626(GE_void(l3)));
					R = (T167x6211T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				} else {
					R = EIF_FALSE;
				}
			}
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_base_type */
T1 T565f56(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T60f149(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6211T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_base_type */
T1 T557f54(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T60f149(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6211T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.base_type_actual_count */
T6 T956f47(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = (T158x6126(GE_void(l6)));
				} else {
					R = (T6)(GE_int32(0));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			if ((l1)==EIF_VOID) {
				l6 = EIF_VOID;
			} else {
				switch (((T0*)(l1))->id) {
				case 557:
				case 565:
				case 956:
					l6 = EIF_VOID;
					break;
				default:
					l6 = l1;
				}
			}
			t2 = ((l6)==(EIF_VOID));
			if (t2) {
				R = (T6)(GE_int32(0));
			} else {
				R = (T158x6126(GE_void(l6)));
			}
		}
	} else {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* ET_LIKE_CURRENT.base_type_actual_count */
T6 T716f48(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T168x6288T0(GE_void(a1), a2));
	return R;
}

/* ET_LIKE_FEATURE.base_type_actual_count */
T6 T714f52(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (T6)(GE_int32(0));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6196T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			l1 = (T168x6282T0(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6196T0T0(GE_void(t3), a1, a2));
			} else {
				R = (T6)(GE_int32(0));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.base_type_actual_count */
T6 T578f48(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T578f52(C));
	return R;
}

/* ET_BIT_N.base_type_actual_count */
T6 T577f46(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T577f51(C));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.base_type_actual_count */
T6 T565f60(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = (T158x6126(GE_void(l6)));
				} else {
					R = (T6)(GE_int32(0));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			if ((l1)==EIF_VOID) {
				l6 = EIF_VOID;
			} else {
				switch (((T0*)(l1))->id) {
				case 557:
				case 565:
				case 956:
					l6 = EIF_VOID;
					break;
				default:
					l6 = l1;
				}
			}
			t2 = ((l6)==(EIF_VOID));
			if (t2) {
				R = (T6)(GE_int32(0));
			} else {
				R = (T158x6126(GE_void(l6)));
			}
		}
	} else {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.base_type_actual_count */
T6 T557f58(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = (T158x6126(GE_void(l6)));
				} else {
					R = (T6)(GE_int32(0));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			if ((l1)==EIF_VOID) {
				l6 = EIF_VOID;
			} else {
				switch (((T0*)(l1))->id) {
				case 557:
				case 565:
				case 956:
					l6 = EIF_VOID;
					break;
				default:
					l6 = l1;
				}
			}
			t2 = ((l6)==(EIF_VOID));
			if (t2) {
				R = (T6)(GE_int32(0));
			} else {
				R = (T158x6126(GE_void(l6)));
			}
		}
	} else {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* ET_TUPLE_TYPE.base_type_actual_count */
T6 T312f63(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T312f27(C));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_actual_count */
T6 T174f67(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T174f69(C));
	return R;
}

/* ET_CLASS_TYPE.base_type_actual_count */
T6 T172f63(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T172f65(C));
	return R;
}

/* ET_CLASS.base_type_actual_count */
T6 T60f135(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T60f104(C));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.base_type_actual */
T0* T956f48(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a2), a3));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a2), ((T956*)(C))->a2, a3));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a2)));
			l3 = (T158x6184T0(GE_void(t3), a3));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t3 = (T168x6280(GE_void(a2)));
					R = (T158x6188T6T0T0(GE_void(l6), a1, t3, a3));
				} else {
					R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
				}
			} else {
				R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
			}
		} else {
			t3 = (T168x6280(GE_void(a2)));
			R = (T959x6188T6T0T0(GE_void(l1), a1, t3, a3));
		}
	} else {
		R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
	}
	return R;
}

/* ET_LIKE_CURRENT.base_type_actual */
T0* T716f49(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	R = (T168x6284T6T0(GE_void(a2), a1, a3));
	return R;
}

/* ET_LIKE_FEATURE.base_type_actual */
T0* T714f53(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a2), a3));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6188T6T0T0(GE_void(t3), a1, a2, a3));
				}
			} else {
				R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
			}
		} else {
			l1 = (T168x6282T0(GE_void(a2), a3));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6188T6T0T0(GE_void(t3), a1, a2, a3));
			} else {
				R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.base_type_actual */
T0* T578f49(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T578f38(C));
	l1 = ((GE_void(t1), a1, (T0*)0));
	t2 = ((a2)==(C));
	if (t2) {
		R = l1;
	}
	t2 = ((R)==(EIF_VOID));
	if (t2) {
		R = ((GE_void(l1), a2, a3, (T0*)0));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.base_type_actual */
T0* T565f57(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a2), a3));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a2), ((T565*)(C))->a6, a3));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a2)));
			l3 = (T158x6184T0(GE_void(t3), a3));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t3 = (T168x6280(GE_void(a2)));
					R = (T158x6188T6T0T0(GE_void(l6), a1, t3, a3));
				} else {
					R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
				}
			} else {
				R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
			}
		} else {
			t3 = (T168x6280(GE_void(a2)));
			R = (T959x6188T6T0T0(GE_void(l1), a1, t3, a3));
		}
	} else {
		R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.base_type_actual */
T0* T557f55(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a2), a3));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a2), ((T557*)(C))->a2, a3));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a2)));
			l3 = (T158x6184T0(GE_void(t3), a3));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t3 = (T168x6280(GE_void(a2)));
					R = (T158x6188T6T0T0(GE_void(l6), a1, t3, a3));
				} else {
					R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
				}
			} else {
				R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
			}
		} else {
			t3 = (T168x6280(GE_void(a2)));
			R = (T959x6188T6T0T0(GE_void(l1), a1, t3, a3));
		}
	} else {
		R = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a5:((T56*)(a3))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.reference_conforms_from_tuple_type */
T1 T956f49(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6235T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.reference_conforms_from_tuple_type */
T1 T716f50(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6319T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.reference_conforms_from_tuple_type */
T1 T714f54(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6235T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6235T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.reference_conforms_from_tuple_type */
T1 T578f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T578f62(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T578f62(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_BIT_N.reference_conforms_from_tuple_type */
T1 T577f72(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T577f61(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T577f61(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.reference_conforms_from_tuple_type */
T1 T565f52(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6235T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.reference_conforms_from_tuple_type */
T1 T557f50(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6235T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.reference_conforms_from_tuple_type */
T1 T312f66(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T312*)(C))->a2;
		l2 = (((T312*)(a1))->a2);
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = ((l2)==(EIF_VOID));
			if (t1) {
				R = (T173f10(GE_void(l1)));
			} else {
				R = (T173f19(GE_void(l2), l1, a3, a2, a4));
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.tuple_conforms_to_types */
T1 T173f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l2 = (((T173*)(GE_void(a1)))->a3);
		t1 = (T6f13(&l2, ((T173*)(C))->a3));
		if (t1) {
			R = EIF_TRUE;
			l1 = (T6)(GE_int32(1));
			t1 = (T6f1(&l1, l2));
			while (!(t1)) {
				t2 = (T173f7(C, l1));
				t3 = (T173f7(GE_void(a1), l1));
				t1 = (T167x6226T0T0T0T0(GE_void(t2), t3, a2, a3, a4));
				t1 = ((T1)(!(t1)));
				if (t1) {
					R = EIF_FALSE;
					l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
				}
				t1 = (T6f1(&l1, l2));
			}
		} else {
			R = EIF_FALSE;
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_conforms_from_tuple_type */
T1 T174f71(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T174f61(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T174f61(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS_TYPE.reference_conforms_from_tuple_type */
T1 T172f71(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T172f57(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T172f57(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS.reference_conforms_from_tuple_type */
T1 T60f139(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T60f137(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T60f137(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.reference_conforms_from_bit_type */
T1 T956f51(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6232T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.reference_conforms_from_bit_type */
T1 T716f52(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6316T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.reference_conforms_from_bit_type */
T1 T714f56(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6232T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6232T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.reference_conforms_from_bit_type */
T1 T578f75(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		T578f103(C);
		t1 = (T578f45(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (((T0*)(a1))->id==577) {
				T577f97(a1);
			} else {
				T578f103(a1);
			}
			t1 = (((((T0*)(a1))->id==577)?T577f5(a1):T578f45(a1)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (((((T0*)(a1))->id==577)?((T577*)(a1))->a2:((T578*)(a1))->a3));
				R = (T6f13(&t2, ((T578*)(C))->a3));
			}
		}
	}
	return R;
}

/* ET_BIT_N.reference_conforms_from_bit_type */
T1 T577f74(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		T577f97(C);
		t1 = (T577f5(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (((T0*)(a1))->id==577) {
				T577f97(a1);
			} else {
				T578f103(a1);
			}
			t1 = (((((T0*)(a1))->id==577)?T577f5(a1):T578f45(a1)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (((((T0*)(a1))->id==577)?((T577*)(a1))->a2:((T578*)(a1))->a3));
				R = (T6f13(&t2, ((T577*)(C))->a2));
			}
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.reference_conforms_from_bit_type */
T1 T565f55(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6232T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.reference_conforms_from_bit_type */
T1 T557f53(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6232T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.reference_conforms_from_bit_type */
T1 T312f68(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T312f56(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T312f56(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_conforms_from_bit_type */
T1 T174f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T174f61(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T174f61(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS_TYPE.reference_conforms_from_bit_type */
T1 T172f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T172f57(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T172f57(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS.reference_conforms_from_bit_type */
T1 T60f142(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T60f137(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T60f137(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.reference_conforms_from_formal_parameter_type */
T1 T956f50(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			l4 = (T956x22307(GE_void(a1)));
			t2 = ((l3)==(l4));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t3 = (T168x6280(GE_void(a3)));
				l5 = (T158x6184T0(GE_void(t3), a4));
				l6 = (((T60*)(GE_void(l5)))->a11);
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t1 = (((T425*)(GE_void(l6)))->a1);
					t2 = (T6f13(&l4, t1));
				}
				if (t2) {
					l7 = (T425f7(GE_void(l6), l4));
					l8 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						l9 = (((((T0*)(GE_void(l7)))->id==557)?T557f7(l7):((T565*)(l7))->a7));
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							t3 = (T168x6280(GE_void(a3)));
							R = (T167x6231T0T0T0T0(GE_void(l8), C, t3, a2, a4));
						} else {
							if ((l8)==EIF_VOID) {
								l2 = EIF_VOID;
							} else {
								switch (((T0*)(l8))->id) {
								case 956:
									l2 = l8;
									break;
								default:
									l2 = EIF_VOID;
								}
							}
							t2 = ((l2)!=(EIF_VOID));
							if (t2) {
								t1 = (((T425*)(GE_void(l6)))->a1);
								l10 = T901c5((T6)(GE_int32(1)), t1);
								T901f6(GE_void(l10), EIF_TRUE, l4);
								l4 = (T956x22307(GE_void(l2)));
								R = ((l3)==(l4));
								if (!(R)) {
									t2 = (T901f4(GE_void(l10), l4));
								} else {
									t2 = EIF_TRUE;
								}
								while (!(t2)) {
									T901f6(GE_void(l10), EIF_TRUE, l4);
									t1 = (((T425*)(GE_void(l6)))->a1);
									t2 = (T6f13(&l4, t1));
									if (t2) {
										l7 = (T425f7(GE_void(l6), l4));
										t3 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
										if ((t3)==EIF_VOID) {
											l2 = EIF_VOID;
										} else {
											switch (((T0*)(t3))->id) {
											case 956:
												l2 = t3;
												break;
											default:
												l2 = EIF_VOID;
											}
										}
										t2 = ((l2)!=(EIF_VOID));
										if (t2) {
											l4 = (T956x22307(GE_void(l2)));
											R = ((l3)==(l4));
										} else {
											R = EIF_FALSE;
										}
									} else {
										R = EIF_FALSE;
									}
									if (!(R)) {
										t2 = (T901f4(GE_void(l10), l4));
									} else {
										t2 = EIF_TRUE;
									}
								}
							} else {
								R = EIF_FALSE;
							}
						}
					}
				} else {
					R = EIF_FALSE;
				}
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6234T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.reference_conforms_from_formal_parameter_type */
T1 T716f51(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6318T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.reference_conforms_from_formal_parameter_type */
T1 T714f55(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6234T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6234T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.reference_conforms_from_formal_parameter_type */
T1 T578f74(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T956x22307(GE_void(a1)));
	t1 = (T168x6282T0(GE_void(a2), a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			R = (T578f62(C, l6, a2, a3, a4));
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				R = (T158x6231T0T0T0T0(GE_void(l5), C, a3, a2, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_N.reference_conforms_from_formal_parameter_type */
T1 T577f73(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T956x22307(GE_void(a1)));
	t1 = (T168x6282T0(GE_void(a2), a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			R = (T577f61(C, l6, a2, a3, a4));
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				R = (T158x6231T0T0T0T0(GE_void(l5), C, a3, a2, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.reference_conforms_from_formal_parameter_type */
T1 T565f53(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			l4 = (T956x22307(GE_void(a1)));
			t2 = ((l3)==(l4));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t3 = (T168x6280(GE_void(a3)));
				l5 = (T158x6184T0(GE_void(t3), a4));
				l6 = (((T60*)(GE_void(l5)))->a11);
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t1 = (((T425*)(GE_void(l6)))->a1);
					t2 = (T6f13(&l4, t1));
				}
				if (t2) {
					l7 = (T425f7(GE_void(l6), l4));
					l8 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						l9 = (((((T0*)(GE_void(l7)))->id==557)?T557f7(l7):((T565*)(l7))->a7));
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							t3 = (T168x6280(GE_void(a3)));
							R = (T167x6231T0T0T0T0(GE_void(l8), C, t3, a2, a4));
						} else {
							if ((l8)==EIF_VOID) {
								l2 = EIF_VOID;
							} else {
								switch (((T0*)(l8))->id) {
								case 956:
									l2 = l8;
									break;
								default:
									l2 = EIF_VOID;
								}
							}
							t2 = ((l2)!=(EIF_VOID));
							if (t2) {
								t1 = (((T425*)(GE_void(l6)))->a1);
								l10 = T901c5((T6)(GE_int32(1)), t1);
								T901f6(GE_void(l10), EIF_TRUE, l4);
								l4 = (T956x22307(GE_void(l2)));
								R = ((l3)==(l4));
								if (!(R)) {
									t2 = (T901f4(GE_void(l10), l4));
								} else {
									t2 = EIF_TRUE;
								}
								while (!(t2)) {
									T901f6(GE_void(l10), EIF_TRUE, l4);
									t1 = (((T425*)(GE_void(l6)))->a1);
									t2 = (T6f13(&l4, t1));
									if (t2) {
										l7 = (T425f7(GE_void(l6), l4));
										t3 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
										if ((t3)==EIF_VOID) {
											l2 = EIF_VOID;
										} else {
											switch (((T0*)(t3))->id) {
											case 956:
												l2 = t3;
												break;
											default:
												l2 = EIF_VOID;
											}
										}
										t2 = ((l2)!=(EIF_VOID));
										if (t2) {
											l4 = (T956x22307(GE_void(l2)));
											R = ((l3)==(l4));
										} else {
											R = EIF_FALSE;
										}
									} else {
										R = EIF_FALSE;
									}
									if (!(R)) {
										t2 = (T901f4(GE_void(l10), l4));
									} else {
										t2 = EIF_TRUE;
									}
								}
							} else {
								R = EIF_FALSE;
							}
						}
					}
				} else {
					R = EIF_FALSE;
				}
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6234T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.reference_conforms_from_formal_parameter_type */
T1 T557f52(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			l4 = (T956x22307(GE_void(a1)));
			t2 = ((l3)==(l4));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t3 = (T168x6280(GE_void(a3)));
				l5 = (T158x6184T0(GE_void(t3), a4));
				l6 = (((T60*)(GE_void(l5)))->a11);
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t1 = (((T425*)(GE_void(l6)))->a1);
					t2 = (T6f13(&l4, t1));
				}
				if (t2) {
					l7 = (T425f7(GE_void(l6), l4));
					l8 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						l9 = (((((T0*)(GE_void(l7)))->id==557)?T557f7(l7):((T565*)(l7))->a7));
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							t3 = (T168x6280(GE_void(a3)));
							R = (T167x6231T0T0T0T0(GE_void(l8), C, t3, a2, a4));
						} else {
							if ((l8)==EIF_VOID) {
								l2 = EIF_VOID;
							} else {
								switch (((T0*)(l8))->id) {
								case 956:
									l2 = l8;
									break;
								default:
									l2 = EIF_VOID;
								}
							}
							t2 = ((l2)!=(EIF_VOID));
							if (t2) {
								t1 = (((T425*)(GE_void(l6)))->a1);
								l10 = T901c5((T6)(GE_int32(1)), t1);
								T901f6(GE_void(l10), EIF_TRUE, l4);
								l4 = (T956x22307(GE_void(l2)));
								R = ((l3)==(l4));
								if (!(R)) {
									t2 = (T901f4(GE_void(l10), l4));
								} else {
									t2 = EIF_TRUE;
								}
								while (!(t2)) {
									T901f6(GE_void(l10), EIF_TRUE, l4);
									t1 = (((T425*)(GE_void(l6)))->a1);
									t2 = (T6f13(&l4, t1));
									if (t2) {
										l7 = (T425f7(GE_void(l6), l4));
										t3 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
										if ((t3)==EIF_VOID) {
											l2 = EIF_VOID;
										} else {
											switch (((T0*)(t3))->id) {
											case 956:
												l2 = t3;
												break;
											default:
												l2 = EIF_VOID;
											}
										}
										t2 = ((l2)!=(EIF_VOID));
										if (t2) {
											l4 = (T956x22307(GE_void(l2)));
											R = ((l3)==(l4));
										} else {
											R = EIF_FALSE;
										}
									} else {
										R = EIF_FALSE;
									}
									if (!(R)) {
										t2 = (T901f4(GE_void(l10), l4));
									} else {
										t2 = EIF_TRUE;
									}
								}
							} else {
								R = EIF_FALSE;
							}
						}
					}
				} else {
					R = EIF_FALSE;
				}
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6234T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.reference_conforms_from_formal_parameter_type */
T1 T312f67(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T956x22307(GE_void(a1)));
	t1 = (T168x6282T0(GE_void(a2), a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			R = (T312f56(C, l6, a2, a3, a4));
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				R = (T158x6231T0T0T0T0(GE_void(l5), C, a3, a2, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_conforms_from_formal_parameter_type */
T1 T174f72(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T956x22307(GE_void(a1)));
	t1 = (T168x6282T0(GE_void(a2), a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			R = (T174f61(C, l6, a2, a3, a4));
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				R = (T158x6231T0T0T0T0(GE_void(l5), C, a3, a2, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.reference_conforms_from_formal_parameter_type */
T1 T172f72(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T956x22307(GE_void(a1)));
	t1 = (T168x6282T0(GE_void(a2), a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			R = (T172f57(C, l6, a2, a3, a4));
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				R = (T158x6231T0T0T0T0(GE_void(l5), C, a3, a2, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CLASS.reference_conforms_from_formal_parameter_type */
T1 T60f141(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T956x22307(GE_void(a1)));
	t1 = (T168x6282T0(GE_void(a2), a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			R = (T60f137(C, l6, a2, a3, a4));
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				R = (T158x6231T0T0T0T0(GE_void(l5), C, a3, a2, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.shallow_named_type */
T0* T956f43(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T158x6126(GE_void(a1)));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		t3 = (T158x6119(GE_void(a1)));
		t3 = (((((T0*)(GE_void(t3)))->id==425)?T425f10(t3, ((T956*)(C))->a2):T173f7(t3, ((T956*)(C))->a2)));
		if ((t3)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(t3))->id) {
			case 716:
			case 714:
				R = EIF_VOID;
				break;
			default:
				R = t3;
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_LIKE_CURRENT.shallow_named_type */
T0* T716f43(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T716f14(C, a1, a2));
	return R;
}

/* ET_LIKE_FEATURE.shallow_named_type */
T0* T714f42(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T158x6184T0(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6192T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			l1 = (T158x6184T0(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6192T0T0(GE_void(t3), a1, a2));
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.shallow_named_type */
T0* T578f61(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T578f26(C, a1, a2));
	return R;
}

/* ET_BIT_N.shallow_named_type */
T0* T577f60(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T577f26(C, a1, a2));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.shallow_named_type */
T0* T565f50(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T158x6126(GE_void(a1)));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		t3 = (T158x6119(GE_void(a1)));
		t3 = (((((T0*)(GE_void(t3)))->id==425)?T425f10(t3, ((T565*)(C))->a6):T173f7(t3, ((T565*)(C))->a6)));
		if ((t3)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(t3))->id) {
			case 716:
			case 714:
				R = EIF_VOID;
				break;
			default:
				R = t3;
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.shallow_named_type */
T0* T557f48(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T158x6126(GE_void(a1)));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		t3 = (T158x6119(GE_void(a1)));
		t3 = (((((T0*)(GE_void(t3)))->id==425)?T425f10(t3, ((T557*)(C))->a2):T173f7(t3, ((T557*)(C))->a2)));
		if ((t3)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(t3))->id) {
			case 716:
			case 714:
				R = EIF_VOID;
				break;
			default:
				R = t3;
			}
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_TUPLE_TYPE.shallow_named_type */
T0* T312f49(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T312f18(C, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.shallow_named_type */
T0* T174f59(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T174f29(C, a1, a2));
	return R;
}

/* ET_CLASS_TYPE.shallow_named_type */
T0* T172f53(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T172f15(C, a1, a2));
	return R;
}

/* ET_CLASS.shallow_named_type */
T0* T60f133(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T60f85(C, a1, a2));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.is_like_current */
T1 T956f46(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.is_like_current */
T1 T714f51(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.is_like_current */
T1 T578f72(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.is_like_current */
T1 T577f71(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.is_like_current */
T1 T565f51(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER.is_like_current */
T1 T557f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.is_like_current */
T1 T312f62(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_like_current */
T1 T174f70(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.is_like_current */
T1 T172f70(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.is_like_current */
T1 T60f138(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.named_type */
T0* T956f35(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		R = (T168x6284T6T0(GE_void(a1), ((T956*)(C))->a2, a2));
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_LIKE_CURRENT.named_type */
T0* T716f36(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T168x6287T0(GE_void(a1), a2));
	return R;
}

/* ET_LIKE_FEATURE.named_type */
T0* T714f33(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6191T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			l1 = (T168x6282T0(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6191T0T0(GE_void(t3), a1, a2));
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.named_type */
T0* T578f35(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T578f14(C, a1, a2));
	return R;
}

/* ET_BIT_N.named_type */
T0* T577f34(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T577f16(C, a1, a2));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.named_type */
T0* T565f36(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		R = (T168x6284T6T0(GE_void(a1), ((T565*)(C))->a6, a2));
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.named_type */
T0* T557f34(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T1 t2;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		R = (T168x6284T6T0(GE_void(a1), ((T557*)(C))->a2, a2));
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_TUPLE_TYPE.named_type */
T0* T312f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T312f10(C, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.named_type */
T0* T174f30(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T174f9(C, a1, a2));
	return R;
}

/* ET_CLASS_TYPE.named_type */
T0* T172f26(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T172f9(C, a1, a2));
	return R;
}

/* ET_CLASS.named_type */
T0* T60f90(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T60f77(C, a1, a2));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.is_type_expanded */
T1 T956f42(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			t3 = (T168x6280(GE_void(a1)));
			t3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(t3)))->a11);
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l3, t1));
			}
			if (t2) {
				t3 = (T425f7(GE_void(l4), l3));
				R = (((((T0*)(GE_void(t3)))->id==557)?T557f36(t3):T565f38(t3)));
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6200T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.is_type_expanded */
T1 T716f42(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T168x6282T0(GE_void(a1), a2));
	R = (T60f63(GE_void(t1)));
	return R;
}

/* ET_LIKE_FEATURE.is_type_expanded */
T1 T714f41(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6200T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6200T0T0(GE_void(t3), a1, a2));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.is_type_expanded */
T1 T578f51(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_BIT_N.is_type_expanded */
T1 T577f50(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.is_type_expanded */
T1 T565f39(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			t3 = (T168x6280(GE_void(a1)));
			t3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(t3)))->a11);
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l3, t1));
			}
			if (t2) {
				t3 = (T425f7(GE_void(l4), l3));
				R = (((((T0*)(GE_void(t3)))->id==557)?T557f36(t3):T565f38(t3)));
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6200T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.is_type_expanded */
T1 T557f37(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			t3 = (T168x6280(GE_void(a1)));
			t3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(t3)))->a11);
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l3, t1));
			}
			if (t2) {
				t3 = (T425f7(GE_void(l4), l3));
				R = (((((T0*)(GE_void(t3)))->id==557)?T557f36(t3):T565f38(t3)));
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6200T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.is_type_expanded */
T1 T312f48(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_expanded */
T1 T174f58(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T174f6(C));
	return R;
}

/* ET_CLASS_TYPE.is_type_expanded */
T1 T172f52(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T172f22(C));
	return R;
}

/* ET_CLASS.is_type_expanded */
T1 T60f132(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (T60f63(C));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.resolved_formal_parameters */
T0* T956f16(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	R = C;
	t1 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a3:((T425*)(a1))->a1));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (((((T0*)(GE_void(a1)))->id==173)?T173f7(a1, ((T956*)(C))->a2):T425f10(a1, ((T956*)(C))->a2)));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 956:
			case 557:
			case 565:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)==(EIF_VOID));
		if (!(t2)) {
			t1 = (T956x22307(GE_void(l2)));
			t2 = ((t1)!=(((T956*)(C))->a2));
		}
		if (t2) {
			R = l1;
		}
	}
	return R;
}

/* ET_LIKE_CURRENT.resolved_formal_parameters */
T0* T716f16(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_LIKE_FEATURE.resolved_formal_parameters */
T0* T714f26(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.resolved_formal_parameters */
T0* T578f28(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.resolved_formal_parameters */
T0* T577f28(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.resolved_formal_parameters */
T0* T565f34(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	R = C;
	t1 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a3:((T425*)(a1))->a1));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (((((T0*)(GE_void(a1)))->id==173)?T173f7(a1, ((T565*)(C))->a6):T425f10(a1, ((T565*)(C))->a6)));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 956:
			case 557:
			case 565:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)==(EIF_VOID));
		if (!(t2)) {
			t1 = (T956x22307(GE_void(l2)));
			t2 = ((t1)!=(((T565*)(C))->a6));
		}
		if (t2) {
			R = l1;
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER.resolved_formal_parameters */
T0* T557f32(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	R = C;
	t1 = (((((T0*)(GE_void(a1)))->id==173)?((T173*)(a1))->a3:((T425*)(a1))->a1));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (((((T0*)(GE_void(a1)))->id==173)?T173f7(a1, ((T557*)(C))->a2):T425f10(a1, ((T557*)(C))->a2)));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 956:
			case 557:
			case 565:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)==(EIF_VOID));
		if (!(t2)) {
			t1 = (T956x22307(GE_void(l2)));
			t2 = ((t1)!=(((T557*)(C))->a2));
		}
		if (t2) {
			R = l1;
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.resolved_formal_parameters */
T0* T312f20(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	R = C;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = (T173f12(GE_void(l1), a1));
		t1 = ((l2)!=(l1));
		if (t1) {
			R = T312c89(l2);
			T312f90(GE_void(R), ((T312*)(C))->a1);
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.resolved_formal_parameters */
T0* T173f12(T0* C, T0* a1)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T1 t1;
	T0* t2;
	R = C;
	l3 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l3));
	while (!(t1)) {
		l4 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
		l6 = (T177x6264(GE_void(l4)));
		t1 = ((l6)!=(l7));
		if (t1) {
			l8 = (T167x6278T0(GE_void(l6), a1));
			l7 = l6;
		}
		l5 = (T177x6267T0(GE_void(l4), l8));
		t1 = ((R)!=(C));
		if (t1) {
			T173f24(GE_void(R), l5);
		} else {
			t1 = ((l4)!=(l5));
			if (t1) {
				R = T173c23(((T173*)(C))->a3);
				T173f26(GE_void(R), ((T173*)(C))->a1);
				T173f27(GE_void(R), ((T173*)(C))->a2);
				l2 = (T6)(GE_int32(0));
				t1 = (T6f12(&l2, l1));
				while (!(t1)) {
					t2 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l2]);
					T173f24(GE_void(R), t2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					t1 = (T6f12(&l2, l1));
				}
				T173f24(GE_void(R), l5);
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = (T6f1(&l1, l3));
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.set_right_bracket */
void T173f27(T0* C, T0* a1)
{
	((T173*)(C))->a2 = a1;
}

/* ET_FORMAL_PARAMETER_TYPE.reference_conforms_to_type */
T1 T956f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6234T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6231T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.reference_conforms_to_type */
T1 T716f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T168x6315T0T0T0(GE_void(a3), a1, a2, a4));
	}
	return R;
}

/* ET_LIKE_FEATURE.reference_conforms_to_type */
T1 T714f40(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T714f36(C));
			if (t1) {
				l1 = (T168x6282T0(GE_void(a3), a4));
				if (((T714*)(C))->a4) {
					l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
				} else {
					l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				}
				t1 = ((l2)!=(EIF_VOID));
				if (t1) {
					l4 = (T200x12627(GE_void(l2)));
					l5 = (T714f38(C));
					t1 = ((l4)==(EIF_VOID));
					if (!(t1)) {
						t2 = (((T235*)(GE_void(l4)))->a3);
						t1 = (T6f1(&l5, t2));
					}
					if (t1) {
						R = EIF_FALSE;
					} else {
						t3 = (T235f11(GE_void(l4), l5));
						t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
						R = (T167x6231T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
					}
				} else {
					R = EIF_FALSE;
				}
			} else {
				l1 = (T168x6282T0(GE_void(a3), a4));
				l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				t1 = ((l3)!=(EIF_VOID));
				if (t1) {
					t3 = (T160x12626(GE_void(l3)));
					R = (T167x6231T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				} else {
					R = EIF_FALSE;
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.reference_conforms_to_type */
T1 T578f60(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6232T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.reference_conforms_to_type */
T1 T565f37(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6234T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6231T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.reference_conforms_to_type */
T1 T557f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6234T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6231T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.is_type_reference */
T1 T956f39(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			t3 = (T168x6280(GE_void(a1)));
			t3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(t3)))->a11);
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l3, t1));
			}
			if (t2) {
				t3 = (T425f7(GE_void(l4), l3));
				R = (((((T0*)(GE_void(t3)))->id==557)?T557f38(t3):T565f40(t3)));
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6201T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.is_type_reference */
T1 T716f44(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T716f42(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_LIKE_FEATURE.is_type_reference */
T1 T714f43(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T714f41(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_BIT_FEATURE.is_type_reference */
T1 T578f47(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T578f51(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_BIT_N.is_type_reference */
T1 T577f45(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T577f50(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.is_type_reference */
T1 T565f28(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			t3 = (T168x6280(GE_void(a1)));
			t3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(t3)))->a11);
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l3, t1));
			}
			if (t2) {
				t3 = (T425f7(GE_void(l4), l3));
				R = (((((T0*)(GE_void(t3)))->id==557)?T557f38(t3):T565f40(t3)));
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6201T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.is_type_reference */
T1 T557f23(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			t3 = (T168x6280(GE_void(a1)));
			t3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(t3)))->a11);
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l3, t1));
			}
			if (t2) {
				t3 = (T425f7(GE_void(l4), l3));
				R = (((((T0*)(GE_void(t3)))->id==557)?T557f38(t3):T565f40(t3)));
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6201T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.is_type_reference */
T1 T312f50(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T312f48(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_type_reference */
T1 T174f60(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T174f58(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CLASS_TYPE.is_type_reference */
T1 T172f54(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T172f52(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_CLASS.is_type_reference */
T1 T60f134(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T1 t1;
	t1 = (T60f132(C, a1, a2));
	R = ((T1)(!(t1)));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.conforms_to_type */
T1 T956f11(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6229T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6226T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.conforms_to_type */
T1 T716f13(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T168x6309T0T0T0(GE_void(a3), a1, a2, a4));
	}
	return R;
}

/* ET_LIKE_FEATURE.conforms_to_type */
T1 T714f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T714f36(C));
			if (t1) {
				l1 = (T168x6282T0(GE_void(a3), a4));
				if (((T714*)(C))->a4) {
					l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
				} else {
					l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				}
				t1 = ((l2)!=(EIF_VOID));
				if (t1) {
					l4 = (T200x12627(GE_void(l2)));
					l5 = (T714f38(C));
					t1 = ((l4)==(EIF_VOID));
					if (!(t1)) {
						t2 = (((T235*)(GE_void(l4)))->a3);
						t1 = (T6f1(&l5, t2));
					}
					if (t1) {
						R = EIF_FALSE;
					} else {
						t3 = (T235f11(GE_void(l4), l5));
						t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
						R = (T167x6226T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
					}
				} else {
					R = EIF_FALSE;
				}
			} else {
				l1 = (T168x6282T0(GE_void(a3), a4));
				l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				t1 = ((l3)!=(EIF_VOID));
				if (t1) {
					t3 = (T160x12626(GE_void(l3)));
					R = (T167x6226T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				} else {
					R = EIF_FALSE;
				}
			}
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.conforms_to_type */
T1 T565f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6229T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6226T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.conforms_to_type */
T1 T557f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6229T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6226T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.conforms_from_class_type */
T1 T956f13(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t2 = (T956f39(C, a3, a4));
			if (t2) {
				t3 = (T172x6184T0(a1, a4));
				t4 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6228T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.conforms_from_class_type */
T1 T716f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6312T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.conforms_from_class_type */
T1 T714f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6228T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6228T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_from_class_type */
T1 T578f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.conforms_from_class_type */
T1 T577f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.conforms_from_class_type */
T1 T565f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t2 = (T565f28(C, a3, a4));
			if (t2) {
				t3 = (T172x6184T0(a1, a4));
				t4 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6228T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.conforms_from_class_type */
T1 T557f16(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t2 = (T557f23(C, a3, a4));
			if (t2) {
				t3 = (T172x6184T0(a1, a4));
				t4 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = EIF_FALSE;
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6228T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_class_type */
T1 T312f16(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		t2 = ((l1)==(t1));
		if (t2) {
			t3 = (T312f27(C));
			t2 = ((t3)==((T6)(GE_int32(0))));
		}
		if (t2) {
			R = EIF_TRUE;
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_class_type */
T1 T174f11(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T174*)(C))->a1)==(l1));
			if (t2) {
				t2 = (T172x6127(GE_void(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T174f12(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T174f12(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
						R = EIF_FALSE;
					} else {
						l3 = (T172x6119(GE_void(a1)));
						t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a80:((T56*)(a4))->a52));
						t2 = ((((T174*)(C))->a1)==(t1));
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a81:((T56*)(a4))->a48));
							t2 = ((((T174*)(C))->a1)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a83:((T56*)(a4))->a49));
							t2 = ((((T174*)(C))->a1)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a82:((T56*)(a4))->a50));
							t2 = ((((T174*)(C))->a1)==(t1));
						}
						if (t2) {
							R = (((((T0*)(GE_void(l3)))->id==173)?T173f9(l3, ((T174*)(C))->a2, a3, a2, a4):T425f11(l3, ((T174*)(C))->a2, a3, a2, a4)));
						} else {
							R = (((((T0*)(GE_void(l3)))->id==173)?T173f9(l3, ((T174*)(C))->a2, a3, a2, a4):T425f11(l3, ((T174*)(C))->a2, a3, a2, a4)));
						}
					}
				}
			} else {
				t2 = (T174f6(C));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
					t2 = ((l1)==(t1));
					if (t2) {
						R = EIF_TRUE;
					} else {
						t2 = (T172x6130(GE_void(a1)));
						if (t2) {
							t3 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t3) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T174f13(C));
								t2 = (T63f14(GE_void(t1), t4));
							} else {
								t2 = EIF_FALSE;
							}
						}
						if (t2) {
							R = EIF_FALSE;
						} else {
							t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t2) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T174f14(C));
								t2 = (T63f14(GE_void(t1), t4));
							}
							if (t2) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a9:((T56*)(a4))->a9));
								t3 = ((l1)==(t1));
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a12:((T56*)(a4))->a12));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a13:((T56*)(a4))->a13));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a10:((T56*)(a4))->a10));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a11:((T56*)(a4))->a11));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a18:((T56*)(a4))->a18));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a14:((T56*)(a4))->a14));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a15:((T56*)(a4))->a15));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a16:((T56*)(a4))->a16));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a17:((T56*)(a4))->a17));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a23:((T56*)(a4))->a23));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a19:((T56*)(a4))->a19));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a20:((T56*)(a4))->a20));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a21:((T56*)(a4))->a21));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a22:((T56*)(a4))->a22));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a26:((T56*)(a4))->a26));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a27:((T56*)(a4))->a27));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a24:((T56*)(a4))->a24));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a25:((T56*)(a4))->a25));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a28:((T56*)(a4))->a28));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a35:((T56*)(a4))->a35));
									t2 = ((l1)==(t1));
								} else {
									t2 = EIF_TRUE;
								}
							}
							if (t2) {
								R = EIF_FALSE;
							} else {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a61:((T56*)(a4))->a53));
								T60f164(GE_void(l1), t1);
								l2 = (T60f57(GE_void(l1), C, a4));
								t2 = ((l2)!=(EIF_VOID));
								if (t2) {
									l3 = (T172x6119(GE_void(a1)));
									t2 = ((l3)!=(EIF_VOID));
									if (t2) {
										l2 = (T158x6278T0(GE_void(l2), l3));
									}
									R = (T158x6226T0T0T0T0(GE_void(l2), C, a3, a2, a4));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.ise_5_7_62488 */
unsigned char ge252os1597 = '\0';
T0* ge252ov1597;
T0* T174f14(T0* C)
{
	T0* R = 0;
	if (ge252os1597) {
		return ge252ov1597;
	} else {
		ge252os1597 = '\1';
	}
	R = T63c17((T6)(GE_int32(5)), (T6)(GE_int32(7)), (T6)(GE_int32(62488)), (T6)(GE_int32(0)));
	ge252ov1597 = R;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.ise_5_6_latest */
T0* T174f13(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_CLASS_TYPE.conforms_from_class_type */
T1 T172f14(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T172*)(C))->a3)==(l1));
			if (t2) {
				t2 = (T172x6127(GE_void(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T172f24(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T172f24(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
						R = EIF_FALSE;
					} else {
						l3 = (T172x6119(GE_void(a1)));
						t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a80:((T56*)(a4))->a52));
						t2 = ((((T172*)(C))->a3)==(t1));
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a81:((T56*)(a4))->a48));
							t2 = ((((T172*)(C))->a3)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a83:((T56*)(a4))->a49));
							t2 = ((((T172*)(C))->a3)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a82:((T56*)(a4))->a50));
							t2 = ((((T172*)(C))->a3)==(t1));
						}
						if (t2) {
							t1 = (T172f5(C));
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, t1, a3, a2, a4):T173f9(l3, t1, a3, a2, a4)));
						} else {
							t1 = (T172f5(C));
							R = (((((T0*)(GE_void(l3)))->id==425)?T425f11(l3, t1, a3, a2, a4):T173f9(l3, t1, a3, a2, a4)));
						}
					}
				}
			} else {
				t2 = (T172f22(C));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
					t2 = ((l1)==(t1));
					if (t2) {
						R = EIF_TRUE;
					} else {
						t2 = (T172x6130(GE_void(a1)));
						if (t2) {
							t3 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t3) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T172f28(C));
								t2 = (T63f14(GE_void(t1), t4));
							} else {
								t2 = EIF_FALSE;
							}
						}
						if (t2) {
							R = EIF_FALSE;
						} else {
							t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t2) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T172f29(C));
								t2 = (T63f14(GE_void(t1), t4));
							}
							if (t2) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a9:((T56*)(a4))->a9));
								t3 = ((l1)==(t1));
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a12:((T56*)(a4))->a12));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a13:((T56*)(a4))->a13));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a10:((T56*)(a4))->a10));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a11:((T56*)(a4))->a11));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a18:((T56*)(a4))->a18));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a14:((T56*)(a4))->a14));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a15:((T56*)(a4))->a15));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a16:((T56*)(a4))->a16));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a17:((T56*)(a4))->a17));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a23:((T56*)(a4))->a23));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a19:((T56*)(a4))->a19));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a20:((T56*)(a4))->a20));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a21:((T56*)(a4))->a21));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a22:((T56*)(a4))->a22));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a26:((T56*)(a4))->a26));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a27:((T56*)(a4))->a27));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a24:((T56*)(a4))->a24));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a25:((T56*)(a4))->a25));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a28:((T56*)(a4))->a28));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a35:((T56*)(a4))->a35));
									t2 = ((l1)==(t1));
								} else {
									t2 = EIF_TRUE;
								}
							}
							if (t2) {
								R = EIF_FALSE;
							} else {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a61:((T56*)(a4))->a53));
								T60f164(GE_void(l1), t1);
								l2 = (T60f57(GE_void(l1), C, a4));
								t2 = ((l2)!=(EIF_VOID));
								if (t2) {
									l3 = (T172x6119(GE_void(a1)));
									t2 = ((l3)!=(EIF_VOID));
									if (t2) {
										l2 = (T158x6278T0(GE_void(l2), l3));
									}
									R = (T158x6226T0T0T0T0(GE_void(l2), C, a3, a2, a4));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.ise_5_7_62488 */
T0* T172f29(T0* C)
{
	T0* R = 0;
	if (ge252os1597) {
		return ge252ov1597;
	} else {
		ge252os1597 = '\1';
	}
	R = T63c17((T6)(GE_int32(5)), (T6)(GE_int32(7)), (T6)(GE_int32(62488)), (T6)(GE_int32(0)));
	ge252ov1597 = R;
	return R;
}

/* ET_CLASS_TYPE.ise_5_6_latest */
T0* T172f28(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_CLASS.conforms_from_class_type */
T1 T60f53(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T0* t4;
	l1 = (T172x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T60*)(C))->a8)==(l1));
			if (t2) {
				t2 = (T172x6127(GE_void(a1)));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T60f72(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T60f72(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
						R = EIF_FALSE;
					} else {
						l3 = (T172x6119(GE_void(a1)));
						t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a80:((T56*)(a4))->a52));
						t2 = ((((T60*)(C))->a8)==(t1));
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a81:((T56*)(a4))->a48));
							t2 = ((((T60*)(C))->a8)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a83:((T56*)(a4))->a49));
							t2 = ((((T60*)(C))->a8)==(t1));
						}
						if (!(t2)) {
							t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a82:((T56*)(a4))->a50));
							t2 = ((((T60*)(C))->a8)==(t1));
						}
						if (t2) {
							R = (((((T0*)(GE_void(l3)))->id==173)?T173f9(l3, ((T60*)(C))->a11, a3, a2, a4):T425f11(l3, ((T60*)(C))->a11, a3, a2, a4)));
						} else {
							R = (((((T0*)(GE_void(l3)))->id==173)?T173f9(l3, ((T60*)(C))->a11, a3, a2, a4):T425f11(l3, ((T60*)(C))->a11, a3, a2, a4)));
						}
					}
				}
			} else {
				t2 = (T60f63(C));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a3:((T56*)(a4))->a3));
					t2 = ((l1)==(t1));
					if (t2) {
						R = EIF_TRUE;
					} else {
						t2 = (T172x6130(GE_void(a1)));
						if (t2) {
							t3 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t3) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T60f58(C));
								t2 = (T63f14(GE_void(t1), t4));
							} else {
								t2 = EIF_FALSE;
							}
						}
						if (t2) {
							R = EIF_FALSE;
						} else {
							t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t2) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T60f59(C));
								t2 = (T63f14(GE_void(t1), t4));
							}
							if (t2) {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a9:((T56*)(a4))->a9));
								t3 = ((l1)==(t1));
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a12:((T56*)(a4))->a12));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a13:((T56*)(a4))->a13));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a10:((T56*)(a4))->a10));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a11:((T56*)(a4))->a11));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a18:((T56*)(a4))->a18));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a14:((T56*)(a4))->a14));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a15:((T56*)(a4))->a15));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a16:((T56*)(a4))->a16));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a17:((T56*)(a4))->a17));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a23:((T56*)(a4))->a23));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a19:((T56*)(a4))->a19));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a20:((T56*)(a4))->a20));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a21:((T56*)(a4))->a21));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a22:((T56*)(a4))->a22));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a26:((T56*)(a4))->a26));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a27:((T56*)(a4))->a27));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a24:((T56*)(a4))->a24));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a25:((T56*)(a4))->a25));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a28:((T56*)(a4))->a28));
									t3 = ((l1)==(t1));
								}
								if (!(t3)) {
									t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a35:((T56*)(a4))->a35));
									t2 = ((l1)==(t1));
								} else {
									t2 = EIF_TRUE;
								}
							}
							if (t2) {
								R = EIF_FALSE;
							} else {
								t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a61:((T56*)(a4))->a53));
								T60f164(GE_void(l1), t1);
								l2 = (T60f57(GE_void(l1), C, a4));
								t2 = ((l2)!=(EIF_VOID));
								if (t2) {
									l3 = (T172x6119(GE_void(a1)));
									t2 = ((l3)!=(EIF_VOID));
									if (t2) {
										l2 = (T158x6278T0(GE_void(l2), l3));
									}
									R = (T158x6226T0T0T0T0(GE_void(l2), C, a3, a2, a4));
								}
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.ise_5_7_62488 */
T0* T60f59(T0* C)
{
	T0* R = 0;
	if (ge252os1597) {
		return ge252ov1597;
	} else {
		ge252os1597 = '\1';
	}
	R = T63c17((T6)(GE_int32(5)), (T6)(GE_int32(7)), (T6)(GE_int32(62488)), (T6)(GE_int32(0)));
	ge252ov1597 = R;
	return R;
}

/* ET_CLASS.ise_5_6_latest */
T0* T60f58(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.conforms_from_formal_parameter_type */
T1 T956f28(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			l4 = (T956x22307(a1));
			t2 = ((l3)==(l4));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t3 = (T168x6280(GE_void(a3)));
				l5 = (T158x6184T0(GE_void(t3), a4));
				l6 = (((T60*)(GE_void(l5)))->a11);
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t1 = (((T425*)(GE_void(l6)))->a1);
					t2 = (T6f13(&l4, t1));
				}
				if (t2) {
					l7 = (T425f7(GE_void(l6), l4));
					l8 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						l9 = (((((T0*)(GE_void(l7)))->id==557)?T557f7(l7):((T565*)(l7))->a7));
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t2) {
								t3 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T956f40(C));
								t2 = (T63f14(GE_void(t3), t4));
							}
							if (t2) {
								t2 = (T956x6201T0T0(a1, a2, a4));
								if (t2) {
									t3 = (T168x6280(GE_void(a3)));
									t2 = (T956f39(C, t3, a4));
								}
								if (t2) {
									t3 = (T168x6280(GE_void(a3)));
									R = (T167x6231T0T0T0T0(GE_void(l8), C, t3, a2, a4));
								}
							} else {
								t3 = (T168x6280(GE_void(a3)));
								R = (T167x6226T0T0T0T0(GE_void(l8), C, t3, a2, a4));
							}
						} else {
							if ((l8)==EIF_VOID) {
								l2 = EIF_VOID;
							} else {
								switch (((T0*)(l8))->id) {
								case 956:
									l2 = l8;
									break;
								default:
									l2 = EIF_VOID;
								}
							}
							t2 = ((l2)!=(EIF_VOID));
							if (t2) {
								t1 = (((T425*)(GE_void(l6)))->a1);
								l10 = T901c5((T6)(GE_int32(1)), t1);
								T901f6(GE_void(l10), EIF_TRUE, l4);
								l4 = (T956x22307(GE_void(l2)));
								R = ((l3)==(l4));
								if (!(R)) {
									t2 = (T901f4(GE_void(l10), l4));
								} else {
									t2 = EIF_TRUE;
								}
								while (!(t2)) {
									T901f6(GE_void(l10), EIF_TRUE, l4);
									t1 = (((T425*)(GE_void(l6)))->a1);
									t2 = (T6f13(&l4, t1));
									if (t2) {
										l7 = (T425f7(GE_void(l6), l4));
										t3 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
										if ((t3)==EIF_VOID) {
											l2 = EIF_VOID;
										} else {
											switch (((T0*)(t3))->id) {
											case 956:
												l2 = t3;
												break;
											default:
												l2 = EIF_VOID;
											}
										}
										t2 = ((l2)!=(EIF_VOID));
										if (t2) {
											l4 = (T956x22307(GE_void(l2)));
											R = ((l3)==(l4));
										} else {
											R = EIF_FALSE;
										}
									} else {
										R = EIF_FALSE;
									}
									if (!(R)) {
										t2 = (T901f4(GE_void(l10), l4));
									} else {
										t2 = EIF_TRUE;
									}
								}
							} else {
								R = EIF_FALSE;
							}
						}
					}
				} else {
					R = EIF_FALSE;
				}
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6229T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.ise_5_6_latest */
T0* T956f40(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_LIKE_CURRENT.conforms_from_formal_parameter_type */
T1 T716f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6313T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.conforms_from_formal_parameter_type */
T1 T714f27(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6229T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6229T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_from_formal_parameter_type */
T1 T578f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l1 = (T956x22307(a1));
	t1 = (T168x6282T0(a2, a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
			if (t2) {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
				t4 = (T578f46(C));
				t2 = (T63f14(GE_void(t1), t4));
			}
			if (t2) {
				t2 = (T956x6201T0T0(a1, a2, a4));
				if (t2) {
					t2 = (T578f47(C, a3, a4));
				}
				if (t2) {
					R = (T578f22(C, l6, a2, a3, a4));
				}
			} else {
				R = (T578f22(C, l6, a2, a3, a4));
			}
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
					t4 = (T578f46(C));
					t2 = (T63f14(GE_void(t1), t4));
				}
				if (t2) {
					t2 = (T956x6201T0T0(a1, a2, a4));
					if (t2) {
						t2 = (T578f47(C, a3, a4));
					}
					if (t2) {
						R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
					}
				} else {
					R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.ise_5_6_latest */
T0* T578f46(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_BIT_N.conforms_from_formal_parameter_type */
T1 T577f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l1 = (T956x22307(a1));
	t1 = (T168x6282T0(a2, a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
			if (t2) {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
				t4 = (T577f44(C));
				t2 = (T63f14(GE_void(t1), t4));
			}
			if (t2) {
				t2 = (T956x6201T0T0(a1, a2, a4));
				if (t2) {
					t2 = (T577f45(C, a3, a4));
				}
				if (t2) {
					R = (T577f23(C, l6, a2, a3, a4));
				}
			} else {
				R = (T577f23(C, l6, a2, a3, a4));
			}
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
					t4 = (T577f44(C));
					t2 = (T63f14(GE_void(t1), t4));
				}
				if (t2) {
					t2 = (T956x6201T0T0(a1, a2, a4));
					if (t2) {
						t2 = (T577f45(C, a3, a4));
					}
					if (t2) {
						R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
					}
				} else {
					R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_N.ise_5_6_latest */
T0* T577f44(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.conforms_from_formal_parameter_type */
T1 T565f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			l4 = (T956x22307(a1));
			t2 = ((l3)==(l4));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t3 = (T168x6280(GE_void(a3)));
				l5 = (T158x6184T0(GE_void(t3), a4));
				l6 = (((T60*)(GE_void(l5)))->a11);
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t1 = (((T425*)(GE_void(l6)))->a1);
					t2 = (T6f13(&l4, t1));
				}
				if (t2) {
					l7 = (T425f7(GE_void(l6), l4));
					l8 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						l9 = (((((T0*)(GE_void(l7)))->id==557)?T557f7(l7):((T565*)(l7))->a7));
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t2) {
								t3 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T565f29(C));
								t2 = (T63f14(GE_void(t3), t4));
							}
							if (t2) {
								t2 = (T956x6201T0T0(a1, a2, a4));
								if (t2) {
									t3 = (T168x6280(GE_void(a3)));
									t2 = (T565f28(C, t3, a4));
								}
								if (t2) {
									t3 = (T168x6280(GE_void(a3)));
									R = (T167x6231T0T0T0T0(GE_void(l8), C, t3, a2, a4));
								}
							} else {
								t3 = (T168x6280(GE_void(a3)));
								R = (T167x6226T0T0T0T0(GE_void(l8), C, t3, a2, a4));
							}
						} else {
							if ((l8)==EIF_VOID) {
								l2 = EIF_VOID;
							} else {
								switch (((T0*)(l8))->id) {
								case 956:
									l2 = l8;
									break;
								default:
									l2 = EIF_VOID;
								}
							}
							t2 = ((l2)!=(EIF_VOID));
							if (t2) {
								t1 = (((T425*)(GE_void(l6)))->a1);
								l10 = T901c5((T6)(GE_int32(1)), t1);
								T901f6(GE_void(l10), EIF_TRUE, l4);
								l4 = (T956x22307(GE_void(l2)));
								R = ((l3)==(l4));
								if (!(R)) {
									t2 = (T901f4(GE_void(l10), l4));
								} else {
									t2 = EIF_TRUE;
								}
								while (!(t2)) {
									T901f6(GE_void(l10), EIF_TRUE, l4);
									t1 = (((T425*)(GE_void(l6)))->a1);
									t2 = (T6f13(&l4, t1));
									if (t2) {
										l7 = (T425f7(GE_void(l6), l4));
										t3 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
										if ((t3)==EIF_VOID) {
											l2 = EIF_VOID;
										} else {
											switch (((T0*)(t3))->id) {
											case 956:
												l2 = t3;
												break;
											default:
												l2 = EIF_VOID;
											}
										}
										t2 = ((l2)!=(EIF_VOID));
										if (t2) {
											l4 = (T956x22307(GE_void(l2)));
											R = ((l3)==(l4));
										} else {
											R = EIF_FALSE;
										}
									} else {
										R = EIF_FALSE;
									}
									if (!(R)) {
										t2 = (T901f4(GE_void(l10), l4));
									} else {
										t2 = EIF_TRUE;
									}
								}
							} else {
								R = EIF_FALSE;
							}
						}
					}
				} else {
					R = EIF_FALSE;
				}
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6229T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.ise_5_6_latest */
T0* T565f29(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_FORMAL_PARAMETER.conforms_from_formal_parameter_type */
T1 T557f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			l3 = (T956x22307(GE_void(l2)));
			l4 = (T956x22307(a1));
			t2 = ((l3)==(l4));
			if (t2) {
				R = EIF_TRUE;
			} else {
				t3 = (T168x6280(GE_void(a3)));
				l5 = (T158x6184T0(GE_void(t3), a4));
				l6 = (((T60*)(GE_void(l5)))->a11);
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t1 = (((T425*)(GE_void(l6)))->a1);
					t2 = (T6f13(&l4, t1));
				}
				if (t2) {
					l7 = (T425f7(GE_void(l6), l4));
					l8 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
					t2 = ((l8)!=(EIF_VOID));
					if (t2) {
						l9 = (((((T0*)(GE_void(l7)))->id==557)?T557f7(l7):((T565*)(l7))->a7));
						t2 = ((l9)!=(EIF_VOID));
						if (t2) {
							t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
							if (t2) {
								t3 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
								t4 = (T557f27(C));
								t2 = (T63f14(GE_void(t3), t4));
							}
							if (t2) {
								t2 = (T956x6201T0T0(a1, a2, a4));
								if (t2) {
									t3 = (T168x6280(GE_void(a3)));
									t2 = (T557f23(C, t3, a4));
								}
								if (t2) {
									t3 = (T168x6280(GE_void(a3)));
									R = (T167x6231T0T0T0T0(GE_void(l8), C, t3, a2, a4));
								}
							} else {
								t3 = (T168x6280(GE_void(a3)));
								R = (T167x6226T0T0T0T0(GE_void(l8), C, t3, a2, a4));
							}
						} else {
							if ((l8)==EIF_VOID) {
								l2 = EIF_VOID;
							} else {
								switch (((T0*)(l8))->id) {
								case 956:
									l2 = l8;
									break;
								default:
									l2 = EIF_VOID;
								}
							}
							t2 = ((l2)!=(EIF_VOID));
							if (t2) {
								t1 = (((T425*)(GE_void(l6)))->a1);
								l10 = T901c5((T6)(GE_int32(1)), t1);
								T901f6(GE_void(l10), EIF_TRUE, l4);
								l4 = (T956x22307(GE_void(l2)));
								R = ((l3)==(l4));
								if (!(R)) {
									t2 = (T901f4(GE_void(l10), l4));
								} else {
									t2 = EIF_TRUE;
								}
								while (!(t2)) {
									T901f6(GE_void(l10), EIF_TRUE, l4);
									t1 = (((T425*)(GE_void(l6)))->a1);
									t2 = (T6f13(&l4, t1));
									if (t2) {
										l7 = (T425f7(GE_void(l6), l4));
										t3 = (((((T0*)(GE_void(l7)))->id==557)?T557f8(l7):((T565*)(l7))->a2));
										if ((t3)==EIF_VOID) {
											l2 = EIF_VOID;
										} else {
											switch (((T0*)(t3))->id) {
											case 956:
												l2 = t3;
												break;
											default:
												l2 = EIF_VOID;
											}
										}
										t2 = ((l2)!=(EIF_VOID));
										if (t2) {
											l4 = (T956x22307(GE_void(l2)));
											R = ((l3)==(l4));
										} else {
											R = EIF_FALSE;
										}
									} else {
										R = EIF_FALSE;
									}
									if (!(R)) {
										t2 = (T901f4(GE_void(l10), l4));
									} else {
										t2 = EIF_TRUE;
									}
								}
							} else {
								R = EIF_FALSE;
							}
						}
					}
				} else {
					R = EIF_FALSE;
				}
			}
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6229T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.ise_5_6_latest */
T0* T557f27(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_formal_parameter_type */
T1 T312f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l1 = (T956x22307(a1));
	t1 = (T168x6282T0(a2, a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
			if (t2) {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
				t4 = (T312f65(C));
				t2 = (T63f14(GE_void(t1), t4));
			}
			if (t2) {
				t2 = (T956x6201T0T0(a1, a2, a4));
				if (t2) {
					t2 = (T312f50(C, a3, a4));
				}
				if (t2) {
					R = (T312f16(C, l6, a2, a3, a4));
				}
			} else {
				R = (T312f16(C, l6, a2, a3, a4));
			}
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
					t4 = (T312f65(C));
					t2 = (T63f14(GE_void(t1), t4));
				}
				if (t2) {
					t2 = (T956x6201T0T0(a1, a2, a4));
					if (t2) {
						t2 = (T312f50(C, a3, a4));
					}
					if (t2) {
						R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
					}
				} else {
					R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_TUPLE_TYPE.ise_5_6_latest */
T0* T312f65(T0* C)
{
	T0* R = 0;
	if (ge252os1592) {
		return ge252ov1592;
	} else {
		ge252os1592 = '\1';
	}
	R = T63c18((T6)(GE_int32(5)), (T6)(GE_int32(6)));
	ge252ov1592 = R;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_formal_parameter_type */
T1 T174f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l1 = (T956x22307(a1));
	t1 = (T168x6282T0(a2, a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
			if (t2) {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
				t4 = (T174f13(C));
				t2 = (T63f14(GE_void(t1), t4));
			}
			if (t2) {
				t2 = (T956x6201T0T0(a1, a2, a4));
				if (t2) {
					t2 = (T174f60(C, a3, a4));
				}
				if (t2) {
					R = (T174f11(C, l6, a2, a3, a4));
				}
			} else {
				R = (T174f11(C, l6, a2, a3, a4));
			}
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
					t4 = (T174f13(C));
					t2 = (T63f14(GE_void(t1), t4));
				}
				if (t2) {
					t2 = (T956x6201T0T0(a1, a2, a4));
					if (t2) {
						t2 = (T174f60(C, a3, a4));
					}
					if (t2) {
						R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
					}
				} else {
					R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_from_formal_parameter_type */
T1 T172f38(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l1 = (T956x22307(a1));
	t1 = (T168x6282T0(a2, a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
			if (t2) {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
				t4 = (T172f28(C));
				t2 = (T63f14(GE_void(t1), t4));
			}
			if (t2) {
				t2 = (T956x6201T0T0(a1, a2, a4));
				if (t2) {
					t2 = (T172f54(C, a3, a4));
				}
				if (t2) {
					R = (T172f14(C, l6, a2, a3, a4));
				}
			} else {
				R = (T172f14(C, l6, a2, a3, a4));
			}
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
					t4 = (T172f28(C));
					t2 = (T63f14(GE_void(t1), t4));
				}
				if (t2) {
					t2 = (T956x6201T0T0(a1, a2, a4));
					if (t2) {
						t2 = (T172f54(C, a3, a4));
					}
					if (t2) {
						R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
					}
				} else {
					R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_CLASS.conforms_from_formal_parameter_type */
T1 T60f105(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T0* t4;
	l1 = (T956x22307(a1));
	t1 = (T168x6282T0(a2, a4));
	l3 = (((T60*)(GE_void(t1)))->a11);
	t2 = ((l3)==(EIF_VOID));
	if (!(t2)) {
		t3 = (((T425*)(GE_void(l3)))->a1);
		t2 = (T6f1(&l1, t3));
	}
	if (t2) {
		R = EIF_FALSE;
	} else {
		l2 = (T425f7(GE_void(l3), l1));
		l4 = (((((T0*)(GE_void(l2)))->id==557)?T557f8(l2):((T565*)(l2))->a2));
		t2 = ((l4)==(EIF_VOID));
		if (t2) {
			l6 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a89:((T56*)(a4))->a88));
			t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
			if (t2) {
				t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
				t4 = (T60f58(C));
				t2 = (T63f14(GE_void(t1), t4));
			}
			if (t2) {
				t2 = (T956x6201T0T0(a1, a2, a4));
				if (t2) {
					t2 = (T60f134(C, a3, a4));
				}
				if (t2) {
					R = (T60f53(C, l6, a2, a3, a4));
				}
			} else {
				R = (T60f53(C, l6, a2, a3, a4));
			}
		} else {
			l5 = (((((T0*)(GE_void(l2)))->id==557)?T557f7(l2):((T565*)(l2))->a7));
			t2 = ((l5)!=(EIF_VOID));
			if (t2) {
				t2 = (((((T0*)(GE_void(a4)))->id==53)?T53f153(a4):T56f150(a4)));
				if (t2) {
					t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a36:((T56*)(a4))->a36));
					t4 = (T60f58(C));
					t2 = (T63f14(GE_void(t1), t4));
				}
				if (t2) {
					t2 = (T956x6201T0T0(a1, a2, a4));
					if (t2) {
						t2 = (T60f134(C, a3, a4));
					}
					if (t2) {
						R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
					}
				} else {
					R = (T158x6226T0T0T0T0(GE_void(l5), C, a3, a2, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.conforms_from_tuple_type */
T1 T956f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6230T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.conforms_from_tuple_type */
T1 T716f26(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6314T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.conforms_from_tuple_type */
T1 T714f21(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6230T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6230T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_from_tuple_type */
T1 T578f23(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T578f22(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T578f22(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_BIT_N.conforms_from_tuple_type */
T1 T577f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T577f23(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T577f23(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.conforms_from_tuple_type */
T1 T565f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6230T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.conforms_from_tuple_type */
T1 T557f17(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6230T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_tuple_type */
T1 T312f28(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T312*)(C))->a2;
		l2 = (((T312*)(a1))->a2);
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			R = EIF_TRUE;
		} else {
			t1 = ((l2)==(EIF_VOID));
			if (t1) {
				R = (T173f10(GE_void(l1)));
			} else {
				R = (T173f19(GE_void(l2), l1, a3, a2, a4));
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_tuple_type */
T1 T174f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T174f11(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T174f11(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_from_tuple_type */
T1 T172f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T172f14(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T172f14(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS.conforms_from_tuple_type */
T1 T60f98(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	l1 = (T312f11(a1, a4));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T60f53(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		t2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a77:((T56*)(a4))->a47));
		R = (T60f53(C, t2, a2, a3, a4));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.conforms_from_bit_type */
T1 T956f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6227T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.conforms_from_bit_type */
T1 T716f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6311T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.conforms_from_bit_type */
T1 T714f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6227T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6227T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_from_bit_type */
T1 T578f24(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		T578f103(C);
		t1 = (T578f45(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (((T0*)(a1))->id==577) {
				T577f97(a1);
			} else {
				T578f103(a1);
			}
			t1 = (((((T0*)(a1))->id==577)?T577f5(a1):T578f45(a1)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (((((T0*)(a1))->id==577)?((T577*)(a1))->a2:((T578*)(a1))->a3));
				R = (T6f13(&t2, ((T578*)(C))->a3));
			}
		}
	}
	return R;
}

/* ET_BIT_N.conforms_from_bit_type */
T1 T577f43(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		T577f97(C);
		t1 = (T577f5(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			if (((T0*)(a1))->id==577) {
				T577f97(a1);
			} else {
				T578f103(a1);
			}
			t1 = (((((T0*)(a1))->id==577)?T577f5(a1):T578f45(a1)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				t2 = (((((T0*)(a1))->id==577)?((T577*)(a1))->a2:((T578*)(a1))->a3));
				R = (T6f13(&t2, ((T577*)(C))->a2));
			}
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.conforms_from_bit_type */
T1 T565f31(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6227T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.conforms_from_bit_type */
T1 T557f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6227T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_from_bit_type */
T1 T312f39(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T312f16(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T312f16(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_from_bit_type */
T1 T174f46(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T174f11(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T174f11(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_from_bit_type */
T1 T172f42(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T172f14(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T172f14(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_CLASS.conforms_from_bit_type */
T1 T60f110(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	l1 = (((((T0*)(a1))->id==577)?T577f17(a1, a4):T578f15(a1, a4)));
	t1 = (T60f71(GE_void(l1)));
	if (t1) {
		R = (T60f53(C, l1, a2, a3, a4));
	}
	t1 = ((T1)(!(R)));
	if (t1) {
		l2 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a4:((T56*)(a4))->a4));
		R = (T60f53(C, l2, a2, a3, a4));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.base_type */
T0* T956f8(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = l6;
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a89:((T56*)(a2))->a88));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			if ((l1)==EIF_VOID) {
				R = EIF_VOID;
			} else {
				switch (((T0*)(l1))->id) {
				case 557:
				case 565:
				case 956:
					R = EIF_VOID;
					break;
				default:
					R = l1;
				}
			}
			t2 = ((R)==(EIF_VOID));
			if (t2) {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_LIKE_CURRENT.base_type */
T0* T716f8(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T168x6283T0(GE_void(a1), a2));
	return R;
}

/* ET_LIKE_FEATURE.base_type */
T0* T714f12(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6186T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			l1 = (T168x6282T0(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6186T0T0(GE_void(t3), a1, a2));
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.base_type */
T0* T578f14(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T578*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = C;
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_BIT_N.base_type */
T0* T577f16(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T577*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = C;
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.base_type */
T0* T565f12(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = l6;
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a89:((T56*)(a2))->a88));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			if ((l1)==EIF_VOID) {
				R = EIF_VOID;
			} else {
				switch (((T0*)(l1))->id) {
				case 557:
				case 565:
				case 956:
					R = EIF_VOID;
					break;
				default:
					R = l1;
				}
			}
			t2 = ((R)==(EIF_VOID));
			if (t2) {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.base_type */
T0* T557f10(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = l6;
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a89:((T56*)(a2))->a88));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			if ((l1)==EIF_VOID) {
				R = EIF_VOID;
			} else {
				switch (((T0*)(l1))->id) {
				case 557:
				case 565:
				case 956:
					R = EIF_VOID;
					break;
				default:
					R = l1;
				}
			}
			t2 = ((R)==(EIF_VOID));
			if (t2) {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_TUPLE_TYPE.base_type */
T0* T312f10(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = C;
	} else {
		R = C;
		l1 = ((T312*)(C))->a2;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (T173f8(GE_void(l1), a1, a2));
			t1 = ((l2)!=(l1));
			if (t1) {
				R = T312c89(l2);
				T312f90(GE_void(R), ((T312*)(C))->a1);
			}
		}
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.named_types */
T0* T173f8(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T1 t1;
	T0* t2;
	R = C;
	l3 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l3));
	while (!(t1)) {
		t2 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l1]);
		l4 = (T177x6263(GE_void(t2)));
		l6 = (T710x6264(GE_void(l4)));
		t1 = ((l6)!=(l7));
		if (t1) {
			l8 = (T167x6191T0T0(GE_void(l6), a1, a2));
			l7 = l6;
		}
		l5 = (T710x6259T0(GE_void(l4), l8));
		t1 = ((R)!=(C));
		if (t1) {
			T173f24(GE_void(R), l5);
		} else {
			t1 = ((l4)!=(l5));
			if (t1) {
				R = T173c23(((T173*)(C))->a3);
				T173f26(GE_void(R), ((T173*)(C))->a1);
				T173f27(GE_void(R), ((T173*)(C))->a2);
				l2 = (T6)(GE_int32(0));
				t1 = (T6f12(&l2, l1));
				while (!(t1)) {
					t2 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l2]);
					t2 = (T177x6263(GE_void(t2)));
					T173f24(GE_void(R), t2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					t1 = (T6f12(&l2, l1));
				}
				T173f24(GE_void(R), l5);
			}
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = (T6f1(&l1, l3));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type */
T0* T174f9(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = C;
	} else {
		R = C;
		l1 = ((T174*)(C))->a2;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (((((T0*)(GE_void(l1)))->id==173)?T173f8(l1, a1, a2):T425f17(l1, a1, a2)));
			t1 = ((l2)!=(l1));
			if (t1) {
				l3 = T174c95(((T174*)(C))->a3, ((T174*)(C))->a4, l2, ((T174*)(C))->a1);
				T174f96(GE_void(l3), C);
				R = l3;
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.named_types */
T0* T425f17(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.base_type */
T0* T172f9(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = C;
	} else {
		R = C;
		l1 = (T172f5(C));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = ((GE_void(l1), a1, a2, (T0*)0));
			t1 = ((l2)!=(l1));
			if (t1) {
				l3 = T174c95(((T172*)(C))->a1, ((T172*)(C))->a2, l2, ((T172*)(C))->a3);
				T174f96(GE_void(l3), C);
				R = l3;
			}
		}
	}
	return R;
}

/* ET_CLASS.base_type */
T0* T60f77(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = C;
	} else {
		R = C;
		l1 = ((T60*)(C))->a11;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			l2 = (T425f17(GE_void(l1), a1, a2));
			t1 = ((l2)!=(l1));
			if (t1) {
				l3 = T174c95(((T60*)(C))->a13, ((T60*)(C))->a1, l2, ((T60*)(C))->a8);
				T174f96(GE_void(l3), C);
				R = l3;
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_base_class_type */
T1 T956f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6223T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_base_class_type */
T1 T716f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6306T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_base_class_type */
T1 T714f14(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6223T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6223T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_base_class_type */
T1 T578f16(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_base_class_type */
T1 T577f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_base_class_type */
T1 T565f14(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6223T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_base_class_type */
T1 T557f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6223T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_base_class_type */
T1 T312f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_class_type */
T1 T174f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T174*)(C))->a1)==(l2));
			if (t2) {
				t3 = (T174f6(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T174f24(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T174f12(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T174f12(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						R = (((((T0*)(GE_void(((T174*)(C))->a2)))->id==173)?T173f15(((T174*)(C))->a2, l1, a2, a3, a4):T425f18(((T174*)(C))->a2, l1, a2, a3, a4)));
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_base_class_type */
T1 T172f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T172*)(C))->a3)==(l2));
			if (t2) {
				t3 = (T172f22(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T172f23(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T172f24(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T172f24(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						t1 = (T172f5(C));
						R = ((GE_void(t1), l1, a2, a3, a4, (T1)0));
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.same_base_class_type */
T1 T60f87(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T1 t4;
	l2 = (T172x6184T0(a1, a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l2)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T60*)(C))->a8)==(l2));
			if (t2) {
				t3 = (T60f63(C));
				t4 = (T172x6130(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t3 = (T60f92(C));
				t4 = (T172x6097(a1));
				t2 = ((t3)==(t4));
			}
			if (t2) {
				t2 = (T172x6127(a1));
				t2 = ((T1)(!(t2)));
				if (t2) {
					t2 = (T60f72(C));
					R = ((T1)(!(t2)));
				} else {
					t2 = (T60f72(C));
					t2 = ((T1)(!(t2)));
					if (t2) {
					} else {
						l1 = (T172x6119(a1));
						R = (T425f18(GE_void(((T60*)(C))->a11), l1, a2, a3, a4));
					}
				}
			}
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_base_tuple_type */
T1 T956f26(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6225T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_base_tuple_type */
T1 T716f27(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6308T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_base_tuple_type */
T1 T714f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6225T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6225T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_base_tuple_type */
T1 T578f17(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_N.same_base_tuple_type */
T1 T577f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_base_tuple_type */
T1 T565f15(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6225T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_base_tuple_type */
T1 T557f13(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6225T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_base_tuple_type */
T1 T312f29(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = (((T312*)(a1))->a2);
		t1 = ((l1)==(EIF_VOID));
		if (t1) {
			t1 = ((((T312*)(C))->a2)==(EIF_VOID));
			if (!(t1)) {
				R = (T173f10(GE_void(((T312*)(C))->a2)));
			} else {
				R = EIF_TRUE;
			}
		} else {
			t1 = ((((T312*)(C))->a2)==(EIF_VOID));
			if (t1) {
				R = (T173f10(GE_void(l1)));
			} else {
				R = (T173f15(GE_void(((T312*)(C))->a2), l1, a2, a3, a4));
			}
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_tuple_type */
T1 T174f36(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_base_tuple_type */
T1 T172f33(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_base_tuple_type */
T1 T60f99(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_base_bit_type */
T1 T956f34(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6222T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_base_bit_type */
T1 T716f35(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T168x6305T0T0T0(GE_void(a3), a1, a2, a4));
	return R;
}

/* ET_LIKE_FEATURE.same_base_bit_type */
T1 T714f16(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = EIF_FALSE;
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a3), a4));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = EIF_FALSE;
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6222T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				}
			} else {
				R = EIF_FALSE;
			}
		} else {
			l1 = (T168x6282T0(GE_void(a3), a4));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6222T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
			} else {
				R = EIF_FALSE;
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_base_bit_type */
T1 T578f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T578f44(C, a1, a2, a3, a4));
	return R;
}

/* ET_BIT_N.same_base_bit_type */
T1 T577f48(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	R = (T577f49(C, a1, a2, a3, a4));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_base_bit_type */
T1 T565f32(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6222T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_base_bit_type */
T1 T557f30(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			R = EIF_FALSE;
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6222T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_base_bit_type */
T1 T312f40(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_bit_type */
T1 T174f47(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS_TYPE.same_base_bit_type */
T1 T172f43(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_CLASS.same_base_bit_type */
T1 T60f111(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.is_base_type */
T1 T956f52(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_CURRENT.is_base_type */
T1 T716f53(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.is_base_type */
T1 T714f57(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.is_base_type */
T1 T578f77(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = (T578f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = ((GE_void(l1), (T6)0));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = ((GE_void(l1), l2, (T0*)0));
			t1 = ((GE_void(t2), (T1)0));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_BIT_N.is_base_type */
T1 T577f76(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = (T577f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = ((GE_void(l1), (T6)0));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = ((GE_void(l1), l2, (T0*)0));
			t1 = ((GE_void(t2), (T1)0));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.is_base_type */
T1 T565f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_FORMAL_PARAMETER.is_base_type */
T1 T557f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_TUPLE_TYPE.is_base_type */
T1 T312f70(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = (((T173*)(GE_void(l1)))->a3);
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = (T173f7(GE_void(l1), l2));
			t1 = (T167x6199(GE_void(t2)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_base_type */
T1 T174f75(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = (((((T0*)(GE_void(l1)))->id==173)?((T173*)(l1))->a3:((T425*)(l1))->a1));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = (((((T0*)(GE_void(l1)))->id==173)?T173f7(l1, l2):T425f10(l1, l2)));
			t1 = (T167x6199(GE_void(t2)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.is_base_type */
T1 T172f75(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = ((GE_void(l1), (T6)0));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = ((GE_void(l1), l2, (T0*)0));
			t1 = ((GE_void(t2), (T1)0));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_CLASS.is_base_type */
T1 T60f150(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = (((T425*)(GE_void(l1)))->a1);
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = (T425f10(GE_void(l1), l2));
			t1 = (((((T0*)(GE_void(t2)))->id==557)?T557f59(t2):T565f61(t2)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.is_named_type */
T1 T956f53(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_LIKE_CURRENT.is_named_type */
T1 T716f55(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_LIKE_FEATURE.is_named_type */
T1 T714f59(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_BIT_FEATURE.is_named_type */
T1 T578f89(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = (T578f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = ((GE_void(l1), (T6)0));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = ((GE_void(l1), l2, (T0*)0));
			t1 = ((GE_void(t2), (T1)0));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_BIT_N.is_named_type */
T1 T577f88(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = (T577f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = ((GE_void(l1), (T6)0));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = ((GE_void(l1), l2, (T0*)0));
			t1 = ((GE_void(t2), (T1)0));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.is_named_type */
T1 T565f62(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_FORMAL_PARAMETER.is_named_type */
T1 T557f60(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* ET_TUPLE_TYPE.is_named_type */
T1 T312f81(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = (((T173*)(GE_void(l1)))->a3);
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = (T173f7(GE_void(l1), l2));
			t1 = (T167x6198(GE_void(t2)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_named_type */
T1 T174f86(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = (((((T0*)(GE_void(l1)))->id==173)?((T173*)(l1))->a3:((T425*)(l1))->a1));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = (((((T0*)(GE_void(l1)))->id==173)?T173f7(l1, l2):T425f10(l1, l2)));
			t1 = (T167x6198(GE_void(t2)));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.is_named_type */
T1 T172f55(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	R = EIF_TRUE;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l3 = ((GE_void(l1), (T6)0));
		l2 = (T6)(GE_int32(1));
		t1 = (T6f1(&l2, l3));
		while (!(t1)) {
			t2 = ((GE_void(l1), l2, (T0*)0));
			t1 = ((GE_void(t2), (T1)0));
			t1 = ((T1)(!(t1)));
			if (t1) {
				R = EIF_FALSE;
				l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
			} else {
				l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l2, l3));
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.last_leaf */
T0* T956f55(T0* C)
{
	T0* R = 0;
	R = ((T956*)(C))->a1;
	return R;
}

/* ET_LIKE_CURRENT.last_leaf */
T0* T716f57(T0* C)
{
	T0* R = 0;
	R = ((T716*)(C))->a2;
	return R;
}

/* ET_LIKE_FEATURE.last_leaf */
T0* T714f61(T0* C)
{
	T0* R = 0;
	R = (T129f87(GE_void(((T714*)(C))->a2)));
	return R;
}

/* ET_BIT_FEATURE.last_leaf */
T0* T578f93(T0* C)
{
	T0* R = 0;
	R = ((T578*)(C))->a2;
	return R;
}

/* ET_BIT_N.last_leaf */
T0* T577f92(T0* C)
{
	T0* R = 0;
	R = ((T577*)(C))->a1;
	return R;
}

/* ET_TUPLE_TYPE.last_leaf */
T0* T312f86(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T312*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		R = (T173f22(GE_void(((T312*)(C))->a2)));
	} else {
		R = ((T312*)(C))->a1;
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.last_leaf */
T0* T173f22(T0* C)
{
	T0* R = 0;
	R = ((T173*)(C))->a2;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.last_leaf */
T0* T174f90(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==173)?T173f22(l1):T425f23(l1)));
	} else {
		R = (T129f87(GE_void(((T174*)(C))->a4)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.last_leaf */
T0* T425f23(T0* C)
{
	T0* R = 0;
	R = ((T425*)(C))->a4;
	return R;
}

/* ET_CLASS_TYPE.last_leaf */
T0* T172f89(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T0*)0));
	} else {
		R = (T129f87(GE_void(((T172*)(C))->a2)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.base_type_index_of_label */
T6 T956f54(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a2), a3));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a2), ((T956*)(C))->a2, a3));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a2)));
			l3 = (T158x6184T0(GE_void(t3), a3));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t3 = (T168x6280(GE_void(a2)));
					R = (T158x6190T0T0T0(GE_void(l6), a1, t3, a3));
				} else {
					R = (T6)(GE_int32(0));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			t3 = (T168x6280(GE_void(a2)));
			R = (T959x6190T0T0T0(GE_void(l1), a1, t3, a3));
		}
	} else {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* ET_LIKE_CURRENT.base_type_index_of_label */
T6 T716f56(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T168x6286T0T0(GE_void(a2), a1, a3));
	return R;
}

/* ET_LIKE_FEATURE.base_type_index_of_label */
T6 T714f60(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (T6)(GE_int32(0));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a2), a3));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (T6)(GE_int32(0));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6190T0T0T0(GE_void(t3), a1, a2, a3));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			l1 = (T168x6282T0(GE_void(a2), a3));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6190T0T0T0(GE_void(t3), a1, a2, a3));
			} else {
				R = (T6)(GE_int32(0));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.base_type_index_of_label */
T6 T578f91(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T578f94(C, a1));
	return R;
}

/* ET_BIT_FEATURE.index_of_label */
T6 T578f94(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T578f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, (T6)0));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.base_type_index_of_label */
T6 T565f63(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a2), a3));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a2), ((T565*)(C))->a6, a3));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a2)));
			l3 = (T158x6184T0(GE_void(t3), a3));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t3 = (T168x6280(GE_void(a2)));
					R = (T158x6190T0T0T0(GE_void(l6), a1, t3, a3));
				} else {
					R = (T6)(GE_int32(0));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			t3 = (T168x6280(GE_void(a2)));
			R = (T959x6190T0T0T0(GE_void(l1), a1, t3, a3));
		}
	} else {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.base_type_index_of_label */
T6 T557f61(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a2), a3));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a2), ((T557*)(C))->a2, a3));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a2)));
			l3 = (T158x6184T0(GE_void(t3), a3));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					t3 = (T168x6280(GE_void(a2)));
					R = (T158x6190T0T0T0(GE_void(l6), a1, t3, a3));
				} else {
					R = (T6)(GE_int32(0));
				}
			} else {
				R = (T6)(GE_int32(0));
			}
		} else {
			t3 = (T168x6280(GE_void(a2)));
			R = (T959x6190T0T0T0(GE_void(l1), a1, t3, a3));
		}
	} else {
		R = (T6)(GE_int32(0));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.to_text */
T0* T956f4(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T956f58(C, R);
	return R;
}

/* ET_LIKE_CURRENT.to_text */
T0* T716f5(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T716f64(C, R);
	return R;
}

/* ET_LIKE_FEATURE.to_text */
T0* T714f5(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T714f68(C, R);
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.to_text */
T0* T565f58(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T565f73(C, R);
	return R;
}

/* ET_FORMAL_PARAMETER.to_text */
T0* T557f56(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T557f69(C, R);
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.base_class */
T0* T956f7(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T956*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = (T158x6184T0(GE_void(l6), a2));
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a4:((T56*)(a2))->a4));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6185T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_LIKE_CURRENT.base_class */
T0* T716f7(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (T168x6282T0(GE_void(a1), a2));
	return R;
}

/* ET_LIKE_FEATURE.base_class */
T0* T714f11(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
	if (t1) {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	} else {
		t1 = (T714f36(C));
		if (t1) {
			l1 = (T168x6282T0(GE_void(a1), a2));
			if (((T714*)(C))->a4) {
				l2 = (T60f66(GE_void(l1), ((T714*)(C))->a3));
			} else {
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			}
			t1 = ((l2)!=(EIF_VOID));
			if (t1) {
				l4 = (T200x12627(GE_void(l2)));
				l5 = (T714f38(C));
				t1 = ((l4)==(EIF_VOID));
				if (!(t1)) {
					t2 = (((T235*)(GE_void(l4)))->a3);
					t1 = (T6f1(&l5, t2));
				}
				if (t1) {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
				} else {
					t3 = (T235f11(GE_void(l4), l5));
					t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
					R = (T167x6185T0T0(GE_void(t3), a1, a2));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			l1 = (T168x6282T0(GE_void(a1), a2));
			l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				t3 = (T160x12626(GE_void(l3)));
				R = (T167x6185T0T0(GE_void(t3), a1, a2));
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.base_class */
T0* T578f13(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a78:((T56*)(a2))->a81));
	return R;
}

/* ET_BIT_N.base_class */
T0* T577f15(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a78:((T56*)(a2))->a81));
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.base_class */
T0* T565f11(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T565*)(C))->a6, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = (T158x6184T0(GE_void(l6), a2));
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a4:((T56*)(a2))->a4));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6185T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.base_class */
T0* T557f9(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T6 l7 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a1), a2));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a1), ((T557*)(C))->a2, a2));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a1)));
			l3 = (T158x6184T0(GE_void(t3), a2));
			l4 = (((T60*)(GE_void(l3)))->a11);
			l7 = (T956x22307(GE_void(l2)));
			t2 = ((l4)!=(EIF_VOID));
			if (t2) {
				t1 = (((T425*)(GE_void(l4)))->a1);
				t2 = (T6f13(&l7, t1));
			}
			if (t2) {
				l5 = (T425f7(GE_void(l4), l7));
				l6 = (((((T0*)(GE_void(l5)))->id==557)?T557f7(l5):((T565*)(l5))->a7));
				t2 = ((l6)!=(EIF_VOID));
				if (t2) {
					R = (T158x6184T0(GE_void(l6), a2));
				} else {
					R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a4:((T56*)(a2))->a4));
				}
			} else {
				R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
			}
		} else {
			t3 = (T168x6280(GE_void(a1)));
			R = (T959x6185T0T0(GE_void(l1), t3, a2));
		}
	} else {
		R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	}
	return R;
}

/* ET_TUPLE_TYPE.base_class */
T0* T312f9(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a77:((T56*)(a2))->a47));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_class */
T0* T174f8(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = ((T174*)(C))->a1;
	return R;
}

/* ET_CLASS_TYPE.base_class */
T0* T172f8(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = ((T172*)(C))->a3;
	return R;
}

/* ET_CLASS.base_class */
T0* T60f76(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = ((T60*)(C))->a8;
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.position */
T0* T956f27(T0* C)
{
	T0* R = 0;
	R = (T129f33(GE_void(((T956*)(C))->a1)));
	return R;
}

/* ET_LIKE_CURRENT.position */
T0* T716f28(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T716*)(C))->a1)));
	t1 = (((((T0*)(GE_void(R)))->id==179)?T179f15(R):T197f20(R)));
	if (t1) {
		R = (T197f11(GE_void(((T716*)(C))->a2)));
	}
	return R;
}

/* ET_LIKE_FEATURE.position */
T0* T714f9(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T179f9(GE_void(((T714*)(C))->a1)));
	t1 = (((((T0*)(GE_void(R)))->id==179)?T179f15(R):T129f47(R)));
	if (t1) {
		R = (T129f33(GE_void(((T714*)(C))->a2)));
	}
	return R;
}

/* ET_BIT_FEATURE.position */
T0* T578f11(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T129f33(GE_void(((T578*)(C))->a1)));
	t1 = (T129f47(GE_void(R)));
	if (t1) {
		R = (T129f33(GE_void(((T578*)(C))->a2)));
	}
	return R;
}

/* ET_BIT_N.position */
T0* T577f8(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = (T129f33(GE_void(((T577*)(C))->a3)));
	t1 = (T269x11814(GE_void(R)));
	if (t1) {
		R = (T477x6246(GE_void(((T577*)(C))->a1)));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.position */
T0* T565f59(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T565*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		R = (T179f9(GE_void(((T565*)(C))->a4)));
	} else {
		R = (T129f33(GE_void(((T565*)(C))->a5)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER.position */
T0* T557f57(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T557*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T179f9(GE_void(((T557*)(C))->a3)));
	} else {
		R = (T129f33(GE_void(((T557*)(C))->a1)));
	}
	return R;
}

/* ET_TUPLE_TYPE.position */
T0* T312f31(T0* C)
{
	T0* R = 0;
	R = (T129f33(GE_void(((T312*)(C))->a1)));
	return R;
}

/* ET_FORMAL_PARAMETER_TYPE.same_named_type */
T1 T956f9(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T956*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T956*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6220T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6210T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LIKE_CURRENT.same_named_type */
T1 T716f9(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T168x6298T0T0T0(GE_void(a3), a1, a2, a4));
	}
	return R;
}

/* ET_LIKE_FEATURE.same_named_type */
T1 T714f17(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T714*)(C))->a3)==((T6)(GE_int32(0))));
		if (t1) {
			R = EIF_FALSE;
		} else {
			t1 = (T714f36(C));
			if (t1) {
				l1 = (T168x6282T0(GE_void(a3), a4));
				l2 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				t1 = ((l2)!=(EIF_VOID));
				if (t1) {
					l4 = (T200x12627(GE_void(l2)));
					l5 = (T714f38(C));
					t1 = ((l4)==(EIF_VOID));
					if (!(t1)) {
						t2 = (((T235*)(GE_void(l4)))->a3);
						t1 = (T6f1(&l5, t2));
					}
					if (t1) {
						R = EIF_FALSE;
					} else {
						t3 = (T235f11(GE_void(l4), l5));
						t3 = (((((T0*)(GE_void(t3)))->id==240)?T240f4(t3):T963f4(t3)));
						R = (T167x6210T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
					}
				} else {
					R = EIF_FALSE;
				}
			} else {
				l1 = (T168x6282T0(GE_void(a3), a4));
				l3 = (T60f70(GE_void(l1), ((T714*)(C))->a3));
				t1 = ((l3)!=(EIF_VOID));
				if (t1) {
					t3 = (T160x12626(GE_void(l3)));
					R = (T167x6210T0T0T0T0(GE_void(t3), a1, a2, a3, a4));
				} else {
					R = EIF_FALSE;
				}
			}
		}
	}
	return R;
}

/* ET_BIT_FEATURE.same_named_type */
T1 T578f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6218T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_BIT_N.same_named_type */
T1 T577f20(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6218T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_CONSTRAINED_FORMAL_PARAMETER.same_named_type */
T1 T565f22(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T565*)(C))->a6), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T565*)(C))->a6, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6220T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6210T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_FORMAL_PARAMETER.same_named_type */
T1 T557f19(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T168x6288T0(GE_void(a3), a4));
	t2 = (T6f13(&(((T557*)(C))->a2), t1));
	if (t2) {
		l1 = (T168x6284T6T0(GE_void(a3), ((T557*)(C))->a2, a4));
		if ((l1)==EIF_VOID) {
			l2 = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 557:
			case 565:
			case 956:
				l2 = l1;
				break;
			default:
				l2 = EIF_VOID;
			}
		}
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t3 = (T168x6280(GE_void(a3)));
			R = (T167x6220T0T0T0T0(GE_void(a1), l2, t3, a2, a4));
		} else {
			t3 = (T168x6280(GE_void(a3)));
			R = (T959x6210T0T0T0T0(GE_void(l1), a1, a2, t3, a4));
		}
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_TUPLE_TYPE.same_named_type */
T1 T312f13(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6221T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_named_type */
T1 T174f26(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6219T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_named_type */
T1 T172f10(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6219T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS.same_named_type */
T1 T60f83(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6219T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.new_synonym */
T0* T667f31(T0* C, T0* a1)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	R = T667c72(a1, ((T667*)(C))->a3, ((T667*)(C))->a1, ((T667*)(C))->a2);
	T667f75(GE_void(R), ((T667*)(C))->a11);
	T667f76(GE_void(R), ((T667*)(C))->a12);
	T667f77(GE_void(R), ((T667*)(C))->a13);
	T667f78(GE_void(R), ((T667*)(C))->a14);
	T667f79(GE_void(R), ((T667*)(C))->a7);
	T667f74(GE_void(R), ((T667*)(C))->a10);
	T667f91(GE_void(R), ((T667*)(C))->a6);
	T667f92(GE_void(R), ((T667*)(C))->a23);
	T667f93(GE_void(R), ((T667*)(C))->a24);
	T667f80(GE_void(R), ((T667*)(C))->a15);
	T667f94(GE_void(R), C);
	t1 = (T667f35(C));
	if (t1) {
		t2 = (T667f32(C));
		t3 = ((T6)(GE_int32(1)));
		T667f73(GE_void(R), t3);
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.set_synonym */
void T667f94(T0* C, T0* a1)
{
	((T667*)(C))->a29 = a1;
}

/* ET_ONCE_PROCEDURE.new_synonym */
T0* T666f40(T0* C, T0* a1)
{
	T0* R = 0;
	R = T666c69(a1, ((T666*)(C))->a3, ((T666*)(C))->a6);
	T666f71(GE_void(R), ((T666*)(C))->a9);
	T666f72(GE_void(R), ((T666*)(C))->a10);
	T666f73(GE_void(R), ((T666*)(C))->a11);
	T666f74(GE_void(R), ((T666*)(C))->a12);
	T666f75(GE_void(R), ((T666*)(C))->a13);
	T666f76(GE_void(R), ((T666*)(C))->a14);
	T666f77(GE_void(R), ((T666*)(C))->a5);
	T666f70(GE_void(R), ((T666*)(C))->a8);
	T666f89(GE_void(R), ((T666*)(C))->a4);
	T666f90(GE_void(R), ((T666*)(C))->a22);
	T666f91(GE_void(R), ((T666*)(C))->a23);
	T666f78(GE_void(R), ((T666*)(C))->a15);
	T666f92(GE_void(R), C);
	return R;
}

/* ET_ONCE_PROCEDURE.set_synonym */
void T666f92(T0* C, T0* a1)
{
	((T666*)(C))->a29 = a1;
}

/* ET_DEFERRED_PROCEDURE.new_synonym */
T0* T327f33(T0* C, T0* a1)
{
	T0* R = 0;
	R = T327c68(a1, ((T327*)(C))->a2, ((T327*)(C))->a8);
	T327f70(GE_void(R), ((T327*)(C))->a10);
	T327f71(GE_void(R), ((T327*)(C))->a11);
	T327f72(GE_void(R), ((T327*)(C))->a12);
	T327f73(GE_void(R), ((T327*)(C))->a7);
	T327f69(GE_void(R), ((T327*)(C))->a9);
	T327f85(GE_void(R), ((T327*)(C))->a4);
	T327f86(GE_void(R), ((T327*)(C))->a6);
	T327f87(GE_void(R), ((T327*)(C))->a19);
	T327f88(GE_void(R), ((T327*)(C))->a20);
	T327f74(GE_void(R), ((T327*)(C))->a13);
	T327f89(GE_void(R), C);
	return R;
}

/* ET_DEFERRED_PROCEDURE.set_synonym */
void T327f89(T0* C, T0* a1)
{
	((T327*)(C))->a27 = a1;
}

/* ET_DO_PROCEDURE.new_synonym */
T0* T322f35(T0* C, T0* a1)
{
	T0* R = 0;
	R = T322c69(a1, ((T322*)(C))->a2, ((T322*)(C))->a7);
	T322f71(GE_void(R), ((T322*)(C))->a9);
	T322f72(GE_void(R), ((T322*)(C))->a10);
	T322f73(GE_void(R), ((T322*)(C))->a11);
	T322f74(GE_void(R), ((T322*)(C))->a12);
	T322f75(GE_void(R), ((T322*)(C))->a13);
	T322f76(GE_void(R), ((T322*)(C))->a14);
	T322f77(GE_void(R), ((T322*)(C))->a6);
	T322f70(GE_void(R), ((T322*)(C))->a8);
	T322f89(GE_void(R), ((T322*)(C))->a5);
	T322f90(GE_void(R), ((T322*)(C))->a21);
	T322f91(GE_void(R), ((T322*)(C))->a22);
	T322f78(GE_void(R), ((T322*)(C))->a15);
	T322f92(GE_void(R), C);
	return R;
}

/* ET_DO_PROCEDURE.set_synonym */
void T322f92(T0* C, T0* a1)
{
	((T322*)(C))->a29 = a1;
}

/* ET_EXTERNAL_PROCEDURE.is_deferred */
T1 T667f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_PROCEDURE.is_deferred */
T1 T666f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_PROCEDURE.is_deferred */
T1 T322f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_frozen */
T1 T667f30(T0* C)
{
	T1 R = 0;
	R = ((((T667*)(C))->a22)!=(EIF_VOID));
	return R;
}

/* ET_ONCE_PROCEDURE.is_frozen */
T1 T666f30(T0* C)
{
	T1 R = 0;
	R = ((((T666*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_frozen */
T1 T327f28(T0* C)
{
	T1 R = 0;
	R = ((((T327*)(C))->a22)!=(EIF_VOID));
	return R;
}

/* ET_DO_PROCEDURE.is_frozen */
T1 T322f30(T0* C)
{
	T1 R = 0;
	R = ((((T322*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.has_seed */
T1 T667f38(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T667*)(C))->a16)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T667*)(C))->a21)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T667*)(C))->a21), a1));
		}
	}
	return R;
}

/* ET_ONCE_PROCEDURE.has_seed */
T1 T666f37(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T666*)(C))->a16)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T666*)(C))->a21)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T666*)(C))->a21), a1));
		}
	}
	return R;
}

/* ET_DEFERRED_PROCEDURE.has_seed */
T1 T327f35(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T327*)(C))->a14)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T327*)(C))->a21)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T327*)(C))->a21), a1));
		}
	}
	return R;
}

/* ET_DO_PROCEDURE.has_seed */
T1 T322f37(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T322*)(C))->a16)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T322*)(C))->a23)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T322*)(C))->a23), a1));
		}
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_creation_exported_to */
T1 T667f43(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	t1 = (T667f40(C));
	t2 = (T60f140(GE_void(a2), t1, a1, a3));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a26);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f79(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t1 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a62:((T56*)(a3))->a70));
			T60f164(GE_void(a2), t1);
			t4 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a8:((T56*)(a3))->a8));
			R = (T667f38(C, t4));
		}
	}
	return R;
}

/* ET_CLASS.is_creation_exported_to */
T1 T60f140(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T60*)(C))->a26)!=(EIF_VOID));
	if (t1) {
		R = (T527f8(GE_void(((T60*)(C))->a26), a1, a2, a3));
	}
	return R;
}

/* ET_CREATOR_LIST.is_exported_to */
T1 T527f8(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T6)((((T527*)(C))->a1)-((T6)(GE_int32(1)))));
	l1 = (T6)(GE_int32(0));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T621*)(GE_void(((T527*)(C))->a2)))->z2[l1]);
		t1 = (T620f13(GE_void(t2), a1, a2, a3));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_CREATOR.is_exported_to */
T1 T620f13(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T1 t1;
	t1 = (T620f9(C));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t1 = (((((T0*)(GE_void(((T620*)(C))->a2)))->id==443)?T443f8(((T620*)(C))->a2, a2, a3):T444f11(((T620*)(C))->a2, a2, a3)));
		if (t1) {
			R = (T620f10(C, a1));
		}
	}
	return R;
}

/* ET_CLIENTS.has_descendant */
T1 T444f11(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	t1 = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a3:((T56*)(a2))->a3));
	t2 = ((a1)==(t1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t2 = (T60f71(GE_void(a1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			if (((T0*)(GE_void(a2)))->id==53) {
				T53f204(a2);
			} else {
				T56f196(a2);
			}
		}
		t2 = (T60f71(GE_void(a1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			R = (T444f7(C, a1));
		} else {
			t1 = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a61:((T56*)(a2))->a53));
			T60f164(GE_void(a1), t1);
			t2 = (((T60*)(GE_void(a1)))->a23);
			if (t2) {
				t3 = (((T60*)(GE_void(a1)))->a24);
				t2 = ((T1)(!(t3)));
			}
			if (t2) {
				l2 = ((T6)((((T444*)(C))->a3)-((T6)(GE_int32(1)))));
				l1 = (T6)(GE_int32(0));
				t2 = (T6f1(&l1, l2));
				while (!(t2)) {
					t1 = (((T615*)(GE_void(((T444*)(C))->a4)))->z2[l1]);
					l3 = (T129f54(GE_void(t1)));
					t2 = (((((T0*)(GE_void(a2)))->id==53)?T53f160(a2, l3):T56f156(a2, l3)));
					if (t2) {
						t1 = (((((T0*)(GE_void(a2)))->id==53)?T53f156(a2, l3):T56f149(a2, l3)));
						t2 = (T60f157(GE_void(a1), t1, a2));
						if (t2) {
							R = EIF_TRUE;
							l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					} else {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					t2 = (T6f1(&l1, l2));
				}
			}
		}
	}
	return R;
}

/* ET_CLASS.has_ancestor */
T1 T60f157(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	t1 = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a5:((T56*)(a2))->a5));
	t2 = ((C)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t1 = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a3:((T56*)(a2))->a3));
			t2 = ((C)==(t1));
			if (t2) {
				R = EIF_TRUE;
			} else {
				R = (T320f6(GE_void(((T60*)(C))->a3), a1, a2));
			}
		}
	}
	return R;
}

/* ET_BASE_TYPE_LIST.has_class */
T1 T320f6(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T1 t1;
	T0* t2;
	l2 = ((T320*)(C))->a1;
	l1 = (T6)(GE_int32(1));
	t1 = (T6f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T1006*)(GE_void(((T320*)(C))->a2)))->z2[l1]);
		t2 = (T158x6184T0(GE_void(t2), a2));
		t1 = ((t2)==(a1));
		if (t1) {
			R = EIF_TRUE;
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		} else {
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l1, l2));
	}
	return R;
}

/* ET_CLASS_NAME_LIST.has_descendant */
T1 T443f8(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	t1 = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a3:((T56*)(a2))->a3));
	t2 = ((a1)==(t1));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t2 = (T60f71(GE_void(a1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			if (((T0*)(GE_void(a2)))->id==53) {
				T53f204(a2);
			} else {
				T56f196(a2);
			}
		}
		t2 = (T60f71(GE_void(a1)));
		t2 = ((T1)(!(t2)));
		if (t2) {
			R = (T443f5(C, a1));
		} else {
			t1 = (((((T0*)(GE_void(a2)))->id==53)?((T53*)(a2))->a61:((T56*)(a2))->a53));
			T60f164(GE_void(a1), t1);
			t2 = (((T60*)(GE_void(a1)))->a23);
			if (t2) {
				t3 = (((T60*)(GE_void(a1)))->a24);
				t2 = ((T1)(!(t3)));
			}
			if (t2) {
				l2 = ((T6)((((T443*)(C))->a1)-((T6)(GE_int32(1)))));
				l1 = (T6)(GE_int32(0));
				t2 = (T6f1(&l1, l2));
				while (!(t2)) {
					t1 = (((T615*)(GE_void(((T443*)(C))->a2)))->z2[l1]);
					l3 = (T129f54(GE_void(t1)));
					t2 = (((((T0*)(GE_void(a2)))->id==53)?T53f160(a2, l3):T56f156(a2, l3)));
					if (t2) {
						t1 = (((((T0*)(GE_void(a2)))->id==53)?T53f156(a2, l3):T56f149(a2, l3)));
						t2 = (T60f157(GE_void(a1), t1, a2));
						if (t2) {
							R = EIF_TRUE;
							l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
						} else {
							l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						}
					} else {
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
					}
					t2 = (T6f1(&l1, l2));
				}
			}
		}
	}
	return R;
}

/* ET_ONCE_PROCEDURE.is_creation_exported_to */
T1 T666f42(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	t1 = (T666f39(C));
	t2 = (T60f140(GE_void(a2), t1, a1, a3));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a26);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f79(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t1 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a62:((T56*)(a3))->a70));
			T60f164(GE_void(a2), t1);
			t4 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a8:((T56*)(a3))->a8));
			R = (T666f37(C, t4));
		}
	}
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_creation_exported_to */
T1 T327f40(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	t1 = (T327f37(C));
	t2 = (T60f140(GE_void(a2), t1, a1, a3));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a26);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f79(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t1 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a62:((T56*)(a3))->a70));
			T60f164(GE_void(a2), t1);
			t4 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a8:((T56*)(a3))->a8));
			R = (T327f35(C, t4));
		}
	}
	return R;
}

/* ET_DO_PROCEDURE.is_creation_exported_to */
T1 T322f42(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T1 t3;
	T6 t4;
	t1 = (T322f36(C));
	t2 = (T60f140(GE_void(a2), t1, a1, a3));
	if (t2) {
		R = EIF_TRUE;
	} else {
		t1 = (((T60*)(GE_void(a2)))->a26);
		t2 = ((t1)==(EIF_VOID));
		if (t2) {
			t3 = (T60f79(GE_void(a2)));
			t2 = ((T1)(!(t3)));
		}
		if (t2) {
			t1 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a62:((T56*)(a3))->a70));
			T60f164(GE_void(a2), t1);
			t4 = (((((T0*)(GE_void(a3)))->id==53)?((T53*)(a3))->a8:((T56*)(a3))->a8));
			R = (T322f37(C, t4));
		}
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.name */
T0* T667f40(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T667*)(C))->a4)));
	return R;
}

/* ET_ONCE_PROCEDURE.name */
T0* T666f39(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T666*)(C))->a1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.name */
T0* T327f37(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T327*)(C))->a3)));
	return R;
}

/* ET_DO_PROCEDURE.name */
T0* T322f36(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T322*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.overloaded_name */
T0* T667f61(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T667f64(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.overloaded_extended_name */
T0* T667f64(T0* C)
{
	T0* R = 0;
	R = ((T667*)(C))->a4;
	return R;
}

/* ET_ONCE_PROCEDURE.overloaded_name */
T0* T666f58(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T666f61(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_ONCE_PROCEDURE.overloaded_extended_name */
T0* T666f61(T0* C)
{
	T0* R = 0;
	R = ((T666*)(C))->a1;
	return R;
}

/* ET_DEFERRED_PROCEDURE.overloaded_name */
T0* T327f57(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T327f60(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.overloaded_extended_name */
T0* T327f60(T0* C)
{
	T0* R = 0;
	R = ((T327*)(C))->a3;
	return R;
}

/* ET_DO_PROCEDURE.overloaded_name */
T0* T322f58(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T322f61(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_DO_PROCEDURE.overloaded_extended_name */
T0* T322f61(T0* C)
{
	T0* R = 0;
	R = ((T322*)(C))->a3;
	return R;
}

/* ET_EXTERNAL_PROCEDURE.alias_name */
T0* T667f39(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T667*)(C))->a4)));
	return R;
}

/* ET_ONCE_PROCEDURE.alias_name */
T0* T666f38(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T666*)(C))->a1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.alias_name */
T0* T327f36(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T327*)(C))->a3)));
	return R;
}

/* ET_DO_PROCEDURE.alias_name */
T0* T322f38(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T322*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.overloaded_alias_name */
T0* T667f62(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T667f64(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_ONCE_PROCEDURE.overloaded_alias_name */
T0* T666f59(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T666f61(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.overloaded_alias_name */
T0* T327f58(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T327f60(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_DO_PROCEDURE.overloaded_alias_name */
T0* T322f59(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T322f61(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_PROCEDURE.arguments_count */
T6 T667f50(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T667*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_ONCE_PROCEDURE.arguments_count */
T6 T666f48(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T666*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_DEFERRED_PROCEDURE.arguments_count */
T6 T327f46(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T327*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_DO_PROCEDURE.arguments_count */
T6 T322f48(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T322*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_EXTERNAL_PROCEDURE.is_exported_to */
T1 T667f49(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T667*)(C))->a7)))->id==443)?T443f8(((T667*)(C))->a7, a1, a2):T444f11(((T667*)(C))->a7, a1, a2)));
	return R;
}

/* ET_ONCE_PROCEDURE.is_exported_to */
T1 T666f47(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T666*)(C))->a5)))->id==443)?T443f8(((T666*)(C))->a5, a1, a2):T444f11(((T666*)(C))->a5, a1, a2)));
	return R;
}

/* ET_DEFERRED_PROCEDURE.is_exported_to */
T1 T327f45(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T327*)(C))->a7)))->id==443)?T443f8(((T327*)(C))->a7, a1, a2):T444f11(((T327*)(C))->a7, a1, a2)));
	return R;
}

/* ET_DO_PROCEDURE.is_exported_to */
T1 T322f47(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T322*)(C))->a6)))->id==443)?T443f8(((T322*)(C))->a6, a1, a2):T444f11(((T322*)(C))->a6, a1, a2)));
	return R;
}

/* ET_DEFERRED_FUNCTION.new_synonym */
T0* T661f46(T0* C, T0* a1)
{
	T0* R = 0;
	R = T661c69(a1, ((T661*)(C))->a4, ((T661*)(C))->a5, ((T661*)(C))->a8);
	T661f71(GE_void(R), ((T661*)(C))->a11);
	T661f72(GE_void(R), ((T661*)(C))->a12);
	T661f73(GE_void(R), ((T661*)(C))->a13);
	T661f74(GE_void(R), ((T661*)(C))->a14);
	T661f75(GE_void(R), ((T661*)(C))->a7);
	T661f70(GE_void(R), ((T661*)(C))->a10);
	T661f87(GE_void(R), ((T661*)(C))->a1);
	T661f88(GE_void(R), ((T661*)(C))->a6);
	T661f89(GE_void(R), ((T661*)(C))->a22);
	T661f90(GE_void(R), ((T661*)(C))->a23);
	T661f76(GE_void(R), ((T661*)(C))->a15);
	T661f91(GE_void(R), C);
	return R;
}

/* ET_DEFERRED_FUNCTION.set_synonym */
void T661f91(T0* C, T0* a1)
{
	((T661*)(C))->a29 = a1;
}

/* ET_ONCE_FUNCTION.new_synonym */
T0* T660f48(T0* C, T0* a1)
{
	T0* R = 0;
	R = T660c70(a1, ((T660*)(C))->a3, ((T660*)(C))->a4, ((T660*)(C))->a7);
	T660f72(GE_void(R), ((T660*)(C))->a10);
	T660f73(GE_void(R), ((T660*)(C))->a11);
	T660f74(GE_void(R), ((T660*)(C))->a12);
	T660f75(GE_void(R), ((T660*)(C))->a13);
	T660f76(GE_void(R), ((T660*)(C))->a14);
	T660f77(GE_void(R), ((T660*)(C))->a15);
	T660f78(GE_void(R), ((T660*)(C))->a16);
	T660f79(GE_void(R), ((T660*)(C))->a6);
	T660f71(GE_void(R), ((T660*)(C))->a9);
	T660f91(GE_void(R), ((T660*)(C))->a5);
	T660f92(GE_void(R), ((T660*)(C))->a24);
	T660f93(GE_void(R), ((T660*)(C))->a25);
	T660f80(GE_void(R), ((T660*)(C))->a17);
	T660f94(GE_void(R), C);
	return R;
}

/* ET_ONCE_FUNCTION.set_synonym */
void T660f94(T0* C, T0* a1)
{
	((T660*)(C))->a31 = a1;
}

/* ET_DO_FUNCTION.new_synonym */
T0* T658f48(T0* C, T0* a1)
{
	T0* R = 0;
	R = T658c70(a1, ((T658*)(C))->a3, ((T658*)(C))->a4, ((T658*)(C))->a7);
	T658f72(GE_void(R), ((T658*)(C))->a10);
	T658f73(GE_void(R), ((T658*)(C))->a11);
	T658f74(GE_void(R), ((T658*)(C))->a12);
	T658f75(GE_void(R), ((T658*)(C))->a13);
	T658f76(GE_void(R), ((T658*)(C))->a14);
	T658f77(GE_void(R), ((T658*)(C))->a15);
	T658f78(GE_void(R), ((T658*)(C))->a16);
	T658f79(GE_void(R), ((T658*)(C))->a6);
	T658f71(GE_void(R), ((T658*)(C))->a9);
	T658f91(GE_void(R), ((T658*)(C))->a5);
	T658f92(GE_void(R), ((T658*)(C))->a24);
	T658f93(GE_void(R), ((T658*)(C))->a25);
	T658f80(GE_void(R), ((T658*)(C))->a17);
	T658f94(GE_void(R), C);
	return R;
}

/* ET_DO_FUNCTION.set_synonym */
void T658f94(T0* C, T0* a1)
{
	((T658*)(C))->a31 = a1;
}

/* ET_ATTRIBUTE.new_synonym */
T0* T254f40(T0* C, T0* a1)
{
	T0* R = 0;
	R = T254c66(a1, ((T254*)(C))->a3, ((T254*)(C))->a5);
	T254f67(GE_void(R), ((T254*)(C))->a7);
	T254f68(GE_void(R), ((T254*)(C))->a4);
	T254f75(GE_void(R), ((T254*)(C))->a12);
	T254f76(GE_void(R), ((T254*)(C))->a13);
	T254f77(GE_void(R), ((T254*)(C))->a14);
	T254f78(GE_void(R), C);
	return R;
}

/* ET_ATTRIBUTE.set_synonym */
void T254f78(T0* C, T0* a1)
{
	((T254*)(C))->a20 = a1;
}

/* ET_UNIQUE_ATTRIBUTE.new_synonym */
T0* T253f42(T0* C, T0* a1)
{
	T0* R = 0;
	R = T253c68(a1, ((T253*)(C))->a3, ((T253*)(C))->a7);
	T253f69(GE_void(R), ((T253*)(C))->a9);
	T253f70(GE_void(R), ((T253*)(C))->a6);
	T253f77(GE_void(R), ((T253*)(C))->a4);
	T253f78(GE_void(R), ((T253*)(C))->a5);
	T253f79(GE_void(R), ((T253*)(C))->a15);
	T253f80(GE_void(R), ((T253*)(C))->a16);
	T253f81(GE_void(R), ((T253*)(C))->a17);
	T253f82(GE_void(R), C);
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.set_synonym */
void T253f82(T0* C, T0* a1)
{
	((T253*)(C))->a22 = a1;
}

/* ET_CONSTANT_ATTRIBUTE.new_synonym */
T0* T251f42(T0* C, T0* a1)
{
	T0* R = 0;
	R = T251c68(a1, ((T251*)(C))->a3, ((T251*)(C))->a5, ((T251*)(C))->a7);
	T251f69(GE_void(R), ((T251*)(C))->a9);
	T251f70(GE_void(R), ((T251*)(C))->a6);
	T251f77(GE_void(R), ((T251*)(C))->a4);
	T251f78(GE_void(R), ((T251*)(C))->a14);
	T251f79(GE_void(R), ((T251*)(C))->a15);
	T251f80(GE_void(R), ((T251*)(C))->a16);
	T251f81(GE_void(R), C);
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.set_synonym */
void T251f81(T0* C, T0* a1)
{
	((T251*)(C))->a22 = a1;
}

/* ET_EXTERNAL_FUNCTION.new_synonym */
T0* T176f40(T0* C, T0* a1)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	T6 t3;
	R = T176c73(a1, ((T176*)(C))->a3, ((T176*)(C))->a5, ((T176*)(C))->a1, ((T176*)(C))->a2);
	T176f76(GE_void(R), ((T176*)(C))->a12);
	T176f77(GE_void(R), ((T176*)(C))->a13);
	T176f78(GE_void(R), ((T176*)(C))->a14);
	T176f79(GE_void(R), ((T176*)(C))->a15);
	T176f80(GE_void(R), ((T176*)(C))->a16);
	T176f81(GE_void(R), ((T176*)(C))->a8);
	T176f75(GE_void(R), ((T176*)(C))->a11);
	T176f89(GE_void(R), ((T176*)(C))->a7);
	T176f90(GE_void(R), ((T176*)(C))->a21);
	T176f91(GE_void(R), ((T176*)(C))->a22);
	T176f82(GE_void(R), ((T176*)(C))->a17);
	T176f92(GE_void(R), C);
	t1 = (T176f38(C));
	if (t1) {
		t2 = (T176f47(C));
		t3 = ((T6)(GE_int32(1)));
		T176f74(GE_void(R), t3);
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.set_synonym */
void T176f92(T0* C, T0* a1)
{
	((T176*)(C))->a29 = a1;
}

/* ET_ONCE_FUNCTION.is_deferred */
T1 T660f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_deferred */
T1 T658f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_deferred */
T1 T254f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_deferred */
T1 T253f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_deferred */
T1 T251f45(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_deferred */
T1 T176f49(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_frozen */
T1 T661f30(T0* C)
{
	T1 R = 0;
	R = ((((T661*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_ONCE_FUNCTION.is_frozen */
T1 T660f32(T0* C)
{
	T1 R = 0;
	R = ((((T660*)(C))->a26)!=(EIF_VOID));
	return R;
}

/* ET_DO_FUNCTION.is_frozen */
T1 T658f32(T0* C)
{
	T1 R = 0;
	R = ((((T658*)(C))->a26)!=(EIF_VOID));
	return R;
}

/* ET_ATTRIBUTE.is_frozen */
T1 T254f23(T0* C)
{
	T1 R = 0;
	R = ((((T254*)(C))->a15)!=(EIF_VOID));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_frozen */
T1 T253f26(T0* C)
{
	T1 R = 0;
	R = ((((T253*)(C))->a18)!=(EIF_VOID));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_frozen */
T1 T251f25(T0* C)
{
	T1 R = 0;
	R = ((((T251*)(C))->a17)!=(EIF_VOID));
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_frozen */
T1 T176f32(T0* C)
{
	T1 R = 0;
	R = ((((T176*)(C))->a24)!=(EIF_VOID));
	return R;
}

/* ET_DEFERRED_FUNCTION.is_bracketable */
T1 T661f33(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T661*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T661*)(C))->a4)))->a3);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ONCE_FUNCTION.is_bracketable */
T1 T660f35(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T660*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T660*)(C))->a3)))->a3);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DO_FUNCTION.is_bracketable */
T1 T658f35(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T658*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T658*)(C))->a3)))->a3);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ATTRIBUTE.is_bracketable */
T1 T254f26(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_bracketable */
T1 T253f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_bracketable */
T1 T251f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_bracketable */
T1 T176f35(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T176*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T176*)(C))->a3)))->a3);
		R = (T6f1(&t2, (T6)(GE_int32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_prefixable */
T1 T661f31(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T661*)(C))->a4)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T235*)(GE_void(((T661*)(C))->a4)))->a3);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_ONCE_FUNCTION.is_prefixable */
T1 T660f33(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T660*)(C))->a3)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T235*)(GE_void(((T660*)(C))->a3)))->a3);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_DO_FUNCTION.is_prefixable */
T1 T658f33(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T658*)(C))->a3)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T235*)(GE_void(((T658*)(C))->a3)))->a3);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_prefixable */
T1 T176f33(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T176*)(C))->a3)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T235*)(GE_void(((T176*)(C))->a3)))->a3);
		R = ((t2)==((T6)(GE_int32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_infixable */
T1 T661f32(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T661*)(C))->a4)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T661*)(C))->a4)))->a3);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ONCE_FUNCTION.is_infixable */
T1 T660f34(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T660*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T660*)(C))->a3)))->a3);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DO_FUNCTION.is_infixable */
T1 T658f34(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T658*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T658*)(C))->a3)))->a3);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ATTRIBUTE.is_infixable */
T1 T254f25(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_infixable */
T1 T253f28(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_infixable */
T1 T251f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_infixable */
T1 T176f34(T0* C)
{
	T1 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T176*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T235*)(GE_void(((T176*)(C))->a3)))->a3);
		R = ((t2)==((T6)(GE_int32(1))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_once */
T1 T661f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_once */
T1 T658f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_once */
T1 T254f27(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_once */
T1 T253f30(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_once */
T1 T251f29(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_once */
T1 T176f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_constant_attribute */
T1 T661f40(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_constant_attribute */
T1 T660f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_constant_attribute */
T1 T658f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_constant_attribute */
T1 T254f33(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_constant_attribute */
T1 T253f36(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_constant_attribute */
T1 T176f43(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.is_unique_attribute */
T1 T661f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_unique_attribute */
T1 T660f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_unique_attribute */
T1 T658f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ATTRIBUTE.is_unique_attribute */
T1 T254f35(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_unique_attribute */
T1 T251f37(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_unique_attribute */
T1 T176f44(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.has_seed */
T1 T661f43(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T661*)(C))->a16)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T661*)(C))->a21)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T661*)(C))->a21), a1));
		}
	}
	return R;
}

/* ET_ONCE_FUNCTION.has_seed */
T1 T660f45(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T660*)(C))->a18)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T660*)(C))->a23)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T660*)(C))->a23), a1));
		}
	}
	return R;
}

/* ET_DO_FUNCTION.has_seed */
T1 T658f45(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T658*)(C))->a18)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T658*)(C))->a23)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T658*)(C))->a23), a1));
		}
	}
	return R;
}

/* ET_ATTRIBUTE.has_seed */
T1 T254f37(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T254*)(C))->a8)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T254*)(C))->a11)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T254*)(C))->a11), a1));
		}
	}
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.has_seed */
T1 T253f40(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T253*)(C))->a10)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T253*)(C))->a14)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T253*)(C))->a14), a1));
		}
	}
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.has_seed */
T1 T251f39(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T251*)(C))->a10)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T251*)(C))->a13)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T251*)(C))->a13), a1));
		}
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.has_seed */
T1 T176f45(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T176*)(C))->a18)==(a1));
	if (t1) {
		R = EIF_TRUE;
	} else {
		t1 = ((((T176*)(C))->a23)!=(EIF_VOID));
		if (t1) {
			R = (T1222f7(GE_void(((T176*)(C))->a23), a1));
		}
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_attribute */
T1 T661f39(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_ONCE_FUNCTION.is_attribute */
T1 T660f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DO_FUNCTION.is_attribute */
T1 T658f41(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_attribute */
T1 T253f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_attribute */
T1 T251f34(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_attribute */
T1 T176f42(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.arguments_count */
T6 T661f35(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T661*)(C))->a4;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_ONCE_FUNCTION.arguments_count */
T6 T660f37(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T660*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_DO_FUNCTION.arguments_count */
T6 T658f37(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T658*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_ATTRIBUTE.arguments_count */
T6 T254f28(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T254f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.arguments_count */
T6 T253f31(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T253f39(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.arguments_count */
T6 T251f30(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T251f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_EXTERNAL_FUNCTION.arguments_count */
T6 T176f37(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T176*)(C))->a3;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T235*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_DEFERRED_FUNCTION.is_exported_to */
T1 T661f52(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T661*)(C))->a7)))->id==443)?T443f8(((T661*)(C))->a7, a1, a2):T444f11(((T661*)(C))->a7, a1, a2)));
	return R;
}

/* ET_ONCE_FUNCTION.is_exported_to */
T1 T660f53(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T660*)(C))->a6)))->id==443)?T443f8(((T660*)(C))->a6, a1, a2):T444f11(((T660*)(C))->a6, a1, a2)));
	return R;
}

/* ET_DO_FUNCTION.is_exported_to */
T1 T658f53(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T658*)(C))->a6)))->id==443)?T443f8(((T658*)(C))->a6, a1, a2):T444f11(((T658*)(C))->a6, a1, a2)));
	return R;
}

/* ET_ATTRIBUTE.is_exported_to */
T1 T254f48(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T254*)(C))->a4)))->id==443)?T443f8(((T254*)(C))->a4, a1, a2):T444f11(((T254*)(C))->a4, a1, a2)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.is_exported_to */
T1 T253f50(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T253*)(C))->a6)))->id==443)?T443f8(((T253*)(C))->a6, a1, a2):T444f11(((T253*)(C))->a6, a1, a2)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.is_exported_to */
T1 T251f50(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T251*)(C))->a6)))->id==443)?T443f8(((T251*)(C))->a6, a1, a2):T444f11(((T251*)(C))->a6, a1, a2)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.is_exported_to */
T1 T176f56(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	R = (((((T0*)(GE_void(((T176*)(C))->a8)))->id==443)?T443f8(((T176*)(C))->a8, a1, a2):T444f11(((T176*)(C))->a8, a1, a2)));
	return R;
}

/* ET_ATTRIBUTE.arguments */
T0* T254f36(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.arguments */
T0* T253f39(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.arguments */
T0* T251f38(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_DEFERRED_FUNCTION.name */
T0* T661f45(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T661*)(C))->a2)));
	return R;
}

/* ET_ONCE_FUNCTION.name */
T0* T660f39(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T660*)(C))->a1)));
	return R;
}

/* ET_DO_FUNCTION.name */
T0* T658f39(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T658*)(C))->a1)));
	return R;
}

/* ET_ATTRIBUTE.name */
T0* T254f39(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T254*)(C))->a1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.name */
T0* T253f35(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T253*)(C))->a1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.name */
T0* T251f41(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T251*)(C))->a1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.name */
T0* T176f48(T0* C)
{
	T0* R = 0;
	R = (T323x11740(GE_void(((T176*)(C))->a4)));
	return R;
}

/* ET_DEFERRED_FUNCTION.overloaded_name */
T0* T661f62(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T661f64(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_FUNCTION.overloaded_extended_name */
T0* T661f64(T0* C)
{
	T0* R = 0;
	R = ((T661*)(C))->a2;
	return R;
}

/* ET_ONCE_FUNCTION.overloaded_name */
T0* T660f63(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T660f65(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_ONCE_FUNCTION.overloaded_extended_name */
T0* T660f65(T0* C)
{
	T0* R = 0;
	R = ((T660*)(C))->a1;
	return R;
}

/* ET_DO_FUNCTION.overloaded_name */
T0* T658f63(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T658f65(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_DO_FUNCTION.overloaded_extended_name */
T0* T658f65(T0* C)
{
	T0* R = 0;
	R = ((T658*)(C))->a1;
	return R;
}

/* ET_ATTRIBUTE.overloaded_name */
T0* T254f58(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T254f60(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_ATTRIBUTE.overloaded_extended_name */
T0* T254f60(T0* C)
{
	T0* R = 0;
	R = ((T254*)(C))->a1;
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.overloaded_name */
T0* T253f60(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T253f62(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.overloaded_extended_name */
T0* T253f62(T0* C)
{
	T0* R = 0;
	R = ((T253*)(C))->a1;
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.overloaded_name */
T0* T251f60(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T251f62(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.overloaded_extended_name */
T0* T251f62(T0* C)
{
	T0* R = 0;
	R = ((T251*)(C))->a1;
	return R;
}

/* ET_EXTERNAL_FUNCTION.overloaded_name */
T0* T176f66(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T176f68(C));
	R = (T323x11740(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.overloaded_extended_name */
T0* T176f68(T0* C)
{
	T0* R = 0;
	R = ((T176*)(C))->a4;
	return R;
}

/* ET_DEFERRED_FUNCTION.alias_name */
T0* T661f44(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T661*)(C))->a2)));
	return R;
}

/* ET_ONCE_FUNCTION.alias_name */
T0* T660f46(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T660*)(C))->a1)));
	return R;
}

/* ET_DO_FUNCTION.alias_name */
T0* T658f46(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T658*)(C))->a1)));
	return R;
}

/* ET_ATTRIBUTE.alias_name */
T0* T254f38(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T254*)(C))->a1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.alias_name */
T0* T253f41(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T253*)(C))->a1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.alias_name */
T0* T251f40(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T251*)(C))->a1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.alias_name */
T0* T176f46(T0* C)
{
	T0* R = 0;
	R = (T323x11741(GE_void(((T176*)(C))->a4)));
	return R;
}

/* ET_DEFERRED_FUNCTION.overloaded_alias_name */
T0* T661f63(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T661f64(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_ONCE_FUNCTION.overloaded_alias_name */
T0* T660f64(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T660f65(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_DO_FUNCTION.overloaded_alias_name */
T0* T658f64(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T658f65(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_ATTRIBUTE.overloaded_alias_name */
T0* T254f59(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T254f60(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.overloaded_alias_name */
T0* T253f61(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T253f62(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.overloaded_alias_name */
T0* T251f61(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T251f62(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.overloaded_alias_name */
T0* T176f67(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T176f68(C));
	R = (T323x11741(GE_void(t1)));
	return R;
}

/* ET_DEFERRED_FUNCTION.type */
T0* T661f41(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T661*)(C))->a5)));
	return R;
}

/* ET_ONCE_FUNCTION.type */
T0* T660f43(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T660*)(C))->a4)));
	return R;
}

/* ET_DO_FUNCTION.type */
T0* T658f43(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T658*)(C))->a4)));
	return R;
}

/* ET_ATTRIBUTE.type */
T0* T254f34(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T254*)(C))->a3)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.type */
T0* T253f37(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T253*)(C))->a3)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.type */
T0* T251f36(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T251*)(C))->a3)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.type */
T0* T176f41(T0* C)
{
	T0* R = 0;
	R = (T644x6277(GE_void(((T176*)(C))->a5)));
	return R;
}

/* ET_DEFERRED_FUNCTION.lower_name */
T0* T661f38(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T661f45(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_ONCE_FUNCTION.lower_name */
T0* T660f40(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T660f39(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_DO_FUNCTION.lower_name */
T0* T658f40(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T658f39(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_ATTRIBUTE.lower_name */
T0* T254f31(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T254f39(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_UNIQUE_ATTRIBUTE.lower_name */
T0* T253f33(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T253f35(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_CONSTANT_ATTRIBUTE.lower_name */
T0* T251f33(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T251f41(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_EXTERNAL_FUNCTION.lower_name */
T0* T176f39(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (T176f48(C));
	R = (T169x11699(GE_void(t1)));
	return R;
}

/* ET_BIT_FEATURE.same_base_type */
T1 T578f43(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6222T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_BIT_N.same_base_type */
T1 T577f41(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6222T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_TUPLE_TYPE.same_base_type */
T1 T312f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6225T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_base_type */
T1 T174f18(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6223T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_base_type */
T1 T172f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6223T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS.same_base_type */
T1 T60f81(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6223T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_expanded */
T1 T174f6(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T174*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T179f10(GE_void(((T174*)(C))->a3)));
	} else {
		R = (T60f63(GE_void(((T174*)(C))->a1)));
	}
	return R;
}

/* ET_CLASS_TYPE.is_expanded */
T1 T172f22(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T172*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T179f10(GE_void(((T172*)(C))->a1)));
	} else {
		R = (T60f63(GE_void(((T172*)(C))->a3)));
	}
	return R;
}

/* ET_CLASS.is_expanded */
T1 T60f63(T0* C)
{
	T1 R = 0;
	R = (T60f54(C));
	return R;
}

/* ET_CLASS.has_expanded_mark */
T1 T60f54(T0* C)
{
	T1 R = 0;
	T1 t1;
	t1 = ((((T60*)(C))->a13)!=(EIF_VOID));
	if (t1) {
		R = (T179f10(GE_void(((T60*)(C))->a13)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.same_syntactical_type */
T1 T174f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6213T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.same_syntactical_type */
T1 T172f7(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6213T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS.same_syntactical_type */
T1 T60f82(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6213T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.position */
T0* T174f37(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T174*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (T179f9(GE_void(((T174*)(C))->a3)));
	} else {
		R = (T129f33(GE_void(((T174*)(C))->a4)));
	}
	return R;
}

/* ET_CLASS_TYPE.position */
T0* T172f34(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T172*)(C))->a1)!=(EIF_VOID));
	if (t1) {
		R = (T179f9(GE_void(((T172*)(C))->a1)));
	} else {
		R = (T129f33(GE_void(((T172*)(C))->a2)));
	}
	return R;
}

/* ET_CLASS.position */
T0* T60f100(T0* C)
{
	T0* R = 0;
	T1 t1;
	t1 = ((((T60*)(C))->a40)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(((T60*)(C))->a40), (T0*)0));
	} else {
		t1 = ((((T60*)(C))->a13)!=(EIF_VOID));
		if (t1) {
			R = (T179f9(GE_void(((T60*)(C))->a13)));
		} else {
			R = (T179f9(GE_void(((T60*)(C))->a6)));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.unaliased_to_text */
T0* T578f27(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T578f102(C, R);
	return R;
}

/* ET_BIT_N.unaliased_to_text */
T0* T577f27(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T577f102(C, R);
	return R;
}

/* ET_TUPLE_TYPE.unaliased_to_text */
T0* T312f19(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T312f94(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.unaliased_to_text */
T0* T174f15(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T174f97(C, R);
	return R;
}

/* ET_CLASS_TYPE.unaliased_to_text */
T0* T172f16(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T172f95(C, R);
	return R;
}

/* ET_CLASS.unaliased_to_text */
T0* T60f60(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T60f163(C, R);
	return R;
}

/* ET_BIT_FEATURE.context_same_named_type */
T1 T578f65(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f19(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_named_type */
T1 T577f64(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f20(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_type */
T1 T312f53(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f13(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_type */
T1 T174f64(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f26(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_type */
T1 T172f60(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f10(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_named_type */
T1 T60f116(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f83(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_named_type */
T0* T578f59(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.context_named_type */
T0* T577f58(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TUPLE_TYPE.context_named_type */
T0* T312f46(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_named_type */
T0* T174f55(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.context_named_type */
T0* T172f49(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.context_named_type */
T0* T60f130(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.context_base_type_actual_count */
T6 T578f39(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T578f48(C, C, a1));
	return R;
}

/* ET_BIT_N.context_base_type_actual_count */
T6 T577f37(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T577f46(C, C, a1));
	return R;
}

/* ET_TUPLE_TYPE.context_base_type_actual_count */
T6 T312f32(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T312f63(C, C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type_actual_count */
T6 T174f38(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T174f67(C, C, a1));
	return R;
}

/* ET_CLASS_TYPE.context_base_type_actual_count */
T6 T172f35(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T172f63(C, C, a1));
	return R;
}

/* ET_CLASS.context_base_type_actual_count */
T6 T60f101(T0* C, T0* a1)
{
	T6 R = 0;
	R = (T60f135(C, C, a1));
	return R;
}

/* ET_BIT_FEATURE.context_base_type_actual */
T0* T578f40(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	R = (T578f49(C, a1, C, a2));
	return R;
}

/* ET_BIT_N.context_base_type_actual */
T0* T577f38(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	R = (T577f47(C, a1, C, a2));
	return R;
}

/* ET_TUPLE_TYPE.context_base_type_actual */
T0* T312f33(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	R = (T312f64(C, a1, C, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type_actual */
T0* T174f39(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	R = (T174f68(C, a1, C, a2));
	return R;
}

/* ET_CLASS_TYPE.context_base_type_actual */
T0* T172f36(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	R = (T172f64(C, a1, C, a2));
	return R;
}

/* ET_CLASS.context_base_type_actual */
T0* T60f102(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	R = (T60f136(C, a1, C, a2));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_formal_parameter_type */
T1 T578f63(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f33(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_named_formal_parameter_type */
T1 T577f62(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f32(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_formal_parameter_type */
T1 T312f51(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f36(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_formal_parameter_type */
T1 T174f62(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f42(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_formal_parameter_type */
T1 T172f58(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f39(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_named_formal_parameter_type */
T1 T60f126(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f106(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_base_class */
T0* T578f54(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T578f15(C, a1));
	return R;
}

/* ET_BIT_N.context_base_class */
T0* T577f53(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T577f17(C, a1));
	return R;
}

/* ET_TUPLE_TYPE.context_base_class */
T0* T312f41(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T312f11(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_class */
T0* T174f49(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T174f10(C, a1));
	return R;
}

/* ET_CLASS_TYPE.context_base_class */
T0* T172f44(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T172f13(C, a1));
	return R;
}

/* ET_CLASS.context_base_class */
T0* T60f113(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T60f52(C, a1));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_class_type */
T1 T578f64(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f30(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_named_class_type */
T1 T577f63(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f30(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_class_type */
T1 T312f52(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f21(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_class_type */
T1 T174f63(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f32(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_class_type */
T1 T172f59(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f30(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_named_class_type */
T1 T60f121(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f89(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_tuple_type */
T1 T578f66(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f31(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_named_tuple_type */
T1 T577f65(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f31(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_tuple_type */
T1 T312f54(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f26(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_tuple_type */
T1 T174f65(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f34(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_tuple_type */
T1 T172f61(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f31(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_named_tuple_type */
T1 T60f122(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f97(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_same_named_bit_type */
T1 T578f67(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f32(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_named_bit_type */
T1 T577f66(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f42(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_named_bit_type */
T1 T312f55(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f38(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_named_bit_type */
T1 T174f66(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f45(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_named_bit_type */
T1 T172f62(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f41(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_named_bit_type */
T1 T60f127(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f109(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.upper_name */
T0* T174f56(T0* C)
{
	T0* R = 0;
	R = (T129f18(GE_void(((T174*)(C))->a4)));
	return R;
}

/* ET_CLASS_TYPE.upper_name */
T0* T172f50(T0* C)
{
	T0* R = 0;
	R = (T129f18(GE_void(((T172*)(C))->a2)));
	return R;
}

/* ET_CLASS.upper_name */
T0* T60f65(T0* C)
{
	T0* R = 0;
	R = (T129f18(GE_void(((T60*)(C))->a1)));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.resolved_formal_parameters */
T0* T174f16(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	R = C;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = (((((T0*)(GE_void(l1)))->id==173)?T173f12(l1, a1):T425f13(l1, a1)));
		t1 = ((l2)!=(l1));
		if (t1) {
			l3 = T174c95(((T174*)(C))->a3, ((T174*)(C))->a4, l2, ((T174*)(C))->a1);
			T174f96(GE_void(l3), C);
			R = l3;
		}
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.resolved_formal_parameters */
T0* T425f13(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.resolved_formal_parameters */
T0* T172f17(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	R = C;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = ((GE_void(l1), a1, (T0*)0));
		t1 = ((l2)!=(l1));
		if (t1) {
			l3 = T174c95(((T172*)(C))->a1, ((T172*)(C))->a2, l2, ((T172*)(C))->a3);
			T174f96(GE_void(l3), C);
			R = l3;
		}
	}
	return R;
}

/* ET_CLASS.resolved_formal_parameters */
T0* T60f61(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	R = C;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		l2 = (T425f13(GE_void(l1), a1));
		t1 = ((l2)!=(l1));
		if (t1) {
			l3 = T174c95(((T60*)(C))->a13, ((T60*)(C))->a1, l2, ((T60*)(C))->a8);
			T174f96(GE_void(l3), C);
			R = l3;
		}
	}
	return R;
}

/* ET_BIT_FEATURE.conforms_to_context */
T1 T578f95(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T578f37(C));
	t1 = (T170f412(GE_void(t1)));
	R = (T578f87(C, t1, a1, a2));
	return R;
}

/* ET_BIT_N.conforms_to_context */
T1 T577f94(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T577f6(C));
	t1 = (T170f412(GE_void(t1)));
	R = (T577f86(C, t1, a1, a2));
	return R;
}

/* ET_TUPLE_TYPE.conforms_to_context */
T1 T312f87(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T312f3(C));
	t1 = (T170f412(GE_void(t1)));
	R = (T312f80(C, t1, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_to_context */
T1 T174f91(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T174f94(C));
	t1 = (T170f412(GE_void(t1)));
	R = (T174f85(C, t1, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.tokens */
T0* T174f94(T0* C)
{
	T0* R = 0;
	if (ge768os2712) {
		return ge768ov2712;
	} else {
		ge768os2712 = '\1';
	}
	R = T170c920();
	ge768ov2712 = R;
	return R;
}

/* ET_CLASS_TYPE.conforms_to_context */
T1 T172f90(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T172f92(C));
	t1 = (T170f412(GE_void(t1)));
	R = (T172f85(C, t1, a1, a2));
	return R;
}

/* ET_CLASS_TYPE.tokens */
T0* T172f92(T0* C)
{
	T0* R = 0;
	if (ge768os2712) {
		return ge768ov2712;
	} else {
		ge768os2712 = '\1';
	}
	R = T170c920();
	ge768ov2712 = R;
	return R;
}

/* ET_CLASS.conforms_to_context */
T1 T60f160(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T60f62(C));
	t1 = (T170f412(GE_void(t1)));
	R = (T60f118(C, t1, a1, a2));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.is_generic */
T1 T174f12(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (((((T0*)(GE_void(l1)))->id==173)?T173f10(l1):T425f12(l1)));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS_TYPE.is_generic */
T1 T172f24(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = ((GE_void(l1), (T1)0));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_CLASS.is_generic */
T1 T60f72(T0* C)
{
	T1 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t1 = (T425f12(GE_void(l1)));
		R = ((T1)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_BIT_FEATURE.actual_parameters */
T0* T578f38(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_N.actual_parameters */
T0* T577f36(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_CLASS_TYPE.actual_parameters */
T0* T172f5(T0* C)
{
	T0* R = 0;
	return R;
}

/* ET_BIT_FEATURE.conforms_to_type */
T1 T578f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6227T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_BIT_N.conforms_to_type */
T1 T577f25(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6227T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_TUPLE_TYPE.conforms_to_type */
T1 T312f17(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6230T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.conforms_to_type */
T1 T174f7(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6228T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.conforms_to_type */
T1 T172f12(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6228T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS.conforms_to_type */
T1 T60f64(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6228T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_BIT_FEATURE.context_base_type_index_of_label */
T6 T578f90(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T578f94(C, a1));
	return R;
}

/* ET_BIT_N.context_base_type_index_of_label */
T6 T577f89(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T577f93(C, a1));
	return R;
}

/* ET_BIT_N.index_of_label */
T6 T577f93(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T577f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, (T6)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.context_base_type_index_of_label */
T6 T312f82(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T312f85(C, a1));
	return R;
}

/* ET_TUPLE_TYPE.index_of_label */
T6 T312f85(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T173f21(GE_void(l1), a1));
	}
	return R;
}

/* ET_ACTUAL_PARAMETER_LIST.index_of_label */
T6 T173f21(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	l3 = ((T6)((((T173*)(C))->a3)-((T6)(GE_int32(1)))));
	l2 = (T6)(GE_int32(0));
	t1 = (T6f1(&l2, l3));
	while (!(t1)) {
		t2 = (((T709*)(GE_void(((T173*)(C))->a4)))->z2[l2]);
		l1 = (T177x6265(GE_void(t2)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T129f34(GE_void(a1), l1));
		}
		if (t1) {
			R = ((T6)((((T173*)(C))->a3)-(l2)));
			l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
		} else {
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l2, l3));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type_index_of_label */
T6 T174f87(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T174f93(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.index_of_label */
T6 T174f93(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==173)?T173f21(l1, a1):T425f22(l1, a1)));
	}
	return R;
}

/* ET_FORMAL_PARAMETER_LIST.index_of_label */
T6 T425f22(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T0* t2;
	l3 = ((T6)((((T425*)(C))->a1)-((T6)(GE_int32(1)))));
	l2 = (T6)(GE_int32(0));
	t1 = (T6f1(&l2, l3));
	while (!(t1)) {
		t2 = (((T560*)(GE_void(((T425*)(C))->a2)))->z2[l2]);
		l1 = (((((T0*)(GE_void(t2)))->id==557)?T557f64(t2):T565f66(t2)));
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T129f34(GE_void(a1), l1));
		}
		if (t1) {
			R = ((T6)((((T425*)(C))->a1)-(l2)));
			l2 = ((T6)((l3)+((T6)(GE_int32(1)))));
		} else {
			l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t1 = (T6f1(&l2, l3));
	}
	return R;
}

/* ET_CLASS_TYPE.context_base_type_index_of_label */
T6 T172f86(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T172f91(C, a1));
	return R;
}

/* ET_CLASS_TYPE.index_of_label */
T6 T172f91(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), a1, (T6)0));
	}
	return R;
}

/* ET_CLASS.context_base_type_index_of_label */
T6 T60f154(T0* C, T0* a1, T0* a2)
{
	T6 R = 0;
	R = (T60f159(C, a1));
	return R;
}

/* ET_CLASS.index_of_label */
T6 T60f159(T0* C, T0* a1)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (T425f22(GE_void(l1), a1));
	}
	return R;
}

/* ET_BIT_FEATURE.context_is_type_reference */
T1 T578f92(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T578f47(C, C, a1));
	return R;
}

/* ET_BIT_N.context_is_type_reference */
T1 T577f91(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T577f45(C, C, a1));
	return R;
}

/* ET_TUPLE_TYPE.context_is_type_reference */
T1 T312f84(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T312f50(C, C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_is_type_reference */
T1 T174f89(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T174f60(C, C, a1));
	return R;
}

/* ET_CLASS_TYPE.context_is_type_reference */
T1 T172f88(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T172f54(C, C, a1));
	return R;
}

/* ET_CLASS.context_is_type_reference */
T1 T60f156(T0* C, T0* a1)
{
	T1 R = 0;
	R = (T60f134(C, C, a1));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_to_type */
T1 T578f87(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f25(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_conforms_to_type */
T1 T577f86(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f25(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_to_type */
T1 T312f80(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f17(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_to_type */
T1 T174f85(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f7(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_to_type */
T1 T172f85(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f12(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_conforms_to_type */
T1 T60f118(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f64(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_class_type */
T1 T578f82(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f22(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_conforms_from_class_type */
T1 T577f81(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f23(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_class_type */
T1 T312f75(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f16(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_class_type */
T1 T174f80(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f11(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_class_type */
T1 T172f80(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f14(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_conforms_from_class_type */
T1 T60f117(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f53(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_formal_parameter_type */
T1 T578f85(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f29(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_conforms_from_formal_parameter_type */
T1 T577f84(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f29(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_formal_parameter_type */
T1 T312f78(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f35(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_formal_parameter_type */
T1 T174f83(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f41(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_formal_parameter_type */
T1 T172f83(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f38(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_conforms_from_formal_parameter_type */
T1 T60f125(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f105(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_tuple_type */
T1 T578f83(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f23(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_conforms_from_tuple_type */
T1 T577f82(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f24(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_tuple_type */
T1 T312f76(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f28(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_tuple_type */
T1 T174f81(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f35(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_tuple_type */
T1 T172f81(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f32(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_conforms_from_tuple_type */
T1 T60f123(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f98(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_conforms_from_bit_type */
T1 T578f84(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f24(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_conforms_from_bit_type */
T1 T577f83(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f43(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_conforms_from_bit_type */
T1 T312f77(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f39(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_conforms_from_bit_type */
T1 T174f82(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f46(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_conforms_from_bit_type */
T1 T172f82(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f42(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_conforms_from_bit_type */
T1 T60f128(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f110(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_base_type */
T0* T578f55(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_N.context_base_type */
T0* T577f54(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_TUPLE_TYPE.context_base_type */
T0* T312f42(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_base_type */
T0* T174f51(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS_TYPE.context_base_type */
T0* T172f45(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_CLASS.context_base_type */
T0* T60f115(T0* C, T0* a1)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_BIT_FEATURE.context_same_base_class_type */
T1 T578f56(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f16(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_base_class_type */
T1 T577f55(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f18(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_class_type */
T1 T312f43(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f12(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_class_type */
T1 T174f52(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f22(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_class_type */
T1 T172f46(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f19(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_base_class_type */
T1 T60f119(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f87(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_same_base_tuple_type */
T1 T578f57(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f17(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_base_tuple_type */
T1 T577f56(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f19(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_tuple_type */
T1 T312f44(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f29(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_tuple_type */
T1 T174f53(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f36(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_tuple_type */
T1 T172f47(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f33(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_base_tuple_type */
T1 T60f124(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f99(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_FEATURE.context_same_base_bit_type */
T1 T578f58(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T578f18(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.context_same_base_bit_type */
T1 T577f57(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T577f48(C, a1, a2, C, a3));
	return R;
}

/* ET_TUPLE_TYPE.context_same_base_bit_type */
T1 T312f45(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T312f40(C, a1, a2, C, a3));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.context_same_base_bit_type */
T1 T174f54(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T174f47(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS_TYPE.context_same_base_bit_type */
T1 T172f48(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T172f43(C, a1, a2, C, a3));
	return R;
}

/* ET_CLASS.context_same_base_bit_type */
T1 T60f129(T0* C, T0* a1, T0* a2, T0* a3)
{
	T1 R = 0;
	R = (T60f111(C, a1, a2, C, a3));
	return R;
}

/* ET_BIT_N.reference_conforms_to_type */
T1 T577f59(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6232T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_TUPLE_TYPE.reference_conforms_to_type */
T1 T312f47(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T1 t1;
	t1 = ((a1)==(C));
	if (t1) {
		t1 = ((a2)==(a3));
	}
	if (t1) {
		R = EIF_TRUE;
	} else {
		R = (T167x6235T0T0T0T0(GE_void(a1), C, a3, a2, a4));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.reference_conforms_to_type */
T1 T174f57(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6233T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS_TYPE.reference_conforms_to_type */
T1 T172f51(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6233T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_CLASS.reference_conforms_to_type */
T1 T60f131(T0* C, T0* a1, T0* a2, T0* a3, T0* a4)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	l1 = (T167x6184T0(GE_void(a1), a4));
	t1 = (((((T0*)(GE_void(a4)))->id==53)?((T53*)(a4))->a5:((T56*)(a4))->a5));
	t2 = ((l1)==(t1));
	if (t2) {
		R = EIF_FALSE;
	} else {
		t2 = ((a1)==(C));
		if (t2) {
			t2 = ((a2)==(a3));
		}
		if (t2) {
			R = EIF_TRUE;
		} else {
			R = (T167x6233T0T0T0T0(GE_void(a1), C, a3, a2, a4));
		}
	}
	return R;
}

/* ET_BIT_N.base_type_actual */
T0* T577f47(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T577f36(C));
	l1 = ((GE_void(t1), a1, (T0*)0));
	t2 = ((a2)==(C));
	if (t2) {
		R = l1;
	}
	t2 = ((R)==(EIF_VOID));
	if (t2) {
		R = ((GE_void(l1), a2, a3, (T0*)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.base_type_actual */
T0* T312f64(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T173f7(GE_void(((T312*)(C))->a2), a1));
	t1 = ((a2)==(C));
	if (t1) {
		if ((l1)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 716:
			case 714:
				R = EIF_VOID;
				break;
			default:
				R = l1;
			}
		}
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (T167x6191T0T0(GE_void(l1), a2, a3));
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_actual */
T0* T174f68(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (((((T0*)(GE_void(((T174*)(C))->a2)))->id==173)?T173f7(((T174*)(C))->a2, a1):T425f10(((T174*)(C))->a2, a1)));
	t1 = ((a2)==(C));
	if (t1) {
		if ((l1)==EIF_VOID) {
			R = EIF_VOID;
		} else {
			switch (((T0*)(l1))->id) {
			case 716:
			case 714:
				R = EIF_VOID;
				break;
			default:
				R = l1;
			}
		}
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (T167x6191T0T0(GE_void(l1), a2, a3));
	}
	return R;
}

/* ET_CLASS_TYPE.base_type_actual */
T0* T172f64(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T1 t2;
	t1 = (T172f5(C));
	l1 = ((GE_void(t1), a1, (T0*)0));
	t2 = ((a2)==(C));
	if (t2) {
		R = l1;
	}
	t2 = ((R)==(EIF_VOID));
	if (t2) {
		R = ((GE_void(l1), a2, a3, (T0*)0));
	}
	return R;
}

/* ET_CLASS.base_type_actual */
T0* T60f136(T0* C, T6 a1, T0* a2, T0* a3)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T425f10(GE_void(((T60*)(C))->a11), a1));
	t1 = ((a2)==(C));
	if (t1) {
		R = l1;
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==557)?T557f34(l1, a2, a3):T565f36(l1, a2, a3)));
	}
	return R;
}

/* ET_BIT_FEATURE.actual_parameter_count */
T6 T578f52(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T578f38(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_BIT_N.actual_parameter_count */
T6 T577f51(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T577f36(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_TUPLE_TYPE.actual_parameter_count */
T6 T312f27(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T312*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T173*)(GE_void(l1)))->a3);
	}
	return R;
}

/* ET_GENERIC_CLASS_TYPE.actual_parameter_count */
T6 T174f69(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T174*)(C))->a2;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((((T0*)(GE_void(l1)))->id==173)?((T173*)(l1))->a3:((T425*)(l1))->a1));
	}
	return R;
}

/* ET_CLASS_TYPE.actual_parameter_count */
T6 T172f65(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = (T172f5(C));
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((GE_void(l1), (T6)0));
	}
	return R;
}

/* ET_CLASS.actual_parameter_count */
T6 T60f104(T0* C)
{
	T6 R = 0;
	T0* l1 = 0;
	T1 t1;
	l1 = ((T60*)(C))->a11;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = (((T425*)(GE_void(l1)))->a1);
	}
	return R;
}

/* ET_BIT_N.base_type_index_of_label */
T6 T577f90(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T577f93(C, a1));
	return R;
}

/* ET_TUPLE_TYPE.base_type_index_of_label */
T6 T312f83(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T312f85(C, a1));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.base_type_index_of_label */
T6 T174f88(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T174f93(C, a1));
	return R;
}

/* ET_CLASS_TYPE.base_type_index_of_label */
T6 T172f87(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T172f91(C, a1));
	return R;
}

/* ET_CLASS.base_type_index_of_label */
T6 T60f155(T0* C, T0* a1, T0* a2, T0* a3)
{
	T6 R = 0;
	R = (T60f159(C, a1));
	return R;
}

/* ET_BIT_FEATURE.direct_base_class */
T0* T578f15(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(a1)))->id==53)?((T53*)(a1))->a78:((T56*)(a1))->a81));
	return R;
}

/* ET_BIT_N.direct_base_class */
T0* T577f17(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(a1)))->id==53)?((T53*)(a1))->a78:((T56*)(a1))->a81));
	return R;
}

/* ET_TUPLE_TYPE.direct_base_class */
T0* T312f11(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(a1)))->id==53)?((T53*)(a1))->a77:((T56*)(a1))->a47));
	return R;
}

/* ET_GENERIC_CLASS_TYPE.direct_base_class */
T0* T174f10(T0* C, T0* a1)
{
	T0* R = 0;
	R = ((T174*)(C))->a1;
	return R;
}

/* ET_CLASS_TYPE.direct_base_class */
T0* T172f13(T0* C, T0* a1)
{
	T0* R = 0;
	R = ((T172*)(C))->a3;
	return R;
}

/* ET_CLASS.direct_base_class */
T0* T60f52(T0* C, T0* a1)
{
	T0* R = 0;
	R = ((T60*)(C))->a8;
	return R;
}

/* ET_BIT_FEATURE.to_text */
T0* T578f7(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T578f101(C, R);
	return R;
}

/* ET_BIT_N.to_text */
T0* T577f9(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T577f99(C, R);
	return R;
}

/* ET_TUPLE_TYPE.to_text */
T0* T312f4(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T312f91(C, R);
	return R;
}

/* ET_GENERIC_CLASS_TYPE.to_text */
T0* T174f17(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T174f98(C, R);
	return R;
}

/* ET_CLASS_TYPE.to_text */
T0* T172f6(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T172f97(C, R);
	return R;
}

/* ET_CLASS.to_text */
T0* T60f80(T0* C)
{
	T0* R = 0;
	R = T17c36((T6)(GE_int32(15)));
	T60f214(C, R);
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.static_type */
T0* T233f52(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.static_type */
T0* T232f52(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.static_type */
T0* T228f52(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.static_type */
T0* T214f52(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_TYPE.static_type */
T0* T157f28(T0* C)
{
	T0* R = 0;
	R = C;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_generic */
T1 T233f49(T0* C)
{
	T1 R = 0;
	R = (T60f72(GE_void(((T233*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_generic */
T1 T232f49(T0* C)
{
	T1 R = 0;
	R = (T60f72(GE_void(((T232*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_generic */
T1 T228f49(T0* C)
{
	T1 R = 0;
	R = (T60f72(GE_void(((T228*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_generic */
T1 T214f49(T0* C)
{
	T1 R = 0;
	R = (T60f72(GE_void(((T214*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TYPE.is_generic */
T1 T157f25(T0* C)
{
	T1 R = 0;
	R = (T60f72(GE_void(((T157*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.hash_code */
T6 T233f56(T0* C)
{
	T6 R = 0;
	R = (T60f46(GE_void(((T233*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.hash_code */
T6 T232f57(T0* C)
{
	T6 R = 0;
	R = (T60f46(GE_void(((T232*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.hash_code */
T6 T228f56(T0* C)
{
	T6 R = 0;
	R = (T60f46(GE_void(((T228*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.hash_code */
T6 T214f57(T0* C)
{
	T6 R = 0;
	R = (T60f46(GE_void(((T214*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_TYPE.hash_code */
T6 T157f54(T0* C)
{
	T6 R = 0;
	R = (T60f46(GE_void(((T157*)(C))->a6)));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.has_nested_reference_attributes */
T1 T233f61(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	if (((T233*)(C))->a12) {
		R = EIF_TRUE;
	} else {
		((T233*)(C))->a12 = EIF_TRUE;
		l2 = ((T233*)(C))->a5;
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l2));
		while (!(t1)) {
			t2 = (T217f4(GE_void(((T233*)(C))->a4), l1));
			t2 = (((((T0*)(GE_void(t2)))->id==163)?((T163*)(t2))->a4:((T219*)(t2))->a10));
			l3 = (T175x12220(GE_void(t2)));
			t1 = (T157x12216(GE_void(l3)));
			if (t1) {
				t1 = (T157x12192(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l1, l2));
		}
		((T233*)(C))->a12 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.has_nested_reference_attributes */
T1 T232f62(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	if (((T232*)(C))->a13) {
		R = EIF_TRUE;
	} else {
		((T232*)(C))->a13 = EIF_TRUE;
		l2 = ((T232*)(C))->a5;
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l2));
		while (!(t1)) {
			t2 = (T217f4(GE_void(((T232*)(C))->a4), l1));
			t2 = (((((T0*)(GE_void(t2)))->id==163)?((T163*)(t2))->a4:((T219*)(t2))->a10));
			l3 = (T175x12220(GE_void(t2)));
			t1 = (T157x12216(GE_void(l3)));
			if (t1) {
				t1 = (T157x12192(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l1, l2));
		}
		((T232*)(C))->a13 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.has_nested_reference_attributes */
T1 T228f61(T0* C)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	if (((T228*)(C))->a9) {
		R = EIF_TRUE;
	} else {
		((T228*)(C))->a9 = EIF_TRUE;
		t1 = (T175x12220(GE_void(((T228*)(C))->a8)));
		t2 = (T157x12192(GE_void(t1)));
		if (t2) {
			R = EIF_TRUE;
		}
		((T228*)(C))->a9 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.has_nested_reference_attributes */
T1 T214f62(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	if (((T214*)(C))->a9) {
		R = EIF_TRUE;
	} else {
		((T214*)(C))->a9 = EIF_TRUE;
		l2 = (((T183*)(GE_void(((T214*)(C))->a8)))->a1);
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l2));
		while (!(t1)) {
			t2 = (T183f3(GE_void(((T214*)(C))->a8), l1));
			l3 = (T175x12220(GE_void(t2)));
			t1 = (T157x12216(GE_void(l3)));
			if (t1) {
				t1 = (T157x12192(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l1, l2));
		}
		((T214*)(C))->a9 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_TYPE.has_nested_reference_attributes */
T1 T157f59(T0* C)
{
	T1 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	if (((T157*)(C))->a12) {
		R = EIF_TRUE;
	} else {
		((T157*)(C))->a12 = EIF_TRUE;
		l2 = ((T157*)(C))->a5;
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l2));
		while (!(t1)) {
			t2 = (T217f4(GE_void(((T157*)(C))->a4), l1));
			t2 = (((((T0*)(GE_void(t2)))->id==163)?((T163*)(t2))->a4:((T219*)(t2))->a10));
			l3 = (T175x12220(GE_void(t2)));
			t1 = (T157x12216(GE_void(l3)));
			if (t1) {
				t1 = (T157x12192(GE_void(l3)));
			}
			if (t1) {
				R = EIF_TRUE;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t1 = (T6f1(&l1, l2));
		}
		((T157*)(C))->a12 = EIF_FALSE;
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.seeded_dynamic_query */
T0* T233f50(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T233f21(C));
	t2 = ((((T233*)(C))->a4)==(t1));
	if (t2) {
		l3 = (T60f70(GE_void(((T233*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T233*)(C))->a6)))->a4);
			t3 = (((T159*)(GE_void(t1)))->a1);
			((T233*)(C))->a4 = T217c8(t3);
			R = (T233f22(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T233f71(C, R, a2);
			} else {
				T217f9(GE_void(((T233*)(C))->a4), R);
			}
		}
	} else {
		l2 = (((T217*)(GE_void(((T233*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T233*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f70(GE_void(((T233*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T233f22(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
				if (t2) {
					T233f71(C, R, a2);
				} else {
					T217f10(GE_void(((T233*)(C))->a4), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.force_last */
void T217f10(T0* C, T0* a1)
{
	T6 l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = (T217f6(C));
	t2 = (T6f12(&(((T217*)(C))->a1), t1));
	if (t2) {
		t1 = (T217f6(C));
		t1 = ((T6)((t1)+((T6)(GE_int32(1)))));
		l1 = ((T6)((t1)*((T6)(GE_int32(2)))));
		t2 = ((((T217*)(C))->a2)==(EIF_VOID));
		if (t2) {
			t3 = (T217f5(C));
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			((T217*)(C))->a2 = (T886f1(GE_void(t3), t1));
		} else {
			t3 = (T217f5(C));
			t1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			((T217*)(C))->a2 = (T886f2(GE_void(t3), ((T217*)(C))->a2, t1));
		}
	}
	((T217*)(C))->a1 = ((T6)((((T217*)(C))->a1)+((T6)(GE_int32(1)))));
	((T885*)(GE_void(((T217*)(C))->a2)))->z2[((T217*)(C))->a1] = (a1);
}

/* ET_DYNAMIC_FEATURE_LIST.fixed_array */
unsigned char ge907os16368 = '\0';
T0* ge907ov16368;
T0* T217f5(T0* C)
{
	T0* R = 0;
	if (ge907os16368) {
		return ge907ov16368;
	} else {
		ge907os16368 = '\1';
	}
	R = T886c3();
	ge907ov16368 = R;
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.capacity */
T6 T217f6(T0* C)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	t1 = ((((T217*)(C))->a2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T885*)(GE_void(((T217*)(C))->a2)))->z1);
		R = ((T6)((t2)-((T6)(GE_int32(1)))));
	}
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.put_last */
void T217f9(T0* C, T0* a1)
{
	((T217*)(C))->a1 = ((T6)((((T217*)(C))->a1)+((T6)(GE_int32(1)))));
	((T885*)(GE_void(((T217*)(C))->a2)))->z2[((T217*)(C))->a1] = (a1);
}

/* ET_DYNAMIC_PROCEDURE_TYPE.put_attribute */
void T233f71(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	((T233*)(C))->a5 = ((T6)((((T233*)(C))->a5)+((T6)(GE_int32(1)))));
	t1 = (((T217*)(GE_void(((T233*)(C))->a4)))->a1);
	t2 = ((T1)((t1)<(((T233*)(C))->a5)));
	if (t2) {
		T217f10(GE_void(((T233*)(C))->a4), a1);
	} else {
		t3 = (T217f4(GE_void(((T233*)(C))->a4), ((T233*)(C))->a5));
		T217f10(GE_void(((T233*)(C))->a4), t3);
		T217f12(GE_void(((T233*)(C))->a4), a1, ((T233*)(C))->a5);
	}
	t3 = (((((T0*)(a1))->id==163)?((T163*)(a1))->a4:((T219*)(a1))->a10));
	l1 = (T175x12220(GE_void(t3)));
	t2 = (T157x12216(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T233*)(C))->a12 = EIF_TRUE;
	} else {
		t2 = (T157x12168(GE_void(l1)));
		if (t2) {
			((T233*)(C))->a13 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_FEATURE_LIST.put */
void T217f12(T0* C, T0* a1, T6 a2)
{
	((T885*)(GE_void(((T217*)(C))->a2)))->z2[a2] = (a1);
}

/* ET_DYNAMIC_PROCEDURE_TYPE.new_dynamic_query */
T0* T233f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_FEATURE_LIST.make_with_capacity */
T0* T217c8(T6 a1)
{
	T0* C;
	T1 t1;
	T0* t2;
	T6 t3;
	C = (T0*)GE_alloc(sizeof(T217));
	*(T217*)C = GE_default217;
	((T217*)(C))->a1 = (T6)(GE_int32(0));
	t1 = (T6f1(&a1, (T6)(GE_int32(0))));
	if (t1) {
		t2 = (T217f5(C));
		t3 = ((T6)((a1)+((T6)(GE_int32(1)))));
		((T217*)(C))->a2 = (T886f1(GE_void(t2), t3));
	} else {
		((T217*)(C))->a2 = EIF_VOID;
	}
	return C;
}

/* ET_DYNAMIC_FUNCTION_TYPE.seeded_dynamic_query */
T0* T232f50(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T232f21(C));
	t2 = ((((T232*)(C))->a4)==(t1));
	if (t2) {
		l3 = (T60f70(GE_void(((T232*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T232*)(C))->a6)))->a4);
			t3 = (((T159*)(GE_void(t1)))->a1);
			((T232*)(C))->a4 = T217c8(t3);
			R = (T232f22(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T232f71(C, R, a2);
			} else {
				T217f9(GE_void(((T232*)(C))->a4), R);
			}
		}
	} else {
		l2 = (((T217*)(GE_void(((T232*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T232*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f70(GE_void(((T232*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T232f22(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
				if (t2) {
					T232f71(C, R, a2);
				} else {
					T217f10(GE_void(((T232*)(C))->a4), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.put_attribute */
void T232f71(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	((T232*)(C))->a5 = ((T6)((((T232*)(C))->a5)+((T6)(GE_int32(1)))));
	t1 = (((T217*)(GE_void(((T232*)(C))->a4)))->a1);
	t2 = ((T1)((t1)<(((T232*)(C))->a5)));
	if (t2) {
		T217f10(GE_void(((T232*)(C))->a4), a1);
	} else {
		t3 = (T217f4(GE_void(((T232*)(C))->a4), ((T232*)(C))->a5));
		T217f10(GE_void(((T232*)(C))->a4), t3);
		T217f12(GE_void(((T232*)(C))->a4), a1, ((T232*)(C))->a5);
	}
	t3 = (((((T0*)(a1))->id==163)?((T163*)(a1))->a4:((T219*)(a1))->a10));
	l1 = (T175x12220(GE_void(t3)));
	t2 = (T157x12216(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T232*)(C))->a13 = EIF_TRUE;
	} else {
		t2 = (T157x12168(GE_void(l1)));
		if (t2) {
			((T232*)(C))->a14 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_query */
T0* T232f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T1 t5;
	R = (T232f22p1(C, a1, a2));
	t1 = (((T163*)(GE_void(R)))->a7);
	t2 = (T232f47(C));
	t3 = (T232f47(C));
	t4 = ((T6)(GE_int32(1)));
	t4 = (T170f23(GE_void(t2), t4));
	t5 = ((t1)==(t4));
	if (t5) {
		t2 = (((T58*)(GE_void(a2)))->a6);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f257(t2, C, R);
		} else {
			T155f16(t2, C, R);
		}
		l1 = (((T163*)(GE_void(R)))->a4);
		t5 = ((l1)!=(EIF_VOID));
		if (t5) {
			t2 = (T175x12220(GE_void(l1)));
			t3 = (T175x12220(GE_void(((T232*)(C))->a8)));
			t5 = ((t2)==(t3));
		}
		if (t5) {
			T163f50(GE_void(R), ((T232*)(C))->a8);
		}
	} else {
		t2 = (T160x12625(GE_void(a1)));
		t3 = (T232f47(C));
		t3 = (T170f50(GE_void(t3)));
		t5 = (T169x11696T0(GE_void(t2), t3));
		if (t5) {
			l1 = (((T163*)(GE_void(R)))->a4);
			t5 = ((l1)!=(EIF_VOID));
			if (t5) {
				t2 = (T175x12220(GE_void(l1)));
				t3 = (T175x12220(GE_void(((T232*)(C))->a8)));
				t5 = ((t2)==(t3));
			}
			if (t5) {
				T163f50(GE_void(R), ((T232*)(C))->a8);
			}
		}
	}
	return R;
}

/* ET_TOKEN_CONSTANTS.last_result_feature_name */
unsigned char ge773os13675 = '\0';
T0* ge773ov13675;
T0* T170f50(T0* C)
{
	T0* R = 0;
	if (ge773os13675) {
		return ge773ov13675;
	} else {
		ge773os13675 = '\1';
	}
	R = T129c95(ge773ov13928);
	ge773ov13675 = R;
	return R;
}

/* ET_DYNAMIC_FEATURE.set_result_type_set */
void T163f50(T0* C, T0* a1)
{
	((T163*)(C))->a4 = a1;
}

/* ET_DYNAMIC_NULL_TYPE_SET_BUILDER.build_agent_call */
void T155f16(T0* C, T0* a1, T0* a2)
{
}

/* ET_DYNAMIC_PUSH_TYPE_SET_BUILDER.build_agent_call */
void T64f257(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T1 t1;
	T0* t2;
	l1 = (((T163*)(a2))->a2);
	t1 = (T183f6(GE_void(l1)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T183f3(GE_void(l1), (T6)(GE_int32(1))));
		t2 = (T175x12220(GE_void(t2)));
		l3 = T942c13(t2, a1);
		T942f14(GE_void(l3));
		l2 = T183c8((T6)(GE_int32(1)));
		T183f11(GE_void(l2), l3);
		T163f51(a2, l2);
	}
}

/* ET_DYNAMIC_AGENT_OPERAND_PUSH_TYPE_SET.make */
T0* T942c13(T0* a1, T0* a2)
{
	T0* C;
	T1 t1;
	C = (T0*)GE_alloc(sizeof(T942));
	*(T942*)C = GE_default942;
	((T942*)(C))->a1 = a1;
	t1 = (T157x12216(a1));
	if (t1) {
		T942f15(C, a1);
	}
	((T942*)(C))->a2 = a2;
	return C;
}

/* ET_DYNAMIC_FUNCTION_TYPE.tokens */
T0* T232f47(T0* C)
{
	T0* R = 0;
	if (ge768os2712) {
		return ge768ov2712;
	} else {
		ge768os2712 = '\1';
	}
	R = T170c920();
	ge768ov2712 = R;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_query */
T0* T232f22p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.seeded_dynamic_query */
T0* T228f50(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T228f21(C));
	t2 = ((((T228*)(C))->a4)==(t1));
	if (t2) {
		l3 = (T60f70(GE_void(((T228*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T228*)(C))->a6)))->a4);
			t3 = (((T159*)(GE_void(t1)))->a1);
			((T228*)(C))->a4 = T217c8(t3);
			R = (T228f22(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T228f70(C, R, a2);
			} else {
				T217f9(GE_void(((T228*)(C))->a4), R);
			}
		}
	} else {
		l2 = (((T217*)(GE_void(((T228*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T228*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f70(GE_void(((T228*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T228f22(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
				if (t2) {
					T228f70(C, R, a2);
				} else {
					T217f10(GE_void(((T228*)(C))->a4), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.put_attribute */
void T228f70(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	((T228*)(C))->a5 = ((T6)((((T228*)(C))->a5)+((T6)(GE_int32(1)))));
	t1 = (((T217*)(GE_void(((T228*)(C))->a4)))->a1);
	t2 = ((T1)((t1)<(((T228*)(C))->a5)));
	if (t2) {
		T217f10(GE_void(((T228*)(C))->a4), a1);
	} else {
		t3 = (T217f4(GE_void(((T228*)(C))->a4), ((T228*)(C))->a5));
		T217f10(GE_void(((T228*)(C))->a4), t3);
		T217f12(GE_void(((T228*)(C))->a4), a1, ((T228*)(C))->a5);
	}
	t3 = (((((T0*)(a1))->id==163)?((T163*)(a1))->a4:((T219*)(a1))->a10));
	l1 = (T175x12220(GE_void(t3)));
	t2 = (T157x12216(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T228*)(C))->a9 = EIF_TRUE;
	} else {
		t2 = (T157x12168(GE_void(l1)));
		if (t2) {
			((T228*)(C))->a10 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_query */
T0* T228f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	R = (T228f22p1(C, a1, a2));
	l1 = (T160x12625(GE_void(a1)));
	t1 = (T228f47(C));
	t1 = (T170f22(GE_void(t1)));
	t2 = (T169x11696T0(GE_void(l1), t1));
	if (!(t2)) {
		t1 = (T228f47(C));
		t1 = (T170f45(GE_void(t1)));
		t2 = (T169x11696T0(GE_void(l1), t1));
	}
	if (t2) {
		l2 = (((T163*)(GE_void(R)))->a4);
		t2 = ((l2)!=(EIF_VOID));
		if (t2) {
			t1 = (T175x12220(GE_void(l2)));
			t3 = (T175x12220(GE_void(((T228*)(C))->a8)));
			t2 = ((t1)==(t3));
		}
		if (t2) {
			T163f50(GE_void(R), ((T228*)(C))->a8);
		}
	}
	return R;
}

/* ET_TOKEN_CONSTANTS.infix_at_feature_name */
unsigned char ge773os13644 = '\0';
T0* ge773ov13644;
T0* T170f45(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge773os13644) {
		return ge773ov13644;
	} else {
		ge773os13644 = '\1';
	}
	l1 = T509c31(ge773ov14062);
	R = T674c60(l1);
	ge773ov13644 = R;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.tokens */
T0* T228f47(T0* C)
{
	T0* R = 0;
	if (ge768os2712) {
		return ge768ov2712;
	} else {
		ge768os2712 = '\1';
	}
	R = T170c920();
	ge768ov2712 = R;
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_query */
T0* T228f22p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.seeded_dynamic_query */
T0* T214f50(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T214f21(C));
	t2 = ((((T214*)(C))->a4)==(t1));
	if (t2) {
		l3 = (T60f70(GE_void(((T214*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T214*)(C))->a6)))->a4);
			t3 = (((T159*)(GE_void(t1)))->a1);
			((T214*)(C))->a4 = T217c8(t3);
			R = (T214f22(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T214f71(C, R, a2);
			} else {
				T217f9(GE_void(((T214*)(C))->a4), R);
			}
		}
	} else {
		l2 = (((T217*)(GE_void(((T214*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T214*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f70(GE_void(((T214*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T214f22(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
				if (t2) {
					T214f71(C, R, a2);
				} else {
					T217f10(GE_void(((T214*)(C))->a4), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.put_attribute */
void T214f71(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	((T214*)(C))->a5 = ((T6)((((T214*)(C))->a5)+((T6)(GE_int32(1)))));
	t1 = (((T217*)(GE_void(((T214*)(C))->a4)))->a1);
	t2 = ((T1)((t1)<(((T214*)(C))->a5)));
	if (t2) {
		T217f10(GE_void(((T214*)(C))->a4), a1);
	} else {
		t3 = (T217f4(GE_void(((T214*)(C))->a4), ((T214*)(C))->a5));
		T217f10(GE_void(((T214*)(C))->a4), t3);
		T217f12(GE_void(((T214*)(C))->a4), a1, ((T214*)(C))->a5);
	}
	t3 = (((((T0*)(a1))->id==163)?((T163*)(a1))->a4:((T219*)(a1))->a10));
	l1 = (T175x12220(GE_void(t3)));
	t2 = (T157x12216(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T214*)(C))->a9 = EIF_TRUE;
	} else {
		t2 = (T157x12168(GE_void(l1)));
		if (t2) {
			((T214*)(C))->a10 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_query */
T0* T214f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	R = (T214f22p1(C, a1, a2));
	l1 = (T160x12625(GE_void(a1)));
	t1 = (T163f23(GE_void(R)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T214f47(C));
		t2 = (T170f22(GE_void(t2)));
		t3 = (T169x11696T0(GE_void(l1), t2));
		if (!(t3)) {
			t2 = (T214f47(C));
			t2 = (T170f45(GE_void(t2)));
			t3 = (T169x11696T0(GE_void(l1), t2));
		}
		if (!(t3)) {
			t2 = (T214f47(C));
			t2 = (T170f46(GE_void(t2)));
			t1 = (T169x11696T0(GE_void(l1), t2));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		t2 = (((T58*)(GE_void(a2)))->a6);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f255(t2, C, R);
		} else {
			T155f14(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_NULL_TYPE_SET_BUILDER.build_tuple_item */
void T155f14(T0* C, T0* a1, T0* a2)
{
}

/* ET_DYNAMIC_PUSH_TYPE_SET_BUILDER.build_tuple_item */
void T64f255(T0* C, T0* a1, T0* a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T1 t1;
	T0* t2;
	l3 = (((T163*)(a2))->a4);
	t1 = ((l3)!=(EIF_VOID));
	if (t1) {
		l4 = (((T214*)(a1))->a8);
		l2 = (((T183*)(GE_void(l4)))->a1);
		l1 = (T6)(GE_int32(1));
		t1 = (T6f1(&l1, l2));
		while (!(t1)) {
			t2 = (T183f3(GE_void(l4), l1));
			T175x12222T0T0(GE_void(t2), l3, ((T64*)(C))->a2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t1 = (T6f1(&l1, l2));
		}
	}
}

/* ET_DYNAMIC_TUPLE_TYPE.tokens */
T0* T214f47(T0* C)
{
	T0* R = 0;
	if (ge768os2712) {
		return ge768ov2712;
	} else {
		ge768os2712 = '\1';
	}
	R = T170c920();
	ge768ov2712 = R;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_query */
T0* T214f22p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TYPE.seeded_dynamic_query */
T0* T157f24(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T157f19(C));
	t2 = ((((T157*)(C))->a4)==(t1));
	if (t2) {
		l3 = (T60f70(GE_void(((T157*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T157*)(C))->a6)))->a4);
			t3 = (((T159*)(GE_void(t1)))->a1);
			((T157*)(C))->a4 = T217c8(t3);
			R = (T157f20(C, l3, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T157f68(C, R, a2);
			} else {
				T217f9(GE_void(((T157*)(C))->a4), R);
			}
		}
	} else {
		l2 = (((T217*)(GE_void(((T157*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T157*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f70(GE_void(((T157*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T157f20(C, l3, a2));
				t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
				if (t2) {
					T157f68(C, R, a2);
				} else {
					T217f10(GE_void(((T157*)(C))->a4), R);
				}
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.put_attribute */
void T157f68(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	((T157*)(C))->a5 = ((T6)((((T157*)(C))->a5)+((T6)(GE_int32(1)))));
	t1 = (((T217*)(GE_void(((T157*)(C))->a4)))->a1);
	t2 = ((T1)((t1)<(((T157*)(C))->a5)));
	if (t2) {
		T217f10(GE_void(((T157*)(C))->a4), a1);
	} else {
		t3 = (T217f4(GE_void(((T157*)(C))->a4), ((T157*)(C))->a5));
		T217f10(GE_void(((T157*)(C))->a4), t3);
		T217f12(GE_void(((T157*)(C))->a4), a1, ((T157*)(C))->a5);
	}
	t3 = (((((T0*)(a1))->id==163)?((T163*)(a1))->a4:((T219*)(a1))->a10));
	l1 = (T175x12220(GE_void(t3)));
	t2 = (T157x12216(GE_void(l1)));
	t2 = ((T1)(!(t2)));
	if (t2) {
		((T157*)(C))->a12 = EIF_TRUE;
	} else {
		t2 = (T157x12168(GE_void(l1)));
		if (t2) {
			((T157*)(C))->a13 = EIF_TRUE;
		}
	}
}

/* ET_DYNAMIC_TYPE.new_dynamic_query */
T0* T157f20(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_builtin_attribute */
T1 T233f19(T0* C, T0* a1, T6 a2, T0* a3)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a7);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a26);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a24);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a25);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_builtin_attribute */
T1 T232f19(T0* C, T0* a1, T6 a2, T0* a3)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a7);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a26);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a24);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a25);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_builtin_attribute */
T1 T228f19(T0* C, T0* a1, T6 a2, T0* a3)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a7);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a26);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a24);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a25);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_builtin_attribute */
T1 T214f19(T0* C, T0* a1, T6 a2, T0* a3)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a7);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a26);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a24);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a25);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_TYPE.is_builtin_attribute */
T1 T157f30(T0* C, T0* a1, T6 a2, T0* a3)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	t1 = ((T6)((a2)/((T6)(GE_int32(100)))));
	switch (t1) {
	case (T6)(T6)(GE_int32(5)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a7);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(3)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a10);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(4)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a11);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(16)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a26);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(6)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a13);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(7)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a14);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(8)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a15);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(9)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a16);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(10)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a18);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(11)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a19);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(12)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a20);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(13)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a21);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(14)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a24);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(15)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(1))));
		if (t2) {
			t3 = (((T58*)(GE_void(a3)))->a25);
			R = ((C)!=(t3));
		}
		break;
	case (T6)(T6)(GE_int32(23)):
		t1 = ((T6)((a2)%((T6)(GE_int32(100)))));
		t2 = ((t1)==((T6)(GE_int32(14))));
		if (t2) {
			R = EIF_TRUE;
		}
		break;
	default:
		R = EIF_FALSE;
		break;
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_special */
T1 T233f60(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_special */
T1 T232f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_special */
T1 T214f61(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TYPE.is_special */
T1 T157f58(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.is_expanded */
T1 T233f23(T0* C)
{
	T1 R = 0;
	R = (T158x6130(GE_void(((T233*)(C))->a2)));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.is_expanded */
T1 T232f23(T0* C)
{
	T1 R = 0;
	R = (T158x6130(GE_void(((T232*)(C))->a2)));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_expanded */
T1 T228f23(T0* C)
{
	T1 R = 0;
	R = (T158x6130(GE_void(((T228*)(C))->a2)));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_expanded */
T1 T214f23(T0* C)
{
	T1 R = 0;
	R = (T158x6130(GE_void(((T214*)(C))->a2)));
	return R;
}

/* ET_DYNAMIC_TYPE.is_expanded */
T1 T157f21(T0* C)
{
	T1 R = 0;
	R = (T158x6130(GE_void(((T157*)(C))->a1)));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.dynamic_procedure */
T0* T233f51(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T233f21(C));
	t2 = ((((T233*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T233*)(C))->a6)))->a5);
		t3 = (((T161*)(GE_void(t1)))->a1);
		((T233*)(C))->a7 = T217c8(t3);
		R = (T233f24(C, a1, a2));
		T217f9(GE_void(((T233*)(C))->a7), R);
	} else {
		l2 = (((T217*)(GE_void(((T233*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T233*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T233f24(C, a1, a2));
			T217f10(GE_void(((T233*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.new_dynamic_procedure */
T0* T233f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T1 t5;
	R = (T233f24p1(C, a1, a2));
	t1 = (((T163*)(GE_void(R)))->a7);
	t2 = (T233f47(C));
	t3 = (T233f47(C));
	t4 = ((T6)(GE_int32(1)));
	t4 = (T170f21(GE_void(t2), t4));
	t5 = ((t1)==(t4));
	if (t5) {
		t2 = (((T58*)(GE_void(a2)))->a6);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f257(t2, C, R);
		} else {
			T155f16(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.tokens */
T0* T233f47(T0* C)
{
	T0* R = 0;
	if (ge768os2712) {
		return ge768ov2712;
	} else {
		ge768os2712 = '\1';
	}
	R = T170c920();
	ge768ov2712 = R;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.new_dynamic_procedure */
T0* T233f24p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.dynamic_procedure */
T0* T232f51(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T232f21(C));
	t2 = ((((T232*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T232*)(C))->a6)))->a5);
		t3 = (((T161*)(GE_void(t1)))->a1);
		((T232*)(C))->a7 = T217c8(t3);
		R = (T232f24(C, a1, a2));
		T217f9(GE_void(((T232*)(C))->a7), R);
	} else {
		l2 = (((T217*)(GE_void(((T232*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T232*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T232f24(C, a1, a2));
			T217f10(GE_void(((T232*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_procedure */
T0* T232f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 t1;
	T0* t2;
	T0* t3;
	T6 t4;
	T1 t5;
	R = (T232f24p1(C, a1, a2));
	t1 = (((T163*)(GE_void(R)))->a7);
	t2 = (T232f47(C));
	t3 = (T232f47(C));
	t4 = ((T6)(GE_int32(2)));
	t4 = (T170f23(GE_void(t2), t4));
	t5 = ((t1)==(t4));
	if (t5) {
		t2 = (((T58*)(GE_void(a2)))->a6);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f257(t2, C, R);
		} else {
			T155f16(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.new_dynamic_procedure */
T0* T232f24p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.dynamic_procedure */
T0* T228f51(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T228f21(C));
	t2 = ((((T228*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T228*)(C))->a6)))->a5);
		t3 = (((T161*)(GE_void(t1)))->a1);
		((T228*)(C))->a7 = T217c8(t3);
		R = (T228f24(C, a1, a2));
		T217f9(GE_void(((T228*)(C))->a7), R);
	} else {
		l2 = (((T217*)(GE_void(((T228*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T228*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T228f24(C, a1, a2));
			T217f10(GE_void(((T228*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_procedure */
T0* T228f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* t1;
	T1 t2;
	R = (T228f24p1(C, a1, a2));
	l1 = (T162x12625(GE_void(a1)));
	t1 = (T228f47(C));
	t1 = (T170f47(GE_void(t1)));
	t2 = (T169x11696T0(GE_void(l1), t1));
	if (t2) {
		l2 = (((T163*)(GE_void(R)))->a2);
		l5 = (((T183*)(GE_void(l2)))->a1);
		l3 = T183c8(l5);
		T183f11(GE_void(l3), ((T228*)(C))->a8);
		l4 = (T6)(GE_int32(2));
		t2 = (T6f1(&l4, l5));
		while (!(t2)) {
			t1 = (T183f3(GE_void(l2), l4));
			T183f11(GE_void(l3), t1);
			l4 = ((T6)((l4)+((T6)(GE_int32(1)))));
			t2 = (T6f1(&l4, l5));
		}
		T163f51(GE_void(R), l3);
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.new_dynamic_procedure */
T0* T228f24p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.dynamic_procedure */
T0* T214f51(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T214f21(C));
	t2 = ((((T214*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T214*)(C))->a6)))->a5);
		t3 = (((T161*)(GE_void(t1)))->a1);
		((T214*)(C))->a7 = T217c8(t3);
		R = (T214f24(C, a1, a2));
		T217f9(GE_void(((T214*)(C))->a7), R);
	} else {
		l2 = (((T217*)(GE_void(((T214*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T214*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T214f24(C, a1, a2));
			T217f10(GE_void(((T214*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_procedure */
T0* T214f24(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T1 t1;
	T0* t2;
	T1 t3;
	R = (T214f24p1(C, a1, a2));
	l1 = (T162x12625(GE_void(a1)));
	t1 = (T163f23(GE_void(R)));
	t1 = ((T1)(!(t1)));
	if (t1) {
		t2 = (T214f47(C));
		t2 = (T170f47(GE_void(t2)));
		t3 = (T169x11696T0(GE_void(l1), t2));
		if (!(t3)) {
			t2 = (T214f47(C));
			t2 = (T170f48(GE_void(t2)));
			t1 = (T169x11696T0(GE_void(l1), t2));
		} else {
			t1 = EIF_TRUE;
		}
	}
	if (t1) {
		t2 = (((T58*)(GE_void(a2)))->a6);
		if (((T0*)(GE_void(t2)))->id==64) {
			T64f256(t2, C, R);
		} else {
			T155f15(t2, C, R);
		}
	}
	return R;
}

/* ET_DYNAMIC_NULL_TYPE_SET_BUILDER.build_tuple_put */
void T155f15(T0* C, T0* a1, T0* a2)
{
}

/* ET_DYNAMIC_PUSH_TYPE_SET_BUILDER.build_tuple_put */
void T64f256(T0* C, T0* a1, T0* a2)
{
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	l3 = (((T163*)(a2))->a2);
	t1 = (((T183*)(GE_void(l3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(1))));
	if (t2) {
		l4 = (T183f3(GE_void(l3), (T6)(GE_int32(1))));
		l5 = (((T214*)(a1))->a8);
		l2 = (((T183*)(GE_void(l5)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			t3 = (T183f3(GE_void(l5), l1));
			T175x12222T0T0(GE_void(l4), t3, ((T64*)(C))->a2);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			t2 = (T6f1(&l1, l2));
		}
	}
}

/* ET_DYNAMIC_TUPLE_TYPE.new_dynamic_procedure */
T0* T214f24p1(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_TYPE.dynamic_procedure */
T0* T157f26(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T157f19(C));
	t2 = ((((T157*)(C))->a7)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T157*)(C))->a6)))->a5);
		t3 = (((T161*)(GE_void(t1)))->a1);
		((T157*)(C))->a7 = T217c8(t3);
		R = (T157f22(C, a1, a2));
		T217f9(GE_void(((T157*)(C))->a7), R);
	} else {
		l2 = (((T217*)(GE_void(((T157*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T157*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T157f22(C, a1, a2));
			T217f10(GE_void(((T157*)(C))->a7), R);
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.new_dynamic_procedure */
T0* T157f22(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	R = T163c47(a1, C, a2);
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.dynamic_query */
T0* T233f48(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T233f21(C));
	t2 = ((((T233*)(C))->a4)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T233*)(C))->a6)))->a4);
		t3 = (((T159*)(GE_void(t1)))->a1);
		((T233*)(C))->a4 = T217c8(t3);
		R = (T233f22(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
		if (t2) {
			T233f71(C, R, a2);
		} else {
			T217f9(GE_void(((T233*)(C))->a4), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T233*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T233*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T233f22(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T233f71(C, R, a2);
			} else {
				T217f10(GE_void(((T233*)(C))->a4), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.dynamic_query */
T0* T232f48(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T232f21(C));
	t2 = ((((T232*)(C))->a4)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T232*)(C))->a6)))->a4);
		t3 = (((T159*)(GE_void(t1)))->a1);
		((T232*)(C))->a4 = T217c8(t3);
		R = (T232f22(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
		if (t2) {
			T232f71(C, R, a2);
		} else {
			T217f9(GE_void(((T232*)(C))->a4), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T232*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T232*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T232f22(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T232f71(C, R, a2);
			} else {
				T217f10(GE_void(((T232*)(C))->a4), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.dynamic_query */
T0* T228f48(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T228f21(C));
	t2 = ((((T228*)(C))->a4)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T228*)(C))->a6)))->a4);
		t3 = (((T159*)(GE_void(t1)))->a1);
		((T228*)(C))->a4 = T217c8(t3);
		R = (T228f22(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
		if (t2) {
			T228f70(C, R, a2);
		} else {
			T217f9(GE_void(((T228*)(C))->a4), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T228*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T228*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T228f22(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T228f70(C, R, a2);
			} else {
				T217f10(GE_void(((T228*)(C))->a4), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.dynamic_query */
T0* T214f48(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T214f21(C));
	t2 = ((((T214*)(C))->a4)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T214*)(C))->a6)))->a4);
		t3 = (((T159*)(GE_void(t1)))->a1);
		((T214*)(C))->a4 = T217c8(t3);
		R = (T214f22(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
		if (t2) {
			T214f71(C, R, a2);
		} else {
			T217f9(GE_void(((T214*)(C))->a4), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T214*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T214*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T214f22(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T214f71(C, R, a2);
			} else {
				T217f10(GE_void(((T214*)(C))->a4), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.dynamic_query */
T0* T157f27(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T157f19(C));
	t2 = ((((T157*)(C))->a4)==(t1));
	if (t2) {
		t1 = (((T60*)(GE_void(((T157*)(C))->a6)))->a4);
		t3 = (((T159*)(GE_void(t1)))->a1);
		((T157*)(C))->a4 = T217c8(t3);
		R = (T157f20(C, a1, a2));
		t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
		if (t2) {
			T157f68(C, R, a2);
		} else {
			T217f9(GE_void(((T157*)(C))->a4), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T157*)(C))->a4)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l3 = (T217f4(GE_void(((T157*)(C))->a4), l1));
			t1 = (((((T0*)(GE_void(l3)))->id==163)?((T163*)(l3))->a1:((T219*)(l3))->a3));
			t2 = ((t1)==(a1));
			if (t2) {
				R = l3;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = (T157f20(C, a1, a2));
			t2 = (((((T0*)(GE_void(R)))->id==163)?T163f31(R, a2):T219f18(R, a2)));
			if (t2) {
				T157f68(C, R, a2);
			} else {
				T217f10(GE_void(((T157*)(C))->a4), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.is_agent_type */
T1 T228f64(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.is_agent_type */
T1 T214f65(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_TYPE.is_agent_type */
T1 T157f62(T0* C)
{
	T1 R = 0;
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.conforms_to_type */
T1 T233f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	l1 = (((T58*)(GE_void(a2)))->a2);
	l2 = (((((T0*)(GE_void(l1)))->id==53)?((T53*)(l1))->a4:((T56*)(l1))->a4));
	t1 = (T157x12178(GE_void(a1)));
	R = (T158x6226T0T0T0T0(GE_void(((T233*)(C))->a2), t1, l2, l2, l1));
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.conforms_to_type */
T1 T232f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	l1 = (((T58*)(GE_void(a2)))->a2);
	l2 = (((((T0*)(GE_void(l1)))->id==53)?((T53*)(l1))->a4:((T56*)(l1))->a4));
	t1 = (T157x12178(GE_void(a1)));
	R = (T158x6226T0T0T0T0(GE_void(((T232*)(C))->a2), t1, l2, l2, l1));
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.conforms_to_type */
T1 T228f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	l1 = (((T58*)(GE_void(a2)))->a2);
	l2 = (((((T0*)(GE_void(l1)))->id==53)?((T53*)(l1))->a4:((T56*)(l1))->a4));
	t1 = (T157x12178(GE_void(a1)));
	R = (T158x6226T0T0T0T0(GE_void(((T228*)(C))->a2), t1, l2, l2, l1));
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.conforms_to_type */
T1 T214f20(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	l1 = (((T58*)(GE_void(a2)))->a2);
	l2 = (((((T0*)(GE_void(l1)))->id==53)?((T53*)(l1))->a4:((T56*)(l1))->a4));
	t1 = (T157x12178(GE_void(a1)));
	R = (T158x6226T0T0T0T0(GE_void(((T214*)(C))->a2), t1, l2, l2, l1));
	return R;
}

/* ET_DYNAMIC_TYPE.conforms_to_type */
T1 T157f23(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	l1 = (((T58*)(GE_void(a2)))->a2);
	l2 = (((((T0*)(GE_void(l1)))->id==53)?((T53*)(l1))->a4:((T56*)(l1))->a4));
	t1 = (T157x12178(GE_void(a1)));
	R = (T158x6226T0T0T0T0(GE_void(((T157*)(C))->a1), t1, l2, l2, l1));
	return R;
}

/* ET_DYNAMIC_PROCEDURE_TYPE.seeded_dynamic_procedure */
T0* T233f55(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T233f21(C));
	t2 = ((((T233*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f66(GE_void(((T233*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T233*)(C))->a6)))->a5);
			t3 = (((T161*)(GE_void(t1)))->a1);
			((T233*)(C))->a7 = T217c8(t3);
			R = (T233f24(C, l3, a2));
			T217f9(GE_void(((T233*)(C))->a7), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T233*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T233*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f66(GE_void(((T233*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T233f24(C, l3, a2));
				T217f10(GE_void(((T233*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_FUNCTION_TYPE.seeded_dynamic_procedure */
T0* T232f56(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T232f21(C));
	t2 = ((((T232*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f66(GE_void(((T232*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T232*)(C))->a6)))->a5);
			t3 = (((T161*)(GE_void(t1)))->a1);
			((T232*)(C))->a7 = T217c8(t3);
			R = (T232f24(C, l3, a2));
			T217f9(GE_void(((T232*)(C))->a7), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T232*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T232*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f66(GE_void(((T232*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T232f24(C, l3, a2));
				T217f10(GE_void(((T232*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_SPECIAL_TYPE.seeded_dynamic_procedure */
T0* T228f55(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T228f21(C));
	t2 = ((((T228*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f66(GE_void(((T228*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T228*)(C))->a6)))->a5);
			t3 = (((T161*)(GE_void(t1)))->a1);
			((T228*)(C))->a7 = T217c8(t3);
			R = (T228f24(C, l3, a2));
			T217f9(GE_void(((T228*)(C))->a7), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T228*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T228*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f66(GE_void(((T228*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T228f24(C, l3, a2));
				T217f10(GE_void(((T228*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TUPLE_TYPE.seeded_dynamic_procedure */
T0* T214f56(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T214f21(C));
	t2 = ((((T214*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f66(GE_void(((T214*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T214*)(C))->a6)))->a5);
			t3 = (((T161*)(GE_void(t1)))->a1);
			((T214*)(C))->a7 = T217c8(t3);
			R = (T214f24(C, l3, a2));
			T217f9(GE_void(((T214*)(C))->a7), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T214*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T214*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f66(GE_void(((T214*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T214f24(C, l3, a2));
				T217f10(GE_void(((T214*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_DYNAMIC_TYPE.seeded_dynamic_procedure */
T0* T157f31(T0* C, T6 a1, T0* a2)
{
	T0* R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	t1 = (T157f19(C));
	t2 = ((((T157*)(C))->a7)==(t1));
	if (t2) {
		l3 = (T60f66(GE_void(((T157*)(C))->a6), a1));
		t2 = ((l3)!=(EIF_VOID));
		if (t2) {
			t1 = (((T60*)(GE_void(((T157*)(C))->a6)))->a5);
			t3 = (((T161*)(GE_void(t1)))->a1);
			((T157*)(C))->a7 = T217c8(t3);
			R = (T157f22(C, l3, a2));
			T217f9(GE_void(((T157*)(C))->a7), R);
		}
	} else {
		l2 = (((T217*)(GE_void(((T157*)(C))->a7)))->a1);
		l1 = (T6)(GE_int32(1));
		t2 = (T6f1(&l1, l2));
		while (!(t2)) {
			l4 = (T217f4(GE_void(((T157*)(C))->a7), l1));
			t1 = (((((T0*)(GE_void(l4)))->id==163)?((T163*)(l4))->a1:((T219*)(l4))->a3));
			t2 = (T200x12623T6(GE_void(t1), a1));
			if (t2) {
				R = l4;
				l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
			} else {
				l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
			}
			t2 = (T6f1(&l1, l2));
		}
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			l3 = (T60f66(GE_void(((T157*)(C))->a6), a1));
			t2 = ((l3)!=(EIF_VOID));
			if (t2) {
				R = (T157f22(C, l3, a2));
				T217f10(GE_void(((T157*)(C))->a7), R);
			}
		}
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T1460f5(T0* C)
{
	T0* R = 0;
	R = (T1460f3(C, ge1020ov3869));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T1460f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T1460f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T1460f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1460f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T1460f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T1460*)(C))->a1), l3));
						if (t2) {
							t1 = (T1460f4(C));
							t5 = (T86f5(GE_void(((T1460*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1460f4(C));
								t5 = (T1460f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T1460f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T1460f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.arguments */
T0* T1460f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ARRAY [STRING_8].valid_index */
T1 T86f4(T0* C, T6 a1)
{
	T1 R = 0;
	T1 t1;
	t1 = (T6f13(&(((T86*)(C))->a2), a1));
	if (t1) {
		R = (T6f13(&a1, ((T86*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T1460f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.default_message */
T0* T1391f12(T0* C)
{
	T0* R = 0;
	R = (T1391f7(C, ((T1391*)(C))->a1));
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.message */
T0* T1391f7(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T1391f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T1391f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1391f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T1391f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T1391*)(C))->a2), l3));
						if (t2) {
							t1 = (T1391f9(C));
							t5 = (T86f5(GE_void(((T1391*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1391f9(C));
								t5 = (T1391f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T1391f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T1391f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.arguments */
T0* T1391f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.string_ */
T0* T1391f9(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T1209f5(T0* C)
{
	T0* R = 0;
	R = (T1209f3(C, ge1017ov3869));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T1209f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T1209f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T1209f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1209f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T1209f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T1209*)(C))->a1), l3));
						if (t2) {
							t1 = (T1209f4(C));
							t5 = (T86f5(GE_void(((T1209*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1209f4(C));
								t5 = (T1209f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T1209f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T1209f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.arguments */
T0* T1209f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T1209f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T1010f5(T0* C)
{
	T0* R = 0;
	R = (T1010f3(C, ge230ov3869));
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.message */
T0* T1010f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T1010f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T1010f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1010f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T1010f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T1010*)(C))->a1), l3));
						if (t2) {
							t1 = (T1010f4(C));
							t5 = (T86f5(GE_void(((T1010*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1010f4(C));
								t5 = (T1010f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T1010f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T1010f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.arguments */
T0* T1010f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T1010f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T1009f5(T0* C)
{
	T0* R = 0;
	R = (T1009f3(C, ge229ov3869));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T1009f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T1009f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T1009f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1009f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T1009f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T1009*)(C))->a1), l3));
						if (t2) {
							t1 = (T1009f4(C));
							t5 = (T86f5(GE_void(((T1009*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T1009f4(C));
								t5 = (T1009f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T1009f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T1009f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T1009f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T1009f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T936f5(T0* C)
{
	T0* R = 0;
	R = (T936f3(C, ge1011ov3869));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T936f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T936f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T936f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T936f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T936f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T936*)(C))->a1), l3));
						if (t2) {
							t1 = (T936f4(C));
							t5 = (T86f5(GE_void(((T936*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T936f4(C));
								t5 = (T936f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T936f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T936f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T936f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T936f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T935f5(T0* C)
{
	T0* R = 0;
	R = (T935f3(C, ge1027ov3869));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T935f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T935f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T935f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T935f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T935f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T935*)(C))->a1), l3));
						if (t2) {
							t1 = (T935f4(C));
							t5 = (T86f5(GE_void(((T935*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T935f4(C));
								t5 = (T935f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T935f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T935f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.arguments */
T0* T935f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T935f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T934f5(T0* C)
{
	T0* R = 0;
	R = (T934f3(C, ge1024ov3869));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T934f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T934f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T934f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T934f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T934f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T934*)(C))->a1), l3));
						if (t2) {
							t1 = (T934f4(C));
							t5 = (T86f5(GE_void(((T934*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T934f4(C));
								t5 = (T934f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T934f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T934f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.arguments */
T0* T934f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T934f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T933f5(T0* C)
{
	T0* R = 0;
	R = (T933f3(C, ge1023ov3869));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T933f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T933f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T933f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T933f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T933f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T933*)(C))->a1), l3));
						if (t2) {
							t1 = (T933f4(C));
							t5 = (T86f5(GE_void(((T933*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T933f4(C));
								t5 = (T933f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T933f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T933f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.arguments */
T0* T933f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T933f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T932f5(T0* C)
{
	T0* R = 0;
	R = (T932f3(C, ge1019ov3869));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T932f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T932f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T932f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T932f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T932f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T932*)(C))->a1), l3));
						if (t2) {
							t1 = (T932f4(C));
							t5 = (T86f5(GE_void(((T932*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T932f4(C));
								t5 = (T932f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T932f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T932f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.arguments */
T0* T932f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T932f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T931f5(T0* C)
{
	T0* R = 0;
	R = (T931f3(C, ge1026ov3869));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T931f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T931f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T931f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T931f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T931f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T931*)(C))->a1), l3));
						if (t2) {
							t1 = (T931f4(C));
							t5 = (T86f5(GE_void(((T931*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T931f4(C));
								t5 = (T931f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T931f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T931f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.arguments */
T0* T931f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T931f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T930f5(T0* C)
{
	T0* R = 0;
	R = (T930f3(C, ge1018ov3869));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T930f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T930f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T930f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T930f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T930f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T930*)(C))->a1), l3));
						if (t2) {
							t1 = (T930f4(C));
							t5 = (T86f5(GE_void(((T930*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T930f4(C));
								t5 = (T930f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T930f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T930f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.arguments */
T0* T930f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T930f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T929f5(T0* C)
{
	T0* R = 0;
	R = (T929f3(C, ge1030ov3869));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T929f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T929f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T929f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T929f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T929f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T929*)(C))->a1), l3));
						if (t2) {
							t1 = (T929f4(C));
							t5 = (T86f5(GE_void(((T929*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T929f4(C));
								t5 = (T929f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T929f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T929f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.arguments */
T0* T929f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T929f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_SYNTAX_ERROR.default_message */
T0* T926f17(T0* C)
{
	T0* R = 0;
	R = (T926f19(C, ((T926*)(C))->a1));
	return R;
}

/* ET_SYNTAX_ERROR.message */
T0* T926f19(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T926f15(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T926f15(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T926f15(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T926f15(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T926*)(C))->a2), l3));
						if (t2) {
							t1 = (T926f15(C));
							t5 = (T86f5(GE_void(((T926*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T926f15(C));
								t5 = (T926f18(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T926f15(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T926f15(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_SYNTAX_ERROR.arguments */
T0* T926f18(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_SYNTAX_ERROR.string_ */
T0* T926f15(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_CLUSTER_ERROR.default_message */
T0* T925f12(T0* C)
{
	T0* R = 0;
	R = (T925f7(C, ((T925*)(C))->a1));
	return R;
}

/* ET_CLUSTER_ERROR.message */
T0* T925f7(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T925f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T925f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T925f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T925f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T925*)(C))->a2), l3));
						if (t2) {
							t1 = (T925f9(C));
							t5 = (T86f5(GE_void(((T925*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T925f9(C));
								t5 = (T925f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T925f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T925f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_CLUSTER_ERROR.arguments */
T0* T925f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_CLUSTER_ERROR.string_ */
T0* T925f9(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_VALIDITY_ERROR.default_message */
T0* T924f60(T0* C)
{
	T0* R = 0;
	R = (T924f18(C, ((T924*)(C))->a5));
	return R;
}

/* ET_VALIDITY_ERROR.message */
T0* T924f18(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T924f59(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T924f59(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T924f59(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T924f59(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T924*)(C))->a6), l3));
						if (t2) {
							t1 = (T924f59(C));
							t5 = (T86f5(GE_void(((T924*)(C))->a6), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T924f59(C));
								t5 = (T924f62(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T924f59(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T924f59(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_VALIDITY_ERROR.arguments */
T0* T924f62(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_VALIDITY_ERROR.string_ */
T0* T924f59(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_INTERNAL_ERROR.default_message */
T0* T923f5(T0* C)
{
	T0* R = 0;
	R = (T923f7(C, ((T923*)(C))->a1));
	return R;
}

/* ET_INTERNAL_ERROR.message */
T0* T923f7(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T923f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T923f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T923f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T923f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T923*)(C))->a2), l3));
						if (t2) {
							t1 = (T923f9(C));
							t5 = (T86f5(GE_void(((T923*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T923f9(C));
								t5 = (T923f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T923f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T923f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_INTERNAL_ERROR.arguments */
T0* T923f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_INTERNAL_ERROR.string_ */
T0* T923f9(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_SYSTEM_ERROR.default_message */
T0* T922f5(T0* C)
{
	T0* R = 0;
	R = (T922f7(C, ((T922*)(C))->a1));
	return R;
}

/* ET_SYSTEM_ERROR.message */
T0* T922f7(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T922f9(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T922f9(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T922f9(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T922f9(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T922*)(C))->a2), l3));
						if (t2) {
							t1 = (T922f9(C));
							t5 = (T86f5(GE_void(((T922*)(C))->a2), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T922f9(C));
								t5 = (T922f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T922f9(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T922f9(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_SYSTEM_ERROR.arguments */
T0* T922f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_SYSTEM_ERROR.string_ */
T0* T922f9(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T294f5(T0* C)
{
	T0* R = 0;
	R = (T294f3(C, ge1014ov3869));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T294f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T294f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T294f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T294f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T294f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T294*)(C))->a1), l3));
						if (t2) {
							t1 = (T294f4(C));
							t5 = (T86f5(GE_void(((T294*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T294f4(C));
								t5 = (T294f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T294f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T294f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.arguments */
T0* T294f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T294f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T293f5(T0* C)
{
	T0* R = 0;
	R = (T293f3(C, ge1025ov3869));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T293f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T293f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T293f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T293f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T293f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T293*)(C))->a1), l3));
						if (t2) {
							t1 = (T293f4(C));
							t5 = (T86f5(GE_void(((T293*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T293f4(C));
								t5 = (T293f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T293f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T293f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.arguments */
T0* T293f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T293f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T292f5(T0* C)
{
	T0* R = 0;
	R = (T292f3(C, ge1029ov3869));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T292f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T292f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T292f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T292f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T292f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T292*)(C))->a1), l3));
						if (t2) {
							t1 = (T292f4(C));
							t5 = (T86f5(GE_void(((T292*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T292f4(C));
								t5 = (T292f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T292f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T292f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.arguments */
T0* T292f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T291f5(T0* C)
{
	T0* R = 0;
	R = (T291f3(C, ge1021ov3869));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T291f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T291f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T291f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T291f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T291f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T291*)(C))->a1), l3));
						if (t2) {
							t1 = (T291f4(C));
							t5 = (T86f5(GE_void(((T291*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T291f4(C));
								t5 = (T291f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T291f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T291f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.arguments */
T0* T291f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T291f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T290f5(T0* C)
{
	T0* R = 0;
	R = (T290f3(C, ge1012ov3869));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T290f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T290f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T290f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T290f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T290f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T290*)(C))->a1), l3));
						if (t2) {
							t1 = (T290f4(C));
							t5 = (T86f5(GE_void(((T290*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T290f4(C));
								t5 = (T290f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T290f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T290f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.arguments */
T0* T290f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T290f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T216f2(T0* C)
{
	T0* R = 0;
	R = (T216f4(C, ge224ov3869));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T216f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T216f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T216f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T216f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T216f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T216*)(C))->a1), l3));
						if (t2) {
							t1 = (T216f5(C));
							t5 = (T86f5(GE_void(((T216*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T216f5(C));
								t5 = (T216f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T216f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T216f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T216f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T216f5(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T114f5(T0* C)
{
	T0* R = 0;
	R = (T114f3(C, ge227ov3869));
	return R;
}

/* UT_MESSAGE.message */
T0* T114f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T114f4(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T114f4(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T114f4(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T114f4(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T114*)(C))->a1), l3));
						if (t2) {
							t1 = (T114f4(C));
							t5 = (T86f5(GE_void(((T114*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T114f4(C));
								t5 = (T114f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T114f4(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T114f4(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T114f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T114f4(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T69f2(T0* C)
{
	T0* R = 0;
	R = (T69f4(C, ge234ov3869));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T69f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T69f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T69f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T69f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T69f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T69*)(C))->a1), l3));
						if (t2) {
							t1 = (T69f5(C));
							t5 = (T86f5(GE_void(((T69*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T69f5(C));
								t5 = (T69f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T69f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T69f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T69f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T69f5(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T68f2(T0* C)
{
	T0* R = 0;
	R = (T68f4(C, ge223ov3869));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T68f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(a1))->a2);
	t1 = (T68f5(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T68f5(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(a1, l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T68f5(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T68f5(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(a1, l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T68*)(C))->a1), l3));
						if (t2) {
							t1 = (T68f5(C));
							t5 = (T86f5(GE_void(((T68*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T68f5(C));
								t5 = (T68f6(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T68f5(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T68f5(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T68f6(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T68f5(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* AP_ERROR.default_message */
T0* T32f16(T0* C)
{
	T0* R = 0;
	R = (T32f17(C, ((T32*)(C))->a2));
	return R;
}

/* AP_ERROR.message */
T0* T32f17(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T2 l5 = 0;
	T1 l6 = 0;
	T1 l7 = 0;
	T1 l8 = 0;
	T0* t1;
	T1 t2;
	T6 t3;
	T6 t4;
	T0* t5;
	l2 = (T6)(GE_int32(1));
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T32f18(C));
	R = (T26f7(GE_void(t1), a1, l4));
	t2 = (T6f1(&l2, l4));
	while (!(t2)) {
		l5 = (T17f10(GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = ((l5)!=((T2)('$')));
		if (t2) {
			t2 = ((l5)!=((T2)('\000')));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, l5);
				} else {
					T948f58(R, l5);
				}
			} else {
				t1 = (T32f18(C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T26f5(GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f1(&l2, l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f39(R, (T2)('$'));
				} else {
					T948f58(R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(GE_void(a1), l2));
				t2 = ((l5)==((T2)('$')));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f39(R, (T2)('$'));
					} else {
						T948f58(R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T32f18(C));
					l1 = (T26f7(GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = ((l5)==((T2)('{')));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T17f10(GE_void(a1), l2));
							t2 = ((l5)==((T2)('}')));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = ((l5)!=((T2)('\000')));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f39(l1, l5);
									} else {
										T948f58(l1, l5);
									}
								} else {
									t1 = (T32f18(C));
									T26f20(GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						t2 = (T6f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T17f10(GE_void(a1), l2));
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
									T17f39(l1, l5);
								} else {
									T948f58(l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
							t2 = (T6f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(l1):T948f35(l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f16(l1):T948f36(l1)));
						t2 = (T86f4(GE_void(((T32*)(C))->a1), l3));
						if (t2) {
							t1 = (T32f18(C));
							t5 = (T86f5(GE_void(((T32*)(C))->a1), l3));
							R = (T26f8(GE_void(t1), R, t5));
						} else {
							t2 = ((l3)==((T6)(GE_int32(0))));
							if (t2) {
								t1 = (T32f18(C));
								t5 = (T32f19(C));
								t5 = (((T23*)(GE_void(t5)))->a1);
								R = (T26f8(GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f39(R, (T2)('$'));
								} else {
									T948f58(R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('{'));
									} else {
										T948f58(R, (T2)('{'));
									}
								}
								t1 = (T32f18(C));
								R = (T26f8(GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f39(R, (T2)('}'));
									} else {
										T948f58(R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f39(R, (T2)('$'));
						} else {
							T948f58(R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('{'));
							} else {
								T948f58(R, (T2)('{'));
							}
						}
						t1 = (T32f18(C));
						R = (T26f8(GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f39(R, (T2)('}'));
							} else {
								T948f58(R, (T2)('}'));
							}
						}
					}
				}
			}
		}
		t2 = (T6f1(&l2, l4));
	}
	return R;
}

/* AP_ERROR.arguments */
T0* T32f19(T0* C)
{
	T0* R = 0;
	if (ge323os1581) {
		return ge323ov1581;
	} else {
		ge323os1581 = '\1';
	}
	R = T23c4();
	ge323ov1581 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T32f18(T0* C)
{
	T0* R = 0;
	if (ge277os1589) {
		return ge277ov1589;
	} else {
		ge277os1589 = '\1';
	}
	R = T26c19();
	ge277ov1589 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T41f24(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T41*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T37f18(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T37f17(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.was_found */
T1 T36f12(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T36f11(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T35f14(T0* C)
{
	T1 R = 0;
	T6 t1;
	t1 = (T35f10(C));
	R = (T6f1(&t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_FLAG.was_found */
T1 T33f9(T0* C)
{
	T1 R = 0;
	R = (T6f1(&(((T33*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T37f17(T0* C)
{
	T6 R = 0;
	R = (((T80*)(GE_void(((T37*)(C))->a1)))->a1);
	return R;
}

/* AP_INTEGER_OPTION.occurrences */
T6 T36f11(T0* C)
{
	T6 R = 0;
	R = (((T92*)(GE_void(((T36*)(C))->a1)))->a1);
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T35f10(T0* C)
{
	T6 R = 0;
	R = (((T89*)(GE_void(((T35*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T41f21(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_ENUMERATION_OPTION.allows_parameter */
T1 T37f15(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_INTEGER_OPTION.allows_parameter */
T1 T36f16(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.allows_parameter */
T1 T35f13(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T33f12(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T41f19(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_INTEGER_OPTION.needs_parameter */
T1 T36f15(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.needs_parameter */
T1 T35f12(T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T33f11(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T41f20(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T41f18(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T41*)(C))->a4));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T41*)(C))->a2)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.name */
T0* T37f12(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T37f14(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T37*)(C))->a6));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T37*)(C))->a10)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_INTEGER_OPTION.name */
T0* T36f10(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T36f13(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T36*)(C))->a2));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T36*)(C))->a3)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.name */
T0* T35f16(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T35f11(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T35*)(C))->a4));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T35*)(C))->a8)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T33f13(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T0* t4;
	t1 = (T33f10(C));
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t2 = (T2)('-');
		t4 = (T2f1(&t2));
		t3 = (T17f9(GE_void(t3), t4));
		R = (T17f9(GE_void(t3), ((T33*)(C))->a3));
	} else {
		t2 = (T2)('-');
		t3 = (T2f1(&t2));
		t4 = (T2f1(&(((T33*)(C))->a4)));
		R = (T17f9(GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T41f26(T0* C)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T41*)(C))->a3) {
		t2 = (T2f1(&(((T41*)(C))->a2)));
		T17f41(GE_void(R), t2);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T41*)(C))->a4);
	}
	t1 = ((T1)(!(((T41*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.example */
T0* T37f19(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T37*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T37*)(C))->a9) {
		T17f39(GE_void(R), ((T37*)(C))->a10);
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T37*)(C))->a4);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T37*)(C))->a6);
		t1 = ((T1)(!(((T37*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f41(GE_void(R), ((T37*)(C))->a4);
		t1 = ((T1)(!(((T37*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T37*)(C))->a7)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_INTEGER_OPTION.example */
T0* T36f19(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T36*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T36*)(C))->a8) {
		T17f39(GE_void(R), ((T36*)(C))->a3);
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T36*)(C))->a5);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T36*)(C))->a2);
		t1 = (T36f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f41(GE_void(R), ((T36*)(C))->a5);
		t1 = (T36f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T36*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.example */
T0* T35f17(T0* C)
{
	T0* R = 0;
	T1 t1;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T35*)(C))->a5)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T35*)(C))->a7) {
		T17f39(GE_void(R), ((T35*)(C))->a8);
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T35*)(C))->a3);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T35*)(C))->a4);
		t1 = (T35f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		T17f39(GE_void(R), (T2)('='));
		T17f41(GE_void(R), ((T35*)(C))->a3);
		t1 = (T35f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T35*)(C))->a5)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T33f14(T0* C)
{
	T0* R = 0;
	T1 t1;
	T0* t2;
	R = T17c36((T6)(GE_int32(20)));
	t1 = ((T1)(!(((T33*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)('['));
	}
	T17f39(GE_void(R), (T2)('-'));
	if (((T33*)(C))->a5) {
		t2 = (T2f1(&(((T33*)(C))->a4)));
		T17f41(GE_void(R), t2);
	} else {
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T33*)(C))->a3);
	}
	t1 = ((T1)(!(((T33*)(C))->a6)));
	if (t1) {
		T17f39(GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T41f34(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T41*)(C))->a3) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T41*)(C))->a2);
	}
	t2 = (T41f18(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T41*)(C))->a4);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T37f23(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = (T37f23p1(C));
	t1 = (T37f14(C));
	if (t1) {
		t1 = ((T1)(!(((T37*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(GE_void(R), t3);
		T17f41(GE_void(R), ((T37*)(C))->a4);
		t1 = ((T1)(!(((T37*)(C))->a5)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T37*)(C))->a4);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T37f23p1(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T37*)(C))->a9) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T37*)(C))->a10);
	}
	t2 = (T37f14(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T37*)(C))->a6);
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T36f21(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = (T36f21p1(C));
	t1 = (T36f13(C));
	if (t1) {
		t1 = (T36f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(GE_void(R), t3);
		T17f41(GE_void(R), ((T36*)(C))->a5);
		t1 = (T36f15(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T36*)(C))->a5);
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T36f21p1(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T36*)(C))->a8) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T36*)(C))->a3);
	}
	t2 = (T36f13(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T36*)(C))->a2);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T35f24(T0* C)
{
	T0* R = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	R = (T35f24p1(C));
	t1 = (T35f11(C));
	if (t1) {
		t1 = (T35f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f1(&t2));
		T17f41(GE_void(R), t3);
		T17f41(GE_void(R), ((T35*)(C))->a3);
		t1 = (T35f12(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			T17f39(GE_void(R), (T2)(']'));
		}
	} else {
		T17f39(GE_void(R), (T2)(' '));
		T17f41(GE_void(R), ((T35*)(C))->a3);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T35f24p1(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T35*)(C))->a7) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T35*)(C))->a8);
	}
	t2 = (T35f11(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T35*)(C))->a4);
	}
	return R;
}

/* AP_FLAG.names */
T0* T33f17(T0* C)
{
	T0* R = 0;
	T2 t1;
	T1 t2;
	if (((T33*)(C))->a5) {
		t1 = (T2)('-');
		R = (T2f1(&t1));
		T17f39(GE_void(R), ((T33*)(C))->a4);
	}
	t2 = (T33f10(C));
	if (t2) {
		t2 = ((R)==(EIF_VOID));
		if (t2) {
			R = GE_ms("    ", 4);
		} else {
			T17f41(GE_void(R), GE_ms(", ", 2));
		}
		T17f39(GE_void(R), (T2)('-'));
		T17f39(GE_void(R), (T2)('-'));
		T17f41(GE_void(R), ((T33*)(C))->a3);
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.has_long_form */
T1 T41f18(T0* C)
{
	T1 R = 0;
	R = ((((T41*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_ENUMERATION_OPTION.has_long_form */
T1 T37f14(T0* C)
{
	T1 R = 0;
	R = ((((T37*)(C))->a6)!=(EIF_VOID));
	return R;
}

/* AP_INTEGER_OPTION.has_long_form */
T1 T36f13(T0* C)
{
	T1 R = 0;
	R = ((((T36*)(C))->a2)!=(EIF_VOID));
	return R;
}

/* AP_BOOLEAN_OPTION.has_long_form */
T1 T35f11(T0* C)
{
	T1 R = 0;
	R = ((((T35*)(C))->a4)!=(EIF_VOID));
	return R;
}

/* AP_FLAG.has_long_form */
T1 T33f10(T0* C)
{
	T1 R = 0;
	R = ((((T33*)(C))->a3)!=(EIF_VOID));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.last_character */
T2 T949f6(T0* C)
{
	T2 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1233*)(GE_void(((T949*)(C))->a3)))->a1);
	t2 = (T6f1(&t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1233f5(GE_void(((T949*)(C))->a3)));
	} else {
		R = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a9:((T1415*)(((T949*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1233f5(T0* C)
{
	T2 R = 0;
	R = (((T1339*)(GE_void(((T1233*)(C))->a2)))->a1);
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T949f21(T0* C)
{
	T1 R = 0;
	T6 t1;
	T1 t2;
	t1 = (((T1233*)(GE_void(((T949*)(C))->a3)))->a1);
	t2 = ((t1)==((T6)(GE_int32(0))));
	if (t2) {
		R = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f25(((T949*)(C))->a4):((T1415*)(((T949*)(C))->a4))->a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T1 T22f25(T0* C)
{
	T1 R = 0;
	R = ((T22*)(C))->a5;
	return R;
}

/* KL_STDIN_FILE.is_closable */
T1 T955f16(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T949f7(T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T22f32(T0* C)
{
	T1 R = 0;
	R = (T22f10(C));
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T6 T955f11(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	l2 = a2;
	t1 = ((l1)==(a3));
	if (!(t1)) {
		t1 = ((((T955*)(C))->a4)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(((T955*)(C))->a4), (T2)0));
		T17f53(a1, t2, l2);
		((T955*)(C))->a4 = ((GE_void(((T955*)(C))->a4), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T955*)(C))->a4)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T955f7(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T955f8(C));
			t1 = (T79f1(GE_void(t3), a1, ge408ov25347));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T955f10(C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c36(l4);
				T17f48(GE_void(l5), l4);
				l4 = (T955f10(C, l5, (T6)(GE_int32(1)), l4));
				l3 = (T6)(GE_int32(1));
				t1 = (T6f1(&l3, l4));
				while (!(t1)) {
					t2 = (T17f10(GE_void(l5), l3));
					T17f53(a1, t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					t1 = (T6f1(&l3, l4));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T955*)(C))->a1 = (T955f7(C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T955f10(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T0* t1;
	T6 t2;
	T14 t3;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f5(GE_void(t1), t2));
	R = (T955f13(C, ((T955*)(C))->a5, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T955f13(T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	R = (T6)(EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T955f8(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T949f28(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T1 t1;
	T6 t2;
	T2 t3;
	t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(6))));
	if (!(t1)) {
		t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(2))));
	}
	if (!(t1)) {
		t2 = (((T1233*)(GE_void(((T949*)(C))->a3)))->a1);
		t1 = (T6f1(&t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T949f32(C);
		t1 = (T949f21(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T949f6(C));
			T17f53(a1, t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = ((((T949*)(C))->a2)==((T6)(GE_int32(1))));
		if (t1) {
			R = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?T22f29(((T949*)(C))->a4, a1, a2, a3):T1415f7(((T949*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T949f28p1(C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T949f28p1(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	T2 t3;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	t2 = (T6f1(&l1, l2));
	while (!(t2)) {
		T949f32(C);
		t2 = (T949f21(C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T949f6(C));
			T17f53(a1, t3, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t2 = (T6f1(&l1, l2));
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_STRING_INPUT_STREAM.read_to_string */
T6 T1415f7(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 t1;
	T1 t2;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	t2 = (T6f1(&l1, l2));
	while (!(t2)) {
		T1415f9(C);
		t2 = ((T1)(!(((T1415*)(C))->a1)));
		if (t2) {
			T17f53(a1, ((T1415*)(C))->a2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
		t2 = (T6f1(&l1, l2));
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T6 T22f29(T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	T0* t5;
	l1 = a2;
	t1 = ((l5)==(a3));
	if (!(t1)) {
		t1 = ((((T22*)(C))->a4)==(EIF_VOID));
	}
	while (!(t1)) {
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((T72*)(GE_void(((T22*)(C))->a4)))->a1);
		T17f53(GE_void(a1), t2, l1);
		((T22*)(C))->a4 = (((T72*)(GE_void(((T22*)(C))->a4)))->a2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T22*)(C))->a4)==(EIF_VOID));
		}
	}
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T22f27(C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T22f35(C));
			t1 = (T79f1(GE_void(t3), a1, ge395ov1684));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T22f28(C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
			} else {
				t3 = (T22f35(C));
				t5 = (T22f37(C));
				t1 = (T79f1(GE_void(t3), a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T22f28(C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c36(l4);
					T17f48(GE_void(l2), l4);
					l4 = (T22f28(C, l2, (T6)(GE_int32(1)), l4));
					l3 = (T6)(GE_int32(1));
					t1 = (T6f1(&l3, l4));
					while (!(t1)) {
						t2 = (T17f10(GE_void(l2), l3));
						T17f53(GE_void(a1), t2, l1);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
						t1 = (T6f1(&l3, l4));
					}
					l5 = ((T6)((l5)+(l4)));
				}
			}
		}
		((T22*)(C))->a5 = (T22f27(C));
	}
	R = l5;
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge395os1685 = '\0';
T0* ge395ov1685;
T0* T22f37(T0* C)
{
	T0* R = 0;
	if (ge395os1685) {
		return ge395ov1685;
	} else {
		ge395os1685 = '\1';
	}
	R = T950c10((T6)(GE_int32(0)));
	ge395ov1685 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T22f35(T0* C)
{
	T0* R = 0;
	if (ge269os1664) {
		return ge269ov1664;
	} else {
		ge269os1664 = '\1';
	}
	R = T79c5();
	ge269ov1664 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T949f5(T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T949*)(C))->a4)))->id==22)?((T22*)(((T949*)(C))->a4))->a2:T1415f6(((T949*)(C))->a4)));
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge310os1660 = '\0';
T0* ge310ov1660;
T0* T1415f6(T0* C)
{
	T0* R = 0;
	if (ge310os1660) {
		return ge310ov1660;
	} else {
		ge310os1660 = '\1';
	}
	R = GE_ms("STRING", 6);
	ge310ov1660 = R;
	return R;
}

/* XM_NAMESPACE.is_equal */
T1 T1307f4(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	T0* t3;
	t1 = (((T1307*)(GE_void(a1)))->a1);
	t2 = ((((T1307*)(C))->a1)==(t1));
	if (!(t2)) {
		t2 = ((((T1307*)(C))->a1)!=(EIF_VOID));
		if (t2) {
			t1 = (T1307f3(C));
			t3 = (((T1307*)(GE_void(a1)))->a1);
			R = (T26f1(GE_void(t1), ((T1307*)(C))->a1, t3));
		} else {
			R = EIF_FALSE;
		}
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.is_equal */
T1 T361f10(T0* C, T0* a1)
{
	T1 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T6 t1;
	T1 t2;
	T0* t3;
	T0* t4;
	t1 = (((T361*)(a1))->a2);
	t2 = ((((T361*)(C))->a2)==(t1));
	if (t2) {
		t2 = ((((T361*)(C))->a2)==((T6)(GE_int32(0))));
		if (t2) {
			R = EIF_TRUE;
		} else {
			t2 = ((((T361*)(C))->a2)==((T6)(GE_int32(1))));
			if (t2) {
				t3 = (((T361*)(a1))->a3);
				R = (T361f15(C, ((T361*)(C))->a3, t3));
			} else {
				t2 = ((((T361*)(C))->a2)==((T6)(GE_int32(2))));
				if (t2) {
					t3 = (((T361*)(a1))->a3);
					t2 = (T361f15(C, ((T361*)(C))->a3, t3));
					if (t2) {
						t3 = (((T361*)(a1))->a4);
						R = (T361f15(C, ((T361*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
				} else {
					t3 = (((T361*)(a1))->a3);
					t2 = (T361f15(C, ((T361*)(C))->a3, t3));
					if (t2) {
						t3 = (((T361*)(a1))->a4);
						R = (T361f15(C, ((T361*)(C))->a4, t3));
					} else {
						R = EIF_FALSE;
					}
					l1 = (T368f6(GE_void(((T361*)(C))->a5)));
					T1034f8(GE_void(l1));
					t3 = (((T361*)(a1))->a5);
					l2 = (T368f6(GE_void(t3)));
					T1034f8(GE_void(l2));
					t2 = (((T1034*)(GE_void(l1)))->a3);
					if (!(t2)) {
						t2 = ((T1)(!(R)));
					}
					while (!(t2)) {
						t3 = (T1034f6(GE_void(l1)));
						t4 = (T1034f6(GE_void(l2)));
						R = (T361f15(C, t3, t4));
						T1034f9(GE_void(l1));
						T1034f9(GE_void(l2));
						t2 = (((T1034*)(GE_void(l1)))->a3);
						if (!(t2)) {
							t2 = ((T1)(!(R)));
						}
					}
				}
			}
		}
	}
	return R;
}

/* XM_EIFFEL_PARSER_NAME.same_string */
T1 T361f15(T0* C, T0* a1, T0* a2)
{
	T1 R = 0;
	T0* t1;
	t1 = (T361f8(C));
	R = (T48f1(GE_void(t1), a1, a2));
	return R;
}

/* ET_IDENTIFIER.is_equal */
T1 T129f32(T0* C, T0* a1)
{
	T1 R = 0;
	T0* t1;
	T1 t2;
	t1 = (T129f46(C));
	t2 = (T79f1(GE_void(t1), C, a1));
	if (t2) {
		R = (T129f34(C, a1));
	}
	return R;
}

/* STRING_8.is_equal */
T1 T17f19(T0* C, T0* a1)
{
	T1 R = 0;
	T6 l1 = 0;
	T1 t1;
	T6 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		R = EIF_TRUE;
	} else {
		l1 = ((T17*)(C))->a2;
		t2 = (((((T0*)(a1))->id==17)?((T17*)(a1))->a2:((T948*)(a1))->a1));
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (((((T0*)(a1))->id==17)?((T17*)(a1))->a1:((T948*)(a1))->a2));
			t2 = (T17f21(C, ((T17*)(C))->a1, t3, l1));
			R = ((t2)==((T6)(GE_int32(0))));
		}
	}
	return R;
}

/* STRING_8.str_strict_cmp */
T6 T17f21(T0* C, T0* a1, T0* a2, T6 a3)
{
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T1 t1;
	T2 t2;
	t1 = ((l1)==(a3));
	while (!(t1)) {
		t2 = (((T15*)(GE_void(a1)))->z2[l1]);
		l2 = ((T6)(t2));
		t2 = (((T15*)(GE_void(a2)))->z2[l1]);
		l3 = ((T6)(t2));
		t1 = ((l2)!=(l3));
		if (t1) {
			R = ((T6)((l2)-(l3)));
			l1 = ((T6)((a3)-((T6)(GE_int32(1)))));
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t1 = ((l1)==(a3));
	}
	return R;
}

T0* GE_ma898(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T897)+c*sizeof(T0*));
	((T0*)(t1))->id = 897;
	((T897*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T897*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T898));
	((T0*)(R))->id = 898;
	((T898*)(R))->a1 = t1;
	((T898*)(R))->a2 = 1;
	((T898*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma86(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T85)+c*sizeof(T0*));
	((T0*)(t1))->id = 85;
	((T85*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T85*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T86));
	((T0*)(R))->id = 86;
	((T86*)(R))->a1 = t1;
	((T86*)(R))->a2 = 1;
	((T86*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma319(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T117)+c*sizeof(T6));
	((T0*)(t1))->id = 117;
	((T117*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T6 *i = ((T117*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T319));
	((T0*)(R))->id = 319;
	((T319*)(R))->a1 = t1;
	((T319*)(R))->a2 = 1;
	((T319*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma958(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T635)+c*sizeof(T0*));
	((T0*)(t1))->id = 635;
	((T635*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T635*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T958));
	((T0*)(R))->id = 958;
	((T958*)(R))->a1 = t1;
	((T958*)(R))->a2 = 1;
	((T958*)(R))->a3 = (T6)c;
	return R;
}

T0* GE_ma343(T6 c, ...)
{
	T0* R;
	T0* t1;
	t1 = (T0*)GE_alloc(sizeof(T342)+c*sizeof(T0*));
	((T0*)(t1))->id = 342;
	((T342*)(t1))->z1 = c;
	if (c!=0) {
		va_list v;
		T6 n = c;
		T0* *i = ((T342*)(t1))->z2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = (T0*)GE_alloc(sizeof(T343));
	((T0*)(R))->id = 343;
	((T343*)(R))->a1 = t1;
	((T343*)(R))->a2 = 1;
	((T343*)(R))->a3 = (T6)c;
	return R;
}

T0* ge407ov9151;
T0* ge411ov2786;
T0* ge350ov25261;
T0* ge417ov9937;
T0* ge409ov9151;
T0* ge953ov7161;
T0* ge953ov7166;
T0* ge384ov1704;
T0* ge1152ov16887;
T0* ge1152ov16872;
T0* ge1152ov16865;
T0* ge1152ov16850;
T0* ge1152ov16875;
T0* ge1152ov16868;
T0* ge1152ov16876;
T0* ge1152ov16885;
T0* ge1152ov16878;
T0* ge1152ov16874;
T0* ge1152ov16862;
T0* ge1152ov16863;
T0* ge1152ov16877;
T0* ge1152ov16864;
T0* ge1152ov16851;
T0* ge1152ov16852;
T0* ge1152ov16853;
T0* ge1152ov16859;
T0* ge1152ov16861;
T0* ge1152ov16856;
T0* ge1152ov16881;
T0* ge1152ov16880;
T0* ge1152ov16857;
T0* ge1152ov16858;
T0* ge1152ov16855;
T0* ge1152ov16854;
T0* ge1148ov16645;
T0* ge953ov7163;
T0* ge953ov7165;
T0* ge953ov7057;
T0* ge953ov7087;
T0* ge953ov7061;
T0* ge953ov7138;
T0* ge773ov13926;
T0* ge773ov13890;
T0* ge773ov13826;
T0* ge773ov14011;
T0* ge953ov7137;
T0* ge953ov7092;
T0* ge953ov7094;
T0* ge953ov7147;
T0* ge953ov7110;
T0* ge953ov7104;
T0* ge953ov7052;
T0* ge953ov7133;
T0* ge953ov7102;
T0* ge773ov13906;
T0* ge773ov13843;
T0* ge948ov24221;
T0* ge948ov24220;
T0* ge948ov24219;
T0* ge773ov13985;
T0* ge953ov7131;
T0* ge953ov7095;
T0* ge953ov7089;
T0* ge953ov7132;
T0* ge953ov7066;
T0* ge953ov7088;
T0* ge953ov7139;
T0* ge953ov7158;
T0* ge953ov7106;
T0* ge953ov7108;
T0* ge953ov7107;
T0* ge953ov7151;
T0* ge953ov7054;
T0* ge953ov7109;
T0* ge953ov7136;
T0* ge953ov7093;
T0* ge953ov7135;
T0* ge953ov7099;
T0* ge953ov7148;
T0* ge953ov7146;
T0* ge953ov7097;
T0* ge773ov13988;
T0* ge953ov7119;
T0* ge953ov7117;
T0* ge953ov7103;
T0* ge953ov7051;
T0* ge953ov7125;
T0* ge953ov7098;
T0* ge953ov7149;
T0* ge953ov7154;
T0* ge953ov7118;
T0* ge953ov7126;
T0* ge953ov7058;
T0* ge953ov7111;
T0* ge953ov7105;
T0* ge953ov7055;
T0* ge953ov7091;
T0* ge953ov7082;
T0* ge953ov7081;
T0* ge953ov7074;
T0* ge953ov7073;
T0* ge953ov7072;
T0* ge953ov7067;
T0* ge953ov7062;
T0* ge953ov7060;
T0* ge953ov7124;
T0* ge953ov7112;
T0* ge953ov7100;
T0* ge953ov7145;
T0* ge773ov13921;
T0* ge953ov7155;
T0* ge953ov7150;
T0* ge953ov7090;
T0* ge953ov7162;
T0* ge953ov7059;
T0* ge953ov7144;
T0* ge953ov7084;
T0* ge953ov7083;
T0* ge953ov7075;
T0* ge953ov7079;
T0* ge953ov7078;
T0* ge953ov7077;
T0* ge953ov7076;
T0* ge953ov7071;
T0* ge953ov7070;
T0* ge953ov7069;
T0* ge953ov7068;
T0* ge953ov7064;
T0* ge953ov7063;
T0* ge953ov7065;
T0* ge773ov13834;
T0* ge773ov13855;
T0* ge773ov13845;
T0* ge773ov13838;
T0* ge773ov13868;
T0* ge773ov13831;
T0* ge773ov14007;
T0* ge951ov24209;
T0* ge951ov24203;
T0* ge951ov24197;
T0* ge951ov24205;
T0* ge951ov24199;
T0* ge951ov24193;
T0* ge951ov24208;
T0* ge951ov24202;
T0* ge951ov24196;
T0* ge951ov24210;
T0* ge951ov24204;
T0* ge951ov24198;
T0* ge773ov13901;
T0* ge951ov24207;
T0* ge951ov24201;
T0* ge951ov24195;
T0* ge773ov13974;
T0* ge773ov13940;
T0* ge773ov13983;
T0* ge773ov13929;
T0* ge773ov13899;
T0* ge952ov25083;
T0* ge952ov24841;
T0* ge952ov24705;
T0* ge952ov25081;
T0* ge952ov24839;
T0* ge952ov24703;
T0* ge952ov25082;
T0* ge952ov24840;
T0* ge952ov24704;
T0* ge773ov13871;
T0* ge951ov24206;
T0* ge951ov24200;
T0* ge951ov24194;
T0* ge944ov26426;
T0* ge944ov26424;
T0* ge944ov26422;
T0* ge1076ov4903;
T0* ge943ov25136;
T0* ge943ov25132;
T0* ge943ov25128;
T0* ge999ov19130;
T0* ge385ov9204;
T0* ge583ov11937;
T0* ge583ov11938;
T0* ge943ov25137;
T0* ge943ov25133;
T0* ge943ov25129;
T0* ge950ov25145;
T0* ge950ov25144;
T0* ge952ov25038;
T0* ge952ov24812;
T0* ge952ov24660;
T0* ge952ov25040;
T0* ge952ov24662;
T0* ge952ov25033;
T0* ge952ov24655;
T0* ge952ov25036;
T0* ge952ov24658;
T0* ge952ov25032;
T0* ge952ov24654;
T0* ge952ov25031;
T0* ge952ov24653;
T0* ge773ov14001;
T0* ge773ov13869;
T0* ge773ov14094;
T0* ge773ov14095;
T0* ge773ov14096;
T0* ge773ov14097;
T0* ge773ov14098;
T0* ge773ov14099;
T0* ge773ov14100;
T0* ge773ov14101;
T0* ge773ov14102;
T0* ge773ov14103;
T0* ge773ov14104;
T0* ge773ov14105;
T0* ge773ov14106;
T0* ge773ov14107;
T0* ge773ov14108;
T0* ge773ov14109;
T0* ge773ov14110;
T0* ge773ov14111;
T0* ge773ov14112;
T0* ge773ov14113;
T0* ge773ov14114;
T0* ge773ov14115;
T0* ge773ov14116;
T0* ge773ov14117;
T0* ge773ov14159;
T0* ge773ov14160;
T0* ge773ov14161;
T0* ge773ov13827;
T0* ge773ov13828;
T0* ge773ov13829;
T0* ge773ov13830;
T0* ge773ov13832;
T0* ge773ov13833;
T0* ge773ov13835;
T0* ge773ov13836;
T0* ge773ov13837;
T0* ge773ov13839;
T0* ge773ov13840;
T0* ge773ov13841;
T0* ge773ov13842;
T0* ge773ov13844;
T0* ge773ov13846;
T0* ge773ov13847;
T0* ge773ov13848;
T0* ge773ov13849;
T0* ge773ov13850;
T0* ge773ov13851;
T0* ge773ov13852;
T0* ge773ov13853;
T0* ge773ov13854;
T0* ge773ov13856;
T0* ge773ov13857;
T0* ge773ov13858;
T0* ge773ov13859;
T0* ge773ov13860;
T0* ge773ov13861;
T0* ge773ov13862;
T0* ge773ov13863;
T0* ge773ov13864;
T0* ge773ov13865;
T0* ge773ov13866;
T0* ge773ov13867;
T0* ge773ov13870;
T0* ge773ov13872;
T0* ge773ov13873;
T0* ge773ov13878;
T0* ge773ov13879;
T0* ge773ov13880;
T0* ge773ov13881;
T0* ge773ov13874;
T0* ge773ov13875;
T0* ge773ov13876;
T0* ge773ov13877;
T0* ge773ov13882;
T0* ge773ov13883;
T0* ge773ov13884;
T0* ge773ov13885;
T0* ge773ov13886;
T0* ge773ov13887;
T0* ge773ov13888;
T0* ge773ov13889;
T0* ge773ov13891;
T0* ge773ov13892;
T0* ge773ov13893;
T0* ge773ov13894;
T0* ge773ov13895;
T0* ge773ov13896;
T0* ge773ov13897;
T0* ge773ov13898;
T0* ge773ov13900;
T0* ge773ov13902;
T0* ge773ov13903;
T0* ge773ov13904;
T0* ge773ov13905;
T0* ge773ov13907;
T0* ge773ov13908;
T0* ge773ov13909;
T0* ge773ov13910;
T0* ge773ov13911;
T0* ge773ov13912;
T0* ge773ov13913;
T0* ge773ov13914;
T0* ge773ov13915;
T0* ge773ov13916;
T0* ge773ov13917;
T0* ge773ov13918;
T0* ge773ov13919;
T0* ge773ov13920;
T0* ge773ov13922;
T0* ge773ov13923;
T0* ge773ov13924;
T0* ge773ov13925;
T0* ge773ov13927;
T0* ge773ov13928;
T0* ge773ov13930;
T0* ge773ov13931;
T0* ge773ov13932;
T0* ge773ov13933;
T0* ge773ov13934;
T0* ge773ov13935;
T0* ge773ov13936;
T0* ge773ov13937;
T0* ge773ov13938;
T0* ge773ov13939;
T0* ge773ov13941;
T0* ge773ov13942;
T0* ge773ov13943;
T0* ge773ov13944;
T0* ge773ov13945;
T0* ge773ov13946;
T0* ge773ov13947;
T0* ge773ov13948;
T0* ge773ov13949;
T0* ge773ov13950;
T0* ge773ov13951;
T0* ge773ov13952;
T0* ge773ov13953;
T0* ge773ov13954;
T0* ge773ov13955;
T0* ge773ov13956;
T0* ge773ov13957;
T0* ge773ov13958;
T0* ge773ov13959;
T0* ge773ov13960;
T0* ge773ov13961;
T0* ge773ov13962;
T0* ge773ov13963;
T0* ge773ov13964;
T0* ge773ov13965;
T0* ge773ov13966;
T0* ge773ov13967;
T0* ge773ov13968;
T0* ge773ov13969;
T0* ge773ov13970;
T0* ge773ov13971;
T0* ge773ov13972;
T0* ge773ov13973;
T0* ge773ov13975;
T0* ge773ov13976;
T0* ge773ov13977;
T0* ge773ov13978;
T0* ge773ov13979;
T0* ge773ov13980;
T0* ge773ov13981;
T0* ge773ov13982;
T0* ge773ov13984;
T0* ge773ov13986;
T0* ge773ov13987;
T0* ge773ov13989;
T0* ge773ov13990;
T0* ge773ov13991;
T0* ge773ov13992;
T0* ge773ov13993;
T0* ge773ov13994;
T0* ge773ov13995;
T0* ge773ov13997;
T0* ge773ov13998;
T0* ge773ov13999;
T0* ge773ov14000;
T0* ge773ov14002;
T0* ge773ov14003;
T0* ge773ov14004;
T0* ge773ov14005;
T0* ge773ov14006;
T0* ge773ov14008;
T0* ge773ov14009;
T0* ge773ov14010;
T0* ge773ov14012;
T0* ge773ov14013;
T0* ge773ov14014;
T0* ge773ov14015;
T0* ge773ov14016;
T0* ge773ov14017;
T0* ge773ov14018;
T0* ge773ov14019;
T0* ge773ov14020;
T0* ge773ov14021;
T0* ge773ov14022;
T0* ge773ov14023;
T0* ge773ov14024;
T0* ge773ov14025;
T0* ge773ov14026;
T0* ge773ov14027;
T0* ge773ov14028;
T0* ge773ov14029;
T0* ge773ov14030;
T0* ge773ov14031;
T0* ge773ov14032;
T0* ge773ov14033;
T0* ge773ov14034;
T0* ge773ov14035;
T0* ge773ov14037;
T0* ge773ov14038;
T0* ge773ov14039;
T0* ge773ov14040;
T0* ge773ov14041;
T0* ge773ov14042;
T0* ge773ov14043;
T0* ge773ov14044;
T0* ge773ov14045;
T0* ge773ov14046;
T0* ge773ov14047;
T0* ge773ov14048;
T0* ge773ov14049;
T0* ge773ov14050;
T0* ge773ov14051;
T0* ge773ov14052;
T0* ge773ov14053;
T0* ge773ov14054;
T0* ge773ov14055;
T0* ge773ov14056;
T0* ge773ov14057;
T0* ge773ov14058;
T0* ge773ov14059;
T0* ge773ov14060;
T0* ge773ov14061;
T0* ge773ov14062;
T0* ge773ov14063;
T0* ge773ov14064;
T0* ge773ov14065;
T0* ge773ov14066;
T0* ge773ov14067;
T0* ge773ov14068;
T0* ge773ov14069;
T0* ge773ov14070;
T0* ge773ov14071;
T0* ge773ov14072;
T0* ge773ov14073;
T0* ge773ov14074;
T0* ge773ov14075;
T0* ge773ov14076;
T0* ge773ov14077;
T0* ge773ov14078;
T0* ge773ov14079;
T0* ge773ov14080;
T0* ge773ov14081;
T0* ge773ov14082;
T0* ge773ov14083;
T0* ge773ov14084;
T0* ge773ov14085;
T0* ge773ov14086;
T0* ge773ov14087;
T0* ge773ov14088;
T0* ge773ov14089;
T0* ge773ov14090;
T0* ge773ov14091;
T0* ge773ov14092;
T0* ge286ov11863;
T0* ge382ov20852;
T0* ge382ov20849;
T0* ge964ov15652;
T0* ge380ov20716;
T0* ge952ov25049;
T0* ge952ov24815;
T0* ge952ov24671;
T0* ge952ov25048;
T0* ge952ov24670;
T0* ge952ov25080;
T0* ge952ov24838;
T0* ge952ov24702;
T0* ge952ov25079;
T0* ge952ov24837;
T0* ge952ov24701;
T0* ge773ov14036;
T0* ge773ov13996;
T0* ge952ov25085;
T0* ge952ov24843;
T0* ge952ov24707;
T0* ge952ov25084;
T0* ge952ov24842;
T0* ge952ov24706;
T0* ge1266ov10577;
T0* ge1266ov10576;
T0* ge1009ov4199;
T0* ge1009ov4200;
T0* ge1009ov4201;
T0* ge1009ov4202;
T0* ge1009ov4203;
T0* ge1009ov4204;
T0* ge1009ov4205;
T0* ge1009ov4206;
T0* ge1009ov4207;
T0* ge1009ov4208;
