#include "geyacc.h"

T0* gems(char* s, int c)
{
	T0* R;
	T0* a;
	a = (T0*)gealloc(sizeof(T15)+c*sizeof(T1));
	((T15*)(a))->id = 15;
	((T15*)(a))->a1 = (c+1);
	memcpy(((T15*)(a))->a2, s, c);
	R = (T0*)gealloc(sizeof(T16));
	((T16*)(R))->id = 16;
	((T16*)(R))->a1 = a;
	((T16*)(R))->a2 = (T4)c;
	return R;
}

/* Call to UT_ERROR.default_message */
T0* T30x2170(T0* C)
{
	int z1 = C->id;
if (z1<=153) {
if (z1<=145) {
if (z1<=53) {
if (z1<=49) {
if (z1==22) {
	return (T22f2(C));
} else {
	return (T49f2(C));
}
} else {
if (z1==52) {
	return (T52f2(C));
} else {
	return (T53f2(C));
}
}
} else {
if (z1<=142) {
if (z1==59) {
	return (T59f1(C));
} else {
	return (T142f1(C));
}
} else {
if (z1==144) {
	return (T144f1(C));
} else {
	return (T145f1(C));
}
}
}
} else {
if (z1<=149) {
if (z1<=147) {
if (z1==146) {
	return (T146f1(C));
} else {
	return (T147f1(C));
}
} else {
if (z1==148) {
	return (T148f1(C));
} else {
	return (T149f1(C));
}
}
} else {
if (z1<=151) {
if (z1==150) {
	return (T150f1(C));
} else {
	return (T151f1(C));
}
} else {
if (z1==152) {
	return (T152f1(C));
} else {
	return (T153f1(C));
}
}
}
}
} else {
if (z1<=161) {
if (z1<=157) {
if (z1<=155) {
if (z1==154) {
	return (T154f1(C));
} else {
	return (T155f1(C));
}
} else {
if (z1==156) {
	return (T156f1(C));
} else {
	return (T157f1(C));
}
}
} else {
if (z1<=159) {
if (z1==158) {
	return (T158f1(C));
} else {
	return (T159f1(C));
}
} else {
if (z1==160) {
	return (T160f1(C));
} else {
	return (T161f1(C));
}
}
}
} else {
if (z1<=173) {
if (z1<=163) {
if (z1==162) {
	return (T162f1(C));
} else {
	return (T163f1(C));
}
} else {
if (z1==172) {
	return (T172f1(C));
} else {
	return (T173f1(C));
}
}
} else {
if (z1<=175) {
if (z1==174) {
	return (T174f1(C));
} else {
	return (T175f1(C));
}
} else {
if (z1==176) {
	return (T176f1(C));
} else {
	return (T177f1(C));
}
}
}
}
}
	return 0;
}

/* Call to ANY.same_type */
T2 T118x59(T0* C, T0* a1)
{
	int z1 = C->id;
if (z1<=56) {
if (z1==16) {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
} else {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
}
} else {
if (z1==66) {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
} else {
	return ((T2)(((T0*)(C))->id==((T0*)(a1))->id));
}
}
	return 0;
}

/* GEYACC.execute */
T0* T18c18()
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* t1;
	T2 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T18));
	((T18*)(C))->id = 18;
	if (EIF_FALSE) {
		T18f19(C);
	}
	t1 = (T18f1(C));
	T24f5(t1, gems("geyacc", 6));
	((T18*)(C))->a2 = T25c6();
	((T18*)(C))->a3 = (EIF_FALSE);
	((T18*)(C))->a4 = (EIF_TRUE);
	T18f20(C);
	T18f21(C);
	t2 = ((((T18*)(C))->a5)!=(EIF_VOID));
	if (t2) {
		t2 = ((((T18*)(C))->a6)!=(EIF_VOID));
		if (t2) {
			t2 = (T16f4(((T18*)(C))->a6, gems("xml", 3)));
			if (t2) {
				l8 = T27c3(((T18*)(C))->a5);
			} else {
				l8 = T28c3(((T18*)(C))->a5);
				if ((l8)->id==27) {
					T27f4(l8, EIF_TRUE);
				} else {
					T28f4(l8, EIF_TRUE);
				}
			}
			t2 = ((((T18*)(C))->a7)!=(EIF_VOID));
			if (t2) {
				l3 = T21c20(((T18*)(C))->a7);
				T21f21(l3);
				t2 = (T21f1(l3));
				if (t2) {
					if ((l8)->id==27) {
						T27f5(l8, l3);
					} else {
						T28f5(l8, l3);
					}
					T21f22(l3);
				} else {
					l5 = T22c7(((T18*)(C))->a7);
					T25f7(((T18*)(C))->a2, l5);
					t1 = (T18f8(C));
					T31f2(t1, (T4)(geint32(1)));
				}
			} else {
				t1 = (T18f9(C));
				t1 = (T32f1(t1));
				if ((l8)->id==27) {
					T27f5(l8, t1);
				} else {
					T28f5(l8, t1);
				}
			}
		} else {
			t2 = ((((T18*)(C))->a10)!=(EIF_VOID));
			if (t2) {
				l7 = T21c20(((T18*)(C))->a10);
				T21f21(l7);
				t2 = (T21f1(l7));
				if (t2) {
					l1 = T19c10(((T18*)(C))->a5, ((T18*)(C))->a2, l7);
					T21f22(l7);
				} else {
					l5 = T22c7(((T18*)(C))->a10);
					T25f7(((T18*)(C))->a2, l5);
					t1 = (T18f8(C));
					T31f2(t1, (T4)(geint32(1)));
				}
			} else {
				l1 = T19c11(((T18*)(C))->a5, ((T18*)(C))->a2);
			}
			l2 = T20c30(l1);
			T20f31(l2, ((T18*)(C))->a3);
			T20f32(l2, ((T18*)(C))->a4);
			t2 = ((((T18*)(C))->a11)!=(EIF_VOID));
			if (t2) {
				T20f33(l2, ((T18*)(C))->a11);
			}
			t2 = ((((T18*)(C))->a12)!=(EIF_VOID));
			if (t2) {
				l4 = T21c20(((T18*)(C))->a13);
				T21f21(l4);
				t2 = (T21f1(l4));
				if (t2) {
					T20f34(l2, ((T18*)(C))->a12, ge301ov1308, l4);
					T21f22(l4);
				} else {
					l5 = T22c7(((T18*)(C))->a13);
					T25f7(((T18*)(C))->a2, l5);
					t1 = (T18f8(C));
					T31f2(t1, (T4)(geint32(1)));
				}
			} else {
				l6 = (EIF_TRUE);
			}
			t2 = ((((T18*)(C))->a7)!=(EIF_VOID));
			if (t2) {
				l3 = T21c20(((T18*)(C))->a7);
				T21f21(l3);
				t2 = (T21f1(l3));
				if (t2) {
					T20f35(l2, l6, ((T18*)(C))->a15, l3);
					T21f22(l3);
				} else {
					l5 = T22c7(((T18*)(C))->a7);
					T25f7(((T18*)(C))->a2, l5);
					t1 = (T18f8(C));
					T31f2(t1, (T4)(geint32(1)));
				}
			} else {
				t1 = (T18f9(C));
				t1 = (T32f1(t1));
				T20f35(l2, l6, ((T18*)(C))->a15, t1);
			}
		}
	}
	return C;
}

/* PR_PARSER_GENERATOR.print_parser */
void T20f35(T0* C, T2 a1, T2 a2, T0* a3)
{
	T2 t1;
	T20f42(C, a3);
	if (a1) {
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
		T20f41(C, a3);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("feature {NONE} -- Implementation\n\n", 34));
	} else {
		T33f11(a3, gems("feature {NONE} -- Implementation\n\n", 34));
	}
	T20f43(C, a3);
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	t1 = ((T2)(!(((T20*)(C))->a8)));
	if (t1) {
		T20f44(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
		T20f45(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
		T20f46(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
		T20f47(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
		T20f48(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
		T20f49(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("feature {NONE} -- Semantic actions\n\n", 36));
	} else {
		T33f11(a3, gems("feature {NONE} -- Semantic actions\n\n", 36));
	}
	if (a2) {
		T20f50(C, a3);
	} else {
		T20f51(C, a3);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	if (a2) {
		T20f52(C, a3);
	} else {
		T20f53(C, a3);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("\nfeature {NONE} -- Table templates\n\n", 36));
	} else {
		T33f11(a3, gems("\nfeature {NONE} -- Table templates\n\n", 36));
	}
	T20f54(C, a3);
	if (((T20*)(C))->a8) {
		T20f55(C, a3);
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems("\nfeature {NONE} -- Semantic value stacks\n\n", 42));
		} else {
			T33f11(a3, gems("\nfeature {NONE} -- Semantic value stacks\n\n", 42));
		}
		T20f56(C, a3);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("feature {NONE} -- Constants\n\n", 29));
	} else {
		T33f11(a3, gems("feature {NONE} -- Constants\n\n", 29));
	}
	T20f57(C, a3);
	if ((a3)->id==21) {
		T21f23(a3, gems("\nfeature -- User-defined features\n\n", 35));
	} else {
		T33f11(a3, gems("\nfeature -- User-defined features\n\n", 35));
	}
	T20f58(C, a3);
}

/* PR_PARSER_GENERATOR.print_eiffel_code */
void T20f58(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a9);
	t2 = ((l1)!=(EIF_VOID));
	if (t2) {
		if ((a1)->id==21) {
			T21f23(a1, l1);
		} else {
			T33f11(a1, l1);
		}
	}
}

/* PR_PARSER_GENERATOR.print_constants */
void T20f57(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f23(a1, gems("\tyyFinal: INTEGER is ", 21));
	} else {
		T33f11(a1, gems("\tyyFinal: INTEGER is ", 21));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T20*)(C))->a2);
	} else {
		T33f14(a1, ((T20*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\t\t-- Termination state id\n\n\tyyFlag: INTEGER is ", 49));
	} else {
		T33f11(a1, gems("\n\t\t\t-- Termination state id\n\n\tyyFlag: INTEGER is ", 49));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T20*)(C))->a3);
	} else {
		T33f14(a1, ((T20*)(C))->a3);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\t\t-- Most negative INTEGER\n\n\tyyNtbase: INTEGER is ", 52));
	} else {
		T33f11(a1, gems("\n\t\t\t-- Most negative INTEGER\n\n\tyyNtbase: INTEGER is ", 52));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T20*)(C))->a9);
	} else {
		T33f14(a1, ((T20*)(C))->a9);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\t\t-- Number of tokens\n\n\tyyLast: INTEGER is ", 45));
	} else {
		T33f11(a1, gems("\n\t\t\t-- Number of tokens\n\n\tyyLast: INTEGER is ", 45));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T20*)(C))->a24);
	} else {
		T33f14(a1, ((T20*)(C))->a24);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\t\t-- Upper bound of `yytable\' and `yycheck\'\n\n\tyyMax_token: INTEGER is ", 72));
	} else {
		T33f11(a1, gems("\n\t\t\t-- Upper bound of `yytable\' and `yycheck\'\n\n\tyyMax_token: INTEGER is ", 72));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T20*)(C))->a11);
	} else {
		T33f14(a1, ((T20*)(C))->a11);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\t\t-- Maximum token id\n\t\t\t-- (upper bound of `yytranslate\'.)\n\n\tyyNsyms: INTEGER is ", 84));
	} else {
		T33f11(a1, gems("\n\t\t\t-- Maximum token id\n\t\t\t-- (upper bound of `yytranslate\'.)\n\n\tyyNsyms: INTEGER is ", 84));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T20*)(C))->a10);
	} else {
		T33f14(a1, ((T20*)(C))->a10);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\t\t-- Number of symbols\n\t\t\t-- (terminal and nonterminal)\n", 58));
	} else {
		T33f11(a1, gems("\n\t\t\t-- Number of symbols\n\t\t\t-- (terminal and nonterminal)\n", 58));
	}
}

/* KL_STDOUT_FILE.put_integer */
void T33f14(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T33f12(C, (T1)('0'));
	} else {
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T33f12(C, (T1)('-'));
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			l1 = ((T4)(-(t2)));
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(1)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(2)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(3)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(4)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(5)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(6)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(7)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(8)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T33f14(C, l2);
				}
				T33f12(C, (T1)('9'));
				break;
			case (T4)(T4)(geint32(9)):
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T33f14(C, t2);
				T33f12(C, (T1)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = (a1);
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l2)!=((T4)(geint32(0))));
			if (t1) {
				T33f14(C, l2);
			}
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				T33f12(C, (T1)('0'));
				break;
			case (T4)(T4)(geint32(1)):
				T33f12(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(2)):
				T33f12(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(3)):
				T33f12(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(4)):
				T33f12(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(5)):
				T33f12(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(6)):
				T33f12(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(7)):
				T33f12(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(8)):
				T33f12(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(9)):
				T33f12(C, (T1)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* KL_STDOUT_FILE.put_character */
void T33f12(T0* C, T1 a1)
{
	T33f17(C, a1);
}

/* KL_STDOUT_FILE.old_put_character */
void T33f17(T0* C, T1 a1)
{
	T33f21(C, ((T33*)(C))->a3, a1);
}

/* KL_STDOUT_FILE.console_pc */
void T33f21(T0* C, T14 a1, T1 a2)
{
	console_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* KL_TEXT_OUTPUT_FILE.put_integer */
void T21f24(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T21f25(C, (T1)('0'));
	} else {
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T21f25(C, (T1)('-'));
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			l1 = ((T4)(-(t2)));
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(1)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(2)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(3)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(4)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(5)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(6)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(7)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(8)):
				t1 = ((l2)!=((T4)(geint32(0))));
				if (t1) {
					T21f24(C, l2);
				}
				T21f25(C, (T1)('9'));
				break;
			case (T4)(T4)(geint32(9)):
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T21f24(C, t2);
				T21f25(C, (T1)('0'));
				break;
			default:
				break;
			}
		} else {
			l1 = (a1);
			l2 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l2)!=((T4)(geint32(0))));
			if (t1) {
				T21f24(C, l2);
			}
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				T21f25(C, (T1)('0'));
				break;
			case (T4)(T4)(geint32(1)):
				T21f25(C, (T1)('1'));
				break;
			case (T4)(T4)(geint32(2)):
				T21f25(C, (T1)('2'));
				break;
			case (T4)(T4)(geint32(3)):
				T21f25(C, (T1)('3'));
				break;
			case (T4)(T4)(geint32(4)):
				T21f25(C, (T1)('4'));
				break;
			case (T4)(T4)(geint32(5)):
				T21f25(C, (T1)('5'));
				break;
			case (T4)(T4)(geint32(6)):
				T21f25(C, (T1)('6'));
				break;
			case (T4)(T4)(geint32(7)):
				T21f25(C, (T1)('7'));
				break;
			case (T4)(T4)(geint32(8)):
				T21f25(C, (T1)('8'));
				break;
			case (T4)(T4)(geint32(9)):
				T21f25(C, (T1)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* KL_TEXT_OUTPUT_FILE.put_character */
void T21f25(T0* C, T1 a1)
{
	T21f32(C, a1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_character */
void T21f32(T0* C, T1 a1)
{
	T21f35(C, ((T21*)(C))->a15, a1);
}

/* KL_TEXT_OUTPUT_FILE.file_pc */
void T21f35(T0* C, T14 a1, T1 a2)
{
	file_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* PR_PARSER_GENERATOR.print_stack_declarations */
void T20f56(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* t1;
	T2 t2;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a8);
	l4 = (((T109*)(l1))->a1);
	l3 = ((T4)(geint32(1)));
	t2 = (T4f1(&l3, l4));
	while (!(t2)) {
		l2 = (T109f2(l1, l3));
		if ((l2)->id==96) {
			T96f16(l2, (T4)(geint32(1)), a1);
		} else {
			T170f14(l2, (T4)(geint32(1)), a1);
		}
		if ((a1)->id==21) {
			T21f26(a1);
		} else {
			T33f13(a1);
		}
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t2 = (T4f1(&l3, l4));
	}
}

/* PR_BASIC_TYPE.print_yyvs_declaration */
void T170f14(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(": SPECIAL [", 11));
	} else {
		T33f11(a2, gems(": SPECIAL [", 11));
	}
	if ((a2)->id==21) {
		T21f23(a2, ((T170*)(C))->a2);
	} else {
		T33f11(a2, ((T170*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("]", 1));
	} else {
		T33f10(a2, gems("]", 1));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Stack for semantic values of type ", 37));
	} else {
		T33f11(a2, gems("-- Stack for semantic values of type ", 37));
	}
	if ((a2)->id==21) {
		T21f27(a2, ((T170*)(C))->a2);
	} else {
		T33f10(a2, ((T170*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsc", 5));
	} else {
		T33f11(a2, gems("yyvsc", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(": INTEGER", 9));
	} else {
		T33f10(a2, gems(": INTEGER", 9));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Capacity of semantic value stack `yyvs", 41));
	} else {
		T33f11(a2, gems("-- Capacity of semantic value stack `yyvs", 41));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\'", 1));
	} else {
		T33f10(a2, gems("\'", 1));
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(": INTEGER", 9));
	} else {
		T33f10(a2, gems(": INTEGER", 9));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Top of semantic value stack `yyvs", 36));
	} else {
		T33f11(a2, gems("-- Top of semantic value stack `yyvs", 36));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\'", 1));
	} else {
		T33f10(a2, gems("\'", 1));
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyspecial_routines", 18));
	} else {
		T33f11(a2, gems("yyspecial_routines", 18));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(": KL_SPECIAL_ROUTINES [", 23));
	} else {
		T33f11(a2, gems(": KL_SPECIAL_ROUTINES [", 23));
	}
	if ((a2)->id==21) {
		T21f23(a2, ((T170*)(C))->a2);
	} else {
		T33f11(a2, ((T170*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("]", 1));
	} else {
		T33f10(a2, gems("]", 1));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Routines that ought to be in SPECIAL [", 41));
	} else {
		T33f11(a2, gems("-- Routines that ought to be in SPECIAL [", 41));
	}
	if ((a2)->id==21) {
		T21f23(a2, ((T170*)(C))->a2);
	} else {
		T33f11(a2, ((T170*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("]", 1));
	} else {
		T33f10(a2, gems("]", 1));
	}
}

/* KL_STDOUT_FILE.put_line */
void T33f10(T0* C, T0* a1)
{
	T33f11(C, a1);
	T33f13(C);
}

/* KL_TEXT_OUTPUT_FILE.put_line */
void T21f27(T0* C, T0* a1)
{
	T21f23(C, a1);
	T21f26(C);
}

/* PR_BASIC_TYPE.print_indentation */
void T170f20(T0* C, T4 a1, T0* a2)
{
	T4 l1 = 0;
	T2 t1;
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, a1));
	while (!(t1)) {
		if ((a2)->id==21) {
			T21f25(a2, (T1)('\t'));
		} else {
			T33f12(a2, (T1)('\t'));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, a1));
	}
}

/* PR_TYPE.print_yyvs_declaration */
void T96f16(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(": SPECIAL [", 11));
	} else {
		T33f11(a2, gems(": SPECIAL [", 11));
	}
	if ((a2)->id==21) {
		T21f23(a2, ((T96*)(C))->a1);
	} else {
		T33f11(a2, ((T96*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("]", 1));
	} else {
		T33f10(a2, gems("]", 1));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Stack for semantic values of type ", 37));
	} else {
		T33f11(a2, gems("-- Stack for semantic values of type ", 37));
	}
	if ((a2)->id==21) {
		T21f27(a2, ((T96*)(C))->a1);
	} else {
		T33f10(a2, ((T96*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsc", 5));
	} else {
		T33f11(a2, gems("yyvsc", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(": INTEGER", 9));
	} else {
		T33f10(a2, gems(": INTEGER", 9));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Capacity of semantic value stack `yyvs", 41));
	} else {
		T33f11(a2, gems("-- Capacity of semantic value stack `yyvs", 41));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\'", 1));
	} else {
		T33f10(a2, gems("\'", 1));
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(": INTEGER", 9));
	} else {
		T33f10(a2, gems(": INTEGER", 9));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Top of semantic value stack `yyvs", 36));
	} else {
		T33f11(a2, gems("-- Top of semantic value stack `yyvs", 36));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\'", 1));
	} else {
		T33f10(a2, gems("\'", 1));
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyspecial_routines", 18));
	} else {
		T33f11(a2, gems("yyspecial_routines", 18));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(": KL_SPECIAL_ROUTINES [", 23));
	} else {
		T33f11(a2, gems(": KL_SPECIAL_ROUTINES [", 23));
	}
	if ((a2)->id==21) {
		T21f23(a2, ((T96*)(C))->a1);
	} else {
		T33f11(a2, ((T96*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("]", 1));
	} else {
		T33f10(a2, gems("]", 1));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("-- Routines that ought to be in SPECIAL [", 41));
	} else {
		T33f11(a2, gems("-- Routines that ought to be in SPECIAL [", 41));
	}
	if ((a2)->id==21) {
		T21f23(a2, ((T96*)(C))->a1);
	} else {
		T33f11(a2, ((T96*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("]", 1));
	} else {
		T33f10(a2, gems("]", 1));
	}
}

/* PR_TYPE.print_indentation */
void T96f22(T0* C, T4 a1, T0* a2)
{
	T4 l1 = 0;
	T2 t1;
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, a1));
	while (!(t1)) {
		if ((a2)->id==21) {
			T21f25(a2, (T1)('\t'));
		} else {
			T33f12(a2, (T1)('\t'));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, a1));
	}
}

/* DS_ARRAYED_LIST [PR_TYPE].item */
T0* T109f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T135*)(((T109*)(C))->a5))->a2[a1]);
	return R;
}

/* INTEGER.infix ">" */
T2 T4f1(T4* C, T4 a1)
{
	T2 R = 0;
	R = ((T2)((a1)<(*C)));
	return R;
}

/* PR_PARSER_GENERATOR.old_print_conversion_routines */
void T20f55(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* t1;
	T2 t2;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a8);
	t2 = (T109f3(l1));
	t2 = ((T2)(!(t2)));
	if (t2) {
		if ((a1)->id==21) {
			T21f23(a1, gems("\nfeature {NONE} -- Conversion\n\n", 31));
		} else {
			T33f11(a1, gems("\nfeature {NONE} -- Conversion\n\n", 31));
		}
		l4 = (((T109*)(l1))->a1);
		l3 = ((T4)(geint32(1)));
		t2 = (T4f1(&l3, l4));
		while (!(t2)) {
			l2 = (T109f2(l1, l3));
			t2 = ((((l2)->id==96)?((T96*)(l2))->a4:((T170*)(l2))->a3));
			if (t2) {
				if ((l2)->id==96) {
					T96f15(l2, a1);
				} else {
					T170f13(l2, a1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('\n'));
				} else {
					T33f12(a1, (T1)('\n'));
				}
			}
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t2 = (T4f1(&l3, l4));
		}
	}
}

/* PR_BASIC_TYPE.old_print_conversion_routine */
void T170f13(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f23(a1, gems("\tyytype", 7));
	} else {
		T33f11(a1, gems("\tyytype", 7));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T170*)(C))->a1);
	} else {
		T33f14(a1, ((T170*)(C))->a1);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" (v: ANY): ", 11));
	} else {
		T33f11(a1, gems(" (v: ANY): ", 11));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T170*)(C))->a2);
	} else {
		T33f11(a1, ((T170*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" is\n\t\trequire\n\t\t\tvalid_type: yyis_type", 38));
	} else {
		T33f11(a1, gems(" is\n\t\trequire\n\t\t\tvalid_type: yyis_type", 38));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T170*)(C))->a1);
	} else {
		T33f14(a1, ((T170*)(C))->a1);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" (v)\n\t\tlocal\n\t\t\tref: ", 21));
	} else {
		T33f11(a1, gems(" (v)\n\t\tlocal\n\t\t\tref: ", 21));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T170*)(C))->a2);
	} else {
		T33f11(a1, ((T170*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("_REF\n\t\tdo\n\t\t\tref \?= v\n\t\t\tResult := ref.item\n\t\tend\n", 50));
	} else {
		T33f11(a1, gems("_REF\n\t\tdo\n\t\t\tref \?= v\n\t\t\tResult := ref.item\n\t\tend\n", 50));
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\tyyis_type", 11));
	} else {
		T33f11(a1, gems("\n\tyyis_type", 11));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T170*)(C))->a1);
	} else {
		T33f14(a1, ((T170*)(C))->a1);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" (v: ANY): BOOLEAN is\n\t\tlocal\n\t\t\tu: ", 36));
	} else {
		T33f11(a1, gems(" (v: ANY): BOOLEAN is\n\t\tlocal\n\t\t\tu: ", 36));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T170*)(C))->a2);
	} else {
		T33f11(a1, ((T170*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("_REF\n\t\tdo\n\t\t\tu \?= v\n\t\t\tResult := (u = v)\n\t\tend\n", 47));
	} else {
		T33f11(a1, gems("_REF\n\t\tdo\n\t\t\tu \?= v\n\t\t\tResult := (u = v)\n\t\tend\n", 47));
	}
}

/* PR_TYPE.old_print_conversion_routine */
void T96f15(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f23(a1, gems("\tyytype", 7));
	} else {
		T33f11(a1, gems("\tyytype", 7));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T96*)(C))->a2);
	} else {
		T33f14(a1, ((T96*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" (v: ANY): ", 11));
	} else {
		T33f11(a1, gems(" (v: ANY): ", 11));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T96*)(C))->a1);
	} else {
		T33f11(a1, ((T96*)(C))->a1);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" is\n\t\trequire\n\t\t\tvalid_type: yyis_type", 38));
	} else {
		T33f11(a1, gems(" is\n\t\trequire\n\t\t\tvalid_type: yyis_type", 38));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T96*)(C))->a2);
	} else {
		T33f14(a1, ((T96*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" (v)\n\t\tdo\n\t\t\tResult \?= v\n\t\tensure\n\t\t\tdefinition: Result = v\n\t\tend\n", 66));
	} else {
		T33f11(a1, gems(" (v)\n\t\tdo\n\t\t\tResult \?= v\n\t\tensure\n\t\t\tdefinition: Result = v\n\t\tend\n", 66));
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\tyyis_type", 11));
	} else {
		T33f11(a1, gems("\n\tyyis_type", 11));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T96*)(C))->a2);
	} else {
		T33f14(a1, ((T96*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(" (v: ANY): BOOLEAN is\n\t\tlocal\n\t\t\tu: ", 36));
	} else {
		T33f11(a1, gems(" (v: ANY): BOOLEAN is\n\t\tlocal\n\t\t\tu: ", 36));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T96*)(C))->a1);
	} else {
		T33f11(a1, ((T96*)(C))->a1);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\n\t\tdo\n\t\t\tu \?= v\n\t\t\tResult := (u = v)\n\t\tend\n", 43));
	} else {
		T33f11(a1, gems("\n\t\tdo\n\t\t\tu \?= v\n\t\t\tResult := (u = v)\n\t\tend\n", 43));
	}
}

/* DS_ARRAYED_LIST [PR_TYPE].is_empty */
T2 T109f3(T0* C)
{
	T2 R = 0;
	R = ((((T109*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* PR_PARSER_GENERATOR.print_eiffel_tables */
void T20f54(T0* C, T0* a1)
{
	T20f62(C, gems("yytranslate_template", 20), ((T20*)(C))->a12, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yyr1_template", 13), ((T20*)(C))->a13, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yytypes1_template", 17), ((T20*)(C))->a14, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yytypes2_template", 17), ((T20*)(C))->a15, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yydefact_template", 17), ((T20*)(C))->a16, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yydefgoto_template", 18), ((T20*)(C))->a17, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yypact_template", 15), ((T20*)(C))->a19, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yypgoto_template", 16), ((T20*)(C))->a20, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yytable_template", 16), ((T20*)(C))->a22, a1);
	if ((a1)->id==21) {
		T21f25(a1, (T1)('\n'));
	} else {
		T33f12(a1, (T1)('\n'));
	}
	T20f62(C, gems("yycheck_template", 16), ((T20*)(C))->a23, a1);
}

/* PR_PARSER_GENERATOR.print_eiffel_array */
void T20f62(T0* C, T0* a1, T0* a2, T0* a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T4 t4;
	if ((a3)->id==21) {
		T21f25(a3, (T1)('\t'));
	} else {
		T33f12(a3, (T1)('\t'));
	}
	if ((a3)->id==21) {
		T21f23(a3, a1);
	} else {
		T33f11(a3, a1);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems(": SPECIAL [INTEGER] is\n", 23));
	} else {
		T33f11(a3, gems(": SPECIAL [INTEGER] is\n", 23));
	}
	t1 = ((((T20*)(C))->a4)==((T4)(geint32(0))));
	if (t1) {
		l4 = ((T4)(geint32(1)));
	} else {
		t2 = (T99f5(a2));
		t2 = ((T4)((t2)/(((T20*)(C))->a4)));
		l4 = ((T4)((t2)+((T4)(geint32(1)))));
	}
	t1 = ((l4)==((T4)(geint32(1))));
	if (t1) {
		if ((a3)->id==21) {
			T21f23(a3, gems("\t\tonce\n\t\t\tResult := yyfixed_array (<<\n", 38));
		} else {
			T33f11(a3, gems("\t\tonce\n\t\t\tResult := yyfixed_array (<<\n", 38));
		}
		t3 = (T20f28(C));
		t2 = (((T99*)(a2))->a2);
		t4 = (((T99*)(a2))->a3);
		T115f8(t3, a3, a2, t2, t4);
		if ((a3)->id==21) {
			T21f23(a3, gems(", yyDummy>>)\n\t\tend\n", 19));
		} else {
			T33f11(a3, gems(", yyDummy>>)\n\t\tend\n", 19));
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems("\t\tlocal\n\t\t\tan_array: ARRAY [INTEGER]\n\t\tonce\n\t\t\tcreate an_array.make (", 69));
		} else {
			T33f11(a3, gems("\t\tlocal\n\t\t\tan_array: ARRAY [INTEGER]\n\t\tonce\n\t\t\tcreate an_array.make (", 69));
		}
		t2 = (((T99*)(a2))->a2);
		if ((a3)->id==21) {
			T21f24(a3, t2);
		} else {
			T33f14(a3, t2);
		}
		if ((a3)->id==21) {
			T21f23(a3, gems(", ", 2));
		} else {
			T33f11(a3, gems(", ", 2));
		}
		t2 = (((T99*)(a2))->a3);
		if ((a3)->id==21) {
			T21f24(a3, t2);
		} else {
			T33f14(a3, t2);
		}
		if ((a3)->id==21) {
			T21f23(a3, gems(")\n", 2));
		} else {
			T33f11(a3, gems(")\n", 2));
		}
		l2 = ((T4)(geint32(1)));
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			if ((a3)->id==21) {
				T21f23(a3, ge180ov1378);
			} else {
				T33f11(a3, ge180ov1378);
			}
			if ((a3)->id==21) {
				T21f23(a3, a1);
			} else {
				T33f11(a3, a1);
			}
			if ((a3)->id==21) {
				T21f25(a3, (T1)('_'));
			} else {
				T33f12(a3, (T1)('_'));
			}
			if ((a3)->id==21) {
				T21f24(a3, l2);
			} else {
				T33f14(a3, l2);
			}
			if ((a3)->id==21) {
				T21f23(a3, gems(" (an_array)\n", 12));
			} else {
				T33f11(a3, gems(" (an_array)\n", 12));
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
		if ((a3)->id==21) {
			T21f23(a3, gems("\t\t\tResult := yyfixed_array (an_array)\n\t\tend\n", 44));
		} else {
			T33f11(a3, gems("\t\t\tResult := yyfixed_array (an_array)\n\t\tend\n", 44));
		}
		l2 = ((T4)(geint32(1)));
		l1 = (((T99*)(a2))->a2);
		l5 = (((T99*)(a2))->a3);
		t1 = (T4f1(&l2, l4));
		while (!(t1)) {
			if ((a3)->id==21) {
				T21f23(a3, gems("\n\t", 2));
			} else {
				T33f11(a3, gems("\n\t", 2));
			}
			if ((a3)->id==21) {
				T21f23(a3, a1);
			} else {
				T33f11(a3, a1);
			}
			if ((a3)->id==21) {
				T21f25(a3, (T1)('_'));
			} else {
				T33f12(a3, (T1)('_'));
			}
			if ((a3)->id==21) {
				T21f24(a3, l2);
			} else {
				T33f14(a3, l2);
			}
			if ((a3)->id==21) {
				T21f23(a3, gems(" (an_array: ARRAY [INTEGER]) is\n\t\tdo\n\t\t\tyy_array_subcopy (an_array, <<\n", 71));
			} else {
				T33f11(a3, gems(" (an_array: ARRAY [INTEGER]) is\n\t\tdo\n\t\t\tyy_array_subcopy (an_array, <<\n", 71));
			}
			t2 = ((T4)((l1)+(((T20*)(C))->a4)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			l3 = (T4f9(&l5, t2));
			t3 = (T20f28(C));
			T115f8(t3, a3, a2, l1, l3);
			if ((a3)->id==21) {
				T21f23(a3, gems(", yyDummy>>,\n\t\t\t", 16));
			} else {
				T33f11(a3, gems(", yyDummy>>,\n\t\t\t", 16));
			}
			if ((a3)->id==21) {
				T21f24(a3, (T4)(geint32(1)));
			} else {
				T33f14(a3, (T4)(geint32(1)));
			}
			if ((a3)->id==21) {
				T21f23(a3, gems(", ", 2));
			} else {
				T33f11(a3, gems(", ", 2));
			}
			t2 = ((T4)((l3)-(l1)));
			t2 = ((T4)((t2)+((T4)(geint32(1)))));
			if ((a3)->id==21) {
				T21f24(a3, t2);
			} else {
				T33f14(a3, t2);
			}
			if ((a3)->id==21) {
				T21f23(a3, gems(", ", 2));
			} else {
				T33f11(a3, gems(", ", 2));
			}
			if ((a3)->id==21) {
				T21f24(a3, l1);
			} else {
				T33f14(a3, l1);
			}
			if ((a3)->id==21) {
				T21f23(a3, gems(")\n\t\tend\n", 8));
			} else {
				T33f11(a3, gems(")\n\t\tend\n", 8));
			}
			l1 = ((T4)((l3)+((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, l4));
		}
	}
}

/* INTEGER.min */
T4 T4f9(T4* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	t1 = (T4f12(C, a1));
	if (t1) {
		R = (*C);
	} else {
		R = (a1);
	}
	return R;
}

/* INTEGER.infix "<=" */
T2 T4f12(T4* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = ((T2)((a1)<(*C)));
	R = ((T2)(!(t1)));
	return R;
}

/* UT_ARRAY_FORMATTER.put_integer_array */
void T115f8(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	if ((a1)->id==21) {
		T21f23(a1, ge216ov4852);
	} else {
		T33f11(a1, ge216ov4852);
	}
	l3 = ((T4)(geint32(1)));
	l1 = (a3);
	t1 = (T4f1(&l1, a4));
	while (!(t1)) {
		l4 = ((T4)((l4)+((T4)(geint32(1)))));
		t1 = (T4f1(&l4, (T4)(geint32(10))));
		if (t1) {
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
			l4 = ((T4)(geint32(1)));
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, (T4)(geint32(10))));
			if (t1) {
				if ((a1)->id==21) {
					T21f26(a1);
				} else {
					T33f13(a1);
				}
				l3 = ((T4)(geint32(1)));
			}
			if ((a1)->id==21) {
				T21f23(a1, ge216ov4852);
			} else {
				T33f11(a1, ge216ov4852);
			}
		}
		l2 = (T99f4(a2, l1));
		t2 = (T4f11(&l2));
		t3 = (((T16*)(t2))->a2);
		switch (t3) {
		case (T4)(T4)(geint32(1)):
			if ((a1)->id==21) {
				T21f23(a1, ge216ov4851);
			} else {
				T33f11(a1, ge216ov4851);
			}
			break;
		case (T4)(T4)(geint32(2)):
			if ((a1)->id==21) {
				T21f23(a1, ge216ov4850);
			} else {
				T33f11(a1, ge216ov4850);
			}
			break;
		case (T4)(T4)(geint32(3)):
			if ((a1)->id==21) {
				T21f23(a1, ge216ov4849);
			} else {
				T33f11(a1, ge216ov4849);
			}
			break;
		default:
			if ((a1)->id==21) {
				T21f25(a1, (T1)(' '));
			} else {
				T33f12(a1, (T1)(' '));
			}
			break;
		}
		if ((a1)->id==21) {
			T21f24(a1, l2);
		} else {
			T33f14(a1, l2);
		}
		t1 = ((T2)((l1)<(a4)));
		if (t1) {
			if ((a1)->id==21) {
				T21f25(a1, (T1)(','));
			} else {
				T33f12(a1, (T1)(','));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, a4));
	}
}

/* INTEGER.out */
T0* T4f11(T4* C)
{
	T0* R = 0;
	T4 t1;
	R = T16c25((T4)(geint32(11)));
	t1 = (*C);
	T16f29(R, t1);
	return R;
}

/* STRING.append_integer */
void T16f29(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T1 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T16f28(C, (T1)('0'));
	} else {
		l2 = (((T16*)(C))->a2);
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T16f28(C, (T1)('-'));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			l1 = ((T4)(-(a1)));
			t2 = ((T4)(geint32(-2147483647)-1));
			t1 = ((l1)==(t2));
			if (t1) {
				t2 = ((T4)((l1)%((T4)(geint32(10)))));
				t2 = ((T4)(-(t2)));
				t2 = ((T4)((t2)+((T4)(geint32(48)))));
				t3 = ((T1)(t2));
				T16f28(C, t3);
				t2 = ((T4)((l1)/((T4)(geint32(10)))));
				l1 = ((T4)(-(t2)));
			}
		} else {
			l1 = (a1);
		}
		t1 = ((l1)==((T4)(geint32(0))));
		while (!(t1)) {
			t2 = ((T4)((l1)%((T4)(geint32(10)))));
			t2 = ((T4)((t2)+((T4)(geint32(48)))));
			t3 = ((T1)(t2));
			T16f28(C, t3);
			l1 = ((T4)((l1)/((T4)(geint32(10)))));
			t1 = ((l1)==((T4)(geint32(0))));
		}
		l3 = ((T4)((((T16*)(C))->a2)-((T4)(geint32(1)))));
		l5 = (((T16*)(C))->a1);
		t1 = (T4f4(&l2, l3));
		while (!(t1)) {
			l4 = (((T15*)(l5))->a2[l2]);
			t3 = (((T15*)(l5))->a2[l3]);
			((T15*)(l5))->a2[l2] = (t3);
			((T15*)(l5))->a2[l3] = (l4);
			l3 = ((T4)((l3)-((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f4(&l2, l3));
		}
	}
}

/* INTEGER.infix ">=" */
T2 T4f4(T4* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = ((T2)((*C)<(a1)));
	R = ((T2)(!(t1)));
	return R;
}

/* STRING.append_character */
void T16f28(T0* C, T1 a1)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T16*)(C))->a2);
	t1 = (T16f12(C));
	t2 = ((l1)==(t1));
	if (t2) {
		t1 = (T16f13(C));
		t1 = ((T4)((l1)+(t1)));
		T16f36(C, t1);
	}
	((T15*)(((T16*)(C))->a1))->a2[l1] = (a1);
	((T16*)(C))->a2 = ((T4)((l1)+((T4)(geint32(1)))));
	((T16*)(C))->a11 = ((T4)(geint32(0)));
}

/* STRING.resize */
void T16f36(T0* C, T4 a1)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T15*)(((T16*)(C))->a1))->a1);
	t1 = (T4f4(&a1, l1));
	if (t1) {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		((T16*)(C))->a1 = (T15f4(((T16*)(C))->a1, t2));
	}
}

/* SPECIAL [CHARACTER].aliased_resized_area */
T0* T15f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1 = ((T15*)(C))->a1;
	if (a1>t1) {
		R = (T0*)gealloc(sizeof(T15)+a1*sizeof(T1));
		*(T15*)(R) = *(T15*)(C);
		memcpy(((T15*)(R))->a2, ((T15*)(C))->a2, t1*sizeof(T1));
	} else {
		R = C;
	}
	((T15*)(R))->a1 = a1;
	return R;
}

/* STRING.additional_space */
T4 T16f13(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (T16f12(C));
	t1 = ((T4)((t1)*((T4)(geint32(50)))));
	t1 = ((T4)((t1)/((T4)(geint32(100)))));
	R = (T4f15(&t1, (T4)(geint32(5))));
	return R;
}

/* INTEGER.max */
T4 T4f15(T4* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	t1 = (T4f4(C, a1));
	if (t1) {
		R = (*C);
	} else {
		R = (a1);
	}
	return R;
}

/* STRING.capacity */
T4 T16f12(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (((T15*)(((T16*)(C))->a1))->a1);
	R = ((T4)((t1)-((T4)(geint32(1)))));
	return R;
}

/* STRING.make */
T0* T16c25(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T16));
	((T16*)(C))->id = 16;
	((T16*)(C))->a2 = ((T4)(geint32(0)));
	((T16*)(C))->a11 = ((T4)(geint32(0)));
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T16f34(C, t1);
	return C;
}

/* STRING.make_area */
void T16f34(T0* C, T4 a1)
{
	((T16*)(C))->a1 = T15c9(a1);
}

/* SPECIAL [CHARACTER].make */
T0* T15c9(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T15)+a1*sizeof(T1));
	((T15*)(C))->a1 = a1;
	((T15*)(C))->id = 15;
	return C;
}

/* ARRAY [INTEGER].item */
T4 T99f4(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T99*)(C))->a2)));
	R = (((T98*)(((T99*)(C))->a1))->a2[t1]);
	return R;
}

/* PR_PARSER_GENERATOR.array_formatter_ */
unsigned char ge219os1406 = '\0';
T0* ge219ov1406;
T0* T20f28(T0* C)
{
	T0* R = 0;
	if (ge219os1406) {
		return ge219ov1406;
	} else {
		ge219os1406 = '\1';
	}
	R = T115c7();
	ge219ov1406 = R;
	return R;
}

/* UT_ARRAY_FORMATTER.default_create */
T0* T115c7()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T115));
	((T115*)(C))->id = 115;
	return C;
}

/* ARRAY [INTEGER].count */
T4 T99f5(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T99*)(C))->a3)-(((T99*)(C))->a2)));
	R = ((T4)((t1)+((T4)(geint32(1)))));
	return R;
}

/* PR_PARSER_GENERATOR.print_error_actions */
void T20f53(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_do_error_action (yy_act: INTEGER) is", 40));
	} else {
		T33f10(a1, gems("\tyy_do_error_action (yy_act: INTEGER) is", 40));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Execute error action.", 27));
	} else {
		T33f10(a1, gems("\t\t\t-- Execute error action.", 27));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tinspect yy_act", 17));
	} else {
		T33f10(a1, gems("\t\t\tinspect yy_act", 17));
	}
	l3 = (((T19*)(((T20*)(C))->a1))->a2);
	l2 = (((T54*)(l3))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l4 = (T54f2(l3, l1));
		l5 = (((T56*)(l4))->a23);
		t1 = ((l5)!=(EIF_VOID));
		if (t1) {
			if ((a1)->id==21) {
				T21f23(a1, gems("when ", 5));
			} else {
				T33f11(a1, gems("when ", 5));
			}
			t2 = (((T56*)(l4))->a6);
			if ((a1)->id==21) {
				T21f24(a1, t2);
			} else {
				T33f14(a1, t2);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" then", 5));
			} else {
				T33f10(a1, gems(" then", 5));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("--|#line ", 9));
			} else {
				T33f11(a1, gems("--|#line ", 9));
			}
			if (((T20*)(C))->a5) {
				t2 = (((T66*)(l5))->a2);
				if ((a1)->id==21) {
					T21f24(a1, t2);
				} else {
					T33f14(a1, t2);
				}
			} else {
				if ((a1)->id==21) {
					T21f23(a1, gems("<not available>", 15));
				} else {
					T33f11(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==21) {
				T21f23(a1, gems(" \"", 2));
			} else {
				T33f11(a1, gems(" \"", 2));
			}
			if ((a1)->id==21) {
				T21f23(a1, ((T20*)(C))->a6);
			} else {
				T33f11(a1, ((T20*)(C))->a6);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\"", 1));
			} else {
				T33f10(a1, gems("\"", 1));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("debug (\"GEYACC\")", 16));
			} else {
				T33f10(a1, gems("debug (\"GEYACC\")", 16));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\tstd.error.put_line (\"Executing parser error-code from file \'", 61));
			} else {
				T33f11(a1, gems("\tstd.error.put_line (\"Executing parser error-code from file \'", 61));
			}
			if ((a1)->id==21) {
				T21f23(a1, ((T20*)(C))->a6);
			} else {
				T33f11(a1, ((T20*)(C))->a6);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\' at line ", 10));
			} else {
				T33f11(a1, gems("\' at line ", 10));
			}
			if (((T20*)(C))->a5) {
				t2 = (((T66*)(l5))->a2);
				if ((a1)->id==21) {
					T21f24(a1, t2);
				} else {
					T33f14(a1, t2);
				}
			} else {
				if ((a1)->id==21) {
					T21f23(a1, gems("<not available>", 15));
				} else {
					T33f11(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\")", 2));
			} else {
				T33f10(a1, gems("\")", 2));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("end", 3));
			} else {
				T33f10(a1, gems("end", 3));
			}
			t3 = (((T66*)(l5))->a1);
			t3 = (T171f2(t3));
			if ((a1)->id==21) {
				T21f27(a1, t3);
			} else {
				T33f10(a1, t3);
			}
		} else {
			t2 = ((T4)((l2)-((T4)(geint32(2)))));
			t1 = ((l1)==(t2));
			if (t1) {
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\twhen ", 8));
				} else {
					T33f11(a1, gems("\t\t\twhen ", 8));
				}
				t2 = (((T56*)(l4))->a6);
				if ((a1)->id==21) {
					T21f24(a1, t2);
				} else {
					T33f14(a1, t2);
				}
				if ((a1)->id==21) {
					T21f27(a1, gems(" then", 5));
				} else {
					T33f10(a1, gems(" then", 5));
				}
				if ((a1)->id==21) {
					T21f27(a1, gems("\t\t\t\t\t-- End-of-file expected action.", 36));
				} else {
					T33f10(a1, gems("\t\t\t\t\t-- End-of-file expected action.", 36));
				}
				if ((a1)->id==21) {
					T21f27(a1, gems("\t\t\t\treport_eof_expected_error", 29));
				} else {
					T33f10(a1, gems("\t\t\t\treport_eof_expected_error", 29));
				}
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\telse", 7));
	} else {
		T33f10(a1, gems("\t\t\telse", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\t-- Default action.", 23));
	} else {
		T33f10(a1, gems("\t\t\t\t\t-- Default action.", 23));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
	} else {
		T33f10(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tend", 6));
	} else {
		T33f10(a1, gems("\t\t\tend", 6));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_ACTION.out */
T0* T171f2(T0* C)
{
	T0* R = 0;
	R = (((T171*)(C))->a1);
	return R;
}

/* DS_ARRAYED_LIST [PR_STATE].item */
T0* T54f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T93*)(((T54*)(C))->a7))->a2[a1]);
	return R;
}

/* PR_PARSER_GENERATOR.print_separated_error_actions */
void T20f52(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	l6 = ((T4)(geint32(200)));
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_do_error_action (yy_act: INTEGER) is", 40));
	} else {
		T33f10(a1, gems("\tyy_do_error_action (yy_act: INTEGER) is", 40));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Execute error action.", 27));
	} else {
		T33f10(a1, gems("\t\t\t-- Execute error action.", 27));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	l7 = (((T19*)(((T20*)(C))->a1))->a2);
	l2 = (((T54*)(l7))->a1);
	t1 = ((T4)((l2)/(l6)));
	l5 = ((T4)((t1)+((T4)(geint32(1)))));
	t2 = ((l5)==((T4)(geint32(1))));
	if (t2) {
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tinspect yy_act", 17));
		} else {
			T33f10(a1, gems("\t\t\tinspect yy_act", 17));
		}
		l1 = ((T4)(geint32(1)));
		t2 = (T4f1(&l1, l2));
		while (!(t2)) {
			l8 = (T54f2(l7, l1));
			l9 = (((T56*)(l8))->a23);
			t2 = ((l9)!=(EIF_VOID));
			if (t2) {
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\twhen ", 8));
				} else {
					T33f11(a1, gems("\t\t\twhen ", 8));
				}
				t1 = (((T56*)(l8))->a6);
				if ((a1)->id==21) {
					T21f24(a1, t1);
				} else {
					T33f14(a1, t1);
				}
				if ((a1)->id==21) {
					T21f27(a1, gems(" then", 5));
				} else {
					T33f10(a1, gems(" then", 5));
				}
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\t\t\t--|#line ", 14));
				} else {
					T33f11(a1, gems("\t\t\t\t\t--|#line ", 14));
				}
				if (((T20*)(C))->a5) {
					t1 = (((T66*)(l9))->a2);
					if ((a1)->id==21) {
						T21f24(a1, t1);
					} else {
						T33f14(a1, t1);
					}
				} else {
					if ((a1)->id==21) {
						T21f23(a1, gems("<not available>", 15));
					} else {
						T33f11(a1, gems("<not available>", 15));
					}
				}
				if ((a1)->id==21) {
					T21f23(a1, gems(" \"", 2));
				} else {
					T33f11(a1, gems(" \"", 2));
				}
				if ((a1)->id==21) {
					T21f23(a1, ((T20*)(C))->a6);
				} else {
					T33f11(a1, ((T20*)(C))->a6);
				}
				if ((a1)->id==21) {
					T21f27(a1, gems("\"", 1));
				} else {
					T33f10(a1, gems("\"", 1));
				}
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\t\tyy_do_error_action_", 23));
				} else {
					T33f11(a1, gems("\t\t\t\tyy_do_error_action_", 23));
				}
				t1 = (((T56*)(l8))->a6);
				if ((a1)->id==21) {
					T21f24(a1, t1);
				} else {
					T33f14(a1, t1);
				}
				if ((a1)->id==21) {
					T21f26(a1);
				} else {
					T33f13(a1);
				}
			} else {
				t1 = ((T4)((l2)-((T4)(geint32(2)))));
				t2 = ((l1)==(t1));
				if (t2) {
					if ((a1)->id==21) {
						T21f23(a1, gems("\t\t\twhen ", 8));
					} else {
						T33f11(a1, gems("\t\t\twhen ", 8));
					}
					t1 = (((T56*)(l8))->a6);
					if ((a1)->id==21) {
						T21f24(a1, t1);
					} else {
						T33f14(a1, t1);
					}
					if ((a1)->id==21) {
						T21f27(a1, gems(" then", 5));
					} else {
						T33f10(a1, gems(" then", 5));
					}
					if ((a1)->id==21) {
						T21f27(a1, gems("\t\t\t\t\t-- End-of-file expected action.", 36));
					} else {
						T33f10(a1, gems("\t\t\t\t\t-- End-of-file expected action.", 36));
					}
					if ((a1)->id==21) {
						T21f27(a1, gems("\t\t\t\treport_eof_expected_error", 29));
					} else {
						T33f10(a1, gems("\t\t\t\treport_eof_expected_error", 29));
					}
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l2));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\telse", 7));
		} else {
			T33f10(a1, gems("\t\t\telse", 7));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\t-- Default action.", 23));
		} else {
			T33f10(a1, gems("\t\t\t\t\t-- Default action.", 23));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
		} else {
			T33f10(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
	} else {
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\t", 3));
		} else {
			T33f11(a1, gems("\t\t\t", 3));
		}
		l1 = ((T4)(geint32(1)));
		t2 = (T4f1(&l1, l5));
		while (!(t2)) {
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = ((T4)((l6)*(t1)));
			t1 = ((T4)((l6)*(l1)));
			l4 = ((T4)((t1)-((T4)(geint32(1)))));
			if ((a1)->id==21) {
				T21f23(a1, gems("if yy_act <= ", 13));
			} else {
				T33f11(a1, gems("if yy_act <= ", 13));
			}
			if ((a1)->id==21) {
				T21f24(a1, l4);
			} else {
				T33f14(a1, l4);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" then", 5));
			} else {
				T33f10(a1, gems(" then", 5));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\t\tyy_do_error_action_", 23));
			} else {
				T33f11(a1, gems("\t\t\t\tyy_do_error_action_", 23));
			}
			if ((a1)->id==21) {
				T21f24(a1, l3);
			} else {
				T33f14(a1, l3);
			}
			if ((a1)->id==21) {
				T21f25(a1, (T1)('_'));
			} else {
				T33f12(a1, (T1)('_'));
			}
			if ((a1)->id==21) {
				T21f24(a1, l4);
			} else {
				T33f14(a1, l4);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" (yy_act)", 9));
			} else {
				T33f10(a1, gems(" (yy_act)", 9));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\telse", 7));
			} else {
				T33f11(a1, gems("\t\t\telse", 7));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l5));
		}
		if ((a1)->id==21) {
			T21f26(a1);
		} else {
			T33f13(a1);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\t-- Default action.", 23));
		} else {
			T33f10(a1, gems("\t\t\t\t\t-- Default action.", 23));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
		} else {
			T33f10(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
		l1 = ((T4)(geint32(1)));
		t2 = (T4f1(&l1, l5));
		while (!(t2)) {
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = ((T4)((l6)*(t1)));
			t1 = ((T4)((l6)*(l1)));
			l4 = ((T4)((t1)-((T4)(geint32(1)))));
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\tyy_do_error_action_", 20));
			} else {
				T33f11(a1, gems("\tyy_do_error_action_", 20));
			}
			if ((a1)->id==21) {
				T21f24(a1, l3);
			} else {
				T33f14(a1, l3);
			}
			if ((a1)->id==21) {
				T21f25(a1, (T1)('_'));
			} else {
				T33f12(a1, (T1)('_'));
			}
			if ((a1)->id==21) {
				T21f24(a1, l4);
			} else {
				T33f14(a1, l4);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" (yy_act: INTEGER) is", 21));
			} else {
				T33f10(a1, gems(" (yy_act: INTEGER) is", 21));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t-- Execute error action.", 27));
			} else {
				T33f10(a1, gems("\t\t\t-- Execute error action.", 27));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tdo", 4));
			} else {
				T33f10(a1, gems("\t\tdo", 4));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\tinspect yy_act", 17));
			} else {
				T33f10(a1, gems("\t\t\tinspect yy_act", 17));
			}
			t1 = ((T4)((l2)-((T4)(geint32(1)))));
			l4 = (T4f9(&l4, t1));
			t2 = (T4f1(&l3, l4));
			while (!(t2)) {
				t1 = ((T4)((l3)+((T4)(geint32(1)))));
				l8 = (T54f2(l7, t1));
				l9 = (((T56*)(l8))->a23);
				t2 = ((l9)!=(EIF_VOID));
				if (t2) {
					if ((a1)->id==21) {
						T21f23(a1, gems("\t\t\twhen ", 8));
					} else {
						T33f11(a1, gems("\t\t\twhen ", 8));
					}
					t1 = (((T56*)(l8))->a6);
					if ((a1)->id==21) {
						T21f24(a1, t1);
					} else {
						T33f14(a1, t1);
					}
					if ((a1)->id==21) {
						T21f27(a1, gems(" then", 5));
					} else {
						T33f10(a1, gems(" then", 5));
					}
					if ((a1)->id==21) {
						T21f23(a1, gems("\t\t\t\t\t--|#line ", 14));
					} else {
						T33f11(a1, gems("\t\t\t\t\t--|#line ", 14));
					}
					if (((T20*)(C))->a5) {
						t1 = (((T66*)(l9))->a2);
						if ((a1)->id==21) {
							T21f24(a1, t1);
						} else {
							T33f14(a1, t1);
						}
					} else {
						if ((a1)->id==21) {
							T21f23(a1, gems("<not available>", 15));
						} else {
							T33f11(a1, gems("<not available>", 15));
						}
					}
					if ((a1)->id==21) {
						T21f23(a1, gems(" \"", 2));
					} else {
						T33f11(a1, gems(" \"", 2));
					}
					if ((a1)->id==21) {
						T21f23(a1, ((T20*)(C))->a6);
					} else {
						T33f11(a1, ((T20*)(C))->a6);
					}
					if ((a1)->id==21) {
						T21f27(a1, gems("\"", 1));
					} else {
						T33f10(a1, gems("\"", 1));
					}
					if ((a1)->id==21) {
						T21f23(a1, gems("\t\t\t\tyy_do_error_action_", 23));
					} else {
						T33f11(a1, gems("\t\t\t\tyy_do_error_action_", 23));
					}
					t1 = (((T56*)(l8))->a6);
					if ((a1)->id==21) {
						T21f24(a1, t1);
					} else {
						T33f14(a1, t1);
					}
					if ((a1)->id==21) {
						T21f26(a1);
					} else {
						T33f13(a1);
					}
				} else {
					t1 = ((T4)((l2)-((T4)(geint32(3)))));
					t2 = ((l3)==(t1));
					if (t2) {
						if ((a1)->id==21) {
							T21f23(a1, gems("\t\t\twhen ", 8));
						} else {
							T33f11(a1, gems("\t\t\twhen ", 8));
						}
						t1 = (((T56*)(l8))->a6);
						if ((a1)->id==21) {
							T21f24(a1, t1);
						} else {
							T33f14(a1, t1);
						}
						if ((a1)->id==21) {
							T21f27(a1, gems(" then", 5));
						} else {
							T33f10(a1, gems(" then", 5));
						}
						if ((a1)->id==21) {
							T21f27(a1, gems("\t\t\t\t\t-- End-of-file expected action.", 36));
						} else {
							T33f10(a1, gems("\t\t\t\t\t-- End-of-file expected action.", 36));
						}
						if ((a1)->id==21) {
							T21f27(a1, gems("\t\t\t\treport_eof_expected_error", 29));
						} else {
							T33f10(a1, gems("\t\t\t\treport_eof_expected_error", 29));
						}
					}
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t2 = (T4f1(&l3, l4));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\telse", 7));
			} else {
				T33f10(a1, gems("\t\t\telse", 7));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\t\t-- Default action.", 23));
			} else {
				T33f10(a1, gems("\t\t\t\t\t-- Default action.", 23));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
			} else {
				T33f10(a1, gems("\t\t\t\treport_error (\"parse error\")", 32));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\tend", 6));
			} else {
				T33f10(a1, gems("\t\t\tend", 6));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tend", 5));
			} else {
				T33f10(a1, gems("\t\tend", 5));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l5));
		}
	}
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		l8 = (T54f2(l7, l1));
		l9 = (((T56*)(l8))->a23);
		t2 = ((l9)!=(EIF_VOID));
		if (t2) {
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\tyy_do_error_action_", 20));
			} else {
				T33f11(a1, gems("\tyy_do_error_action_", 20));
			}
			t1 = (((T56*)(l8))->a6);
			if ((a1)->id==21) {
				T21f24(a1, t1);
			} else {
				T33f14(a1, t1);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" is", 3));
			} else {
				T33f10(a1, gems(" is", 3));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\t--|#line ", 12));
			} else {
				T33f11(a1, gems("\t\t\t--|#line ", 12));
			}
			if (((T20*)(C))->a5) {
				t1 = (((T66*)(l9))->a2);
				if ((a1)->id==21) {
					T21f24(a1, t1);
				} else {
					T33f14(a1, t1);
				}
			} else {
				if ((a1)->id==21) {
					T21f23(a1, gems("<not available>", 15));
				} else {
					T33f11(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==21) {
				T21f23(a1, gems(" \"", 2));
			} else {
				T33f11(a1, gems(" \"", 2));
			}
			if ((a1)->id==21) {
				T21f23(a1, ((T20*)(C))->a6);
			} else {
				T33f11(a1, ((T20*)(C))->a6);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\"", 1));
			} else {
				T33f10(a1, gems("\"", 1));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tdo", 4));
			} else {
				T33f10(a1, gems("\t\tdo", 4));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\tdebug (\"GEYACC\")", 19));
			} else {
				T33f10(a1, gems("\t\t\tdebug (\"GEYACC\")", 19));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\t\tstd.error.put_line (\"Executing parser error-code from file \'", 64));
			} else {
				T33f11(a1, gems("\t\t\t\tstd.error.put_line (\"Executing parser error-code from file \'", 64));
			}
			if ((a1)->id==21) {
				T21f23(a1, ((T20*)(C))->a6);
			} else {
				T33f11(a1, ((T20*)(C))->a6);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\' at line ", 10));
			} else {
				T33f11(a1, gems("\' at line ", 10));
			}
			if (((T20*)(C))->a5) {
				t1 = (((T66*)(l9))->a2);
				if ((a1)->id==21) {
					T21f24(a1, t1);
				} else {
					T33f14(a1, t1);
				}
			} else {
				if ((a1)->id==21) {
					T21f23(a1, gems("<not available>", 15));
				} else {
					T33f11(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\")", 2));
			} else {
				T33f10(a1, gems("\")", 2));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\tend", 6));
			} else {
				T33f10(a1, gems("\t\t\tend", 6));
			}
			t3 = (((T66*)(l9))->a1);
			t3 = (T171f2(t3));
			if ((a1)->id==21) {
				T21f27(a1, t3);
			} else {
				T33f10(a1, t3);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tend", 5));
			} else {
				T33f10(a1, gems("\t\tend", 5));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
}

/* PR_PARSER_GENERATOR.print_actions */
void T20f51(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* t1;
	T2 t2;
	T2 t3;
	T4 t4;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_do_action (yy_act: INTEGER) is", 34));
	} else {
		T33f10(a1, gems("\tyy_do_action (yy_act: INTEGER) is", 34));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Execute semantic action.", 30));
	} else {
		T33f10(a1, gems("\t\t\t-- Execute semantic action.", 30));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	t1 = (((T26*)(t1))->a8);
	l4 = (((T109*)(t1))->a1);
	l5 = T110c35(l4);
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l3 = (((T26*)(t1))->a1);
	l2 = (((T67*)(l3))->a1);
	t2 = (T4f1(&l4, (T4)(geint32(0))));
	if (t2) {
		l1 = ((T4)(geint32(1)));
		t2 = (T4f1(&l1, l2));
		while (!(t2)) {
			l7 = (T67f2(l3, l1));
			t1 = (((T69*)(l7))->a2);
			l8 = (((T70*)(t1))->a4);
			t2 = ((T2)(!(((T20*)(C))->a8)));
			if (!(t2)) {
				t1 = ((((l8)->id==96)?((T96*)(l8))->a1:((T170*)(l8))->a2));
				t3 = (T16f4(t1, gems("ANY", 3)));
				t2 = ((T2)(!(t3)));
			}
			if (t2) {
				T110f36(l5, l8);
				t4 = (((T110*)(l5))->a1);
				t2 = ((t4)==(l4));
				if (t2) {
					l1 = ((T4)((l2)+((T4)(geint32(1)))));
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l2));
		}
	}
	t2 = (T110f4(l5));
	t2 = ((T2)(!(t2)));
	if (t2) {
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tlocal", 7));
		} else {
			T33f10(a1, gems("\t\tlocal", 7));
		}
		l6 = (T110f3(l5));
		T111f7(l6);
		t2 = (T111f1(l6));
		while (!(t2)) {
			t1 = (T111f2(l6));
			if ((t1)->id==96) {
				T96f18(t1, a1);
			} else {
				T170f16(t1, a1);
			}
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
			T111f8(l6);
			t2 = (T111f1(l6));
		}
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tinspect yy_act", 17));
	} else {
		T33f10(a1, gems("\t\t\tinspect yy_act", 17));
	}
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		l7 = (T67f2(l3, l1));
		if ((a1)->id==21) {
			T21f23(a1, gems("when ", 5));
		} else {
			T33f11(a1, gems("when ", 5));
		}
		t4 = (((T69*)(l7))->a6);
		if ((a1)->id==21) {
			T21f24(a1, t4);
		} else {
			T33f14(a1, t4);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems(" then", 5));
		} else {
			T33f10(a1, gems(" then", 5));
		}
		if (((T20*)(C))->a8) {
			T69f25(l7, ((T20*)(C))->a6, ((T20*)(C))->a5, a1);
		} else {
			T69f26(l7, ((T20*)(C))->a6, ((T20*)(C))->a5, a1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\telse", 7));
	} else {
		T33f10(a1, gems("\t\t\telse", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
	} else {
		T33f10(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
	} else {
		T33f10(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
	} else {
		T33f10(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
	} else {
		T33f10(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\tend", 7));
	} else {
		T33f10(a1, gems("\t\t\t\tend", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\tabort", 9));
	} else {
		T33f10(a1, gems("\t\t\t\tabort", 9));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tend", 6));
	} else {
		T33f10(a1, gems("\t\t\tend", 6));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_RULE.print_action */
void T69f26(T0* C, T0* a1, T2 a2, T0* a3)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* t1;
	T4 t2;
	T2 t3;
	if ((a3)->id==21) {
		T21f23(a3, gems("--|#line ", 9));
	} else {
		T33f11(a3, gems("--|#line ", 9));
	}
	if (a2) {
		if ((a3)->id==21) {
			T21f24(a3, ((T69*)(C))->a5);
		} else {
			T33f14(a3, ((T69*)(C))->a5);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems("<not available>", 15));
		} else {
			T33f11(a3, gems("<not available>", 15));
		}
	}
	if ((a3)->id==21) {
		T21f23(a3, gems(" \"", 2));
	} else {
		T33f11(a3, gems(" \"", 2));
	}
	if ((a3)->id==21) {
		T21f23(a3, a1);
	} else {
		T33f11(a3, a1);
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("\"", 1));
	} else {
		T33f10(a3, gems("\"", 1));
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("debug (\"GEYACC\")", 16));
	} else {
		T33f10(a3, gems("debug (\"GEYACC\")", 16));
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("\tstd.error.put_line (\"Executing parser user-code from file \'", 60));
	} else {
		T33f11(a3, gems("\tstd.error.put_line (\"Executing parser user-code from file \'", 60));
	}
	if ((a3)->id==21) {
		T21f23(a3, a1);
	} else {
		T33f11(a3, a1);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("\' at line ", 10));
	} else {
		T33f11(a3, gems("\' at line ", 10));
	}
	if (a2) {
		if ((a3)->id==21) {
			T21f24(a3, ((T69*)(C))->a5);
		} else {
			T33f14(a3, ((T69*)(C))->a5);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems("<not available>", 15));
		} else {
			T33f11(a3, gems("<not available>", 15));
		}
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("\")", 2));
	} else {
		T33f10(a3, gems("\")", 2));
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("end", 3));
	} else {
		T33f10(a3, gems("end", 3));
	}
	l1 = (((T70*)(((T69*)(C))->a2))->a4);
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	t1 = (T171f2(((T69*)(C))->a4));
	if ((a3)->id==21) {
		T21f23(a3, t1);
	} else {
		T33f11(a3, t1);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("if yy_parsing_status = yyContinue then", 38));
	} else {
		T33f10(a3, gems("if yy_parsing_status = yyContinue then", 38));
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("\tyyssp := yyssp - ", 18));
	} else {
		T33f11(a3, gems("\tyyssp := yyssp - ", 18));
	}
	l3 = (((T77*)(((T69*)(C))->a1))->a1);
	if ((a3)->id==21) {
		T21f24(a3, l3);
	} else {
		T33f14(a3, l3);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	t2 = ((T4)((l3)+((T4)(geint32(1)))));
	l4 = T278c40(t2);
	T278f41(l4, (T4)(geint32(1)), l1);
	l2 = ((T4)(geint32(1)));
	t3 = (T4f1(&l2, l3));
	while (!(t3)) {
		t1 = (T77f2(((T69*)(C))->a1, l2));
		l1 = ((((t1)->id==70)?((T70*)(t1))->a4:((T81*)(t1))->a9));
		T278f42(l4, l1);
		t3 = (T278f1(l4));
		if (t3) {
			t2 = (T278f2(l4));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			T278f43(l4, t2);
		} else {
			T278f41(l4, (T4)(geint32(-1)), l1);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t3 = (T4f1(&l2, l3));
	}
	l5 = (T278f3(l4));
	T279f8(l5);
	t3 = (T279f1(l5));
	while (!(t3)) {
		l3 = (T279f2(l5));
		t3 = ((l3)!=((T4)(geint32(0))));
		if (t3) {
			t1 = (T279f3(l5));
			if ((t1)->id==96) {
				T96f19(t1, l3, (T4)(geint32(1)), a3);
			} else {
				T170f17(t1, l3, (T4)(geint32(1)), a3);
			}
		}
		T279f9(l5);
		t3 = (T279f1(l5));
	}
	l1 = (((T70*)(((T69*)(C))->a2))->a4);
	t2 = (T278f4(l4, l1));
	t3 = (T4f1(&t2, (T4)(geint32(0))));
	if (t3) {
		if ((l1)->id==96) {
			T96f20(l1, (T4)(geint32(1)), a3);
		} else {
			T170f18(l1, (T4)(geint32(1)), a3);
		}
	}
	if ((l1)->id==96) {
		T96f21(l1, (T4)(geint32(1)), a3);
	} else {
		T170f19(l1, (T4)(geint32(1)), a3);
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("end", 3));
	} else {
		T33f10(a3, gems("end", 3));
	}
}

/* PR_BASIC_TYPE.print_push_yyval */
void T170f19(T0* C, T4 a1, T0* a2)
{
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".put (yyval", 11));
	} else {
		T33f11(a2, gems(".put (yyval", 11));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(", yyvsp", 7));
	} else {
		T33f11(a2, gems(", yyvsp", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
}

/* PR_TYPE.print_push_yyval */
void T96f21(T0* C, T4 a1, T0* a2)
{
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".put (yyval", 11));
	} else {
		T33f11(a2, gems(".put (yyval", 11));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(", yyvsp", 7));
	} else {
		T33f11(a2, gems(", yyvsp", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
}

/* PR_BASIC_TYPE.print_resize_yyvs */
void T170f18(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("if yyvsp", 8));
	} else {
		T33f11(a2, gems("if yyvsp", 8));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" >= yyvsc", 9));
	} else {
		T33f11(a2, gems(" >= yyvsc", 9));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" then", 5));
	} else {
		T33f10(a2, gems(" then", 5));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("if yyvs", 7));
	} else {
		T33f11(a2, gems("if yyvs", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" = Void then", 12));
	} else {
		T33f10(a2, gems(" = Void then", 12));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f21(C, t1, a2);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("else", 4));
	} else {
		T33f10(a2, gems("else", 4));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("debug (\"GEYACC\")", 16));
	} else {
		T33f10(a2, gems("debug (\"GEYACC\")", 16));
	}
	t1 = ((T4)((a1)+((T4)(geint32(3)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("std.error.put_line (\"Resize yyvs", 32));
	} else {
		T33f11(a2, gems("std.error.put_line (\"Resize yyvs", 32));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\")", 2));
	} else {
		T33f10(a2, gems("\")", 2));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsc", 5));
	} else {
		T33f11(a2, gems("yyvsc", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyvsc", 9));
	} else {
		T33f11(a2, gems(" := yyvsc", 9));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" + yyInitial_yyvs_size", 22));
	} else {
		T33f10(a2, gems(" + yyInitial_yyvs_size", 22));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyspecial_routines", 22));
	} else {
		T33f11(a2, gems(" := yyspecial_routines", 22));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".resize (yyvs", 13));
	} else {
		T33f11(a2, gems(".resize (yyvs", 13));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(", yyvsc", 7));
	} else {
		T33f11(a2, gems(", yyvsc", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
}

/* PR_BASIC_TYPE.print_create_yyvs */
void T170f21(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("debug (\"GEYACC\")", 16));
	} else {
		T33f10(a2, gems("debug (\"GEYACC\")", 16));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("std.error.put_line (\"Create yyvs", 32));
	} else {
		T33f11(a2, gems("std.error.put_line (\"Create yyvs", 32));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\")", 2));
	} else {
		T33f10(a2, gems("\")", 2));
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("create yyspecial_routines", 25));
	} else {
		T33f11(a2, gems("create yyspecial_routines", 25));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsc", 5));
	} else {
		T33f11(a2, gems("yyvsc", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" := yyInitial_yyvs_size", 23));
	} else {
		T33f10(a2, gems(" := yyInitial_yyvs_size", 23));
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyspecial_routines", 22));
	} else {
		T33f11(a2, gems(" := yyspecial_routines", 22));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".make (yyvsc", 12));
	} else {
		T33f11(a2, gems(".make (yyvsc", 12));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
}

/* PR_TYPE.print_resize_yyvs */
void T96f20(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("if yyvsp", 8));
	} else {
		T33f11(a2, gems("if yyvsp", 8));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" >= yyvsc", 9));
	} else {
		T33f11(a2, gems(" >= yyvsc", 9));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" then", 5));
	} else {
		T33f10(a2, gems(" then", 5));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("if yyvs", 7));
	} else {
		T33f11(a2, gems("if yyvs", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" = Void then", 12));
	} else {
		T33f10(a2, gems(" = Void then", 12));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f23(C, t1, a2);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("else", 4));
	} else {
		T33f10(a2, gems("else", 4));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("debug (\"GEYACC\")", 16));
	} else {
		T33f10(a2, gems("debug (\"GEYACC\")", 16));
	}
	t1 = ((T4)((a1)+((T4)(geint32(3)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("std.error.put_line (\"Resize yyvs", 32));
	} else {
		T33f11(a2, gems("std.error.put_line (\"Resize yyvs", 32));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\")", 2));
	} else {
		T33f10(a2, gems("\")", 2));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsc", 5));
	} else {
		T33f11(a2, gems("yyvsc", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyvsc", 9));
	} else {
		T33f11(a2, gems(" := yyvsc", 9));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" + yyInitial_yyvs_size", 22));
	} else {
		T33f10(a2, gems(" + yyInitial_yyvs_size", 22));
	}
	t1 = ((T4)((a1)+((T4)(geint32(2)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyspecial_routines", 22));
	} else {
		T33f11(a2, gems(" := yyspecial_routines", 22));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".resize (yyvs", 13));
	} else {
		T33f11(a2, gems(".resize (yyvs", 13));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(", yyvsc", 7));
	} else {
		T33f11(a2, gems(", yyvsc", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
}

/* PR_TYPE.print_create_yyvs */
void T96f23(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("debug (\"GEYACC\")", 16));
	} else {
		T33f10(a2, gems("debug (\"GEYACC\")", 16));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("std.error.put_line (\"Create yyvs", 32));
	} else {
		T33f11(a2, gems("std.error.put_line (\"Create yyvs", 32));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\")", 2));
	} else {
		T33f10(a2, gems("\")", 2));
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("create yyspecial_routines", 25));
	} else {
		T33f11(a2, gems("create yyspecial_routines", 25));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f26(a2);
	} else {
		T33f13(a2);
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsc", 5));
	} else {
		T33f11(a2, gems("yyvsc", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" := yyInitial_yyvs_size", 23));
	} else {
		T33f10(a2, gems(" := yyInitial_yyvs_size", 23));
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyspecial_routines", 22));
	} else {
		T33f11(a2, gems(" := yyspecial_routines", 22));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".make (yyvsc", 12));
	} else {
		T33f11(a2, gems(".make (yyvsc", 12));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].item */
T4 T278f4(T0* C, T0* a1)
{
	T4 R = 0;
	T278f44(C, a1);
	R = (T278f7(C, ((T278*)(C))->a8));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].items_item */
T4 T278f7(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T278*)(C))->a9))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].search_position */
void T278f44(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T278*)(C))->a8 = (T278f15(C, ((T278*)(C))->a17));
		((T278*)(C))->a18 = (((T278*)(C))->a17);
		((T278*)(C))->a19 = ((T4)(geint32(0)));
	} else {
		l4 = (((T278*)(C))->a20);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T278*)(C))->a8)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T278f21(C, ((T278*)(C))->a8));
				t3 = ((T2)gevoid(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = ((T2)gevoid(l4, a1, l3));
			}
			if (t1) {
				((T278*)(C))->a18 = (T278f14(C, a1));
				l1 = (T278f15(C, ((T278*)(C))->a18));
				((T278*)(C))->a8 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T278f21(C, l1));
					t1 = ((T2)gevoid(l4, a1, t2));
					if (t1) {
						((T278*)(C))->a8 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T278f13(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T278*)(C))->a19 = (l2);
			}
		} else {
			t1 = ((((T278*)(C))->a8)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T278f21(C, ((T278*)(C))->a8));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T278*)(C))->a18 = (T278f14(C, a1));
				l1 = (T278f15(C, ((T278*)(C))->a18));
				((T278*)(C))->a8 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T278f21(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T278*)(C))->a8 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T278f13(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T278*)(C))->a19 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].clashes_item */
T4 T278f13(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T278*)(C))->a23))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].hash_position */
T4 T278f14(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = ((((a1)->id==96)?T96f5(a1):T170f4(a1)));
		R = ((T4)((t2)%(((T278*)(C))->a17)));
	} else {
		R = (((T278*)(C))->a17);
	}
	return R;
}

/* PR_BASIC_TYPE.hash_code */
T4 T170f4(T0* C)
{
	T4 R = 0;
	R = (((T170*)(C))->a1);
	return R;
}

/* PR_TYPE.hash_code */
T4 T96f5(T0* C)
{
	T4 R = 0;
	R = (((T96*)(C))->a2);
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].keys_item */
T0* T278f21(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T135*)(((T278*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].slots_item */
T4 T278f15(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T278*)(C))->a24))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].forth */
void T279f9(T0* C)
{
	T278f57(((T279*)(C))->a4, C);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_forth */
void T278f57(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T4 t2;
	l4 = (((T279*)(a1))->a5);
	t1 = ((l4)==((T4)(geint32(-1))));
	if (t1) {
		l3 = (EIF_TRUE);
	} else {
		l1 = ((T4)((l4)+((T4)(geint32(1)))));
	}
	l2 = (((T278*)(C))->a11);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t2 = (T278f13(C, l1));
		t1 = (T4f1(&t2, (T4)(geint32(-1))));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T278f13(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
	}
	t1 = (T4f1(&l1, l2));
	if (t1) {
		T279f10(a1, (T4)(geint32(-2)));
		t1 = ((T2)(!(l3)));
		if (t1) {
			T278f58(C, a1);
		}
	} else {
		T279f10(a1, l1);
		if (l3) {
			T278f59(C, a1);
		}
	}
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].add_traversing_cursor */
void T278f59(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T278*)(C))->a28));
	if (t1) {
		t2 = (((T279*)(((T278*)(C))->a28))->a6);
		T279f11(a1, t2);
		T279f11(((T278*)(C))->a28, a1);
	}
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].set_next_cursor */
void T279f11(T0* C, T0* a1)
{
	((T279*)(C))->a6 = (a1);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].remove_traversing_cursor */
void T278f58(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T278*)(C))->a28));
	if (t1) {
		l2 = (((T278*)(C))->a28);
		l1 = (((T279*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T279*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T279*)(a1))->a6);
			T279f11(l2, t2);
			T279f11(a1, EIF_VOID);
		}
	}
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].set_position */
void T279f10(T0* C, T4 a1)
{
	((T279*)(C))->a5 = (a1);
}

/* PR_BASIC_TYPE.print_increment_yyvsp */
void T170f17(T0* C, T4 a1, T4 a2, T0* a3)
{
	T2 t1;
	T170f20(C, a2, a3);
	if ((a3)->id==21) {
		T21f23(a3, gems("yyvsp", 5));
	} else {
		T33f11(a3, gems("yyvsp", 5));
	}
	if ((a3)->id==21) {
		T21f24(a3, ((T170*)(C))->a1);
	} else {
		T33f14(a3, ((T170*)(C))->a1);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems(" := yyvsp", 9));
	} else {
		T33f11(a3, gems(" := yyvsp", 9));
	}
	if ((a3)->id==21) {
		T21f24(a3, ((T170*)(C))->a1);
	} else {
		T33f14(a3, ((T170*)(C))->a1);
	}
	t1 = (T4f4(&a1, (T4)(geint32(0))));
	if (t1) {
		if ((a3)->id==21) {
			T21f23(a3, gems(" + ", 3));
		} else {
			T33f11(a3, gems(" + ", 3));
		}
		if ((a3)->id==21) {
			T21f24(a3, a1);
		} else {
			T33f14(a3, a1);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems(" ", 1));
		} else {
			T33f11(a3, gems(" ", 1));
		}
		if ((a3)->id==21) {
			T21f24(a3, a1);
		} else {
			T33f14(a3, a1);
		}
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
}

/* PR_TYPE.print_increment_yyvsp */
void T96f19(T0* C, T4 a1, T4 a2, T0* a3)
{
	T2 t1;
	T96f22(C, a2, a3);
	if ((a3)->id==21) {
		T21f23(a3, gems("yyvsp", 5));
	} else {
		T33f11(a3, gems("yyvsp", 5));
	}
	if ((a3)->id==21) {
		T21f24(a3, ((T96*)(C))->a2);
	} else {
		T33f14(a3, ((T96*)(C))->a2);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems(" := yyvsp", 9));
	} else {
		T33f11(a3, gems(" := yyvsp", 9));
	}
	if ((a3)->id==21) {
		T21f24(a3, ((T96*)(C))->a2);
	} else {
		T33f14(a3, ((T96*)(C))->a2);
	}
	t1 = (T4f4(&a1, (T4)(geint32(0))));
	if (t1) {
		if ((a3)->id==21) {
			T21f23(a3, gems(" + ", 3));
		} else {
			T33f11(a3, gems(" + ", 3));
		}
		if ((a3)->id==21) {
			T21f24(a3, a1);
		} else {
			T33f14(a3, a1);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems(" ", 1));
		} else {
			T33f11(a3, gems(" ", 1));
		}
		if ((a3)->id==21) {
			T21f24(a3, a1);
		} else {
			T33f14(a3, a1);
		}
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].key */
T0* T279f3(T0* C)
{
	T0* R = 0;
	R = (T278f34(((T279*)(C))->a4, C));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_key */
T0* T278f34(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T279*)(a1))->a5);
	R = (T278f21(C, t1));
	return R;
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].item */
T4 T279f2(T0* C)
{
	T4 R = 0;
	R = (T278f33(((T279*)(C))->a4, C));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_item */
T4 T278f33(T0* C, T0* a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (((T279*)(a1))->a5);
	R = (T278f7(C, t1));
	return R;
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].after */
T2 T279f1(T0* C)
{
	T2 R = 0;
	R = (T278f32(((T279*)(C))->a4, C));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_after */
T2 T278f32(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T279*)(a1))->a5);
	R = ((t1)==((T4)(geint32(-2))));
	return R;
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].start */
void T279f8(T0* C)
{
	T278f56(((T279*)(C))->a4, C);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_start */
void T278f56(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T2 t1;
	T4 t2;
	t1 = (T278f37(C));
	if (t1) {
		T279f10(a1, (T4)(geint32(-2)));
	} else {
		l3 = (T278f38(C, a1));
		l1 = ((T4)(geint32(1)));
		l2 = (((T278*)(C))->a11);
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T278f13(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T278f13(C, l1));
				t1 = (T4f1(&t2, (T4)(geint32(-1))));
			}
		}
		t1 = (T4f1(&l1, l2));
		if (t1) {
			T279f10(a1, (T4)(geint32(-2)));
			t1 = ((T2)(!(l3)));
			if (t1) {
				T278f58(C, a1);
			}
		} else {
			T279f10(a1, l1);
			if (l3) {
				T278f59(C, a1);
			}
		}
	}
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].cursor_off */
T2 T278f38(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T279*)(a1))->a5);
	R = ((T2)((t1)<((T4)(geint32(0)))));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].is_empty */
T2 T278f37(T0* C)
{
	T2 R = 0;
	R = ((((T278*)(C))->a16)==((T4)(geint32(0))));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].new_cursor */
T0* T278f3(T0* C)
{
	T0* R = 0;
	R = T279c7(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [INTEGER, PR_TYPE].make */
T0* T279c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T279));
	((T279*)(C))->id = 279;
	((T279*)(C))->a4 = (a1);
	((T279*)(C))->a5 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].replace_found_item */
void T278f43(T0* C, T4 a1)
{
	T278f49(C, a1, ((T278*)(C))->a5);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].items_put */
void T278f49(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T278*)(C))->a9))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].found_item */
T4 T278f2(T0* C)
{
	T4 R = 0;
	R = (T278f7(C, ((T278*)(C))->a5));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].found */
T2 T278f1(T0* C)
{
	T2 R = 0;
	R = ((((T278*)(C))->a5)!=((T4)(geint32(0))));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].search */
void T278f42(T0* C, T0* a1)
{
	T278f44(C, a1);
	((T278*)(C))->a5 = (((T278*)(C))->a8);
}

/* DS_ARRAYED_LIST [PR_SYMBOL].item */
T0* T77f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T202*)(((T77*)(C))->a4))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].put_new */
void T278f41(T0* C, T4 a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T278f46(C);
	l1 = (((T278*)(C))->a10);
	t1 = ((l1)==((T4)(geint32(0))));
	if (t1) {
		((T278*)(C))->a11 = ((T4)((((T278*)(C))->a11)+((T4)(geint32(1)))));
		l1 = (((T278*)(C))->a11);
	} else {
		t2 = (T4)(geint32(-1));
		t3 = (T278f13(C, l1));
		((T278*)(C))->a10 = ((T4)((t2)-(t3)));
	}
	l2 = (T278f14(C, a2));
	t2 = (T278f15(C, l2));
	T278f47(C, t2, l1);
	T278f48(C, l1, l2);
	T278f49(C, a1, l1);
	T278f50(C, a2, l1);
	((T278*)(C))->a16 = ((T4)((((T278*)(C))->a16)+((T4)(geint32(1)))));
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].keys_put */
void T278f50(T0* C, T0* a1, T4 a2)
{
	((T135*)(((T278*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].slots_put */
void T278f48(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T278*)(C))->a24))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].clashes_put */
void T278f47(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T278*)(C))->a23))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].unset_found_item */
void T278f46(T0* C)
{
	((T278*)(C))->a5 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_map */
T0* T278c40(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T278));
	((T278*)(C))->id = 278;
	T278f45(C, a1, EIF_VOID, EIF_VOID);
	return C;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_with_equality_testers */
void T278f45(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T278*)(C))->a22 = (a2);
	((T278*)(C))->a20 = (a3);
	T278f51(C, a1);
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_sparse_container */
void T278f51(T0* C, T4 a1)
{
	T4 t1;
	((T278*)(C))->a26 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T278f52(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T278f53(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T278f54(C, t1);
	((T278*)(C))->a17 = (T278f27(C, a1));
	t1 = ((T4)((((T278*)(C))->a17)+((T4)(geint32(1)))));
	T278f55(C, t1);
	((T278*)(C))->a11 = ((T4)(geint32(0)));
	((T278*)(C))->a10 = ((T4)(geint32(0)));
	((T278*)(C))->a8 = ((T4)(geint32(0)));
	T278f46(C);
	((T278*)(C))->a28 = (T278f3(C));
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_slots */
void T278f55(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T278f31(C));
	((T278*)(C))->a24 = (T129f1(t1, a1));
}

/* KL_SPECIAL_ROUTINES [INTEGER].make */
T0* T129f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T233c2(a1);
	R = (((T233*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [INTEGER].make_area */
T0* T233c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T233));
	((T233*)(C))->id = 233;
	((T233*)(C))->a1 = T98c6(a1);
	return C;
}

/* SPECIAL [INTEGER].make */
T0* T98c6(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T98)+a1*sizeof(T4));
	((T98*)(C))->a1 = a1;
	((T98*)(C))->id = 98;
	return C;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].special_integer_ */
unsigned char ge256os3449 = '\0';
T0* ge256ov3449;
T0* T278f31(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER].default_create */
T0* T129c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T129));
	((T129*)(C))->id = 129;
	return C;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].new_modulus */
T4 T278f27(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_clashes */
void T278f54(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T278f31(C));
	((T278*)(C))->a23 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_keys */
void T278f53(T0* C, T4 a1)
{
	((T278*)(C))->a30 = T136c3();
	((T278*)(C))->a25 = (T136f1(((T278*)(C))->a30, a1));
}

/* KL_SPECIAL_ROUTINES [PR_TYPE].make */
T0* T136f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T236c2(a1);
	R = (((T236*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_TYPE].make_area */
T0* T236c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T236));
	((T236*)(C))->id = 236;
	((T236*)(C))->a1 = T135c4(a1);
	return C;
}

/* SPECIAL [PR_TYPE].make */
T0* T135c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T135)+a1*sizeof(T0*));
	((T135*)(C))->a1 = a1;
	((T135*)(C))->id = 135;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_TYPE].default_create */
T0* T136c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T136));
	((T136*)(C))->id = 136;
	return C;
}

/* DS_HASH_TABLE [INTEGER, PR_TYPE].make_items */
void T278f52(T0* C, T4 a1)
{
	((T278*)(C))->a29 = T129c4();
	((T278*)(C))->a9 = (T129f1(((T278*)(C))->a29, a1));
}

/* PR_RULE.old_print_action */
void T69f25(T0* C, T0* a1, T2 a2, T0* a3)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	if ((a3)->id==21) {
		T21f23(a3, gems("--|#line ", 9));
	} else {
		T33f11(a3, gems("--|#line ", 9));
	}
	if (a2) {
		if ((a3)->id==21) {
			T21f24(a3, ((T69*)(C))->a5);
		} else {
			T33f14(a3, ((T69*)(C))->a5);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems("<not available>", 15));
		} else {
			T33f11(a3, gems("<not available>", 15));
		}
	}
	if ((a3)->id==21) {
		T21f23(a3, gems(" \"", 2));
	} else {
		T33f11(a3, gems(" \"", 2));
	}
	if ((a3)->id==21) {
		T21f23(a3, a1);
	} else {
		T33f11(a3, a1);
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("\"", 1));
	} else {
		T33f10(a3, gems("\"", 1));
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("debug (\"GEYACC\")", 16));
	} else {
		T33f10(a3, gems("debug (\"GEYACC\")", 16));
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("\tstd.error.put_line (\"Executing parser user-code from file \'", 60));
	} else {
		T33f11(a3, gems("\tstd.error.put_line (\"Executing parser user-code from file \'", 60));
	}
	if ((a3)->id==21) {
		T21f23(a3, a1);
	} else {
		T33f11(a3, a1);
	}
	if ((a3)->id==21) {
		T21f23(a3, gems("\' at line ", 10));
	} else {
		T33f11(a3, gems("\' at line ", 10));
	}
	if (a2) {
		if ((a3)->id==21) {
			T21f24(a3, ((T69*)(C))->a5);
		} else {
			T33f14(a3, ((T69*)(C))->a5);
		}
	} else {
		if ((a3)->id==21) {
			T21f23(a3, gems("<not available>", 15));
		} else {
			T33f11(a3, gems("<not available>", 15));
		}
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("\")", 2));
	} else {
		T33f10(a3, gems("\")", 2));
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("end", 3));
	} else {
		T33f10(a3, gems("end", 3));
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	l1 = (((T70*)(((T69*)(C))->a2))->a4);
	if ((l1)->id==96) {
		T96f26(l1, a3);
	} else {
		T170f24(l1, a3);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	t1 = (T171f2(((T69*)(C))->a4));
	if ((a3)->id==21) {
		T21f23(a3, t1);
	} else {
		T33f11(a3, t1);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	if ((l1)->id==96) {
		T96f27(l1, a3);
	} else {
		T170f25(l1, a3);
	}
	if ((a3)->id==21) {
		T21f26(a3);
	} else {
		T33f13(a3);
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("if yy_parsing_status = yyContinue then", 38));
	} else {
		T33f10(a3, gems("if yy_parsing_status = yyContinue then", 38));
	}
	l2 = (((T77*)(((T69*)(C))->a1))->a1);
	t2 = ((l2)!=((T4)(geint32(0))));
	if (t2) {
		if ((a3)->id==21) {
			T21f23(a3, gems("\tyyssp := yyssp - ", 18));
		} else {
			T33f11(a3, gems("\tyyssp := yyssp - ", 18));
		}
		if ((a3)->id==21) {
			T21f24(a3, l2);
		} else {
			T33f14(a3, l2);
		}
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
	}
	l2 = ((T4)((l2)-((T4)(geint32(1)))));
	t2 = (T4f1(&l2, (T4)(geint32(0))));
	if (t2) {
		if ((a3)->id==21) {
			T21f23(a3, gems("\tyyvsp := yyvsp - ", 18));
		} else {
			T33f11(a3, gems("\tyyvsp := yyvsp - ", 18));
		}
		if ((a3)->id==21) {
			T21f24(a3, l2);
		} else {
			T33f14(a3, l2);
		}
		if ((a3)->id==21) {
			T21f26(a3);
		} else {
			T33f13(a3);
		}
	} else {
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
		if (t2) {
			if ((a3)->id==21) {
				T21f23(a3, gems("\tyyvsp := yyvsp + ", 18));
			} else {
				T33f11(a3, gems("\tyyvsp := yyvsp + ", 18));
			}
			t3 = ((T4)(-(l2)));
			if ((a3)->id==21) {
				T21f24(a3, t3);
			} else {
				T33f14(a3, t3);
			}
			if ((a3)->id==21) {
				T21f26(a3);
			} else {
				T33f13(a3);
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\tif yyvsp >= yyvsc then", 23));
			} else {
				T33f10(a3, gems("\tif yyvsp >= yyvsc then", 23));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\tyyvsc := yyvsc + yyInitial_stack_size", 39));
			} else {
				T33f10(a3, gems("\t\tyyvsc := yyvsc + yyInitial_stack_size", 39));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\tyyvs := yy_special_routines.resize (yyvs, yyvsc)", 50));
			} else {
				T33f10(a3, gems("\t\tyyvs := yy_special_routines.resize (yyvs, yyvsc)", 50));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\tdebug (\"GEYACC\")", 18));
			} else {
				T33f10(a3, gems("\t\tdebug (\"GEYACC\")", 18));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\t\tstd.error.put_string (\"Stack (yyvs) size increased to \")", 59));
			} else {
				T33f10(a3, gems("\t\t\tstd.error.put_string (\"Stack (yyvs) size increased to \")", 59));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\t\tstd.error.put_integer (yyvsc)", 32));
			} else {
				T33f10(a3, gems("\t\t\tstd.error.put_integer (yyvsc)", 32));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\t\tstd.error.put_new_line", 25));
			} else {
				T33f10(a3, gems("\t\t\tstd.error.put_new_line", 25));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\t\tend", 5));
			} else {
				T33f10(a3, gems("\t\tend", 5));
			}
			if ((a3)->id==21) {
				T21f27(a3, gems("\tend", 4));
			} else {
				T33f10(a3, gems("\tend", 4));
			}
		}
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("\tyyvs.put (yyval, yyvsp)", 24));
	} else {
		T33f10(a3, gems("\tyyvs.put (yyval, yyvsp)", 24));
	}
	if ((a3)->id==21) {
		T21f27(a3, gems("end", 3));
	} else {
		T33f10(a3, gems("end", 3));
	}
}

/* PR_BASIC_TYPE.old_print_dollar_dollar_finalization */
void T170f25(T0* C, T0* a1)
{
	T2 t1;
	t1 = (T16f4(((T170*)(C))->a2, gems("ANY", 3)));
	t1 = ((T2)(!(t1)));
	if (t1) {
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\tyyval := yyval", 17));
		} else {
			T33f11(a1, gems("\t\t\tyyval := yyval", 17));
		}
		if ((a1)->id==21) {
			T21f24(a1, ((T170*)(C))->a1);
		} else {
			T33f14(a1, ((T170*)(C))->a1);
		}
	}
}

/* PR_TYPE.old_print_dollar_dollar_finalization */
void T96f27(T0* C, T0* a1)
{
	T2 t1;
	t1 = (T16f4(((T96*)(C))->a1, gems("ANY", 3)));
	t1 = ((T2)(!(t1)));
	if (t1) {
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\tyyval := yyval", 17));
		} else {
			T33f11(a1, gems("\t\t\tyyval := yyval", 17));
		}
		if ((a1)->id==21) {
			T21f24(a1, ((T96*)(C))->a2);
		} else {
			T33f14(a1, ((T96*)(C))->a2);
		}
	}
}

/* PR_BASIC_TYPE.old_print_dollar_dollar_initialization */
void T170f24(T0* C, T0* a1)
{
	T2 t1;
	t1 = (T16f4(((T170*)(C))->a2, gems("ANY", 3)));
	if (t1) {
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\tyyval := yyval_default;", 26));
		} else {
			T33f11(a1, gems("\t\t\tyyval := yyval_default;", 26));
		}
	}
}

/* PR_TYPE.old_print_dollar_dollar_initialization */
void T96f26(T0* C, T0* a1)
{
	T2 t1;
	t1 = (T16f4(((T96*)(C))->a1, gems("ANY", 3)));
	if (t1) {
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\tyyval := yyval_default;", 26));
		} else {
			T33f11(a1, gems("\t\t\tyyval := yyval_default;", 26));
		}
	}
}

/* DS_HASH_SET_CURSOR [PR_TYPE].forth */
void T111f8(T0* C)
{
	T110f47(((T111*)(C))->a3, C);
}

/* DS_HASH_SET [PR_TYPE].cursor_forth */
void T110f47(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T4 l4 = 0;
	T2 t1;
	T4 t2;
	l4 = (((T111*)(a1))->a4);
	t1 = ((l4)==((T4)(geint32(-1))));
	if (t1) {
		l3 = (EIF_TRUE);
	} else {
		l1 = ((T4)((l4)+((T4)(geint32(1)))));
	}
	l2 = (((T110*)(C))->a13);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t2 = (T110f5(C, l1));
		t1 = (T4f1(&t2, (T4)(geint32(-1))));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T110f5(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
	}
	t1 = (T4f1(&l1, l2));
	if (t1) {
		T111f9(a1, (T4)(geint32(-2)));
		t1 = ((T2)(!(l3)));
		if (t1) {
			T110f48(C, a1);
		}
	} else {
		T111f9(a1, l1);
		if (l3) {
			T110f49(C, a1);
		}
	}
}

/* DS_HASH_SET [PR_TYPE].add_traversing_cursor */
void T110f49(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T110*)(C))->a17));
	if (t1) {
		t2 = (((T111*)(((T110*)(C))->a17))->a5);
		T111f10(a1, t2);
		T111f10(((T110*)(C))->a17, a1);
	}
}

/* DS_HASH_SET_CURSOR [PR_TYPE].set_next_cursor */
void T111f10(T0* C, T0* a1)
{
	((T111*)(C))->a5 = (a1);
}

/* DS_HASH_SET [PR_TYPE].remove_traversing_cursor */
void T110f48(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T110*)(C))->a17));
	if (t1) {
		l2 = (((T110*)(C))->a17);
		l1 = (((T111*)(l2))->a5);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T111*)(l1))->a5);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T111*)(a1))->a5);
			T111f10(l2, t2);
			T111f10(a1, EIF_VOID);
		}
	}
}

/* DS_HASH_SET_CURSOR [PR_TYPE].set_position */
void T111f9(T0* C, T4 a1)
{
	((T111*)(C))->a4 = (a1);
}

/* DS_HASH_SET [PR_TYPE].clashes_item */
T4 T110f5(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T110*)(C))->a8))->a2[a1]);
	return R;
}

/* PR_BASIC_TYPE.print_dollar_dollar_declaration */
void T170f16(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f23(a1, gems("\t\t\tyyval", 8));
	} else {
		T33f11(a1, gems("\t\t\tyyval", 8));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T170*)(C))->a1);
	} else {
		T33f14(a1, ((T170*)(C))->a1);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(": ", 2));
	} else {
		T33f11(a1, gems(": ", 2));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T170*)(C))->a2);
	} else {
		T33f11(a1, ((T170*)(C))->a2);
	}
}

/* PR_TYPE.print_dollar_dollar_declaration */
void T96f18(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f23(a1, gems("\t\t\tyyval", 8));
	} else {
		T33f11(a1, gems("\t\t\tyyval", 8));
	}
	if ((a1)->id==21) {
		T21f24(a1, ((T96*)(C))->a2);
	} else {
		T33f14(a1, ((T96*)(C))->a2);
	}
	if ((a1)->id==21) {
		T21f23(a1, gems(": ", 2));
	} else {
		T33f11(a1, gems(": ", 2));
	}
	if ((a1)->id==21) {
		T21f23(a1, ((T96*)(C))->a1);
	} else {
		T33f11(a1, ((T96*)(C))->a1);
	}
}

/* DS_HASH_SET_CURSOR [PR_TYPE].item */
T0* T111f2(T0* C)
{
	T0* R = 0;
	R = (T110f30(((T111*)(C))->a3, C));
	return R;
}

/* DS_HASH_SET [PR_TYPE].cursor_item */
T0* T110f30(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T111*)(a1))->a4);
	R = (T110f7(C, t1));
	return R;
}

/* DS_HASH_SET [PR_TYPE].items_item */
T0* T110f7(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T135*)(((T110*)(C))->a9))->a2[a1]);
	return R;
}

/* DS_HASH_SET_CURSOR [PR_TYPE].after */
T2 T111f1(T0* C)
{
	T2 R = 0;
	R = (T110f29(((T111*)(C))->a3, C));
	return R;
}

/* DS_HASH_SET [PR_TYPE].cursor_after */
T2 T110f29(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T111*)(a1))->a4);
	R = ((t1)==((T4)(geint32(-2))));
	return R;
}

/* DS_HASH_SET_CURSOR [PR_TYPE].start */
void T111f7(T0* C)
{
	T110f46(((T111*)(C))->a3, C);
}

/* DS_HASH_SET [PR_TYPE].cursor_start */
void T110f46(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T2 t1;
	T4 t2;
	t1 = (T110f4(C));
	if (t1) {
		T111f9(a1, (T4)(geint32(-2)));
	} else {
		l3 = (T110f34(C, a1));
		l1 = ((T4)(geint32(1)));
		l2 = (((T110*)(C))->a13);
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t2 = (T110f5(C, l1));
			t1 = (T4f1(&t2, (T4)(geint32(-1))));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
			if (!(t1)) {
				t2 = (T110f5(C, l1));
				t1 = (T4f1(&t2, (T4)(geint32(-1))));
			}
		}
		t1 = (T4f1(&l1, l2));
		if (t1) {
			T111f9(a1, (T4)(geint32(-2)));
			t1 = ((T2)(!(l3)));
			if (t1) {
				T110f48(C, a1);
			}
		} else {
			T111f9(a1, l1);
			if (l3) {
				T110f49(C, a1);
			}
		}
	}
}

/* DS_HASH_SET [PR_TYPE].cursor_off */
T2 T110f34(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T111*)(a1))->a4);
	R = ((T2)((t1)<((T4)(geint32(0)))));
	return R;
}

/* DS_HASH_SET [PR_TYPE].new_cursor */
T0* T110f3(T0* C)
{
	T0* R = 0;
	R = T111c6(C);
	return R;
}

/* DS_HASH_SET_CURSOR [PR_TYPE].make */
T0* T111c6(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T111));
	((T111*)(C))->id = 111;
	((T111*)(C))->a3 = (a1);
	((T111*)(C))->a4 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_SET [PR_TYPE].is_empty */
T2 T110f4(T0* C)
{
	T2 R = 0;
	R = ((((T110*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_HASH_SET [PR_TYPE].put */
void T110f36(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T110f41(C);
	T110f42(C, a1);
	t1 = ((((T110*)(C))->a16)!=((T4)(geint32(0))));
	if (t1) {
		T110f43(C, a1, ((T110*)(C))->a16);
	} else {
		l1 = (((T110*)(C))->a14);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T110*)(C))->a13 = ((T4)((((T110*)(C))->a13)+((T4)(geint32(1)))));
			l1 = (((T110*)(C))->a13);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T110f5(C, l1));
			((T110*)(C))->a14 = ((T4)((t2)-(t3)));
		}
		l2 = (((T110*)(C))->a19);
		t2 = (T110f20(C, l2));
		T110f44(C, t2, l1);
		T110f45(C, l1, l2);
		T110f43(C, a1, l1);
		((T110*)(C))->a1 = ((T4)((((T110*)(C))->a1)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_SET [PR_TYPE].slots_put */
void T110f45(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T110*)(C))->a23))->a2[a2] = (a1);
}

/* DS_HASH_SET [PR_TYPE].clashes_put */
void T110f44(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T110*)(C))->a8))->a2[a2] = (a1);
}

/* DS_HASH_SET [PR_TYPE].slots_item */
T4 T110f20(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T110*)(C))->a23))->a2[a1]);
	return R;
}

/* DS_HASH_SET [PR_TYPE].items_put */
void T110f43(T0* C, T0* a1, T4 a2)
{
	((T135*)(((T110*)(C))->a9))->a2[a2] = (a1);
}

/* DS_HASH_SET [PR_TYPE].search_position */
void T110f42(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T110*)(C))->a16 = (T110f20(C, ((T110*)(C))->a11));
		((T110*)(C))->a19 = (((T110*)(C))->a11);
		((T110*)(C))->a25 = ((T4)(geint32(0)));
	} else {
		l4 = (T110f26(C));
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T110*)(C))->a16)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T110f27(C, ((T110*)(C))->a16));
				t3 = ((T2)gevoid(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = ((T2)gevoid(l4, a1, l3));
			}
			if (t1) {
				((T110*)(C))->a19 = (T110f28(C, a1));
				l1 = (T110f20(C, ((T110*)(C))->a19));
				((T110*)(C))->a16 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T110f27(C, l1));
					t1 = ((T2)gevoid(l4, a1, t2));
					if (t1) {
						((T110*)(C))->a16 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T110f5(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T110*)(C))->a25 = (l2);
			}
		} else {
			t1 = ((((T110*)(C))->a16)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T110f27(C, ((T110*)(C))->a16));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T110*)(C))->a19 = (T110f28(C, a1));
				l1 = (T110f20(C, ((T110*)(C))->a19));
				((T110*)(C))->a16 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T110f27(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T110*)(C))->a16 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T110f5(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T110*)(C))->a25 = (l2);
			}
		}
	}
}

/* DS_HASH_SET [PR_TYPE].hash_position */
T4 T110f28(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = ((((a1)->id==96)?T96f5(a1):T170f4(a1)));
		R = ((T4)((t2)%(((T110*)(C))->a11)));
	} else {
		R = (((T110*)(C))->a11);
	}
	return R;
}

/* DS_HASH_SET [PR_TYPE].keys_item */
T0* T110f27(T0* C, T4 a1)
{
	T0* R = 0;
	R = (T110f7(C, a1));
	return R;
}

/* DS_HASH_SET [PR_TYPE].key_equality_tester */
T0* T110f26(T0* C)
{
	T0* R = 0;
	R = (((T110*)(C))->a32);
	return R;
}

/* DS_HASH_SET [PR_TYPE].unset_found_item */
void T110f41(T0* C)
{
	((T110*)(C))->a24 = ((T4)(geint32(0)));
}

/* DS_ARRAYED_LIST [PR_RULE].item */
T0* T67f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T190*)(((T67*)(C))->a7))->a2[a1]);
	return R;
}

/* DS_HASH_SET [PR_TYPE].make */
T0* T110c35(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T110));
	((T110*)(C))->id = 110;
	((T110*)(C))->a10 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T110f37(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T110f38(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T110f39(C, t1);
	((T110*)(C))->a11 = (T110f12(C, a1));
	t1 = ((T4)((((T110*)(C))->a11)+((T4)(geint32(1)))));
	T110f40(C, t1);
	((T110*)(C))->a13 = ((T4)(geint32(0)));
	((T110*)(C))->a14 = ((T4)(geint32(0)));
	((T110*)(C))->a16 = ((T4)(geint32(0)));
	T110f41(C);
	((T110*)(C))->a17 = (T110f3(C));
	return C;
}

/* DS_HASH_SET [PR_TYPE].make_slots */
void T110f40(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T110f22(C));
	((T110*)(C))->a23 = (T129f1(t1, a1));
}

/* DS_HASH_SET [PR_TYPE].special_integer_ */
T0* T110f22(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* DS_HASH_SET [PR_TYPE].new_modulus */
T4 T110f12(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_SET [PR_TYPE].make_clashes */
void T110f39(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T110f22(C));
	((T110*)(C))->a8 = (T129f1(t1, a1));
}

/* DS_HASH_SET [PR_TYPE].make_keys */
void T110f38(T0* C, T4 a1)
{
}

/* DS_HASH_SET [PR_TYPE].make_items */
void T110f37(T0* C, T4 a1)
{
	((T110*)(C))->a21 = T136c3();
	((T110*)(C))->a9 = (T136f1(((T110*)(C))->a21, a1));
}

/* PR_PARSER_GENERATOR.print_separated_actions */
void T20f50(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* t1;
	T4 t2;
	T2 t3;
	T2 t4;
	l6 = ((T4)(geint32(200)));
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_do_action (yy_act: INTEGER) is", 34));
	} else {
		T33f10(a1, gems("\tyy_do_action (yy_act: INTEGER) is", 34));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Execute semantic action.", 30));
	} else {
		T33f10(a1, gems("\t\t\t-- Execute semantic action.", 30));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l7 = (((T26*)(t1))->a1);
	l2 = (((T67*)(l7))->a1);
	t2 = ((T4)((l2)/(l6)));
	l5 = ((T4)((t2)+((T4)(geint32(1)))));
	t3 = ((l5)==((T4)(geint32(1))));
	if (t3) {
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tinspect yy_act", 17));
		} else {
			T33f10(a1, gems("\t\t\tinspect yy_act", 17));
		}
		l1 = ((T4)(geint32(1)));
		t3 = (T4f1(&l1, l2));
		while (!(t3)) {
			l8 = (T67f2(l7, l1));
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\twhen ", 8));
			} else {
				T33f11(a1, gems("\t\t\twhen ", 8));
			}
			t2 = (((T69*)(l8))->a6);
			if ((a1)->id==21) {
				T21f24(a1, t2);
			} else {
				T33f14(a1, t2);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" then", 5));
			} else {
				T33f10(a1, gems(" then", 5));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\t\t\t--|#line ", 14));
			} else {
				T33f11(a1, gems("\t\t\t\t\t--|#line ", 14));
			}
			if (((T20*)(C))->a5) {
				t2 = (((T69*)(l8))->a5);
				if ((a1)->id==21) {
					T21f24(a1, t2);
				} else {
					T33f14(a1, t2);
				}
			} else {
				if ((a1)->id==21) {
					T21f23(a1, gems("<not available>", 15));
				} else {
					T33f11(a1, gems("<not available>", 15));
				}
			}
			if ((a1)->id==21) {
				T21f23(a1, gems(" \"", 2));
			} else {
				T33f11(a1, gems(" \"", 2));
			}
			if ((a1)->id==21) {
				T21f23(a1, ((T20*)(C))->a6);
			} else {
				T33f11(a1, ((T20*)(C))->a6);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\"", 1));
			} else {
				T33f10(a1, gems("\"", 1));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\t\tyy_do_action_", 17));
			} else {
				T33f11(a1, gems("\t\t\t\tyy_do_action_", 17));
			}
			if ((a1)->id==21) {
				T21f24(a1, l1);
			} else {
				T33f14(a1, l1);
			}
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t3 = (T4f1(&l1, l2));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\telse", 7));
		} else {
			T33f10(a1, gems("\t\t\telse", 7));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
		} else {
			T33f10(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tend", 7));
		} else {
			T33f10(a1, gems("\t\t\t\tend", 7));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tabort", 9));
		} else {
			T33f10(a1, gems("\t\t\t\tabort", 9));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
	} else {
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\t", 3));
		} else {
			T33f11(a1, gems("\t\t\t", 3));
		}
		l1 = ((T4)(geint32(1)));
		t3 = (T4f1(&l1, l5));
		while (!(t3)) {
			t2 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = ((T4)((l6)*(t2)));
			l3 = ((T4)((t2)+((T4)(geint32(1)))));
			l4 = ((T4)((l6)*(l1)));
			if ((a1)->id==21) {
				T21f23(a1, gems("if yy_act <= ", 13));
			} else {
				T33f11(a1, gems("if yy_act <= ", 13));
			}
			if ((a1)->id==21) {
				T21f24(a1, l4);
			} else {
				T33f14(a1, l4);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" then", 5));
			} else {
				T33f10(a1, gems(" then", 5));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\t\tyy_do_action_", 17));
			} else {
				T33f11(a1, gems("\t\t\t\tyy_do_action_", 17));
			}
			if ((a1)->id==21) {
				T21f24(a1, l3);
			} else {
				T33f14(a1, l3);
			}
			if ((a1)->id==21) {
				T21f25(a1, (T1)('_'));
			} else {
				T33f12(a1, (T1)('_'));
			}
			if ((a1)->id==21) {
				T21f24(a1, l4);
			} else {
				T33f14(a1, l4);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" (yy_act)", 9));
			} else {
				T33f10(a1, gems(" (yy_act)", 9));
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\telse", 7));
			} else {
				T33f11(a1, gems("\t\t\telse", 7));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t3 = (T4f1(&l1, l5));
		}
		if ((a1)->id==21) {
			T21f26(a1);
		} else {
			T33f13(a1);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
		} else {
			T33f10(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tend", 7));
		} else {
			T33f10(a1, gems("\t\t\t\tend", 7));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tabort", 9));
		} else {
			T33f10(a1, gems("\t\t\t\tabort", 9));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
		l1 = ((T4)(geint32(1)));
		t3 = (T4f1(&l1, l5));
		while (!(t3)) {
			t2 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = ((T4)((l6)*(t2)));
			l3 = ((T4)((t2)+((T4)(geint32(1)))));
			l4 = ((T4)((l6)*(l1)));
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\tyy_do_action_", 14));
			} else {
				T33f11(a1, gems("\tyy_do_action_", 14));
			}
			if ((a1)->id==21) {
				T21f24(a1, l3);
			} else {
				T33f14(a1, l3);
			}
			if ((a1)->id==21) {
				T21f25(a1, (T1)('_'));
			} else {
				T33f12(a1, (T1)('_'));
			}
			if ((a1)->id==21) {
				T21f24(a1, l4);
			} else {
				T33f14(a1, l4);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" (yy_act: INTEGER) is", 21));
			} else {
				T33f10(a1, gems(" (yy_act: INTEGER) is", 21));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t-- Execute semantic action.", 30));
			} else {
				T33f10(a1, gems("\t\t\t-- Execute semantic action.", 30));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tdo", 4));
			} else {
				T33f10(a1, gems("\t\tdo", 4));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\tinspect yy_act", 17));
			} else {
				T33f10(a1, gems("\t\t\tinspect yy_act", 17));
			}
			l4 = (T4f9(&l4, l2));
			t3 = (T4f1(&l3, l4));
			while (!(t3)) {
				l8 = (T67f2(l7, l3));
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\twhen ", 8));
				} else {
					T33f11(a1, gems("\t\t\twhen ", 8));
				}
				t2 = (((T69*)(l8))->a6);
				if ((a1)->id==21) {
					T21f24(a1, t2);
				} else {
					T33f14(a1, t2);
				}
				if ((a1)->id==21) {
					T21f27(a1, gems(" then", 5));
				} else {
					T33f10(a1, gems(" then", 5));
				}
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\t\t\t--|#line ", 14));
				} else {
					T33f11(a1, gems("\t\t\t\t\t--|#line ", 14));
				}
				if (((T20*)(C))->a5) {
					t2 = (((T69*)(l8))->a5);
					if ((a1)->id==21) {
						T21f24(a1, t2);
					} else {
						T33f14(a1, t2);
					}
				} else {
					if ((a1)->id==21) {
						T21f23(a1, gems("<not available>", 15));
					} else {
						T33f11(a1, gems("<not available>", 15));
					}
				}
				if ((a1)->id==21) {
					T21f23(a1, gems(" \"", 2));
				} else {
					T33f11(a1, gems(" \"", 2));
				}
				if ((a1)->id==21) {
					T21f23(a1, ((T20*)(C))->a6);
				} else {
					T33f11(a1, ((T20*)(C))->a6);
				}
				if ((a1)->id==21) {
					T21f27(a1, gems("\"", 1));
				} else {
					T33f10(a1, gems("\"", 1));
				}
				if ((a1)->id==21) {
					T21f23(a1, gems("\t\t\t\tyy_do_action_", 17));
				} else {
					T33f11(a1, gems("\t\t\t\tyy_do_action_", 17));
				}
				if ((a1)->id==21) {
					T21f24(a1, l3);
				} else {
					T33f14(a1, l3);
				}
				if ((a1)->id==21) {
					T21f26(a1);
				} else {
					T33f13(a1);
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t3 = (T4f1(&l3, l4));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\telse", 7));
			} else {
				T33f10(a1, gems("\t\t\telse", 7));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
			} else {
				T33f10(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
			} else {
				T33f10(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown rule id: \")", 64));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
			} else {
				T33f10(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_act)", 35));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
			} else {
				T33f10(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\tend", 7));
			} else {
				T33f10(a1, gems("\t\t\t\tend", 7));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\t\tabort", 9));
			} else {
				T33f10(a1, gems("\t\t\t\tabort", 9));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\t\tend", 6));
			} else {
				T33f10(a1, gems("\t\t\tend", 6));
			}
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tend", 5));
			} else {
				T33f10(a1, gems("\t\tend", 5));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t3 = (T4f1(&l1, l5));
		}
	}
	l1 = ((T4)(geint32(1)));
	t3 = (T4f1(&l1, l2));
	while (!(t3)) {
		l8 = (T67f2(l7, l1));
		if ((a1)->id==21) {
			T21f26(a1);
		} else {
			T33f13(a1);
		}
		if ((a1)->id==21) {
			T21f23(a1, gems("\tyy_do_action_", 14));
		} else {
			T33f11(a1, gems("\tyy_do_action_", 14));
		}
		if ((a1)->id==21) {
			T21f24(a1, l1);
		} else {
			T33f14(a1, l1);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems(" is", 3));
		} else {
			T33f10(a1, gems(" is", 3));
		}
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\t--|#line ", 12));
		} else {
			T33f11(a1, gems("\t\t\t--|#line ", 12));
		}
		if (((T20*)(C))->a5) {
			t2 = (((T69*)(l8))->a5);
			if ((a1)->id==21) {
				T21f24(a1, t2);
			} else {
				T33f14(a1, t2);
			}
		} else {
			if ((a1)->id==21) {
				T21f23(a1, gems("<not available>", 15));
			} else {
				T33f11(a1, gems("<not available>", 15));
			}
		}
		if ((a1)->id==21) {
			T21f23(a1, gems(" \"", 2));
		} else {
			T33f11(a1, gems(" \"", 2));
		}
		if ((a1)->id==21) {
			T21f23(a1, ((T20*)(C))->a6);
		} else {
			T33f11(a1, ((T20*)(C))->a6);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\"", 1));
		} else {
			T33f10(a1, gems("\"", 1));
		}
		t1 = (((T69*)(l8))->a2);
		l9 = (((T70*)(t1))->a4);
		t3 = ((T2)(!(((T20*)(C))->a8)));
		if (!(t3)) {
			t1 = ((((l9)->id==96)?((T96*)(l9))->a1:((T170*)(l9))->a2));
			t4 = (T16f4(t1, gems("ANY", 3)));
			t3 = ((T2)(!(t4)));
		}
		if (t3) {
			if ((a1)->id==21) {
				T21f27(a1, gems("\t\tlocal", 7));
			} else {
				T33f10(a1, gems("\t\tlocal", 7));
			}
			if ((l9)->id==96) {
				T96f18(l9, a1);
			} else {
				T170f16(l9, a1);
			}
			if ((a1)->id==21) {
				T21f26(a1);
			} else {
				T33f13(a1);
			}
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tdo", 4));
		} else {
			T33f10(a1, gems("\t\tdo", 4));
		}
		if (((T20*)(C))->a8) {
			T69f25(l8, ((T20*)(C))->a6, ((T20*)(C))->a5, a1);
		} else {
			T69f26(l8, ((T20*)(C))->a6, ((T20*)(C))->a5, a1);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t3 = (T4f1(&l1, l2));
	}
}

/* PR_PARSER_GENERATOR.print_pop_last_value */
void T20f49(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_pop_last_value (yystate: INTEGER) is", 40));
	} else {
		T33f10(a1, gems("\tyy_pop_last_value (yystate: INTEGER) is", 40));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Pop semantic value from stack when in state `yystate\'.", 60));
	} else {
		T33f10(a1, gems("\t\t\t-- Pop semantic value from stack when in state `yystate\'.", 60));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tlocal", 7));
	} else {
		T33f10(a1, gems("\t\tlocal", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyy_type_id: INTEGER", 22));
	} else {
		T33f10(a1, gems("\t\t\tyy_type_id: INTEGER", 22));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyy_type_id := yytypes1.item (yystate)", 40));
	} else {
		T33f10(a1, gems("\t\t\tyy_type_id := yytypes1.item (yystate)", 40));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tinspect yy_type_id", 21));
	} else {
		T33f10(a1, gems("\t\t\tinspect yy_type_id", 21));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a8);
	l4 = (((T109*)(l1))->a1);
	l3 = ((T4)(geint32(1)));
	t2 = (T4f1(&l3, l4));
	while (!(t2)) {
		l2 = (T109f2(l1, l3));
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\twhen ", 8));
		} else {
			T33f11(a1, gems("\t\t\twhen ", 8));
		}
		t3 = ((((l2)->id==96)?((T96*)(l2))->a2:((T170*)(l2))->a1));
		if ((a1)->id==21) {
			T21f24(a1, t3);
		} else {
			T33f14(a1, t3);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems(" then", 5));
		} else {
			T33f10(a1, gems(" then", 5));
		}
		if ((l2)->id==96) {
			T96f14(l2, (T4)(geint32(4)), a1);
		} else {
			T170f12(l2, (T4)(geint32(4)), a1);
		}
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t2 = (T4f1(&l3, l4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\telse", 7));
	} else {
		T33f10(a1, gems("\t\t\telse", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
	} else {
		T33f10(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown type id: \")", 64));
	} else {
		T33f10(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: unknown type id: \")", 64));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_type_id)", 39));
	} else {
		T33f10(a1, gems("\t\t\t\t\tstd.error.put_integer (yy_type_id)", 39));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
	} else {
		T33f10(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\tend", 7));
	} else {
		T33f10(a1, gems("\t\t\t\tend", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t\tabort", 9));
	} else {
		T33f10(a1, gems("\t\t\t\tabort", 9));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tend", 6));
	} else {
		T33f10(a1, gems("\t\t\tend", 6));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_BASIC_TYPE.print_pop_last_value */
void T170f12(T0* C, T4 a1, T0* a2)
{
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := ", 4));
	} else {
		T33f11(a2, gems(" := ", 4));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" - 1", 4));
	} else {
		T33f10(a2, gems(" - 1", 4));
	}
}

/* PR_TYPE.print_pop_last_value */
void T96f14(T0* C, T4 a1, T0* a2)
{
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := ", 4));
	} else {
		T33f11(a2, gems(" := ", 4));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" - 1", 4));
	} else {
		T33f10(a2, gems(" - 1", 4));
	}
}

/* PR_PARSER_GENERATOR.print_push_error_value */
void T20f48(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T0* t1;
	T2 t2;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_push_error_value is", 23));
	} else {
		T33f10(a1, gems("\tyy_push_error_value is", 23));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Push semantic value associated with token \'error\'", 55));
	} else {
		T33f10(a1, gems("\t\t\t-- Push semantic value associated with token \'error\'", 55));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- on top of corresponding value stack.", 42));
	} else {
		T33f10(a1, gems("\t\t\t-- on top of corresponding value stack.", 42));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a6);
	l4 = (((T95*)(l1))->a1);
	t2 = (T4f4(&l4, (T4)(geint32(2))));
	if (t2) {
		l2 = (T95f2(l1, (T4)(geint32(2))));
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tlocal", 7));
		} else {
			T33f10(a1, gems("\t\tlocal", 7));
		}
		l3 = (((T81*)(l2))->a9);
		if ((l3)->id==96) {
			T96f18(l3, a1);
		} else {
			T170f16(l3, a1);
		}
		if ((a1)->id==21) {
			T21f26(a1);
		} else {
			T33f13(a1);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tdo", 4));
		} else {
			T33f10(a1, gems("\t\tdo", 4));
		}
		if ((l3)->id==96) {
			T96f19(l3, (T4)(geint32(1)), (T4)(geint32(3)), a1);
		} else {
			T170f17(l3, (T4)(geint32(1)), (T4)(geint32(3)), a1);
		}
		if ((l3)->id==96) {
			T96f20(l3, (T4)(geint32(3)), a1);
		} else {
			T170f18(l3, (T4)(geint32(3)), a1);
		}
		if ((l3)->id==96) {
			T96f21(l3, (T4)(geint32(3)), a1);
		} else {
			T170f19(l3, (T4)(geint32(3)), a1);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
	} else {
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tdo", 4));
		} else {
			T33f10(a1, gems("\t\tdo", 4));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tdebug (\"GEYACC\")", 19));
		} else {
			T33f10(a1, gems("\t\t\tdebug (\"GEYACC\")", 19));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tstd.error.put_line (\"Error in parser: unknown \'error\' token.\")", 66));
		} else {
			T33f10(a1, gems("\t\t\t\tstd.error.put_line (\"Error in parser: unknown \'error\' token.\")", 66));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tabort", 8));
		} else {
			T33f10(a1, gems("\t\t\tabort", 8));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
	}
}

/* DS_ARRAYED_LIST [PR_TOKEN].item */
T0* T95f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T139*)(((T95*)(C))->a3))->a2[a1]);
	return R;
}

/* PR_PARSER_GENERATOR.print_push_last_value */
void T20f47(T0* C, T0* a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_push_last_value (yychar1: INTEGER) is", 41));
	} else {
		T33f10(a1, gems("\tyy_push_last_value (yychar1: INTEGER) is", 41));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Push semantic value associated with token `last_token\'", 60));
	} else {
		T33f10(a1, gems("\t\t\t-- Push semantic value associated with token `last_token\'", 60));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- (with internal id `yychar1\') on top of corresponding", 58));
	} else {
		T33f10(a1, gems("\t\t\t-- (with internal id `yychar1\') on top of corresponding", 58));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- value stack.", 18));
	} else {
		T33f10(a1, gems("\t\t\t-- value stack.", 18));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	t1 = (((T26*)(t1))->a8);
	l1 = (((T109*)(t1))->a1);
	l2 = T110c35(l1);
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l4 = (((T26*)(t1))->a6);
	l6 = (((T95*)(l4))->a1);
	l5 = ((T4)(geint32(1)));
	t2 = (T4f1(&l5, l6));
	while (!(t2)) {
		t1 = (T95f2(l4, l5));
		l7 = (((T81*)(t1))->a9);
		T110f36(l2, l7);
		t3 = (((T110*)(l2))->a1);
		t2 = ((t3)==(l1));
		if (t2) {
			l5 = ((T4)((l6)+((T4)(geint32(1)))));
		}
		l5 = ((T4)((l5)+((T4)(geint32(1)))));
		t2 = (T4f1(&l5, l6));
	}
	t3 = (((T110*)(l2))->a1);
	switch (t3) {
	case (T4)(T4)(geint32(0)):
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tdebug (\"GEYACC\")", 19));
		} else {
			T33f10(a1, gems("\t\t\tdebug (\"GEYACC\")", 19));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tstd.error.put_string (\"Error in parser: not a token type: \")", 64));
		} else {
			T33f10(a1, gems("\t\t\t\tstd.error.put_string (\"Error in parser: not a token type: \")", 64));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tstd.error.put_integer (yytypes2.item (yychar1))", 51));
		} else {
			T33f10(a1, gems("\t\t\t\tstd.error.put_integer (yytypes2.item (yychar1))", 51));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tstd.error.put_new_line", 26));
		} else {
			T33f10(a1, gems("\t\t\t\tstd.error.put_new_line", 26));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tabort", 8));
		} else {
			T33f10(a1, gems("\t\t\tabort", 8));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\tend", 5));
		} else {
			T33f10(a1, gems("\t\tend", 5));
		}
		break;
	case (T4)(T4)(geint32(1)):
		l7 = (T110f2(l2));
		if ((l7)->id==96) {
			T96f17(l7, (T4)(geint32(3)), a1);
		} else {
			T170f15(l7, (T4)(geint32(3)), a1);
		}
		break;
	default:
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tinspect yytypes2.item (yychar1)", 34));
		} else {
			T33f10(a1, gems("\t\t\tinspect yytypes2.item (yychar1)", 34));
		}
		l3 = (T110f3(l2));
		T111f7(l3);
		t2 = (T111f1(l3));
		while (!(t2)) {
			l7 = (T111f2(l3));
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\twhen ", 8));
			} else {
				T33f11(a1, gems("\t\t\twhen ", 8));
			}
			t3 = ((((l7)->id==96)?((T96*)(l7))->a2:((T170*)(l7))->a1));
			if ((a1)->id==21) {
				T21f24(a1, t3);
			} else {
				T33f14(a1, t3);
			}
			if ((a1)->id==21) {
				T21f27(a1, gems(" then", 5));
			} else {
				T33f10(a1, gems(" then", 5));
			}
			if ((l7)->id==96) {
				T96f17(l7, (T4)(geint32(4)), a1);
			} else {
				T170f15(l7, (T4)(geint32(4)), a1);
			}
			T111f8(l3);
			t2 = (T111f1(l3));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\telse", 7));
		} else {
			T33f10(a1, gems("\t\t\telse", 7));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
		} else {
			T33f10(a1, gems("\t\t\t\tdebug (\"GEYACC\")", 20));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: not a token type: \")", 65));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_string (\"Error in parser: not a token type: \")", 65));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_integer (yytypes2.item (yychar1))", 52));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_integer (yytypes2.item (yychar1))", 52));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
		} else {
			T33f10(a1, gems("\t\t\t\t\tstd.error.put_new_line", 27));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tend", 7));
		} else {
			T33f10(a1, gems("\t\t\t\tend", 7));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\t\tabort", 9));
		} else {
			T33f10(a1, gems("\t\t\t\tabort", 9));
		}
		if ((a1)->id==21) {
			T21f27(a1, gems("\t\t\tend", 6));
		} else {
			T33f10(a1, gems("\t\t\tend", 6));
		}
		break;
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_BASIC_TYPE.print_push_last_value */
void T170f15(T0* C, T4 a1, T0* a2)
{
	T0* t1;
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyvsp", 9));
	} else {
		T33f11(a2, gems(" := yyvsp", 9));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" + 1", 4));
	} else {
		T33f10(a2, gems(" + 1", 4));
	}
	T170f18(C, a1, a2);
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".put (", 6));
	} else {
		T33f11(a2, gems(".put (", 6));
	}
	t1 = (T170f5(C));
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(", yyvsp", 7));
	} else {
		T33f11(a2, gems(", yyvsp", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
}

/* PR_BASIC_TYPE.last_value_name */
T0* T170f5(T0* C)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T1 t4;
	l2 = (((T16*)(((T170*)(C))->a2))->a2);
	t1 = ((T4)((l2)+((T4)(geint32(11)))));
	R = T16c25(t1);
	T16f26(R, gems("last_", 5));
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		l3 = (T16f14(((T170*)(C))->a2, l1));
		switch (l3) {
		case (T1)'0':
		case (T1)'1':
		case (T1)'2':
		case (T1)'3':
		case (T1)'4':
		case (T1)'5':
		case (T1)'6':
		case (T1)'7':
		case (T1)'8':
		case (T1)'9':
		case (T1)'a':
		case (T1)'b':
		case (T1)'c':
		case (T1)'d':
		case (T1)'e':
		case (T1)'f':
		case (T1)'g':
		case (T1)'h':
		case (T1)'i':
		case (T1)'j':
		case (T1)'k':
		case (T1)'l':
		case (T1)'m':
		case (T1)'n':
		case (T1)'o':
		case (T1)'p':
		case (T1)'q':
		case (T1)'r':
		case (T1)'s':
		case (T1)'t':
		case (T1)'u':
		case (T1)'v':
		case (T1)'w':
		case (T1)'x':
		case (T1)'y':
		case (T1)'z':
		case (T1)(T1)('_'):
			T16f28(R, l3);
			break;
		case (T1)'A':
		case (T1)'B':
		case (T1)'C':
		case (T1)'D':
		case (T1)'E':
		case (T1)'F':
		case (T1)'G':
		case (T1)'H':
		case (T1)'I':
		case (T1)'J':
		case (T1)'K':
		case (T1)'L':
		case (T1)'M':
		case (T1)'N':
		case (T1)'O':
		case (T1)'P':
		case (T1)'Q':
		case (T1)'R':
		case (T1)'S':
		case (T1)'T':
		case (T1)'U':
		case (T1)'V':
		case (T1)'W':
		case (T1)'X':
		case (T1)'Y':
		case (T1)'Z':
			t3 = (T170f6(C));
			t4 = (T270f1(t3, l3));
			T16f28(R, t4);
			break;
		default:
			T16f28(R, (T1)('_'));
			break;
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	T16f26(R, gems("_value", 6));
	return R;
}

/* KL_CHARACTER_ROUTINES.as_lower */
T1 T270f1(T0* C, T1 a1)
{
	T1 R = 0;
	R = (T1f3(&a1));
	return R;
}

/* CHARACTER.lower */
T1 T1f3(T1* C)
{
	T1 R = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	T4 t4;
	t1 = (T1f8(C));
	if (t1) {
		t2 = (*C);
		t3 = ((T4)(t2));
		t2 = (T1)('A');
		t4 = ((T4)(t2));
		t3 = ((T4)((t3)-(t4)));
		t2 = (T1)('a');
		t4 = ((T4)(t2));
		t3 = ((T4)((t3)+(t4)));
		R = ((T1)(t3));
	} else {
		R = (*C);
	}
	return R;
}

/* CHARACTER.is_upper */
T2 T1f8(T1* C)
{
	T2 R = 0;
	T1 t1;
	T4 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T4)(t1));
	t3 = (T1f9(C, t2));
	t3 = (T8f1(&t3, (T5)(geint8(0x01))));
	R = (T8f2(&t3, (T8)(genat8(0))));
	return R;
}

/* NATURAL_8.infix ">" */
T2 T8f2(T8* C, T8 a1)
{
	T2 R = 0;
	R = ((T2)((a1)<(*C)));
	return R;
}

/* NATURAL_8.infix "&" */
T8 T8f1(T8* C, T8 a1)
{
	T8 R = 0;
	R = ((T8)((*C)&(a1)));
	return R;
}

/* CHARACTER.character_types */
T8 T1f9(T1* C, T4 a1)
{
	T8 R = 0;
	T2 t1;
	T0* t2;
	t1 = ((T2)((a1)<((T4)(geint32(256)))));
	if (t1) {
		t2 = (T1f12(C));
		R = (((T242*)(t2))->a2[a1]);
	}
	return R;
}

/* CHARACTER.internal_character_types */
unsigned char ge35os35 = '\0';
T0* ge35ov35;
T0* T1f12(T1* C)
{
	T0* R = 0;
	T8 t1;
	if (ge35os35) {
		return ge35ov35;
	} else {
		ge35os35 = '\1';
	}
	R = T242c2((T4)(geint32(256)));
	((T242*)(R))->a2[(T4)(geint32(0))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(1))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(2))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(3))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(4))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(5))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(6))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(7))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(8))] = ((T5)(geint8(0x20)));
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T242*)(R))->a2[(T4)(geint32(9))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T242*)(R))->a2[(T4)(geint32(10))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T242*)(R))->a2[(T4)(geint32(11))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T242*)(R))->a2[(T4)(geint32(12))] = (t1);
	t1 = (T5)(geint8(0x20));
	t1 = (T8f3(&t1, (T5)(geint8(0x08))));
	((T242*)(R))->a2[(T4)(geint32(13))] = (t1);
	((T242*)(R))->a2[(T4)(geint32(14))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(15))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(16))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(17))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(18))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(19))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(20))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(21))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(22))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(23))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(24))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(25))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(26))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(27))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(28))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(29))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(30))] = ((T5)(geint8(0x20)));
	((T242*)(R))->a2[(T4)(geint32(31))] = ((T5)(geint8(0x20)));
	t1 = (T5)(geint8(0x08));
	t1 = (T8f3(&t1, (T5)(geint8(0x80))));
	((T242*)(R))->a2[(T4)(geint32(32))] = (t1);
	((T242*)(R))->a2[(T4)(geint32(33))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(34))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(35))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(36))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(37))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(38))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(39))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(40))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(41))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(42))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(43))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(44))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(45))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(46))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(47))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(48))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(49))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(50))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(51))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(52))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(53))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(54))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(55))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(56))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(57))] = ((T5)(geint8(0x04)));
	((T242*)(R))->a2[(T4)(geint32(58))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(59))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(60))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(61))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(62))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(63))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(64))] = ((T5)(geint8(0x10)));
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(65))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(66))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(67))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(68))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(69))] = (t1);
	t1 = (T5)(geint8(0x01));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(70))] = (t1);
	((T242*)(R))->a2[(T4)(geint32(71))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(72))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(73))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(74))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(75))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(76))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(77))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(78))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(79))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(80))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(81))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(82))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(83))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(84))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(85))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(86))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(87))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(88))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(89))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(90))] = ((T5)(geint8(0x01)));
	((T242*)(R))->a2[(T4)(geint32(91))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(92))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(93))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(94))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(95))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(96))] = ((T5)(geint8(0x10)));
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(97))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(98))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(99))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(100))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(101))] = (t1);
	t1 = (T5)(geint8(0x02));
	t1 = (T8f3(&t1, (T5)(geint8(0x40))));
	((T242*)(R))->a2[(T4)(geint32(102))] = (t1);
	((T242*)(R))->a2[(T4)(geint32(103))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(104))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(105))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(106))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(107))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(108))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(109))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(110))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(111))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(112))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(113))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(114))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(115))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(116))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(117))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(118))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(119))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(120))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(121))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(122))] = ((T5)(geint8(0x02)));
	((T242*)(R))->a2[(T4)(geint32(123))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(124))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(125))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(126))] = ((T5)(geint8(0x10)));
	((T242*)(R))->a2[(T4)(geint32(127))] = ((T5)(geint8(0x20)));
	ge35ov35 = R;
	return R;
}

/* NATURAL_8.infix "|" */
T8 T8f3(T8* C, T8 a1)
{
	T8 R = 0;
	R = ((T8)((*C)|(a1)));
	return R;
}

/* SPECIAL [NATURAL_8].make */
T0* T242c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T242)+a1*sizeof(T8));
	((T242*)(C))->a1 = a1;
	((T242*)(C))->id = 242;
	return C;
}

/* PR_BASIC_TYPE.character_ */
unsigned char ge253os2968 = '\0';
T0* ge253ov2968;
T0* T170f6(T0* C)
{
	T0* R = 0;
	if (ge253os2968) {
		return ge253ov2968;
	} else {
		ge253os2968 = '\1';
	}
	R = T270c2();
	ge253ov2968 = R;
	return R;
}

/* KL_CHARACTER_ROUTINES.default_create */
T0* T270c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T270));
	((T270*)(C))->id = 270;
	return C;
}

/* STRING.item */
T1 T16f14(T0* C, T4 a1)
{
	T1 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-((T4)(geint32(1)))));
	R = (((T15*)(((T16*)(C))->a1))->a2[t1]);
	return R;
}

/* STRING.append_string */
void T16f26(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		T16f35(C, a1);
	}
}

/* STRING.append */
void T16f35(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(0))));
	if (t1) {
		l1 = (((T16*)(C))->a2);
		l3 = ((T4)((l2)+(l1)));
		t2 = (T16f12(C));
		t1 = (T4f1(&l3, t2));
		if (t1) {
			t2 = (T16f13(C));
			t2 = ((T4)((l3)+(t2)));
			T16f36(C, t2);
		}
		t3 = (((T16*)(a1))->a1);
		T15f8(((T16*)(C))->a1, t3, (T4)(geint32(0)), l1, l2);
		((T16*)(C))->a2 = (l3);
		((T16*)(C))->a11 = ((T4)(geint32(0)));
	}
}

/* SPECIAL [CHARACTER].copy_data */
void T15f8(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	t1 = ((a1)==(C));
	if (t1) {
		T15f11(C, a2, a3, a4);
	} else {
		l1 = (a2);
		l2 = (a3);
		l3 = ((T4)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T15*)(a1))->a2[l1]);
			((T15*)(C))->a2[l2] = (t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [CHARACTER].move_data */
void T15f11(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T4f1(&a1, a2));
		if (t1) {
			t2 = ((T4)((a2)+(a3)));
			t1 = ((T2)((t2)<(a1)));
			if (t1) {
				T15f13(C, a1, a2, a3);
			} else {
				T15f14(C, a1, a2, a3);
			}
		} else {
			t2 = ((T4)((a1)+(a3)));
			t1 = ((T2)((t2)<(a2)));
			if (t1) {
				T15f13(C, a1, a2, a3);
			} else {
				T15f14(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [CHARACTER].overlapping_move */
void T15f14(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	t1 = ((T2)((a1)<(a2)));
	if (t1) {
		t2 = ((T4)((a1)+(a3)));
		l1 = ((T4)((t2)-((T4)(geint32(1)))));
		l2 = ((T4)((a1)-((T4)(geint32(1)))));
		l3 = ((T4)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T15*)(C))->a2[l1]);
			t2 = ((T4)((l1)+(l3)));
			((T15*)(C))->a2[t2] = (t3);
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = (a1);
		l2 = ((T4)((a1)+(a3)));
		l3 = ((T4)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t3 = (((T15*)(C))->a2[l1]);
			t2 = ((T4)((l1)-(l3)));
			((T15*)(C))->a2[t2] = (t3);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [CHARACTER].non_overlapping_move */
void T15f13(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	l1 = (a1);
	l2 = ((T4)((a1)+(a3)));
	l3 = ((T4)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T15*)(C))->a2[l1]);
		t3 = ((T4)((l1)+(l3)));
		((T15*)(C))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* PR_TYPE.print_push_last_value */
void T96f17(T0* C, T4 a1, T0* a2)
{
	T0* t1;
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvsp", 5));
	} else {
		T33f11(a2, gems("yyvsp", 5));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(" := yyvsp", 9));
	} else {
		T33f11(a2, gems(" := yyvsp", 9));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" + 1", 4));
	} else {
		T33f10(a2, gems(" + 1", 4));
	}
	T96f20(C, a1, a2);
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(".put (", 6));
	} else {
		T33f11(a2, gems(".put (", 6));
	}
	t1 = (T96f6(C));
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(", yyvsp", 7));
	} else {
		T33f11(a2, gems(", yyvsp", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(")", 1));
	} else {
		T33f10(a2, gems(")", 1));
	}
}

/* PR_TYPE.last_value_name */
T0* T96f6(T0* C)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T1 t4;
	l2 = (((T16*)(((T96*)(C))->a1))->a2);
	t1 = ((T4)((l2)+((T4)(geint32(11)))));
	R = T16c25(t1);
	T16f26(R, gems("last_", 5));
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		l3 = (T16f14(((T96*)(C))->a1, l1));
		switch (l3) {
		case (T1)'0':
		case (T1)'1':
		case (T1)'2':
		case (T1)'3':
		case (T1)'4':
		case (T1)'5':
		case (T1)'6':
		case (T1)'7':
		case (T1)'8':
		case (T1)'9':
		case (T1)'a':
		case (T1)'b':
		case (T1)'c':
		case (T1)'d':
		case (T1)'e':
		case (T1)'f':
		case (T1)'g':
		case (T1)'h':
		case (T1)'i':
		case (T1)'j':
		case (T1)'k':
		case (T1)'l':
		case (T1)'m':
		case (T1)'n':
		case (T1)'o':
		case (T1)'p':
		case (T1)'q':
		case (T1)'r':
		case (T1)'s':
		case (T1)'t':
		case (T1)'u':
		case (T1)'v':
		case (T1)'w':
		case (T1)'x':
		case (T1)'y':
		case (T1)'z':
		case (T1)(T1)('_'):
			T16f28(R, l3);
			break;
		case (T1)'A':
		case (T1)'B':
		case (T1)'C':
		case (T1)'D':
		case (T1)'E':
		case (T1)'F':
		case (T1)'G':
		case (T1)'H':
		case (T1)'I':
		case (T1)'J':
		case (T1)'K':
		case (T1)'L':
		case (T1)'M':
		case (T1)'N':
		case (T1)'O':
		case (T1)'P':
		case (T1)'Q':
		case (T1)'R':
		case (T1)'S':
		case (T1)'T':
		case (T1)'U':
		case (T1)'V':
		case (T1)'W':
		case (T1)'X':
		case (T1)'Y':
		case (T1)'Z':
			t3 = (T96f7(C));
			t4 = (T270f1(t3, l3));
			T16f28(R, t4);
			break;
		default:
			T16f28(R, (T1)('_'));
			break;
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	T16f26(R, gems("_value", 6));
	return R;
}

/* PR_TYPE.character_ */
T0* T96f7(T0* C)
{
	T0* R = 0;
	if (ge253os2968) {
		return ge253ov2968;
	} else {
		ge253os2968 = '\1';
	}
	R = T270c2();
	ge253ov2968 = R;
	return R;
}

/* DS_HASH_SET [PR_TYPE].first */
T0* T110f2(T0* C)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	l1 = ((T4)(geint32(1)));
	t1 = (T110f5(C, l1));
	t2 = (T4f1(&t1, (T4)(geint32(-1))));
	while (!(t2)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T110f5(C, l1));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
	}
	R = (T110f7(C, l1));
	return R;
}

/* PR_PARSER_GENERATOR.print_clear_value_stacks */
void T20f46(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* t1;
	T2 t2;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_clear_value_stacks is", 25));
	} else {
		T33f10(a1, gems("\tyy_clear_value_stacks is", 25));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Clear objects in semantic value stacks so that", 52));
	} else {
		T33f10(a1, gems("\t\t\t-- Clear objects in semantic value stacks so that", 52));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- they can be collected by the garbage collector.", 53));
	} else {
		T33f10(a1, gems("\t\t\t-- they can be collected by the garbage collector.", 53));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a8);
	l4 = (((T109*)(l1))->a1);
	l3 = ((T4)(geint32(1)));
	t2 = (T4f1(&l3, l4));
	while (!(t2)) {
		l2 = (T109f2(l1, l3));
		if ((l2)->id==96) {
			T96f13(l2, (T4)(geint32(3)), a1);
		} else {
			T170f11(l2, (T4)(geint32(3)), a1);
		}
		l3 = ((T4)((l3)+((T4)(geint32(1)))));
		t2 = (T4f1(&l3, l4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_BASIC_TYPE.print_clear_yyvs */
void T170f11(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("if yyvs", 7));
	} else {
		T33f11(a2, gems("if yyvs", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" /= Void then", 13));
	} else {
		T33f10(a2, gems(" /= Void then", 13));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T170f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T170*)(C))->a1);
	} else {
		T33f14(a2, ((T170*)(C))->a1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(".clear_all", 10));
	} else {
		T33f10(a2, gems(".clear_all", 10));
	}
	T170f20(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
}

/* PR_TYPE.print_clear_yyvs */
void T96f13(T0* C, T4 a1, T0* a2)
{
	T4 t1;
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("if yyvs", 7));
	} else {
		T33f11(a2, gems("if yyvs", 7));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(" /= Void then", 13));
	} else {
		T33f10(a2, gems(" /= Void then", 13));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T96f22(C, t1, a2);
	if ((a2)->id==21) {
		T21f23(a2, gems("yyvs", 4));
	} else {
		T33f11(a2, gems("yyvs", 4));
	}
	if ((a2)->id==21) {
		T21f24(a2, ((T96*)(C))->a2);
	} else {
		T33f14(a2, ((T96*)(C))->a2);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems(".clear_all", 10));
	} else {
		T33f10(a2, gems(".clear_all", 10));
	}
	T96f22(C, a1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("end", 3));
	} else {
		T33f10(a2, gems("end", 3));
	}
}

/* PR_PARSER_GENERATOR.print_init_value_stacks */
void T20f45(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* t1;
	T2 t2;
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_init_value_stacks is", 24));
	} else {
		T33f10(a1, gems("\tyy_init_value_stacks is", 24));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Initialize value stacks.", 30));
	} else {
		T33f10(a1, gems("\t\t\t-- Initialize value stacks.", 30));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a8);
	l5 = (((T109*)(l1))->a1);
	l4 = ((T4)(geint32(1)));
	t2 = (T4f1(&l4, l5));
	while (!(t2)) {
		l2 = (T109f2(l1, l4));
		l3 = ((((l2)->id==96)?((T96*)(l2))->a2:((T170*)(l2))->a1));
		if ((a1)->id==21) {
			T21f23(a1, gems("\t\t\tyyvsp", 8));
		} else {
			T33f11(a1, gems("\t\t\tyyvsp", 8));
		}
		if ((a1)->id==21) {
			T21f24(a1, l3);
		} else {
			T33f14(a1, l3);
		}
		if ((a1)->id==21) {
			T21f27(a1, gems(" := -1", 6));
		} else {
			T33f10(a1, gems(" := -1", 6));
		}
		l4 = ((T4)((l4)+((T4)(geint32(1)))));
		t2 = (T4f1(&l4, l5));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_PARSER_GENERATOR.print_create_value_stacks */
void T20f44(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_create_value_stacks is", 26));
	} else {
		T33f10(a1, gems("\tyy_create_value_stacks is", 26));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Create value stacks.", 26));
	} else {
		T33f10(a1, gems("\t\t\t-- Create value stacks.", 26));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* PR_PARSER_GENERATOR.print_build_parser_tables */
void T20f43(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\tyy_build_parser_tables is", 26));
	} else {
		T33f10(a1, gems("\tyy_build_parser_tables is", 26));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t-- Build parser tables.", 26));
	} else {
		T33f10(a1, gems("\t\t\t-- Build parser tables.", 26));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tdo", 4));
	} else {
		T33f10(a1, gems("\t\tdo", 4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyytranslate := yytranslate_template", 38));
	} else {
		T33f10(a1, gems("\t\t\tyytranslate := yytranslate_template", 38));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyyr1 := yyr1_template", 24));
	} else {
		T33f10(a1, gems("\t\t\tyyr1 := yyr1_template", 24));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyytypes1 := yytypes1_template", 32));
	} else {
		T33f10(a1, gems("\t\t\tyytypes1 := yytypes1_template", 32));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyytypes2 := yytypes2_template", 32));
	} else {
		T33f10(a1, gems("\t\t\tyytypes2 := yytypes2_template", 32));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyydefact := yydefact_template", 32));
	} else {
		T33f10(a1, gems("\t\t\tyydefact := yydefact_template", 32));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyydefgoto := yydefgoto_template", 34));
	} else {
		T33f10(a1, gems("\t\t\tyydefgoto := yydefgoto_template", 34));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyypact := yypact_template", 28));
	} else {
		T33f10(a1, gems("\t\t\tyypact := yypact_template", 28));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyypgoto := yypgoto_template", 30));
	} else {
		T33f10(a1, gems("\t\t\tyypgoto := yypgoto_template", 30));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyytable := yytable_template", 30));
	} else {
		T33f10(a1, gems("\t\t\tyytable := yytable_template", 30));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\tyycheck := yycheck_template", 30));
	} else {
		T33f10(a1, gems("\t\t\tyycheck := yycheck_template", 30));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tend", 5));
	} else {
		T33f10(a1, gems("\t\tend", 5));
	}
}

/* KL_STDOUT_FILE.put_string */
void T33f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T33f1(C));
	l1 = (T116f1(t1, a1));
	T33f16(C, l1);
}

/* KL_STDOUT_FILE.old_put_string */
void T33f16(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T119 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 119;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T119f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T33f20(C, ((T33*)(C))->a3, t4, t1);
	}
}

/* KL_STDOUT_FILE.console_ps */
void T33f20(T0* C, T14 a1, T14 a2, T4 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* TYPED_POINTER [ANY].to_pointer */
T14 T119f2(T119* C)
{
	T14 R = 0;
	R = ((*C).a1);
	return R;
}

/* KL_STRING_ROUTINES.as_string */
T0* T116f1(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T116f6(C));
	t2 = (T68f2(t1, a1, ge388ov4904));
	if (t2) {
		R = (a1);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((T0*)gevoid(l1));
		} else {
			R = (T16f16(a1));
		}
	}
	return R;
}

/* STRING.string */
T0* T16f16(T0* C)
{
	T0* R = 0;
	R = T16c25(((T16*)(C))->a2);
	T16f35(R, C);
	return R;
}

/* KL_ANY_ROUTINES.same_types */
T2 T68f2(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = (T118x59(a1, a2));
	return R;
}

/* KL_STRING_ROUTINES.any_ */
unsigned char ge250os1337 = '\0';
T0* ge250ov1337;
T0* T116f6(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* KL_ANY_ROUTINES.default_create */
T0* T68c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T68));
	((T68*)(C))->id = 68;
	return C;
}

/* KL_STDOUT_FILE.string_ */
unsigned char ge258os1313 = '\0';
T0* ge258ov1313;
T0* T33f1(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* KL_STRING_ROUTINES.default_create */
T0* T116c10()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T116));
	((T116*)(C))->id = 116;
	return C;
}

/* KL_TEXT_OUTPUT_FILE.put_string */
void T21f23(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T21f9(C));
	t1 = (T116f1(t1, a1));
	T21f31(C, t1);
}

/* KL_TEXT_OUTPUT_FILE.old_put_string */
void T21f31(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T119 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 119;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T119f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T21f34(C, ((T21*)(C))->a15, t4, t1);
	}
}

/* KL_TEXT_OUTPUT_FILE.file_ps */
void T21f34(T0* C, T14 a1, T14 a2, T4 a3)
{
	file_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_TEXT_OUTPUT_FILE.string_ */
T0* T21f9(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_PARSER_GENERATOR.print_token_codes */
void T20f41(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((T2)(!(((T20*)(C))->a8)));
	if (t1) {
		T20f61(C, a1);
	}
	if ((a1)->id==21) {
		T21f26(a1);
	} else {
		T33f13(a1);
	}
	t2 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t2))->a6);
	l6 = (((T95*)(l1))->a1);
	if ((a1)->id==21) {
		T21f23(a1, gems("feature -- Access\n\n\ttoken_name (a_token: INTEGER): STRING is\n\t\t\t-- Name of token `a_token\'\n\t\tdo\n\t\t\tinspect a_token\n\t\t\twhen 0 then\n\t\t\t\tResult := \"EOF token\"\n\t\t\twhen -1 then\n\t\t\t\tResult := \"Error token\"\n", 200));
	} else {
		T33f11(a1, gems("feature -- Access\n\n\ttoken_name (a_token: INTEGER): STRING is\n\t\t\t-- Name of token `a_token\'\n\t\tdo\n\t\t\tinspect a_token\n\t\t\twhen 0 then\n\t\t\t\tResult := \"EOF token\"\n\t\t\twhen -1 then\n\t\t\t\tResult := \"Error token\"\n", 200));
	}
	l5 = ((T4)(geint32(3)));
	t1 = (T4f1(&l5, l6));
	while (!(t1)) {
		l2 = (T95f2(l1, l5));
		t1 = (T81f15(l2));
		if (t1) {
			l3 = (((T81*)(l2))->a3);
			if ((a1)->id==21) {
				T21f23(a1, gems("\t\t\twhen ", 8));
			} else {
				T33f11(a1, gems("\t\t\twhen ", 8));
			}
			if ((a1)->id==21) {
				T21f23(a1, l3);
			} else {
				T33f11(a1, l3);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems(" then\n\t\t\t\tResult := \"", 21));
			} else {
				T33f11(a1, gems(" then\n\t\t\t\tResult := \"", 21));
			}
			if ((a1)->id==21) {
				T21f23(a1, l3);
			} else {
				T33f11(a1, l3);
			}
			l4 = (((T81*)(l2))->a4);
			t1 = ((l4)!=(EIF_VOID));
			if (t1) {
				if ((a1)->id==21) {
					T21f23(a1, gems(" (", 2));
				} else {
					T33f11(a1, gems(" (", 2));
				}
				t2 = (T20f27(C));
				T107f3(t2, a1, l4);
				if ((a1)->id==21) {
					T21f25(a1, (T1)(')'));
				} else {
					T33f12(a1, (T1)(')'));
				}
			}
			if ((a1)->id==21) {
				T21f23(a1, gems("\"\n", 2));
			} else {
				T33f11(a1, gems("\"\n", 2));
			}
		}
		l5 = ((T4)((l5)+((T4)(geint32(1)))));
		t1 = (T4f1(&l5, l6));
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("\t\t\telse\n\t\t\t\tResult := yy_character_token_name (a_token)\n\t\t\tend\n\t\tend\n\nfeature -- Token codes\n\n", 94));
	} else {
		T33f11(a1, gems("\t\t\telse\n\t\t\t\tResult := yy_character_token_name (a_token)\n\t\t\tend\n\t\tend\n\nfeature -- Token codes\n\n", 94));
	}
	l5 = ((T4)(geint32(3)));
	t1 = (T4f1(&l5, l6));
	while (!(t1)) {
		l2 = (T95f2(l1, l5));
		t1 = (T81f15(l2));
		if (t1) {
			l3 = (((T81*)(l2))->a3);
			if ((a1)->id==21) {
				T21f25(a1, (T1)('\t'));
			} else {
				T33f12(a1, (T1)('\t'));
			}
			if ((a1)->id==21) {
				T21f23(a1, l3);
			} else {
				T33f11(a1, l3);
			}
			if ((a1)->id==21) {
				T21f23(a1, gems(": INTEGER is ", 13));
			} else {
				T33f11(a1, gems(": INTEGER is ", 13));
			}
			t3 = (((T81*)(l2))->a2);
			if ((a1)->id==21) {
				T21f24(a1, t3);
			} else {
				T33f14(a1, t3);
			}
			if ((a1)->id==21) {
				T21f25(a1, (T1)('\n'));
			} else {
				T33f12(a1, (T1)('\n'));
			}
		}
		l5 = ((T4)((l5)+((T4)(geint32(1)))));
		t1 = (T4f1(&l5, l6));
	}
}

/* UT_STRING_FORMATTER.put_eiffel_string */
void T107f3(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l2 = (((T16*)(a2))->a2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T16f14(a2, l1));
		switch (l3) {
		case (T1)(T1)(' '):
		case (T1)(T1)('!'):
		case (T1)(T1)('#'):
		case (T1)(T1)('$'):
		case (T1)(T1)('&'):
		case (T1)'(':
		case (T1)')':
		case (T1)'*':
		case (T1)'+':
		case (T1)',':
		case (T1)'-':
		case (T1)'.':
		case (T1)'/':
		case (T1)'0':
		case (T1)'1':
		case (T1)'2':
		case (T1)'3':
		case (T1)'4':
		case (T1)'5':
		case (T1)'6':
		case (T1)'7':
		case (T1)'8':
		case (T1)'9':
		case (T1)':':
		case (T1)';':
		case (T1)'<':
		case (T1)'=':
		case (T1)'>':
		case (T1)'?':
		case (T1)'@':
		case (T1)'A':
		case (T1)'B':
		case (T1)'C':
		case (T1)'D':
		case (T1)'E':
		case (T1)'F':
		case (T1)'G':
		case (T1)'H':
		case (T1)'I':
		case (T1)'J':
		case (T1)'K':
		case (T1)'L':
		case (T1)'M':
		case (T1)'N':
		case (T1)'O':
		case (T1)'P':
		case (T1)'Q':
		case (T1)'R':
		case (T1)'S':
		case (T1)'T':
		case (T1)'U':
		case (T1)'V':
		case (T1)'W':
		case (T1)'X':
		case (T1)'Y':
		case (T1)'Z':
		case (T1)'[':
		case (T1)'\\':
		case (T1)']':
		case (T1)'^':
		case (T1)'_':
		case (T1)'`':
		case (T1)'a':
		case (T1)'b':
		case (T1)'c':
		case (T1)'d':
		case (T1)'e':
		case (T1)'f':
		case (T1)'g':
		case (T1)'h':
		case (T1)'i':
		case (T1)'j':
		case (T1)'k':
		case (T1)'l':
		case (T1)'m':
		case (T1)'n':
		case (T1)'o':
		case (T1)'p':
		case (T1)'q':
		case (T1)'r':
		case (T1)'s':
		case (T1)'t':
		case (T1)'u':
		case (T1)'v':
		case (T1)'w':
		case (T1)'x':
		case (T1)'y':
		case (T1)'z':
		case (T1)'{':
		case (T1)'|':
		case (T1)'}':
		case (T1)'~':
			if ((a1)->id==21) {
				T21f25(a1, l3);
			} else {
				T33f12(a1, l3);
			}
			break;
		case (T1)(T1)('\010'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045B", 2));
			} else {
				T33f11(a1, gems("\045B", 2));
			}
			break;
		case (T1)(T1)('\014'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045F", 2));
			} else {
				T33f11(a1, gems("\045F", 2));
			}
			break;
		case (T1)(T1)('\n'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045N", 2));
			} else {
				T33f11(a1, gems("\045N", 2));
			}
			break;
		case (T1)(T1)('\r'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045R", 2));
			} else {
				T33f11(a1, gems("\045R", 2));
			}
			break;
		case (T1)(T1)('\t'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045T", 2));
			} else {
				T33f11(a1, gems("\045T", 2));
			}
			break;
		case (T1)(T1)('\000'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045U", 2));
			} else {
				T33f11(a1, gems("\045U", 2));
			}
			break;
		case (T1)(T1)('\045'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045\045", 2));
			} else {
				T33f11(a1, gems("\045\045", 2));
			}
			break;
		case (T1)(T1)('\''):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045\'", 2));
			} else {
				T33f11(a1, gems("\045\'", 2));
			}
			break;
		case (T1)(T1)('\"'):
			if ((a1)->id==21) {
				T21f23(a1, gems("\045\"", 2));
			} else {
				T33f11(a1, gems("\045\"", 2));
			}
			break;
		default:
			if ((a1)->id==21) {
				T21f23(a1, gems("\045/", 2));
			} else {
				T33f11(a1, gems("\045/", 2));
			}
			t2 = (T107f1(C));
			t3 = (T16f23(a2, l1));
			T226f2(t2, a1, t3);
			if ((a1)->id==21) {
				T21f25(a1, (T1)('/'));
			} else {
				T33f12(a1, (T1)('/'));
			}
			break;
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* UT_INTEGER_FORMATTER.put_decimal_integer */
void T226f2(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a2)==((T4)(geint32(0))));
	if (t1) {
		if ((a1)->id==21) {
			T21f25(a1, (T1)('0'));
		} else {
			T33f12(a1, (T1)('0'));
		}
	} else {
		t1 = ((T2)((a2)<((T4)(geint32(0)))));
		if (t1) {
			if ((a1)->id==21) {
				T21f25(a1, (T1)('-'));
			} else {
				T33f12(a1, (T1)('-'));
			}
			t2 = ((T4)((a2)+((T4)(geint32(1)))));
			l2 = ((T4)(-(t2)));
			l1 = ((T4)((l2)/((T4)(geint32(10)))));
			t2 = ((T4)((l2)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('1'));
				} else {
					T33f12(a1, (T1)('1'));
				}
				break;
			case (T4)(T4)(geint32(1)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('2'));
				} else {
					T33f12(a1, (T1)('2'));
				}
				break;
			case (T4)(T4)(geint32(2)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('3'));
				} else {
					T33f12(a1, (T1)('3'));
				}
				break;
			case (T4)(T4)(geint32(3)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('4'));
				} else {
					T33f12(a1, (T1)('4'));
				}
				break;
			case (T4)(T4)(geint32(4)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('5'));
				} else {
					T33f12(a1, (T1)('5'));
				}
				break;
			case (T4)(T4)(geint32(5)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('6'));
				} else {
					T33f12(a1, (T1)('6'));
				}
				break;
			case (T4)(T4)(geint32(6)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('7'));
				} else {
					T33f12(a1, (T1)('7'));
				}
				break;
			case (T4)(T4)(geint32(7)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('8'));
				} else {
					T33f12(a1, (T1)('8'));
				}
				break;
			case (T4)(T4)(geint32(8)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T226f2(C, a1, l1);
				}
				if ((a1)->id==21) {
					T21f25(a1, (T1)('9'));
				} else {
					T33f12(a1, (T1)('9'));
				}
				break;
			case (T4)(T4)(geint32(9)):
				t2 = ((T4)((l1)+((T4)(geint32(1)))));
				T226f2(C, a1, t2);
				if ((a1)->id==21) {
					T21f25(a1, (T1)('0'));
				} else {
					T33f12(a1, (T1)('0'));
				}
				break;
			default:
				break;
			}
		} else {
			l2 = (a2);
			l1 = ((T4)((l2)/((T4)(geint32(10)))));
			t1 = ((l1)!=((T4)(geint32(0))));
			if (t1) {
				T226f2(C, a1, l1);
			}
			t2 = ((T4)((l2)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('0'));
				} else {
					T33f12(a1, (T1)('0'));
				}
				break;
			case (T4)(T4)(geint32(1)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('1'));
				} else {
					T33f12(a1, (T1)('1'));
				}
				break;
			case (T4)(T4)(geint32(2)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('2'));
				} else {
					T33f12(a1, (T1)('2'));
				}
				break;
			case (T4)(T4)(geint32(3)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('3'));
				} else {
					T33f12(a1, (T1)('3'));
				}
				break;
			case (T4)(T4)(geint32(4)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('4'));
				} else {
					T33f12(a1, (T1)('4'));
				}
				break;
			case (T4)(T4)(geint32(5)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('5'));
				} else {
					T33f12(a1, (T1)('5'));
				}
				break;
			case (T4)(T4)(geint32(6)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('6'));
				} else {
					T33f12(a1, (T1)('6'));
				}
				break;
			case (T4)(T4)(geint32(7)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('7'));
				} else {
					T33f12(a1, (T1)('7'));
				}
				break;
			case (T4)(T4)(geint32(8)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('8'));
				} else {
					T33f12(a1, (T1)('8'));
				}
				break;
			case (T4)(T4)(geint32(9)):
				if ((a1)->id==21) {
					T21f25(a1, (T1)('9'));
				} else {
					T33f12(a1, (T1)('9'));
				}
				break;
			default:
				break;
			}
		}
	}
}

/* STRING.item_code */
T4 T16f23(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	T1 t2;
	t1 = ((T4)((a1)-((T4)(geint32(1)))));
	t2 = (((T15*)(((T16*)(C))->a1))->a2[t1]);
	R = ((T4)(t2));
	return R;
}

/* UT_STRING_FORMATTER.integer_formatter_ */
unsigned char ge219os1402 = '\0';
T0* ge219ov1402;
T0* T107f1(T0* C)
{
	T0* R = 0;
	if (ge219os1402) {
		return ge219ov1402;
	} else {
		ge219os1402 = '\1';
	}
	R = T226c1();
	ge219ov1402 = R;
	return R;
}

/* UT_INTEGER_FORMATTER.default_create */
T0* T226c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T226));
	((T226*)(C))->id = 226;
	return C;
}

/* PR_PARSER_GENERATOR.string_formatter_ */
unsigned char ge219os1405 = '\0';
T0* ge219ov1405;
T0* T20f27(T0* C)
{
	T0* R = 0;
	if (ge219os1405) {
		return ge219ov1405;
	} else {
		ge219os1405 = '\1';
	}
	R = T107c2();
	ge219ov1405 = R;
	return R;
}

/* UT_STRING_FORMATTER.default_create */
T0* T107c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T107));
	((T107*)(C))->id = 107;
	return C;
}

/* PR_TOKEN.has_identifier */
T2 T81f15(T0* C)
{
	T2 R = 0;
	T1 l1 = 0;
	T2 t1;
	l1 = (T16f14(((T81*)(C))->a3, (T4)(geint32(1))));
	t1 = ((l1)!=((T1)('\'')));
	if (t1) {
		R = ((l1)!=((T1)('\"')));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* PR_PARSER_GENERATOR.print_last_values */
void T20f61(T0* C, T0* a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	if ((a1)->id==21) {
		T21f27(a1, gems("feature -- Last values", 22));
	} else {
		T33f10(a1, gems("feature -- Last values", 22));
	}
	if ((a1)->id==21) {
		T21f26(a1);
	} else {
		T33f13(a1);
	}
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	t1 = (((T26*)(t1))->a8);
	l1 = (((T109*)(t1))->a1);
	l2 = T110c35(l1);
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l4 = (((T26*)(t1))->a6);
	l7 = (((T95*)(l4))->a1);
	l6 = ((T4)(geint32(1)));
	t2 = (T4f1(&l6, l7));
	while (!(t2)) {
		t1 = (T95f2(l4, l6));
		l5 = (((T81*)(t1))->a9);
		T110f36(l2, l5);
		t3 = (((T110*)(l2))->a1);
		t2 = ((t3)==(l1));
		if (t2) {
			l6 = ((T4)((l7)+((T4)(geint32(1)))));
		}
		l6 = ((T4)((l6)+((T4)(geint32(1)))));
		t2 = (T4f1(&l6, l7));
	}
	l3 = (T110f3(l2));
	T111f7(l3);
	t2 = (T111f1(l3));
	while (!(t2)) {
		l5 = (T111f2(l3));
		if ((a1)->id==21) {
			T21f23(a1, gems("\t", 1));
		} else {
			T33f11(a1, gems("\t", 1));
		}
		t1 = ((((l5)->id==96)?T96f6(l5):T170f5(l5)));
		if ((a1)->id==21) {
			T21f23(a1, t1);
		} else {
			T33f11(a1, t1);
		}
		if ((a1)->id==21) {
			T21f23(a1, gems(": ", 2));
		} else {
			T33f11(a1, gems(": ", 2));
		}
		t1 = ((((l5)->id==96)?((T96*)(l5))->a1:((T170*)(l5))->a2));
		if ((a1)->id==21) {
			T21f27(a1, t1);
		} else {
			T33f10(a1, t1);
		}
		T111f8(l3);
		t2 = (T111f1(l3));
	}
}

/* KL_STDOUT_FILE.put_new_line */
void T33f13(T0* C)
{
	T33f11(C, ge386ov1447);
}

/* KL_TEXT_OUTPUT_FILE.put_new_line */
void T21f26(T0* C)
{
	T21f23(C, ge391ov1447);
}

/* PR_PARSER_GENERATOR.print_eiffel_header */
void T20f42(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T2 t2;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l3 = (((T26*)(t1))->a7);
	l2 = (((T108*)(l3))->a1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t1 = (T108f2(l3, l1));
		if ((a1)->id==21) {
			T21f23(a1, t1);
		} else {
			T33f11(a1, t1);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
}

/* DS_ARRAYED_LIST [STRING].item */
T0* T108f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T120*)(((T108*)(C))->a3))->a2[a1]);
	return R;
}

/* PR_PARSER_GENERATOR.print_token_class */
void T20f34(T0* C, T0* a1, T0* a2, T0* a3)
{
	T21f23(a3, gems("indexing\n\n\tdescription: \"Parser token codes\"\n\tgenerator: \"geyacc version ", 73));
	T21f23(a3, a2);
	T21f23(a3, gems("\"\n\nclass ", 9));
	T21f23(a3, a1);
	T21f23(a3, gems("\n\ninherit\n\n\tYY_PARSER_TOKENS\n", 29));
	T21f26(a3);
	T20f41(C, a3);
	T21f27(a3, gems("\nend", 4));
}

/* PR_PARSER_GENERATOR.set_input_filename */
void T20f33(T0* C, T0* a1)
{
	((T20*)(C))->a6 = (a1);
}

/* PR_PARSER_GENERATOR.set_line_pragma */
void T20f32(T0* C, T2 a1)
{
	((T20*)(C))->a5 = (a1);
}

/* PR_PARSER_GENERATOR.set_old_typing */
void T20f31(T0* C, T2 a1)
{
	((T20*)(C))->a8 = (a1);
}

/* PR_PARSER_GENERATOR.make */
T0* T20c30(T0* a1)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T20));
	((T20*)(C))->id = 20;
	((T20*)(C))->a1 = (a1);
	t1 = (((T19*)(((T20*)(C))->a1))->a2);
	t1 = (T54f6(t1));
	((T20*)(C))->a2 = (((T56*)(t1))->a6);
	((T20*)(C))->a3 = ((T4)(geint32(-32768)));
	T20f36(C);
	T20f37(C);
	T20f38(C);
	T20f39(C);
	T20f40(C);
	((T20*)(C))->a4 = ((T4)(geint32(3000)));
	((T20*)(C))->a5 = (EIF_TRUE);
	((T20*)(C))->a6 = (ge180ov1380);
	return C;
}

/* PR_PARSER_GENERATOR.build_action_tables */
void T20f40(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T4 l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T4 l13 = 0;
	T4 l14 = 0;
	T4 l15 = 0;
	T4 l16 = 0;
	T4 l17 = 0;
	T4 l18 = 0;
	T4 l19 = 0;
	T4 l20 = 0;
	T4 l21 = 0;
	T2 l22 = 0;
	T0* t1;
	T4 t2;
	T2 t3;
	l3 = (((T19*)(((T20*)(C))->a1))->a2);
	l1 = (((T54*)(l3))->a1);
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l4 = (((T26*)(t1))->a5);
	l2 = (((T88*)(l4))->a1);
	t2 = ((T4)((l1)+(l2)));
	l5 = T100c9(t2);
	t2 = ((T4)((l1)-((T4)(geint32(1)))));
	((T20*)(C))->a16 = T99c7((T4)(geint32(0)), t2);
	l13 = ((T4)(geint32(1)));
	t3 = (T4f1(&l13, l1));
	while (!(t3)) {
		t1 = (T54f2(l3, l13));
		T20f59(C, t1, l5);
		l13 = ((T4)((l13)+((T4)(geint32(1)))));
		t3 = (T4f1(&l13, l1));
	}
	t2 = ((T4)((l2)-((T4)(geint32(1)))));
	((T20*)(C))->a17 = T99c7((T4)(geint32(0)), t2);
	l13 = ((T4)(geint32(1)));
	t3 = (T4f1(&l13, l2));
	while (!(t3)) {
		t1 = (T88f2(l4, l13));
		T20f60(C, t1, l5);
		l13 = ((T4)((l13)+((T4)(geint32(1)))));
		t3 = (T4f1(&l13, l2));
	}
	t1 = (T20f18(C));
	T100f10(l5, t1);
	l13 = ((T4)((l1)-((T4)(geint32(1)))));
	((T20*)(C))->a19 = T99c7((T4)(geint32(0)), l13);
	t3 = ((T2)((l13)<((T4)(geint32(0)))));
	while (!(t3)) {
		T99f8(((T20*)(C))->a19, ((T20*)(C))->a3, l13);
		l13 = ((T4)((l13)-((T4)(geint32(1)))));
		t3 = ((T2)((l13)<((T4)(geint32(0)))));
	}
	l13 = ((T4)((l2)-((T4)(geint32(1)))));
	((T20*)(C))->a20 = T99c7((T4)(geint32(0)), l13);
	t3 = ((T2)((l13)<((T4)(geint32(0)))));
	while (!(t3)) {
		T99f8(((T20*)(C))->a20, ((T20*)(C))->a3, l13);
		l13 = ((T4)((l13)-((T4)(geint32(1)))));
		t3 = ((T2)((l13)<((T4)(geint32(0)))));
	}
	l17 = ((T4)(geint32(500)));
	((T20*)(C))->a22 = T99c7((T4)(geint32(0)), l17);
	((T20*)(C))->a23 = T99c7((T4)(geint32(0)), l17);
	t3 = ((T2)((l17)<((T4)(geint32(0)))));
	while (!(t3)) {
		T99f8(((T20*)(C))->a23, (T4)(geint32(-1)), l17);
		l17 = ((T4)((l17)-((T4)(geint32(1)))));
		t3 = ((T2)((l17)<((T4)(geint32(0)))));
	}
	((T20*)(C))->a24 = ((T4)(geint32(-1)));
	l16 = (((T100*)(l5))->a1);
	l13 = (l16);
	t3 = ((T2)((l13)<((T4)(geint32(1)))));
	while (!(t3)) {
		l11 = (T100f2(l5, l13));
		l6 = (((T102*)(l11))->a2);
		l7 = (((T102*)(l11))->a3);
		l8 = (((T102*)(l11))->a4);
		l9 = (((T102*)(l11))->a5);
		l19 = ((T4)(geint32(-1)));
		t3 = (((T102*)(l11))->a6);
		if (t3) {
			l14 = ((T4)((l13)+((T4)(geint32(1)))));
			t3 = (T4f1(&l14, l16));
			while (!(t3)) {
				l12 = (T100f2(l5, l14));
				t3 = (T102f7(l11, l12));
				t3 = ((T2)(!(t3)));
				if (t3) {
					l14 = ((T4)((l16)+((T4)(geint32(1)))));
				} else {
					t3 = (T102f8(l11, l12));
					if (t3) {
						l19 = (((T102*)(l12))->a1);
						l14 = ((T4)((l16)+((T4)(geint32(1)))));
					} else {
						l14 = ((T4)((l14)+((T4)(geint32(1)))));
					}
				}
				t3 = (T4f1(&l14, l16));
			}
		}
		t3 = ((T2)((l19)<((T4)(geint32(0)))));
		if (t3) {
			t2 = (T101f8(l6));
			l14 = ((T4)((l10)-(t2)));
			l22 = (EIF_FALSE);
			while (!(l22)) {
				l22 = (EIF_TRUE);
				l15 = ((T4)(geint32(1)));
				t3 = (T4f1(&l15, l8));
				while (!(t3)) {
					t2 = (T101f9(l6, l15));
					l21 = ((T4)((l14)+(t2)));
					t2 = (((T99*)(((T20*)(C))->a22))->a3);
					t3 = (T4f1(&l21, t2));
					if (t3) {
						t2 = (((T99*)(((T20*)(C))->a23))->a3);
						l17 = ((T4)((t2)+((T4)(geint32(1)))));
						l18 = ((T4)((l21)+((T4)(geint32(500)))));
						t1 = (T20f26(C));
						T106f3(t1, ((T20*)(C))->a22, (T4)(geint32(0)), l18);
						t1 = (T20f26(C));
						T106f3(t1, ((T20*)(C))->a23, (T4)(geint32(0)), l18);
						t3 = (T4f1(&l17, l18));
						while (!(t3)) {
							T99f8(((T20*)(C))->a23, (T4)(geint32(-1)), l17);
							l17 = ((T4)((l17)+((T4)(geint32(1)))));
							t3 = (T4f1(&l17, l18));
						}
					}
					t2 = (T99f4(((T20*)(C))->a22, l21));
					t3 = ((t2)!=((T4)(geint32(0))));
					if (t3) {
						l22 = (EIF_FALSE);
						l15 = ((T4)((l8)+((T4)(geint32(1)))));
					} else {
						l15 = ((T4)((l15)+((T4)(geint32(1)))));
					}
					t3 = (T4f1(&l15, l8));
				}
				if (l22) {
					l15 = ((T4)((l13)+((T4)(geint32(1)))));
					t3 = (T4f1(&l15, l16));
					while (!(t3)) {
						t1 = (T100f2(l5, l15));
						t2 = (((T102*)(t1))->a9);
						t3 = ((t2)==(l14));
						if (t3) {
							l22 = (EIF_FALSE);
							l15 = ((T4)((l16)+((T4)(geint32(1)))));
						} else {
							l15 = ((T4)((l15)+((T4)(geint32(1)))));
						}
						t3 = (T4f1(&l15, l16));
					}
					if (l22) {
						l15 = ((T4)(geint32(1)));
						t3 = (T4f1(&l15, l8));
						while (!(t3)) {
							t2 = (T101f9(l6, l15));
							l21 = ((T4)((l14)+(t2)));
							t2 = (T101f9(l7, l15));
							T99f8(((T20*)(C))->a22, t2, l21);
							t2 = (T101f9(l6, l15));
							T99f8(((T20*)(C))->a23, t2, l21);
							l15 = ((T4)((l15)+((T4)(geint32(1)))));
							t3 = (T4f1(&l15, l8));
						}
						t2 = (T99f4(((T20*)(C))->a22, l10));
						t3 = ((t2)==((T4)(geint32(0))));
						while (!(t3)) {
							l10 = ((T4)((l10)+((T4)(geint32(1)))));
							t2 = (T99f4(((T20*)(C))->a22, l10));
							t3 = ((t2)==((T4)(geint32(0))));
						}
						t3 = (T4f1(&l21, ((T20*)(C))->a24));
						if (t3) {
							((T20*)(C))->a24 = (l21);
						}
						l20 = (l14);
					}
				}
				l14 = ((T4)((l14)+((T4)(geint32(1)))));
			}
		} else {
			l20 = (T99f4(((T20*)(C))->a19, l19));
		}
		T102f13(l11, l20);
		t3 = (((T102*)(l11))->a6);
		if (t3) {
			t2 = (((T102*)(l11))->a1);
			T99f8(((T20*)(C))->a19, l20, t2);
		} else {
			t2 = (((T102*)(l11))->a1);
			T99f8(((T20*)(C))->a20, l20, t2);
		}
		l13 = ((T4)((l13)-((T4)(geint32(1)))));
		t3 = ((T2)((l13)<((T4)(geint32(1)))));
	}
	t1 = (T20f26(C));
	((T20*)(C))->a22 = (T106f1(t1, ((T20*)(C))->a22, (T4)(geint32(0)), ((T20*)(C))->a24, (T4)(geint32(0))));
	t1 = (T20f26(C));
	((T20*)(C))->a23 = (T106f1(t1, ((T20*)(C))->a23, (T4)(geint32(0)), ((T20*)(C))->a24, (T4)(geint32(0))));
}

/* KL_ARRAY_ROUTINES [INTEGER].subarray */
T0* T106f1(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a4)+(a3)));
	t1 = ((T4)((t1)-(a2)));
	R = T99c7(a4, t1);
	T106f4(C, R, a1, a2, a3, a4);
	return R;
}

/* KL_ARRAY_ROUTINES [INTEGER].subcopy */
void T106f4(T0* C, T0* a1, T0* a2, T4 a3, T4 a4, T4 a5)
{
	T2 t1;
	t1 = (T4f12(&a3, a4));
	if (t1) {
		T99f11(a1, a2, a3, a4, a5);
	}
}

/* ARRAY [INTEGER].subcopy */
void T99f11(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T0* t1;
	T4 t2;
	T4 t3;
	T4 t4;
	t1 = (((T99*)(a1))->a1);
	t2 = (((T99*)(a1))->a2);
	t2 = ((T4)((a2)-(t2)));
	t3 = ((T4)((a4)-(((T99*)(C))->a2)));
	t4 = ((T4)((a3)-(a2)));
	t4 = ((T4)((t4)+((T4)(geint32(1)))));
	T98f9(((T99*)(C))->a1, t1, t2, t3, t4);
}

/* SPECIAL [INTEGER].copy_data */
void T98f9(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==(C));
	if (t1) {
		T98f7(C, a2, a3, a4);
	} else {
		l1 = (a2);
		l2 = (a3);
		l3 = ((T4)((a2)+(a4)));
		t1 = ((l1)==(l3));
		while (!(t1)) {
			t2 = (((T98*)(a1))->a2[l1]);
			((T98*)(C))->a2[l2] = (t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = ((l1)==(l3));
		}
	}
}

/* SPECIAL [INTEGER].move_data */
void T98f7(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	t1 = ((a1)==(a2));
	if (t1) {
	} else {
		t1 = (T4f1(&a1, a2));
		if (t1) {
			t2 = ((T4)((a2)+(a3)));
			t1 = ((T2)((t2)<(a1)));
			if (t1) {
				T98f11(C, a1, a2, a3);
			} else {
				T98f12(C, a1, a2, a3);
			}
		} else {
			t2 = ((T4)((a1)+(a3)));
			t1 = ((T2)((t2)<(a2)));
			if (t1) {
				T98f11(C, a1, a2, a3);
			} else {
				T98f12(C, a1, a2, a3);
			}
		}
	}
}

/* SPECIAL [INTEGER].overlapping_move */
void T98f12(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a1)<(a2)));
	if (t1) {
		t2 = ((T4)((a1)+(a3)));
		l1 = ((T4)((t2)-((T4)(geint32(1)))));
		l2 = ((T4)((a1)-((T4)(geint32(1)))));
		l3 = ((T4)((a2)-(a1)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = (((T98*)(C))->a2[l1]);
			t3 = ((T4)((l1)+(l3)));
			((T98*)(C))->a2[t3] = (t2);
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	} else {
		l1 = (a1);
		l2 = ((T4)((a1)+(a3)));
		l3 = ((T4)((a1)-(a2)));
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = (((T98*)(C))->a2[l1]);
			t3 = ((T4)((l1)-(l3)));
			((T98*)(C))->a2[t3] = (t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
	}
}

/* SPECIAL [INTEGER].non_overlapping_move */
void T98f11(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	l1 = (a1);
	l2 = ((T4)((a1)+(a3)));
	l3 = ((T4)((a2)-(a1)));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T98*)(C))->a2[l1]);
		t3 = ((T4)((l1)+(l3)));
		((T98*)(C))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* PR_PORTION.set_position */
void T102f13(T0* C, T4 a1)
{
	((T102*)(C))->a9 = (a1);
}

/* KL_ARRAY_ROUTINES [INTEGER].resize */
void T106f3(T0* C, T0* a1, T4 a2, T4 a3)
{
	T2 t1;
	t1 = (T4f12(&a2, a3));
	if (t1) {
		T99f10(a1, a2, a3);
	}
}

/* ARRAY [INTEGER].conservative_resize */
void T99f10(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T2 t1;
	T4 t2;
	t1 = (T99f6(C));
	if (t1) {
		l4 = (a1);
		l5 = (a2);
	} else {
		l4 = (T4f9(&a1, ((T99*)(C))->a2));
		l5 = (T4f15(&a2, ((T99*)(C))->a3));
	}
	t2 = ((T4)((l5)-(l4)));
	l2 = ((T4)((t2)+((T4)(geint32(1)))));
	t1 = (T99f6(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l1 = (((T98*)(((T99*)(C))->a1))->a1);
		t2 = ((T4)((((T99*)(C))->a3)-(((T99*)(C))->a2)));
		l3 = ((T4)((t2)+((T4)(geint32(1)))));
	}
	t1 = (T99f6(C));
	if (t1) {
		T99f9(C, l2);
	} else {
		t1 = (T4f1(&l2, l1));
		if (t1) {
			((T99*)(C))->a1 = (T98f3(((T99*)(C))->a1, l2));
		}
		t1 = ((T2)((l4)<(((T99*)(C))->a2)));
		if (t1) {
			l6 = ((T4)((((T99*)(C))->a2)-(l4)));
			T98f7(((T99*)(C))->a1, (T4)(geint32(0)), l6, l3);
			t2 = ((T4)((l6)-((T4)(geint32(1)))));
			T98f8(((T99*)(C))->a1, l7, (T4)(geint32(0)), t2);
		}
	}
	((T99*)(C))->a2 = (l4);
	((T99*)(C))->a3 = (l5);
}

/* SPECIAL [INTEGER].fill_with */
void T98f8(T0* C, T4 a1, T4 a2, T4 a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l1 = (a2);
	l2 = ((T4)((a3)+((T4)(geint32(1)))));
	t1 = ((l1)==(l2));
	while (!(t1)) {
		((T98*)(C))->a2[l1] = (a1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
}

/* SPECIAL [INTEGER].aliased_resized_area */
T0* T98f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1 = ((T98*)(C))->a1;
	if (a1>t1) {
		R = (T0*)gealloc(sizeof(T98)+a1*sizeof(T4));
		*(T98*)(R) = *(T98*)(C);
		memcpy(((T98*)(R))->a2, ((T98*)(C))->a2, t1*sizeof(T4));
	} else {
		R = C;
	}
	((T98*)(R))->a1 = a1;
	return R;
}

/* ARRAY [INTEGER].make_area */
void T99f9(T0* C, T4 a1)
{
	((T99*)(C))->a1 = T98c6(a1);
}

/* ARRAY [INTEGER].empty_area */
T2 T99f6(T0* C)
{
	T2 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T99*)(C))->a1)==(EIF_VOID));
	if (!(t1)) {
		t2 = (((T98*)(((T99*)(C))->a1))->a1);
		R = ((t2)==((T4)(geint32(0))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* PR_PARSER_GENERATOR.integer_array_ */
unsigned char ge251os1398 = '\0';
T0* ge251ov1398;
T0* T20f26(T0* C)
{
	T0* R = 0;
	if (ge251os1398) {
		return ge251ov1398;
	} else {
		ge251os1398 = '\1';
	}
	R = T106c2();
	ge251ov1398 = R;
	return R;
}

/* KL_ARRAY_ROUTINES [INTEGER].default_create */
T0* T106c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T106));
	((T106*)(C))->id = 106;
	return C;
}

/* DS_ARRAYED_LIST [INTEGER].item */
T4 T101f9(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T101*)(C))->a2))->a2[a1]);
	return R;
}

/* DS_ARRAYED_LIST [INTEGER].first */
T4 T101f8(T0* C)
{
	T4 R = 0;
	R = (((T98*)(((T101*)(C))->a2))->a2[(T4)(geint32(1))]);
	return R;
}

/* PR_PORTION.same_portion */
T2 T102f8(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = (((T102*)(a1))->a6);
	t1 = ((((T102*)(C))->a6)==(t1));
	if (t1) {
		t2 = (((T102*)(a1))->a5);
		t1 = ((((T102*)(C))->a5)==(t2));
	}
	if (t1) {
		t2 = (((T102*)(a1))->a4);
		t1 = ((((T102*)(C))->a4)==(t2));
	}
	if (t1) {
		R = (EIF_TRUE);
		l1 = (((T102*)(a1))->a2);
		l2 = (((T102*)(a1))->a3);
		l3 = (((T102*)(C))->a4);
		t1 = ((T2)((l3)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (T101f9(((T102*)(C))->a3, l3));
			t3 = (T101f9(l2, l3));
			t1 = ((t2)!=(t3));
			if (!(t1)) {
				t2 = (T101f9(((T102*)(C))->a2, l3));
				t3 = (T101f9(l1, l3));
				t1 = ((t2)!=(t3));
			}
			if (t1) {
				R = (EIF_FALSE);
				l3 = ((T4)(geint32(0)));
			} else {
				l3 = ((T4)((l3)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l3)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* PR_PORTION.order_is_equal */
T2 T102f7(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	T4 t2;
	t1 = (((T102*)(a1))->a6);
	t1 = ((((T102*)(C))->a6)==(t1));
	if (t1) {
		t2 = (((T102*)(a1))->a5);
		t1 = ((((T102*)(C))->a5)==(t2));
	}
	if (t1) {
		t2 = (((T102*)(a1))->a4);
		R = ((((T102*)(C))->a4)==(t2));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_PORTION].item */
T0* T100f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T221*)(((T100*)(C))->a3))->a2[a1]);
	return R;
}

/* ARRAY [INTEGER].put */
void T99f8(T0* C, T4 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T99*)(C))->a2)));
	((T98*)(((T99*)(C))->a1))->a2[t1] = (a1);
}

/* DS_ARRAYED_LIST [PR_PORTION].sort */
void T100f10(T0* C, T0* a1)
{
	T104f3(a1, C);
}

/* DS_BUBBLE_SORTER [PR_PORTION].sort */
void T104f3(T0* C, T0* a1)
{
	T104f4(C, a1, ((T104*)(C))->a1);
}

/* DS_BUBBLE_SORTER [PR_PORTION].sort_with_comparator */
void T104f4(T0* C, T0* a1, T0* a2)
{
	T2 t1;
	T4 t2;
	t1 = (T100f8(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T100*)(a1))->a1);
		T104f5(C, a1, a2, (T4)(geint32(1)), t2);
	}
}

/* DS_BUBBLE_SORTER [PR_PORTION].subsort_with_comparator */
void T104f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	l1 = (a4);
	t1 = (T4f12(&l1, a3));
	while (!(t1)) {
		l2 = (a3);
		t1 = (T4f4(&l2, l1));
		while (!(t1)) {
			l4 = (T100f2(a1, l2));
			t2 = ((T4)((l2)+((T4)(geint32(1)))));
			l5 = (T100f2(a1, t2));
			t1 = (T166f1(a2, l5, l4));
			if (t1) {
				T100f12(a1, l5, l2);
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T100f12(a1, l4, t2);
				l3 = (EIF_TRUE);
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f4(&l2, l1));
		}
		if (l3) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = (EIF_FALSE);
		} else {
			l1 = (a3);
		}
		t1 = (T4f12(&l1, a3));
	}
}

/* DS_ARRAYED_LIST [PR_PORTION].replace */
void T100f12(T0* C, T0* a1, T4 a2)
{
	((T221*)(((T100*)(C))->a3))->a2[a2] = (a1);
}

/* KL_COMPARABLE_COMPARATOR [PR_PORTION].less_than */
T2 T166f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = (T102f10(a1, a2));
	return R;
}

/* PR_PORTION.infix "<" */
T2 T102f10(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T102*)(a1))->a5);
	t2 = ((((T102*)(C))->a5)==(t1));
	if (t2) {
		t1 = (((T102*)(a1))->a4);
		t2 = ((((T102*)(C))->a4)==(t1));
		if (t2) {
			t2 = ((T2)(!(((T102*)(C))->a6)));
			if (t2) {
				R = (((T102*)(a1))->a6);
			} else {
				R = EIF_FALSE;
			}
		} else {
			t1 = (((T102*)(a1))->a4);
			R = ((T2)((((T102*)(C))->a4)<(t1)));
		}
	} else {
		t1 = (((T102*)(a1))->a5);
		R = ((T2)((((T102*)(C))->a5)<(t1)));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_PORTION].is_empty */
T2 T100f8(T0* C)
{
	T2 R = 0;
	R = ((((T100*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* PR_PARSER_GENERATOR.portion_sorter */
unsigned char ge180os1379 = '\0';
T0* ge180ov1379;
T0* T20f18(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge180os1379) {
		return ge180ov1379;
	} else {
		ge180os1379 = '\1';
	}
	l1 = T166c2();
	R = T104c2(l1);
	ge180ov1379 = R;
	return R;
}

/* DS_BUBBLE_SORTER [PR_PORTION].make */
T0* T104c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T104));
	((T104*)(C))->id = 104;
	((T104*)(C))->a1 = (a1);
	return C;
}

/* KL_COMPARABLE_COMPARATOR [PR_PORTION].make */
T0* T166c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T166));
	((T166*)(C))->id = 166;
	return C;
}

/* PR_PARSER_GENERATOR.put_yydefgoto */
void T20f60(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T0* l12 = 0;
	T0* l13 = 0;
	T0* l14 = 0;
	T0* l15 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	l1 = (((T70*)(a1))->a8);
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	t1 = (((T26*)(t1))->a6);
	l7 = (((T95*)(t1))->a1);
	t2 = (T73f3(l1));
	if (t2) {
		l5 = ((T4)(geint32(-1)));
	} else {
		t1 = (((T19*)(((T20*)(C))->a1))->a2);
		l8 = (((T54*)(t1))->a1);
		t3 = ((T4)((l8)-((T4)(geint32(1)))));
		l4 = T99c7((T4)(geint32(0)), t3);
		l2 = (T73f1(l1));
		T84f8(l2);
		t2 = (((T84*)(l2))->a1);
		while (!(t2)) {
			t1 = (T84f2(l2));
			t1 = (((T79*)(t1))->a2);
			l6 = (((T56*)(t1))->a6);
			t3 = (T99f4(l4, l6));
			t3 = ((T4)((t3)+((T4)(geint32(1)))));
			T99f8(l4, t3, l6);
			T84f9(l2);
			t2 = (((T84*)(l2))->a1);
		}
		l5 = ((T4)(geint32(-1)));
		l9 = ((T4)(geint32(0)));
		t2 = (T4f4(&l9, l8));
		while (!(t2)) {
			l10 = (T99f4(l4, l9));
			t2 = (T4f1(&l10, l11));
			if (t2) {
				l11 = (l10);
				l5 = (l9);
			}
			l9 = ((T4)((l9)+((T4)(geint32(1)))));
			t2 = (T4f4(&l9, l8));
		}
		l10 = ((T4)(geint32(0)));
		t3 = ((T4)((l8)-((T4)(geint32(1)))));
		l12 = T114c5((T4)(geint32(0)), t3);
		T84f8(l2);
		t2 = (((T84*)(l2))->a1);
		while (!(t2)) {
			l3 = (T84f2(l2));
			t1 = (((T79*)(l3))->a2);
			t3 = (((T56*)(t1))->a6);
			t2 = ((t3)!=(l5));
			if (t2) {
				t1 = (((T79*)(l3))->a5);
				t3 = (((T56*)(t1))->a6);
				T114f6(l12, l3, t3);
				l10 = ((T4)((l10)+((T4)(geint32(1)))));
			}
			T84f9(l2);
			t2 = (((T84*)(l2))->a1);
		}
		t2 = ((l10)!=((T4)(geint32(0))));
		if (t2) {
			l13 = T101c10(l10);
			l14 = T101c10(l10);
			l9 = ((T4)(geint32(0)));
			t2 = (T4f4(&l9, l8));
			while (!(t2)) {
				l3 = (T114f4(l12, l9));
				t2 = ((l3)!=(EIF_VOID));
				if (t2) {
					t1 = (((T79*)(l3))->a5);
					t3 = (((T56*)(t1))->a6);
					T101f11(l13, t3);
					t1 = (((T79*)(l3))->a2);
					t3 = (((T56*)(t1))->a6);
					T101f11(l14, t3);
				}
				l9 = ((T4)((l9)+((T4)(geint32(1)))));
				t2 = (T4f4(&l9, l8));
			}
			t3 = (((T70*)(a1))->a5);
			l15 = T102c12(t3, l13, l14);
			T100f11(a2, l15);
		}
	}
	t3 = (((T70*)(a1))->a5);
	T99f8(((T20*)(C))->a17, l5, t3);
}

/* DS_ARRAYED_LIST [PR_PORTION].put_last */
void T100f11(T0* C, T0* a1)
{
	((T100*)(C))->a1 = ((T4)((((T100*)(C))->a1)+((T4)(geint32(1)))));
	((T221*)(((T100*)(C))->a3))->a2[((T100*)(C))->a1] = (a1);
}

/* PR_PORTION.make_symbol */
T0* T102c12(T4 a1, T0* a2, T0* a3)
{
	T4 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T102));
	((T102*)(C))->id = 102;
	((T102*)(C))->a1 = (a1);
	((T102*)(C))->a2 = (a2);
	((T102*)(C))->a3 = (a3);
	((T102*)(C))->a4 = (((T101*)(((T102*)(C))->a2))->a6);
	t1 = (T101f7(((T102*)(C))->a2));
	t2 = (T101f8(((T102*)(C))->a2));
	t1 = ((T4)((t1)-(t2)));
	((T102*)(C))->a5 = ((T4)((t1)+((T4)(geint32(1)))));
	return C;
}

/* DS_ARRAYED_LIST [INTEGER].last */
T4 T101f7(T0* C)
{
	T4 R = 0;
	R = (((T98*)(((T101*)(C))->a2))->a2[((T101*)(C))->a6]);
	return R;
}

/* DS_ARRAYED_LIST [INTEGER].put_last */
void T101f11(T0* C, T4 a1)
{
	((T101*)(C))->a6 = ((T4)((((T101*)(C))->a6)+((T4)(geint32(1)))));
	((T98*)(((T101*)(C))->a2))->a2[((T101*)(C))->a6] = (a1);
}

/* ARRAY [PR_TRANSITION].item */
T0* T114f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T114*)(C))->a2)));
	R = (((T113*)(((T114*)(C))->a1))->a2[t1]);
	return R;
}

/* DS_ARRAYED_LIST [INTEGER].make */
T0* T101c10(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T101));
	((T101*)(C))->id = 101;
	((T101*)(C))->a1 = T129c4();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T101*)(C))->a2 = (T129f1(((T101*)(C))->a1, t1));
	((T101*)(C))->a3 = (a1);
	((T101*)(C))->a4 = (T101f5(C));
	return C;
}

/* DS_ARRAYED_LIST [INTEGER].new_cursor */
T0* T101f5(T0* C)
{
	T0* R = 0;
	R = T225c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [INTEGER].make */
T0* T225c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T225));
	((T225*)(C))->id = 225;
	((T225*)(C))->a1 = (a1);
	return C;
}

/* ARRAY [PR_TRANSITION].put */
void T114f6(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T114*)(C))->a2)));
	((T113*)(((T114*)(C))->a1))->a2[t1] = (a1);
}

/* ARRAY [PR_TRANSITION].make */
T0* T114c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T114));
	((T114*)(C))->id = 114;
	((T114*)(C))->a2 = (a1);
	((T114*)(C))->a3 = (a2);
	t1 = (T4f12(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T114f7(C, t2);
	} else {
		T114f7(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [PR_TRANSITION].make_area */
void T114f7(T0* C, T4 a1)
{
	((T114*)(C))->a1 = T113c2(a1);
}

/* SPECIAL [PR_TRANSITION].make */
T0* T113c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T113)+a1*sizeof(T0*));
	((T113*)(C))->a1 = a1;
	((T113*)(C))->id = 113;
	return C;
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].forth */
void T84f9(T0* C)
{
	T73f11(((T84*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_TRANSITION].cursor_forth */
void T73f11(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T84*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T73*)(C))->a4);
	} else {
		t2 = (((T84*)(a1))->a3);
		l3 = (((T195*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T84f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T73f13(C, a1);
		}
	} else {
		if (l1) {
			T73f12(C, a1);
		}
	}
}

/* DS_LINKED_LIST [PR_TRANSITION].add_traversing_cursor */
void T73f12(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T73*)(C))->a2));
	if (t1) {
		t2 = (((T84*)(((T73*)(C))->a2))->a6);
		T84f11(a1, t2);
		T84f11(((T73*)(C))->a2, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_next_cursor */
void T84f11(T0* C, T0* a1)
{
	((T84*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [PR_TRANSITION].remove_traversing_cursor */
void T73f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T73*)(C))->a2));
	if (t1) {
		l2 = (((T73*)(C))->a2);
		l1 = (((T84*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T84*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T84*)(a1))->a6);
			T84f11(l2, t2);
			T84f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set */
void T84f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T84*)(C))->a3 = (a1);
	((T84*)(C))->a5 = (a2);
	((T84*)(C))->a1 = (a3);
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].item */
T0* T84f2(T0* C)
{
	T0* R = 0;
	R = (((T195*)(((T84*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].start */
void T84f8(T0* C)
{
	T73f10(((T84*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_TRANSITION].cursor_start */
void T73f10(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T73f7(C, a1));
	l2 = ((((T73*)(C))->a4)==(EIF_VOID));
	T84f10(a1, ((T73*)(C))->a4, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T73f12(C, a1);
	}
}

/* DS_LINKED_LIST [PR_TRANSITION].cursor_off */
T2 T73f7(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T84*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_LINKED_LIST [PR_TRANSITION].new_cursor */
T0* T73f1(T0* C)
{
	T0* R = 0;
	R = T84c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].make */
T0* T84c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T84));
	((T84*)(C))->id = 84;
	((T84*)(C))->a4 = (a1);
	((T84*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* DS_LINKED_LIST [PR_TRANSITION].is_empty */
T2 T73f3(T0* C)
{
	T2 R = 0;
	R = ((((T73*)(C))->a6)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].item */
T0* T88f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T208*)(((T88*)(C))->a6))->a2[a1]);
	return R;
}

/* PR_PARSER_GENERATOR.put_yydefact */
void T20f59(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T4 l12 = 0;
	T4 l13 = 0;
	T0* l14 = 0;
	T0* l15 = 0;
	T2 l16 = 0;
	T4 l17 = 0;
	T4 l18 = 0;
	T0* l19 = 0;
	T0* l20 = 0;
	T0* l21 = 0;
	T4 l22 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	t1 = (((T26*)(t1))->a6);
	l5 = (((T95*)(t1))->a1);
	l4 = T99c7((T4)(geint32(0)), l5);
	l7 = (((T56*)(a1))->a10);
	l6 = (((T82*)(l7))->a7);
	t2 = (((T56*)(a1))->a17);
	if (t2) {
		l1 = (l6);
		t2 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t2)) {
			l9 = (T82f9(l7, l1));
			t1 = (((T87*)(l9))->a1);
			t3 = (((T69*)(t1))->a6);
			l12 = ((T4)(-(t3)));
			l8 = (((T87*)(l9))->a2);
			l3 = (((T95*)(l8))->a1);
			l2 = ((T4)(geint32(1)));
			t2 = (T4f1(&l2, l3));
			while (!(t2)) {
				t1 = (T95f2(l8, l2));
				t3 = (((T81*)(t1))->a8);
				T99f8(l4, l12, t3);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t2 = (T4f1(&l2, l3));
			}
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t2 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	l10 = (((T56*)(a1))->a1);
	l3 = (((T54*)(l10))->a1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l3));
	while (!(t2)) {
		l14 = (T54f2(l10, l1));
		l15 = (((T56*)(l14))->a7);
		t2 = ((((l15)->id==81)?EIF_TRUE:EIF_FALSE));
		if (t2) {
			t3 = (((T56*)(l14))->a6);
			t4 = ((((l15)->id==81)?((T81*)(l15))->a8:((T70*)(l15))->a5));
			T99f8(l4, t3, t4);
			t3 = ((((l15)->id==81)?((T81*)(l15))->a8:((T70*)(l15))->a5));
			t2 = ((t3)==((T4)(geint32(1))));
			if (t2) {
				l16 = (EIF_TRUE);
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l3));
	}
	l11 = (((T56*)(a1))->a12);
	l3 = (((T95*)(l11))->a1);
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l3));
	while (!(t2)) {
		t1 = (T95f2(l11, l1));
		t3 = (((T81*)(t1))->a8);
		T99f8(l4, ((T20*)(C))->a3, t3);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l3));
	}
	t2 = (T4f4(&l6, (T4)(geint32(1))));
	if (t2) {
		t2 = ((T2)(!(l16)));
	}
	if (t2) {
		t2 = (((T56*)(a1))->a17);
		t2 = ((T2)(!(t2)));
		if (t2) {
			t1 = (T82f10(l7));
			t1 = (((T87*)(t1))->a1);
			l13 = (((T69*)(t1))->a6);
		} else {
			l1 = ((T4)(geint32(1)));
			t2 = (T4f1(&l1, l6));
			while (!(t2)) {
				t1 = (T82f9(l7, l1));
				t1 = (((T87*)(t1))->a1);
				t3 = (((T69*)(t1))->a6);
				l12 = ((T4)(-(t3)));
				l2 = ((T4)(geint32(0)));
				t2 = (T4f1(&l2, l5));
				while (!(t2)) {
					t3 = (T99f4(l4, l2));
					t2 = ((t3)==(l12));
					if (t2) {
						l18 = ((T4)((l18)+((T4)(geint32(1)))));
					}
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					t2 = (T4f1(&l2, l5));
				}
				t2 = (T4f1(&l18, l17));
				if (t2) {
					l17 = (l18);
					l13 = (l12);
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				t2 = (T4f1(&l1, l6));
			}
			t2 = (T4f1(&l17, (T4)(geint32(0))));
			if (t2) {
				l2 = ((T4)(geint32(0)));
				t2 = (T4f1(&l2, l5));
				while (!(t2)) {
					t3 = (T99f4(l4, l2));
					t2 = ((t3)==(l13));
					if (t2) {
						T99f8(l4, (T4)(geint32(0)), l2);
					}
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					t2 = (T4f1(&l2, l5));
				}
				l13 = ((T4)(-(l13)));
			}
		}
	}
	t2 = ((l13)==((T4)(geint32(0))));
	if (t2) {
		l1 = ((T4)(geint32(0)));
		t2 = (T4f1(&l1, l5));
		while (!(t2)) {
			t3 = (T99f4(l4, l1));
			t2 = ((t3)==(((T20*)(C))->a3));
			if (t2) {
				T99f8(l4, (T4)(geint32(0)), l1);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l5));
		}
	}
	l22 = (((T56*)(a1))->a6);
	T99f8(((T20*)(C))->a16, l13, l22);
	l18 = ((T4)(geint32(0)));
	l1 = ((T4)(geint32(0)));
	t2 = (T4f1(&l1, l5));
	while (!(t2)) {
		t3 = (T99f4(l4, l1));
		t2 = ((t3)!=((T4)(geint32(0))));
		if (t2) {
			l18 = ((T4)((l18)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l5));
	}
	t2 = ((l18)!=((T4)(geint32(0))));
	if (t2) {
		l19 = T101c10(l18);
		l20 = T101c10(l18);
		l1 = ((T4)(geint32(0)));
		t2 = (T4f1(&l1, l5));
		while (!(t2)) {
			t3 = (T99f4(l4, l1));
			t2 = ((t3)!=((T4)(geint32(0))));
			if (t2) {
				T101f11(l19, l1);
				t3 = (T99f4(l4, l1));
				T101f11(l20, t3);
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l5));
		}
		t3 = (((T56*)(a1))->a6);
		l21 = T102c11(t3, l19, l20);
		T100f11(a2, l21);
	}
}

/* PR_PORTION.make_state */
T0* T102c11(T4 a1, T0* a2, T0* a3)
{
	T4 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T102));
	((T102*)(C))->id = 102;
	((T102*)(C))->a1 = (a1);
	((T102*)(C))->a2 = (a2);
	((T102*)(C))->a3 = (a3);
	((T102*)(C))->a4 = (((T101*)(((T102*)(C))->a2))->a6);
	t1 = (T101f7(((T102*)(C))->a2));
	t2 = (T101f8(((T102*)(C))->a2));
	t1 = ((T4)((t1)-(t2)));
	((T102*)(C))->a5 = ((T4)((t1)+((T4)(geint32(1)))));
	((T102*)(C))->a6 = (EIF_TRUE);
	return C;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].first */
T0* T82f10(T0* C)
{
	T0* R = 0;
	R = (((T206*)(((T82*)(C))->a2))->a2[(T4)(geint32(1))]);
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].item */
T0* T82f9(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T206*)(((T82*)(C))->a2))->a2[a1]);
	return R;
}

/* ARRAY [INTEGER].make */
T0* T99c7(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T99));
	((T99*)(C))->id = 99;
	((T99*)(C))->a2 = (a1);
	((T99*)(C))->a3 = (a2);
	t1 = (T4f12(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T99f9(C, t2);
	} else {
		T99f9(C, (T4)(geint32(0)));
	}
	return C;
}

/* DS_ARRAYED_LIST [PR_PORTION].make */
T0* T100c9(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T100));
	((T100*)(C))->id = 100;
	((T100*)(C))->a4 = T222c2();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T100*)(C))->a3 = (T222f1(((T100*)(C))->a4, t1));
	((T100*)(C))->a5 = (a1);
	((T100*)(C))->a6 = (T100f7(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_PORTION].new_cursor */
T0* T100f7(T0* C)
{
	T0* R = 0;
	R = T223c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_PORTION].make */
T0* T223c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T223));
	((T223*)(C))->id = 223;
	((T223*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_PORTION].make */
T0* T222f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T268c2(a1);
	R = (((T268*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_PORTION].make_area */
T0* T268c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T268));
	((T268*)(C))->id = 268;
	((T268*)(C))->a1 = T221c2(a1);
	return C;
}

/* SPECIAL [PR_PORTION].make */
T0* T221c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T221)+a1*sizeof(T0*));
	((T221*)(C))->a1 = a1;
	((T221*)(C))->id = 221;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_PORTION].default_create */
T0* T222c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T222));
	((T222*)(C))->id = 222;
	return C;
}

/* PR_PARSER_GENERATOR.build_yytypes2 */
void T20f39(T0* C)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a6);
	l3 = (((T95*)(l1))->a1);
	((T20*)(C))->a15 = T99c7((T4)(geint32(0)), l3);
	T99f8(((T20*)(C))->a15, (T4)(geint32(1)), (T4)(geint32(0)));
	l2 = ((T4)(geint32(1)));
	t2 = (T4f1(&l2, l3));
	while (!(t2)) {
		l4 = (T95f2(l1, l2));
		t1 = (((T81*)(l4))->a9);
		t3 = ((((t1)->id==96)?((T96*)(t1))->a2:((T170*)(t1))->a1));
		T99f8(((T20*)(C))->a15, t3, l2);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = (T4f1(&l2, l3));
	}
}

/* PR_PARSER_GENERATOR.build_yytypes1 */
void T20f38(T0* C)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T4 t4;
	l1 = (((T19*)(((T20*)(C))->a1))->a2);
	l3 = (((T54*)(l1))->a1);
	t1 = ((T4)((l3)-((T4)(geint32(1)))));
	((T20*)(C))->a14 = T99c7((T4)(geint32(0)), t1);
	l2 = ((T4)(geint32(1)));
	t2 = (T4f1(&l2, l3));
	while (!(t2)) {
		l4 = (T54f2(l1, l2));
		t3 = (((T56*)(l4))->a7);
		t3 = ((((t3)->id==81)?((T81*)(t3))->a9:((T70*)(t3))->a4));
		t1 = ((((t3)->id==96)?((T96*)(t3))->a2:((T170*)(t3))->a1));
		t4 = (((T56*)(l4))->a6);
		T99f8(((T20*)(C))->a14, t1, t4);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = (T4f1(&l2, l3));
	}
}

/* PR_PARSER_GENERATOR.build_yyr1 */
void T20f37(T0* C)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a1);
	l3 = (((T67*)(l1))->a1);
	((T20*)(C))->a13 = T99c7((T4)(geint32(0)), l3);
	l2 = ((T4)(geint32(1)));
	t2 = (T4f1(&l2, l3));
	while (!(t2)) {
		l4 = (T67f2(l1, l2));
		t1 = (((T69*)(l4))->a2);
		t3 = (((T70*)(t1))->a5);
		t3 = ((T4)((t3)+(((T20*)(C))->a9)));
		T99f8(((T20*)(C))->a13, t3, l2);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = (T4f1(&l2, l3));
	}
}

/* PR_PARSER_GENERATOR.build_yytranslate */
void T20f36(T0* C)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T0* t1;
	T4 t2;
	T2 t3;
	T4 t4;
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	l1 = (((T26*)(t1))->a6);
	l3 = (((T95*)(l1))->a1);
	((T20*)(C))->a9 = ((T4)((l3)+((T4)(geint32(1)))));
	t1 = (((T19*)(((T20*)(C))->a1))->a1);
	t1 = (((T26*)(t1))->a5);
	t2 = (((T88*)(t1))->a1);
	((T20*)(C))->a10 = ((T4)((((T20*)(C))->a9)+(t2)));
	l2 = ((T4)(geint32(1)));
	t3 = (T4f1(&l2, l3));
	while (!(t3)) {
		t1 = (T95f2(l1, l2));
		l4 = (((T81*)(t1))->a2);
		t3 = (T4f1(&l4, ((T20*)(C))->a11));
		if (t3) {
			((T20*)(C))->a11 = (l4);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t3 = (T4f1(&l2, l3));
	}
	((T20*)(C))->a12 = T99c7((T4)(geint32(0)), ((T20*)(C))->a11);
	l2 = ((T4)(geint32(0)));
	t3 = (T4f1(&l2, ((T20*)(C))->a11));
	while (!(t3)) {
		T99f8(((T20*)(C))->a12, (T4)(geint32(2)), l2);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t3 = (T4f1(&l2, ((T20*)(C))->a11));
	}
	T99f8(((T20*)(C))->a12, (T4)(geint32(0)), (T4)(geint32(0)));
	l2 = ((T4)(geint32(1)));
	t3 = (T4f1(&l2, l3));
	while (!(t3)) {
		l5 = (T95f2(l1, l2));
		t2 = (((T81*)(l5))->a8);
		t4 = (((T81*)(l5))->a2);
		T99f8(((T20*)(C))->a12, t2, t4);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t3 = (T4f1(&l2, l3));
	}
}

/* DS_ARRAYED_LIST [PR_STATE].last */
T0* T54f6(T0* C)
{
	T0* R = 0;
	R = (((T93*)(((T54*)(C))->a7))->a2[((T54*)(C))->a1]);
	return R;
}

/* PR_FSM.make */
T0* T19c11(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T19));
	((T19*)(C))->id = 19;
	T26f23(a1, a2);
	T26f21(a1);
	T19f12(C, a1);
	T19f16(C, a2);
	T19f17(C, a2);
	return C;
}

/* PR_FSM.set_error_actions */
void T19f17(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T2 l9 = 0;
	T2 l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T0* l13 = 0;
	T0* l14 = 0;
	T4 l15 = 0;
	T4 l16 = 0;
	T4 l17 = 0;
	T0* l18 = 0;
	T0* l19 = 0;
	T2 t1;
	T0* t2;
	l2 = (((T54*)(((T19*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l5 = (T54f2(((T19*)(C))->a2, l1));
		l9 = (EIF_TRUE);
		l6 = (((T56*)(l5))->a5);
		l4 = (((T64*)(l6))->a1);
		l3 = ((T4)(geint32(1)));
		t1 = (T4f1(&l3, l4));
		while (!(t1)) {
			l7 = (T64f2(l6, l3));
			t1 = (T65f4(l7));
			t1 = ((T2)(!(t1)));
			if (t1) {
				l9 = (EIF_FALSE);
				t1 = (T65f5(l7));
				t1 = ((T2)(!(t1)));
				if (t1) {
					t1 = ((l8)!=(EIF_VOID));
					if (t1) {
						l11 = (T65f6(l7));
						l12 = (T65f6(l8));
						t2 = (T19f6(C));
						t1 = (T68f1(t2, l11, l12));
						t1 = ((T2)(!(t1)));
						if (t1) {
							l10 = (EIF_TRUE);
						}
						t1 = ((l11)!=(EIF_VOID));
						if (t1) {
							l15 = (((T66*)(l11))->a2);
						} else {
							t2 = (((T65*)(l7))->a3);
							l15 = (((T69*)(t2))->a5);
						}
						t1 = ((l12)!=(EIF_VOID));
						if (t1) {
							l16 = (((T66*)(l12))->a2);
						} else {
							t2 = (((T65*)(l8))->a3);
							l16 = (((T69*)(t2))->a5);
						}
						t1 = ((T2)((l15)<(l16)));
						if (t1) {
							l8 = (l7);
						}
					} else {
						l8 = (l7);
					}
				} else {
					l8 = (EIF_VOID);
					l3 = ((T4)((l4)+((T4)(geint32(1)))));
				}
			}
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, l4));
		}
		if (l9) {
			t2 = (((T26*)(((T19*)(C))->a1))->a3);
			l13 = (((T70*)(t2))->a1);
			l14 = T64c12(l4);
			l3 = ((T4)(geint32(1)));
			t1 = (T4f1(&l3, l4));
			while (!(t1)) {
				l7 = (T64f2(l6, l3));
				t2 = (((T65*)(l7))->a3);
				t1 = (T67f15(l13, t2));
				if (t1) {
					T64f13(l14, l7);
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = (T4f1(&l3, l4));
			}
			l4 = (((T64*)(l14))->a1);
			l3 = ((T4)(geint32(1)));
			t1 = (T4f1(&l3, l4));
			while (!(t1)) {
				l7 = (T64f2(l14, l3));
				t1 = ((l8)!=(EIF_VOID));
				if (t1) {
					l11 = (T65f6(l7));
					l12 = (T65f6(l8));
					t2 = (T19f6(C));
					t1 = (T68f1(t2, l11, l12));
					t1 = ((T2)(!(t1)));
					if (t1) {
						l10 = (EIF_TRUE);
					}
					t1 = ((l11)!=(EIF_VOID));
					if (t1) {
						l15 = (((T66*)(l11))->a2);
					} else {
						t2 = (((T65*)(l7))->a3);
						l15 = (((T69*)(t2))->a5);
					}
					t1 = ((l12)!=(EIF_VOID));
					if (t1) {
						l16 = (((T66*)(l12))->a2);
					} else {
						t2 = (((T65*)(l8))->a3);
						l16 = (((T69*)(t2))->a5);
					}
					t1 = ((T2)((l15)<(l16)));
					if (t1) {
						l8 = (l7);
					}
				} else {
					l8 = (l7);
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = (T4f1(&l3, l4));
			}
		}
		if (l10) {
			l17 = ((T4)((l17)+((T4)(geint32(1)))));
			l10 = (EIF_FALSE);
		}
		t1 = ((l8)!=(EIF_VOID));
		if (t1) {
			t2 = (T65f6(l8));
			T56f29(l5, t2);
			l8 = (EIF_VOID);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t1 = (T4f4(&l17, (T4)(geint32(1))));
	if (t1) {
		l18 = T16c25((T4)(geint32(128)));
		T16f26(l18, gems("Parser contains ", 16));
		t1 = ((l17)==((T4)(geint32(1))));
		if (t1) {
			T16f26(l18, gems("1 error action conflict.\n", 25));
		} else {
			t2 = (T19f5(C));
			T63f2(t2, l17, l18);
			T16f26(l18, gems(" error action conflicts.\n", 25));
		}
		l19 = T59c7(l18);
		T25f9(a1, l19);
	}
}

/* UT_ERROR_HANDLER.report_warning */
void T25f9(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T25f5(C, a1));
	T25f12(C, t1);
}

/* UT_ERROR_HANDLER.report_warning_message */
void T25f12(T0* C, T0* a1)
{
	T122f10(((T25*)(C))->a3, a1);
}

/* KL_STDERR_FILE.put_line */
void T122f10(T0* C, T0* a1)
{
	T122f11(C, a1);
	T122f14(C);
}

/* KL_STDERR_FILE.put_new_line */
void T122f14(T0* C)
{
	T122f11(C, ge384ov1447);
}

/* KL_STDERR_FILE.put_string */
void T122f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T122f1(C));
	l1 = (T116f1(t1, a1));
	T122f15(C, l1);
}

/* KL_STDERR_FILE.old_put_string */
void T122f15(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 t1;
	T2 t2;
	T119 t3;
	T14 t4;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)!=((T4)(geint32(0))));
	if (t2) {
		l1 = (((T16*)(a1))->a1);
		t3.id = 119;
		t3.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
		t4 = (T119f2(&t3));
		t1 = (((T16*)(a1))->a2);
		T122f19(C, ((T122*)(C))->a2, t4, t1);
	}
}

/* KL_STDERR_FILE.console_ps */
void T122f19(T0* C, T14 a1, T14 a2, T4 a3)
{
	console_ps((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
}

/* KL_STDERR_FILE.string_ */
T0* T122f1(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_ERROR_HANDLER.message */
T0* T25f5(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T30x2170(a1));
	return R;
}

/* UT_MESSAGE.make */
T0* T59c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T59));
	((T59*)(C))->id = 59;
	((T59*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(1)));
	T121f7(((T59*)(C))->a5, a1, (T4)(geint32(1)));
	return C;
}

/* ARRAY [STRING].put */
void T121f7(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T121*)(C))->a2)));
	((T120*)(((T121*)(C))->a1))->a2[t1] = (a1);
}

/* ARRAY [STRING].make */
T0* T121c6(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T121));
	((T121*)(C))->id = 121;
	((T121*)(C))->a2 = (a1);
	((T121*)(C))->a3 = (a2);
	t1 = (T4f12(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T121f8(C, t2);
	} else {
		T121f8(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [STRING].make_area */
void T121f8(T0* C, T4 a1)
{
	((T121*)(C))->a1 = T120c4(a1);
}

/* SPECIAL [STRING].make */
T0* T120c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T120)+a1*sizeof(T0*));
	((T120*)(C))->a1 = a1;
	((T120*)(C))->id = 120;
	return C;
}

/* KL_INTEGER_ROUTINES.append_decimal_integer */
void T63f2(T0* C, T4 a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==((T4)(geint32(0))));
	if (t1) {
		T16f28(a2, (T1)('0'));
	} else {
		t1 = ((T2)((a1)<((T4)(geint32(0)))));
		if (t1) {
			T16f28(a2, (T1)('-'));
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			l2 = ((T4)(-(t2)));
			l1 = ((T4)((l2)/((T4)(geint32(10)))));
			t2 = ((T4)((l2)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('1'));
				break;
			case (T4)(T4)(geint32(1)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('2'));
				break;
			case (T4)(T4)(geint32(2)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('3'));
				break;
			case (T4)(T4)(geint32(3)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('4'));
				break;
			case (T4)(T4)(geint32(4)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('5'));
				break;
			case (T4)(T4)(geint32(5)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('6'));
				break;
			case (T4)(T4)(geint32(6)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('7'));
				break;
			case (T4)(T4)(geint32(7)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('8'));
				break;
			case (T4)(T4)(geint32(8)):
				t1 = ((l1)!=((T4)(geint32(0))));
				if (t1) {
					T63f2(C, l1, a2);
				}
				T16f28(a2, (T1)('9'));
				break;
			case (T4)(T4)(geint32(9)):
				t2 = ((T4)((l1)+((T4)(geint32(1)))));
				T63f2(C, t2, a2);
				T16f28(a2, (T1)('0'));
				break;
			default:
				break;
			}
		} else {
			l2 = (a1);
			l1 = ((T4)((l2)/((T4)(geint32(10)))));
			t1 = ((l1)!=((T4)(geint32(0))));
			if (t1) {
				T63f2(C, l1, a2);
			}
			t2 = ((T4)((l2)%((T4)(geint32(10)))));
			switch (t2) {
			case (T4)(T4)(geint32(0)):
				T16f28(a2, (T1)('0'));
				break;
			case (T4)(T4)(geint32(1)):
				T16f28(a2, (T1)('1'));
				break;
			case (T4)(T4)(geint32(2)):
				T16f28(a2, (T1)('2'));
				break;
			case (T4)(T4)(geint32(3)):
				T16f28(a2, (T1)('3'));
				break;
			case (T4)(T4)(geint32(4)):
				T16f28(a2, (T1)('4'));
				break;
			case (T4)(T4)(geint32(5)):
				T16f28(a2, (T1)('5'));
				break;
			case (T4)(T4)(geint32(6)):
				T16f28(a2, (T1)('6'));
				break;
			case (T4)(T4)(geint32(7)):
				T16f28(a2, (T1)('7'));
				break;
			case (T4)(T4)(geint32(8)):
				T16f28(a2, (T1)('8'));
				break;
			case (T4)(T4)(geint32(9)):
				T16f28(a2, (T1)('9'));
				break;
			default:
				break;
			}
		}
	}
}

/* PR_FSM.integer_ */
unsigned char ge255os1336 = '\0';
T0* ge255ov1336;
T0* T19f5(T0* C)
{
	T0* R = 0;
	if (ge255os1336) {
		return ge255ov1336;
	} else {
		ge255os1336 = '\1';
	}
	R = T63c1();
	ge255ov1336 = R;
	return R;
}

/* KL_INTEGER_ROUTINES.default_create */
T0* T63c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T63));
	((T63*)(C))->id = 63;
	return C;
}

/* PR_STATE.set_error_action */
void T56f29(T0* C, T0* a1)
{
	((T56*)(C))->a23 = (a1);
}

/* DS_ARRAYED_LIST [PR_POSITION].put_last */
void T64f13(T0* C, T0* a1)
{
	((T64*)(C))->a1 = ((T4)((((T64*)(C))->a1)+((T4)(geint32(1)))));
	((T186*)(((T64*)(C))->a5))->a2[((T64*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_RULE].has */
T2 T67f15(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T67*)(C))->a1);
	l2 = (((T67*)(C))->a16);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T190*)(((T67*)(C))->a7))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T190*)(((T67*)(C))->a7))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_POSITION].make */
T0* T64c12(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T64));
	((T64*)(C))->id = 64;
	((T64*)(C))->a8 = T188c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T64*)(C))->a5 = (T188f1(((T64*)(C))->a8, t1));
	((T64*)(C))->a7 = (a1);
	((T64*)(C))->a9 = (T64f10(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_POSITION].new_cursor */
T0* T64f10(T0* C)
{
	T0* R = 0;
	R = T189c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_POSITION].make */
T0* T189c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T189));
	((T189*)(C))->id = 189;
	((T189*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_POSITION].make */
T0* T188f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T259c2(a1);
	R = (((T259*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_POSITION].make_area */
T0* T259c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T259));
	((T259*)(C))->id = 259;
	((T259*)(C))->a1 = T186c4(a1);
	return C;
}

/* SPECIAL [PR_POSITION].make */
T0* T186c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T186)+a1*sizeof(T0*));
	((T186*)(C))->a1 = a1;
	((T186*)(C))->id = 186;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_POSITION].default_create */
T0* T188c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T188));
	((T188*)(C))->id = 188;
	return C;
}

/* KL_ANY_ROUTINES.equal_objects */
T2 T68f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = (EIF_FALSE);
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = (EIF_FALSE);
			} else {
				t1 = (T68f2(C, a1, a2));
				if (t1) {
					R = (T66f4(a1, a2));
				}
			}
		}
	}
	return R;
}

/* PR_ERROR_ACTION.is_equal */
T2 T66f4(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T66f5(C));
	t2 = (T68f2(t1, C, a1));
	if (t2) {
		t1 = (((T66*)(a1))->a1);
		R = (T171f3(((T66*)(C))->a1, t1));
	}
	return R;
}

/* PR_ACTION.is_equal */
T2 T171f3(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	T2 t2;
	t1 = (T171f4(C));
	t2 = (T68f2(t1, C, a1));
	if (t2) {
		t1 = (((T171*)(a1))->a1);
		R = (T16f4(((T171*)(C))->a1, t1));
	}
	return R;
}

/* PR_ACTION.any_ */
T0* T171f4(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* PR_ERROR_ACTION.any_ */
T0* T66f5(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* PR_FSM.any_ */
T0* T19f6(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* PR_POSITION.error_action */
T0* T65f6(T0* C)
{
	T0* R = 0;
	T0* t1;
	T4 t2;
	T2 t3;
	t1 = (((T69*)(((T65*)(C))->a3))->a3);
	t2 = (((T141*)(t1))->a1);
	t3 = (T4f12(&(((T65*)(C))->a2), t2));
	if (t3) {
		t1 = (((T69*)(((T65*)(C))->a3))->a3);
		R = (T141f8(t1, ((T65*)(C))->a2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].item */
T0* T141f8(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T240*)(((T141*)(C))->a5))->a2[a1]);
	return R;
}

/* PR_POSITION.after */
T2 T65f5(T0* C)
{
	T2 R = 0;
	T0* t1;
	T4 t2;
	t1 = (((T69*)(((T65*)(C))->a3))->a1);
	t2 = (((T77*)(t1))->a1);
	R = (T4f1(&(((T65*)(C))->a2), t2));
	return R;
}

/* PR_POSITION.before */
T2 T65f4(T0* C)
{
	T2 R = 0;
	R = ((((T65*)(C))->a2)==((T4)(geint32(1))));
	return R;
}

/* DS_ARRAYED_LIST [PR_POSITION].item */
T0* T64f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T186*)(((T64*)(C))->a5))->a2[a1]);
	return R;
}

/* PR_FSM.resolve_conflicts */
void T19f16(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l2 = (((T54*)(((T19*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T54f2(((T19*)(C))->a2, l1));
		t1 = (((T56*)(l3))->a17);
		if (t1) {
			l8 = (T56f18(l3));
			t1 = (((T56*)(l3))->a19);
			if (t1) {
				l4 = (T56f20(l3));
				l6 = (T56f21(l3));
				l5 = ((T4)((l5)+(l4)));
				l7 = ((T4)((l7)+(l6)));
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t1 = (T4f1(&l5, (T4)(geint32(0))));
	if (t1) {
		t2 = (((T26*)(((T19*)(C))->a1))->a2);
		t1 = ((l5)!=(t2));
	}
	if (!(t1)) {
		t1 = (T4f1(&l7, (T4)(geint32(0))));
	}
	if (t1) {
		l9 = T16c25((T4)(geint32(128)));
		T16f26(l9, gems("Parser contains ", 16));
		t1 = ((l5)==((T4)(geint32(1))));
		if (t1) {
			T16f26(l9, gems("1 shift/reduce conflict", 23));
		} else {
			t1 = (T4f1(&l5, (T4)(geint32(1))));
			if (t1) {
				t3 = (T19f5(C));
				T63f2(t3, l5, l9);
				T16f26(l9, gems(" shift/reduce conflicts", 23));
			}
		}
		t1 = (T4f1(&l5, (T4)(geint32(0))));
		if (t1) {
			t1 = (T4f1(&l7, (T4)(geint32(0))));
		}
		if (t1) {
			T16f26(l9, gems(" and ", 5));
		}
		t1 = ((l7)==((T4)(geint32(1))));
		if (t1) {
			T16f26(l9, gems("1 reduce/reduce conflict", 24));
		} else {
			t1 = (T4f1(&l7, (T4)(geint32(1))));
			if (t1) {
				t3 = (T19f5(C));
				T63f2(t3, l7, l9);
				T16f26(l9, gems(" reduce/reduce conflicts", 24));
			}
		}
		T16f26(l9, gems(".\n", 2));
		l10 = T59c7(l9);
		T25f9(a1, l10);
	}
}

/* PR_STATE.reduce_reduce_count */
T4 T56f21(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T82*)(((T56*)(C))->a10))->a7);
	t1 = (T4f1(&l1, (T4)(geint32(1))));
	if (t1) {
		l4 = T76c10();
		l5 = T76c10();
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (T82f9(((T56*)(C))->a10, l1));
			l3 = (((T87*)(t2))->a2);
			l2 = (((T95*)(l3))->a1);
			t1 = ((T2)((l2)<((T4)(geint32(1)))));
			while (!(t1)) {
				l6 = (T95f2(l3, l2));
				t1 = (T76f1(l4, l6));
				t1 = ((T2)(!(t1)));
				if (t1) {
					T76f11(l4, l6);
				} else {
					t1 = (T76f1(l5, l6));
					t1 = ((T2)(!(t1)));
					if (t1) {
						T76f11(l5, l6);
					}
				}
				l2 = ((T4)((l2)-((T4)(geint32(1)))));
				t1 = ((T2)((l2)<((T4)(geint32(1)))));
			}
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
		R = (((T76*)(l5))->a8);
	}
	return R;
}

/* DS_LINKED_LIST [PR_TOKEN].force_last */
void T76f11(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T76f6(C));
	if (t1) {
		((T76*)(C))->a2 = T249c3(a1);
		((T76*)(C))->a7 = (((T76*)(C))->a2);
		((T76*)(C))->a8 = ((T4)(geint32(1)));
	} else {
		l1 = (((T76*)(C))->a7);
		((T76*)(C))->a7 = T249c3(a1);
		T249f4(l1, ((T76*)(C))->a7);
		((T76*)(C))->a8 = ((T4)((((T76*)(C))->a8)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [PR_TOKEN].put_right */
void T249f4(T0* C, T0* a1)
{
	((T249*)(C))->a2 = (a1);
}

/* DS_LINKABLE [PR_TOKEN].make */
T0* T249c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T249));
	((T249*)(C))->id = 249;
	((T249*)(C))->a1 = (a1);
	return C;
}

/* DS_LINKED_LIST [PR_TOKEN].is_empty */
T2 T76f6(T0* C)
{
	T2 R = 0;
	R = ((((T76*)(C))->a8)==((T4)(geint32(0))));
	return R;
}

/* DS_LINKED_LIST [PR_TOKEN].has */
T2 T76f1(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T76*)(C))->a2);
	l2 = (((T76*)(C))->a3);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((l1)==(EIF_VOID));
		while (!(t1)) {
			t2 = (((T249*)(l1))->a1);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = (EIF_VOID);
			} else {
				l1 = (((T249*)(l1))->a2);
			}
			t1 = ((l1)==(EIF_VOID));
		}
	} else {
		t1 = ((l1)==(EIF_VOID));
		while (!(t1)) {
			t2 = (((T249*)(l1))->a1);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = (EIF_VOID);
			} else {
				l1 = (((T249*)(l1))->a2);
			}
			t1 = ((l1)==(EIF_VOID));
		}
	}
	return R;
}

/* DS_LINKED_LIST [PR_TOKEN].make */
T0* T76c10()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T76));
	((T76*)(C))->id = 76;
	((T76*)(C))->a4 = (T76f5(C));
	return C;
}

/* DS_LINKED_LIST [PR_TOKEN].new_cursor */
T0* T76f5(T0* C)
{
	T0* R = 0;
	R = T250c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_TOKEN].make */
T0* T250c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T250));
	((T250*)(C))->id = 250;
	((T250*)(C))->a4 = (a1);
	((T250*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* PR_STATE.shift_reduce_count */
T4 T56f20(T0* C)
{
	T4 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T0* t2;
	l4 = (((T54*)(((T56*)(C))->a1))->a1);
	l1 = T95c19(l4);
	t1 = ((T2)((l4)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T54f2(((T56*)(C))->a1, l4));
		t2 = (((T56*)(t2))->a7);
		if ((t2)==EIF_VOID) {
			l3 = EIF_VOID;
		} else {
			switch ((t2)->id) {
			case 81:
				l3 = t2;
				break;
			default:
				l3 = EIF_VOID;
			}
		}
		t1 = ((l3)!=(EIF_VOID));
		if (t1) {
			T95f21(l1, l3);
		}
		l4 = ((T4)((l4)-((T4)(geint32(1)))));
		t1 = ((T2)((l4)<((T4)(geint32(1)))));
	}
	l4 = (((T82*)(((T56*)(C))->a10))->a7);
	t1 = ((T2)((l4)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T82f9(((T56*)(C))->a10, l4));
		l2 = (((T87*)(t2))->a2);
		l5 = (((T95*)(l1))->a1);
		t1 = ((T2)((l5)<((T4)(geint32(1)))));
		while (!(t1)) {
			l3 = (T95f2(l1, l5));
			t1 = (T95f9(l2, l3));
			if (t1) {
				R = ((T4)((R)+((T4)(geint32(1)))));
				T95f22(l1, l5);
			}
			l5 = ((T4)((l5)-((T4)(geint32(1)))));
			t1 = ((T2)((l5)<((T4)(geint32(1)))));
		}
		l4 = ((T4)((l4)-((T4)(geint32(1)))));
		t1 = ((T2)((l4)<((T4)(geint32(1)))));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].remove */
void T95f22(T0* C, T4 a1)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==(((T95*)(C))->a1));
	if (t1) {
		T95f26(C);
	} else {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T95f27(C, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T95f28(C, t2, (T4)(geint32(1)));
		t2 = ((T4)((((T95*)(C))->a1)+((T4)(geint32(1)))));
		((T139*)(((T95*)(C))->a3))->a2[t2] = (l1);
	}
}

/* DS_ARRAYED_LIST [PR_TOKEN].move_left */
void T95f28(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (a1);
	l2 = (((T95*)(C))->a1);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
		t3 = ((T4)((l1)-(a2)));
		((T139*)(((T95*)(C))->a3))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	((T95*)(C))->a1 = ((T4)((((T95*)(C))->a1)-(a2)));
}

/* DS_ARRAYED_LIST [PR_TOKEN].move_cursors_left */
void T95f27(T0* C, T4 a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	l2 = (((T95*)(C))->a6);
	t1 = ((l2)==(EIF_VOID));
	while (!(t1)) {
		l1 = (((T219*)(l2))->a4);
		t1 = (T4f4(&l1, a1));
		if (t1) {
			t2 = ((T4)((l1)-((T4)(geint32(1)))));
			T219f10(l2, t2);
		}
		l2 = (((T219*)(l2))->a5);
		t1 = ((l2)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_position */
void T219f10(T0* C, T4 a1)
{
	((T219*)(C))->a4 = (a1);
}

/* DS_ARRAYED_LIST [PR_TOKEN].remove_last */
void T95f26(T0* C)
{
	T0* l1 = 0;
	T95f31(C);
	((T139*)(((T95*)(C))->a3))->a2[((T95*)(C))->a1] = (l1);
	((T95*)(C))->a1 = ((T4)((((T95*)(C))->a1)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_LIST [PR_TOKEN].move_last_cursors_after */
void T95f31(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T95*)(C))->a1);
	l2 = (((T95*)(C))->a6);
	t1 = (((T219*)(l2))->a4);
	t2 = ((t1)==(l1));
	if (t2) {
		T219f10(l2, (T4)(geint32(-1)));
	}
	l3 = (l2);
	l2 = (((T219*)(l2))->a5);
	t2 = ((l2)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T219*)(l2))->a4);
		t2 = ((t1)==(l1));
		if (t2) {
			T219f10(l2, (T4)(geint32(-1)));
			l4 = (((T219*)(l2))->a5);
			T219f11(l3, l4);
			T219f11(l2, EIF_VOID);
			l2 = (l4);
		} else {
			l3 = (l2);
			l2 = (((T219*)(l2))->a5);
		}
		t2 = ((l2)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
void T219f11(T0* C, T0* a1)
{
	((T219*)(C))->a5 = (a1);
}

/* DS_ARRAYED_LIST [PR_TOKEN].has */
T2 T95f9(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T95*)(C))->a1);
	l2 = (((T95*)(C))->a10);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].put_last */
void T95f21(T0* C, T0* a1)
{
	((T95*)(C))->a1 = ((T4)((((T95*)(C))->a1)+((T4)(geint32(1)))));
	((T139*)(((T95*)(C))->a3))->a2[((T95*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_TOKEN].make */
T0* T95c19(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T95));
	((T95*)(C))->id = 95;
	((T95*)(C))->a4 = T140c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T95*)(C))->a3 = (T140f1(((T95*)(C))->a4, t1));
	((T95*)(C))->a5 = (a1);
	((T95*)(C))->a6 = (T95f7(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_TOKEN].new_cursor */
T0* T95f7(T0* C)
{
	T0* R = 0;
	R = T219c7(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].make */
T0* T219c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T219));
	((T219*)(C))->id = 219;
	((T219*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_TOKEN].make */
T0* T140f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T238c2(a1);
	R = (((T238*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_TOKEN].make_area */
T0* T238c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T238));
	((T238*)(C))->id = 238;
	((T238*)(C))->a1 = T139c4(a1);
	return C;
}

/* SPECIAL [PR_TOKEN].make */
T0* T139c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T139)+a1*sizeof(T0*));
	((T139*)(C))->a1 = a1;
	((T139*)(C))->id = 139;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_TOKEN].default_create */
T0* T140c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T140));
	((T140*)(C))->id = 140;
	return C;
}

/* PR_STATE.resolve_conflicts */
T0* T56f18(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 l8 = 0;
	T4 l9 = 0;
	T4 l10 = 0;
	T0* l11 = 0;
	T2 t1;
	T0* t2;
	R = T60c8();
	l8 = (((T54*)(((T56*)(C))->a1))->a1);
	l1 = T95c19(l8);
	t1 = ((T2)((l8)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T54f2(((T56*)(C))->a1, l8));
		t2 = (((T56*)(t2))->a7);
		if ((t2)==EIF_VOID) {
			l7 = EIF_VOID;
		} else {
			switch ((t2)->id) {
			case 81:
				l7 = t2;
				break;
			default:
				l7 = EIF_VOID;
			}
		}
		t1 = ((l7)!=(EIF_VOID));
		if (t1) {
			T95f21(l1, l7);
		}
		l8 = ((T4)((l8)-((T4)(geint32(1)))));
		t1 = ((T2)((l8)<((T4)(geint32(1)))));
	}
	l10 = (((T82*)(((T56*)(C))->a10))->a7);
	l8 = ((T4)(geint32(1)));
	t1 = (T4f1(&l8, l10));
	while (!(t1)) {
		l5 = (T82f9(((T56*)(C))->a10, l8));
		l11 = (((T87*)(l5))->a1);
		t1 = (T69f15(l11));
		if (t1) {
			l3 = (((T69*)(l11))->a12);
			l2 = (((T87*)(l5))->a2);
			l9 = (((T95*)(l1))->a1);
			t1 = ((T2)((l9)<((T4)(geint32(1)))));
			while (!(t1)) {
				l7 = (T95f2(l1, l9));
				t1 = (T81f6(l7));
				if (t1) {
					t1 = (T95f9(l2, l7));
					if (t1) {
						l4 = (((T81*)(l7))->a7);
						t1 = ((T2)((l4)<(l3)));
						if (t1) {
							T95f22(l1, l9);
							T56f33(C, l7);
							l6 = T62c5(C, l11, l7, gems("reduce", 6));
							T60f9(R, l6);
						} else {
							t1 = ((T2)((l3)<(l4)));
							if (t1) {
								T95f25(l2, l7);
								l6 = T62c5(C, l11, l7, gems("shift", 5));
								T60f9(R, l6);
							} else {
								t1 = (T81f16(l7));
								if (t1) {
									T95f22(l1, l9);
									T56f33(C, l7);
									l6 = T62c5(C, l11, l7, gems("reduce", 6));
									T60f9(R, l6);
								} else {
									t1 = (T81f17(l7));
									if (t1) {
										T95f25(l2, l7);
										l6 = T62c5(C, l11, l7, gems("shift", 5));
										T60f9(R, l6);
									} else {
										t1 = (T81f18(l7));
										if (t1) {
											T95f25(l2, l7);
											T95f22(l1, l9);
											T56f33(C, l7);
											T95f23(((T56*)(C))->a12, l7);
											l6 = T62c5(C, l11, l7, gems("an error", 8));
											T60f9(R, l6);
										}
									}
								}
							}
						}
					}
				}
				l9 = ((T4)((l9)-((T4)(geint32(1)))));
				t1 = ((T2)((l9)<((T4)(geint32(1)))));
			}
		}
		l8 = ((T4)((l8)+((T4)(geint32(1)))));
		t1 = (T4f1(&l8, l10));
	}
	((T56*)(C))->a19 = (EIF_FALSE);
	l8 = (((T82*)(((T56*)(C))->a10))->a7);
	t1 = ((T2)((l8)<((T4)(geint32(1)))));
	while (!(t1)) {
		l5 = (T82f9(((T56*)(C))->a10, l8));
		l2 = (((T87*)(l5))->a2);
		l9 = (((T95*)(l2))->a1);
		t1 = ((T2)((l9)<((T4)(geint32(1)))));
		while (!(t1)) {
			l7 = (T95f2(l2, l9));
			t1 = (T95f9(l1, l7));
			if (t1) {
				((T56*)(C))->a19 = (EIF_TRUE);
			} else {
				T95f23(l1, l7);
			}
			l9 = ((T4)((l9)-((T4)(geint32(1)))));
			t1 = ((T2)((l9)<((T4)(geint32(1)))));
		}
		l8 = ((T4)((l8)-((T4)(geint32(1)))));
		t1 = ((T2)((l8)<((T4)(geint32(1)))));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].force_last */
void T95f23(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T95f11(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T95*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T95f12(C, t2));
		T95f20(C, t2);
	}
	((T95*)(C))->a1 = ((T4)((((T95*)(C))->a1)+((T4)(geint32(1)))));
	((T139*)(((T95*)(C))->a3))->a2[((T95*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_TOKEN].resize */
void T95f20(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T95*)(C))->a3 = (T140f2(((T95*)(C))->a4, ((T95*)(C))->a3, t1));
	((T95*)(C))->a5 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_TOKEN].resize */
T0* T140f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T139*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T139f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_TOKEN].resized_area */
T0* T139f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T139c4(a1);
	l2 = (((T139*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T139*)(C))->a2[l1]);
		((T139*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].new_capacity */
T4 T95f12(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].extendible */
T2 T95f11(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T95*)(C))->a1)+(a1)));
	R = (T4f4(&(((T95*)(C))->a5), t1));
	return R;
}

/* PR_TOKEN.is_non_associative */
T2 T81f18(T0* C)
{
	T2 R = 0;
	R = ((((T81*)(C))->a10)==((T4)(geint32(3))));
	return R;
}

/* PR_TOKEN.is_right_associative */
T2 T81f17(T0* C)
{
	T2 R = 0;
	R = ((((T81*)(C))->a10)==((T4)(geint32(2))));
	return R;
}

/* PR_TOKEN.is_left_associative */
T2 T81f16(T0* C)
{
	T2 R = 0;
	R = ((((T81*)(C))->a10)==((T4)(geint32(1))));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].delete */
void T95f25(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	T4 t4;
	T95f29(C);
	t1 = (T95f13(C));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l3 = (((T95*)(C))->a1);
		l5 = (((T95*)(C))->a10);
		t1 = ((l5)!=(EIF_VOID));
		if (t1) {
			l1 = ((T4)(geint32(1)));
			t1 = (T4f1(&l1, l3));
			while (!(t1)) {
				t1 = (T4f1(&l1, l3));
				if (!(t1)) {
					t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
					t3 = ((T2)gevoid(l5, t2, a1));
					t1 = ((T2)(!(t3)));
				}
				while (!(t1)) {
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
					t1 = (T4f1(&l1, l3));
					if (!(t1)) {
						t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
						t3 = ((T2)gevoid(l5, t2, a1));
						t1 = ((T2)(!(t3)));
					}
				}
				t1 = (T4f1(&l1, l3));
				if (!(t1)) {
					t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
					t1 = ((T2)gevoid(l5, t2, a1));
				}
				while (!(t1)) {
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
					((T139*)(((T95*)(C))->a3))->a2[l2] = (t2);
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
					t1 = (T4f1(&l1, l3));
					if (!(t1)) {
						t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
						t1 = ((T2)gevoid(l5, t2, a1));
					}
				}
				t1 = (T4f1(&l1, l3));
			}
		} else {
			l1 = ((T4)(geint32(1)));
			t1 = (T4f1(&l1, l3));
			while (!(t1)) {
				t1 = (T4f1(&l1, l3));
				if (!(t1)) {
					t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
					t1 = ((t2)!=(a1));
				}
				while (!(t1)) {
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
					t1 = (T4f1(&l1, l3));
					if (!(t1)) {
						t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
						t1 = ((t2)!=(a1));
					}
				}
				t1 = (T4f1(&l1, l3));
				if (!(t1)) {
					t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
					t1 = ((t2)==(a1));
				}
				while (!(t1)) {
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
					((T139*)(((T95*)(C))->a3))->a2[l2] = (t2);
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
					t1 = (T4f1(&l1, l3));
					if (!(t1)) {
						t2 = (((T139*)(((T95*)(C))->a3))->a2[l1]);
						t1 = ((t2)==(a1));
					}
				}
				t1 = (T4f1(&l1, l3));
			}
		}
		l4 = (((T95*)(C))->a1);
		((T95*)(C))->a1 = (l2);
		t4 = ((T4)((((T95*)(C))->a1)+((T4)(geint32(1)))));
		T95f30(C, t4, l4);
	}
}

/* DS_ARRAYED_LIST [PR_TOKEN].clear_items */
void T95f30(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		((T139*)(((T95*)(C))->a3))->a2[l2] = (l1);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
}

/* DS_ARRAYED_LIST [PR_TOKEN].is_empty */
T2 T95f13(T0* C)
{
	T2 R = 0;
	R = ((((T95*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].move_all_cursors_after */
void T95f29(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T95*)(C))->a6);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T219f10(l1, (T4)(geint32(-1)));
		l2 = (((T219*)(l1))->a5);
		T219f11(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_LINKED_LIST [PR_CONFLICT].force_last */
void T60f9(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T60f3(C));
	if (t1) {
		((T60*)(C))->a4 = T277c3(a1);
		((T60*)(C))->a5 = (((T60*)(C))->a4);
		((T60*)(C))->a6 = ((T4)(geint32(1)));
	} else {
		l1 = (((T60*)(C))->a5);
		((T60*)(C))->a5 = T277c3(a1);
		T277f4(l1, ((T60*)(C))->a5);
		((T60*)(C))->a6 = ((T4)((((T60*)(C))->a6)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [PR_CONFLICT].put_right */
void T277f4(T0* C, T0* a1)
{
	((T277*)(C))->a2 = (a1);
}

/* DS_LINKABLE [PR_CONFLICT].make */
T0* T277c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T277));
	((T277*)(C))->id = 277;
	((T277*)(C))->a1 = (a1);
	return C;
}

/* DS_LINKED_LIST [PR_CONFLICT].is_empty */
T2 T60f3(T0* C)
{
	T2 R = 0;
	R = ((((T60*)(C))->a6)==((T4)(geint32(0))));
	return R;
}

/* PR_CONFLICT.make */
T0* T62c5(T0* a1, T0* a2, T0* a3, T0* a4)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T62));
	((T62*)(C))->id = 62;
	((T62*)(C))->a1 = (a1);
	((T62*)(C))->a2 = (a2);
	((T62*)(C))->a3 = (a3);
	((T62*)(C))->a4 = (a4);
	return C;
}

/* PR_STATE.remove_shift */
void T56f33(T0* C, T0* a1)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T54*)(((T56*)(C))->a1))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T54f2(((T56*)(C))->a1, l1));
		t2 = (((T56*)(t2))->a7);
		t1 = ((t2)==(a1));
		if (t1) {
			T54f22(((T56*)(C))->a1, l1);
			l1 = ((T4)(geint32(0)));
		} else {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
}

/* DS_ARRAYED_LIST [PR_STATE].remove */
void T54f22(T0* C, T4 a1)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==(((T54*)(C))->a1));
	if (t1) {
		T54f23(C);
	} else {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T54f24(C, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T54f25(C, t2, (T4)(geint32(1)));
		t2 = ((T4)((((T54*)(C))->a1)+((T4)(geint32(1)))));
		((T93*)(((T54*)(C))->a7))->a2[t2] = (l1);
	}
}

/* DS_ARRAYED_LIST [PR_STATE].move_left */
void T54f25(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (a1);
	l2 = (((T54*)(C))->a1);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T93*)(((T54*)(C))->a7))->a2[l1]);
		t3 = ((T4)((l1)-(a2)));
		((T93*)(((T54*)(C))->a7))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	((T54*)(C))->a1 = ((T4)((((T54*)(C))->a1)-(a2)));
}

/* DS_ARRAYED_LIST [PR_STATE].move_cursors_left */
void T54f24(T0* C, T4 a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	l2 = (((T54*)(C))->a9);
	t1 = ((l2)==(EIF_VOID));
	while (!(t1)) {
		l1 = (((T180*)(l2))->a1);
		t1 = (T4f4(&l1, a1));
		if (t1) {
			t2 = ((T4)((l1)-((T4)(geint32(1)))));
			T180f5(l2, t2);
		}
		l2 = (((T180*)(l2))->a2);
		t1 = ((l2)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_position */
void T180f5(T0* C, T4 a1)
{
	((T180*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST [PR_STATE].remove_last */
void T54f23(T0* C)
{
	T0* l1 = 0;
	T54f26(C);
	((T93*)(((T54*)(C))->a7))->a2[((T54*)(C))->a1] = (l1);
	((T54*)(C))->a1 = ((T4)((((T54*)(C))->a1)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_LIST [PR_STATE].move_last_cursors_after */
void T54f26(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T54*)(C))->a1);
	l2 = (((T54*)(C))->a9);
	t1 = (((T180*)(l2))->a1);
	t2 = ((t1)==(l1));
	if (t2) {
		T180f5(l2, (T4)(geint32(-1)));
	}
	l3 = (l2);
	l2 = (((T180*)(l2))->a2);
	t2 = ((l2)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T180*)(l2))->a1);
		t2 = ((t1)==(l1));
		if (t2) {
			T180f5(l2, (T4)(geint32(-1)));
			l4 = (((T180*)(l2))->a2);
			T180f6(l3, l4);
			T180f6(l2, EIF_VOID);
			l2 = (l4);
		} else {
			l3 = (l2);
			l2 = (((T180*)(l2))->a2);
		}
		t2 = ((l2)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_STATE].set_next_cursor */
void T180f6(T0* C, T0* a1)
{
	((T180*)(C))->a2 = (a1);
}

/* PR_TOKEN.has_precedence */
T2 T81f6(T0* C)
{
	T2 R = 0;
	R = ((((T81*)(C))->a7)!=((T4)(geint32(0))));
	return R;
}

/* PR_RULE.has_precedence */
T2 T69f15(T0* C)
{
	T2 R = 0;
	R = ((((T69*)(C))->a12)!=((T4)(geint32(0))));
	return R;
}

/* DS_LINKED_LIST [PR_CONFLICT].make */
T0* T60c8()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T60));
	((T60*)(C))->id = 60;
	((T60*)(C))->a2 = (T60f1(C));
	return C;
}

/* DS_LINKED_LIST [PR_CONFLICT].new_cursor */
T0* T60f1(T0* C)
{
	T0* R = 0;
	R = T276c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].make */
T0* T276c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T276));
	((T276*)(C))->id = 276;
	((T276*)(C))->a4 = (a1);
	((T276*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* PR_FSM.make_default */
void T19f12(T0* C, T0* a1)
{
	((T19*)(C))->a1 = (a1);
	((T19*)(C))->a2 = T54c14((T4)(geint32(100)));
	((T19*)(C))->a4 = T55c33((T4)(geint32(100)));
	T19f18(C);
	T19f19(C);
}

/* PR_FSM.build_deterministic */
void T19f19(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
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
	T0* l14 = 0;
	T0* l15 = 0;
	T0* l16 = 0;
	T0* l17 = 0;
	T0* l18 = 0;
	T0* l19 = 0;
	T0* l20 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T0* t4;
	l4 = T71c8();
	l6 = T73c8();
	l1 = (((T54*)(((T19*)(C))->a2))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		l14 = (T54f2(((T19*)(C))->a2, l1));
		T56f31(l14);
		t1 = (((T56*)(l14))->a17);
		if (t1) {
			t2 = (((T56*)(l14))->a10);
			T71f9(l4, t2);
		}
		l9 = (((T56*)(l14))->a1);
		l2 = (((T54*)(l9))->a1);
		t1 = ((T2)((l2)<((T4)(geint32(1)))));
		while (!(t1)) {
			l15 = (T54f2(l9, l2));
			t2 = (((T56*)(l15))->a7);
			if ((t2)==EIF_VOID) {
				l18 = EIF_VOID;
			} else {
				switch ((t2)->id) {
				case 70:
					l18 = t2;
					break;
				default:
					l18 = EIF_VOID;
				}
			}
			t1 = ((l18)!=(EIF_VOID));
			if (t1) {
				l16 = T79c7(l14, l15);
				T70f19(l18, l16);
				T73f9(l6, l16);
			}
			l2 = ((T4)((l2)-((T4)(geint32(1)))));
			t1 = ((T2)((l2)<((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
	t3 = (T26f4(((T19*)(C))->a1));
	t3 = ((T4)((t3)+((T4)(geint32(1)))));
	l13 = T78c6(t3);
	l7 = (T73f1(l6));
	T84f8(l7);
	t1 = (((T84*)(l7))->a1);
	while (!(t1)) {
		l16 = (T84f2(l7));
		l10 = (((T79*)(l16))->a1);
		l14 = (((T79*)(l16))->a2);
		l9 = (((T56*)(l14))->a1);
		l1 = (((T54*)(l9))->a1);
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (T54f2(l9, l1));
			l17 = (((T56*)(t2))->a7);
			if ((l17)==EIF_VOID) {
				l19 = EIF_VOID;
			} else {
				switch ((l17)->id) {
				case 81:
					l19 = l17;
					break;
				default:
					l19 = EIF_VOID;
				}
			}
			t1 = ((l19)!=(EIF_VOID));
			if (t1) {
				t1 = (T76f1(l10, l19));
				t1 = ((T2)(!(t1)));
				if (t1) {
					T76f11(l10, l19);
				}
			} else {
				if ((l17)==EIF_VOID) {
					l18 = EIF_VOID;
				} else {
					switch ((l17)->id) {
					case 70:
						l18 = l17;
						break;
					default:
						l18 = EIF_VOID;
					}
				}
				t1 = (((T70*)(l18))->a11);
				if (t1) {
					t2 = (((T79*)(l16))->a3);
					t4 = (T70f12(l18, l14));
					T73f9(t2, t4);
				}
			}
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
		t2 = (T79f4(l16));
		if ((t2)==EIF_VOID) {
			l18 = EIF_VOID;
		} else {
			switch ((t2)->id) {
			case 70:
				l18 = t2;
				break;
			default:
				l18 = EIF_VOID;
			}
		}
		l11 = (((T70*)(l18))->a1);
		l1 = (((T67*)(l11))->a1);
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			l14 = (((T79*)(l16))->a5);
			T78f7(l13);
			T78f8(l13, l14);
			l20 = (T67f2(l11, l1));
			l12 = (((T69*)(l20))->a1);
			l3 = (((T77*)(l12))->a1);
			l2 = ((T4)(geint32(1)));
			t1 = (T4f1(&l2, l3));
			while (!(t1)) {
				t2 = (T77f2(l12, l2));
				l14 = (T56f22(l14, t2));
				T78f8(l13, l14);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t1 = (T4f1(&l2, l3));
			}
			t1 = (((T56*)(l14))->a17);
			if (t1) {
				T56f32(l14, l16, l20);
			}
			l2 = (((T77*)(l12))->a1);
			T78f9(l13);
			t1 = ((T2)((l2)<((T4)(geint32(1)))));
			while (!(t1)) {
				t2 = (T77f2(l12, l2));
				if ((t2)==EIF_VOID) {
					l18 = EIF_VOID;
				} else {
					switch ((t2)->id) {
					case 70:
						l18 = t2;
						break;
					default:
						l18 = EIF_VOID;
					}
				}
				t1 = ((l18)!=(EIF_VOID));
				if (t1) {
					l14 = (T78f1(l13));
					T78f9(l13);
					t2 = (T70f12(l18, l14));
					t2 = (((T79*)(t2))->a3);
					T73f9(t2, l16);
					t1 = (((T70*)(l18))->a11);
					t1 = ((T2)(!(t1)));
					if (t1) {
						l2 = ((T4)(geint32(0)));
					} else {
						l2 = ((T4)((l2)-((T4)(geint32(1)))));
					}
				} else {
					l2 = ((T4)(geint32(0)));
				}
				t1 = ((T2)((l2)<((T4)(geint32(1)))));
			}
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
		T84f9(l7);
		t1 = (((T84*)(l7))->a1);
	}
	l8 = T75c1();
	T75f2(l8, l6);
	l5 = (T71f1(l4));
	T86f8(l5);
	t1 = (((T86*)(l5))->a1);
	while (!(t1)) {
		t2 = (T86f2(l5));
		T87f7(t2);
		T86f9(l5);
		t1 = (((T86*)(l5))->a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].forth */
void T86f9(T0* C)
{
	T71f11(((T86*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_REDUCTION].cursor_forth */
void T71f11(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T86*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T71*)(C))->a4);
	} else {
		t2 = (((T86*)(a1))->a3);
		l3 = (((T194*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T86f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T71f13(C, a1);
		}
	} else {
		if (l1) {
			T71f12(C, a1);
		}
	}
}

/* DS_LINKED_LIST [PR_REDUCTION].add_traversing_cursor */
void T71f12(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T71*)(C))->a2));
	if (t1) {
		t2 = (((T86*)(((T71*)(C))->a2))->a6);
		T86f11(a1, t2);
		T86f11(((T71*)(C))->a2, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
void T86f11(T0* C, T0* a1)
{
	((T86*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [PR_REDUCTION].remove_traversing_cursor */
void T71f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T71*)(C))->a2));
	if (t1) {
		l2 = (((T71*)(C))->a2);
		l1 = (((T86*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T86*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T86*)(a1))->a6);
			T86f11(l2, t2);
			T86f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].set */
void T86f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T86*)(C))->a3 = (a1);
	((T86*)(C))->a5 = (a2);
	((T86*)(C))->a1 = (a3);
}

/* PR_REDUCTION.build_lookaheads */
void T87f7(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l2 = (T73f1(((T87*)(C))->a4));
	T84f8(l2);
	t1 = (((T84*)(l2))->a1);
	while (!(t1)) {
		t2 = (T84f2(l2));
		t2 = (((T79*)(t2))->a1);
		t3 = (((T76*)(t2))->a8);
		l1 = ((T4)((l1)+(t3)));
		T84f9(l2);
		t1 = (((T84*)(l2))->a1);
	}
	T95f34(((T87*)(C))->a2);
	t3 = (((T95*)(((T87*)(C))->a2))->a5);
	t1 = ((T2)((t3)<(l1)));
	if (t1) {
		T95f20(((T87*)(C))->a2, l1);
	}
	T84f8(l2);
	t1 = (((T84*)(l2))->a1);
	while (!(t1)) {
		t2 = (T84f2(l2));
		t2 = (((T79*)(t2))->a1);
		l3 = (T76f5(t2));
		T250f8(l3);
		t1 = (((T250*)(l3))->a1);
		while (!(t1)) {
			l4 = (T250f2(l3));
			t1 = (T95f9(((T87*)(C))->a2, l4));
			t1 = ((T2)(!(t1)));
			if (t1) {
				T95f21(((T87*)(C))->a2, l4);
			}
			T250f9(l3);
			t1 = (((T250*)(l3))->a1);
		}
		T84f9(l2);
		t1 = (((T84*)(l2))->a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_TOKEN].forth */
void T250f9(T0* C)
{
	T76f13(((T250*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_TOKEN].cursor_forth */
void T76f13(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T250*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T76*)(C))->a2);
	} else {
		t2 = (((T250*)(a1))->a3);
		l3 = (((T249*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T250f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T76f15(C, a1);
		}
	} else {
		if (l1) {
			T76f14(C, a1);
		}
	}
}

/* DS_LINKED_LIST [PR_TOKEN].add_traversing_cursor */
void T76f14(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T76*)(C))->a4));
	if (t1) {
		t2 = (((T250*)(((T76*)(C))->a4))->a6);
		T250f11(a1, t2);
		T250f11(((T76*)(C))->a4, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set_next_cursor */
void T250f11(T0* C, T0* a1)
{
	((T250*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [PR_TOKEN].remove_traversing_cursor */
void T76f15(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T76*)(C))->a4));
	if (t1) {
		l2 = (((T76*)(C))->a4);
		l1 = (((T250*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T250*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T250*)(a1))->a6);
			T250f11(l2, t2);
			T250f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [PR_TOKEN].set */
void T250f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T250*)(C))->a3 = (a1);
	((T250*)(C))->a5 = (a2);
	((T250*)(C))->a1 = (a3);
}

/* DS_LINKED_LIST_CURSOR [PR_TOKEN].item */
T0* T250f2(T0* C)
{
	T0* R = 0;
	R = (((T249*)(((T250*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_TOKEN].start */
void T250f8(T0* C)
{
	T76f12(((T250*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_TOKEN].cursor_start */
void T76f12(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T76f9(C, a1));
	l2 = ((((T76*)(C))->a2)==(EIF_VOID));
	T250f10(a1, ((T76*)(C))->a2, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T76f14(C, a1);
	}
}

/* DS_LINKED_LIST [PR_TOKEN].cursor_off */
T2 T76f9(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T250*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].wipe_out */
void T95f34(T0* C)
{
	T95f29(C);
	T95f30(C, (T4)(geint32(1)), ((T95*)(C))->a1);
	((T95*)(C))->a1 = ((T4)(geint32(0)));
}

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].item */
T0* T86f2(T0* C)
{
	T0* R = 0;
	R = (((T194*)(((T86*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].start */
void T86f8(T0* C)
{
	T71f10(((T86*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_REDUCTION].cursor_start */
void T71f10(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T71f7(C, a1));
	l2 = ((((T71*)(C))->a4)==(EIF_VOID));
	T86f10(a1, ((T71*)(C))->a4, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T71f12(C, a1);
	}
}

/* DS_LINKED_LIST [PR_REDUCTION].cursor_off */
T2 T71f7(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T86*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_LINKED_LIST [PR_REDUCTION].new_cursor */
T0* T71f1(T0* C)
{
	T0* R = 0;
	R = T86c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_REDUCTION].make */
T0* T86c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T86));
	((T86*)(C))->id = 86;
	((T86*)(C))->a4 = (a1);
	((T86*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].flatten */
void T75f2(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (T73f1(a1));
	T84f8(l1);
	t1 = (((T84*)(l1))->a1);
	while (!(t1)) {
		t2 = (T84f2(l1));
		T79f8(t2, (T4)(geint32(0)));
		T84f9(l1);
		t1 = (((T84*)(l1))->a1);
	}
	t3 = (((T73*)(a1))->a6);
	l2 = T197c8(t3);
	T84f8(l1);
	t1 = (((T84*)(l1))->a1);
	while (!(t1)) {
		l3 = (T84f2(l1));
		t3 = (((T79*)(l3))->a6);
		t1 = ((t3)==((T4)(geint32(0))));
		if (t1) {
			T75f3(C, l3, l2);
		}
		T84f9(l1);
		t1 = (((T84*)(l1))->a1);
	}
}

/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].traverse */
void T75f3(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T4 t1;
	T0* t2;
	T2 t3;
	T197f9(a2, a1);
	t1 = (((T197*)(a2))->a1);
	T79f8(a1, t1);
	l4 = (((T79*)(a1))->a1);
	t2 = (((T79*)(a1))->a3);
	l1 = (T73f1(t2));
	T84f8(l1);
	t3 = (((T84*)(l1))->a1);
	while (!(t3)) {
		l2 = (T84f2(l1));
		t3 = ((l2)!=(a1));
		if (t3) {
			t1 = (((T79*)(l2))->a6);
			t3 = ((t1)==((T4)(geint32(0))));
			if (t3) {
				T75f3(C, l2, a2);
			}
			l6 = (((T79*)(l2))->a6);
			t3 = (T4f1(&l6, (T4)(geint32(0))));
			if (t3) {
				t1 = (((T79*)(a1))->a6);
				t3 = (T4f1(&t1, l6));
			}
			if (t3) {
				l5 = (EIF_TRUE);
				T79f8(a1, l6);
			}
			t2 = (((T79*)(l2))->a1);
			l3 = (T76f5(t2));
			T250f8(l3);
			t3 = (((T250*)(l3))->a1);
			while (!(t3)) {
				l7 = (T250f2(l3));
				t3 = (T76f1(l4, l7));
				t3 = ((T2)(!(t3)));
				if (t3) {
					T79f10(a1, l7);
				}
				T250f9(l3);
				t3 = (((T250*)(l3))->a1);
			}
		}
		T84f9(l1);
		t3 = (((T84*)(l1))->a1);
	}
	t3 = ((T2)(!(l5)));
	if (t3) {
		l2 = (T197f2(a2));
		T79f8(l2, (T4)(geint32(-1)));
		T197f10(a2);
		t3 = ((l2)==(a1));
		while (!(t3)) {
			T79f9(l2, l4);
			l2 = (T197f2(a2));
			T79f8(l2, (T4)(geint32(-1)));
			T197f10(a2);
			t3 = ((l2)==(a1));
		}
	}
}

/* PR_TRANSITION.set_following_tokens */
void T79f9(T0* C, T0* a1)
{
	((T79*)(C))->a1 = (a1);
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].remove */
void T197f10(T0* C)
{
	T0* l1 = 0;
	((T261*)(((T197*)(C))->a3))->a2[((T197*)(C))->a1] = (l1);
	((T197*)(C))->a1 = ((T4)((((T197*)(C))->a1)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].item */
T0* T197f2(T0* C)
{
	T0* R = 0;
	R = (((T261*)(((T197*)(C))->a3))->a2[((T197*)(C))->a1]);
	return R;
}

/* PR_TRANSITION.add_following_token */
void T79f10(T0* C, T0* a1)
{
	T76f11(((T79*)(C))->a1, a1);
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].force */
void T197f9(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T197f6(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T197*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T197f7(C, t2));
		T197f11(C, t2);
	}
	((T197*)(C))->a1 = ((T4)((((T197*)(C))->a1)+((T4)(geint32(1)))));
	((T261*)(((T197*)(C))->a3))->a2[((T197*)(C))->a1] = (a1);
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].resize */
void T197f11(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T197*)(C))->a3 = (T262f2(((T197*)(C))->a4, ((T197*)(C))->a3, t1));
	((T197*)(C))->a5 = (a1);
}

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].resize */
T0* T262f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T261*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T261f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].resized_area */
T0* T261f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T261c4(a1);
	l2 = (((T261*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T261*)(C))->a2[l1]);
		((T261*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make */
T0* T261c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T261)+a1*sizeof(T0*));
	((T261*)(C))->a1 = a1;
	((T261*)(C))->id = 261;
	return C;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].new_capacity */
T4 T197f7(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].extendible */
T2 T197f6(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T197*)(C))->a1)+(a1)));
	R = (T4f4(&(((T197*)(C))->a5), t1));
	return R;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_TOKEN]].make */
T0* T197c8(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T197));
	((T197*)(C))->id = 197;
	((T197*)(C))->a4 = T262c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T197*)(C))->a3 = (T262f1(((T197*)(C))->a4, t1));
	((T197*)(C))->a5 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].make */
T0* T262f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T274c2(a1);
	R = (((T274*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [DS_NESTED_LIST [PR_TOKEN]].make_area */
T0* T274c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T274));
	((T274*)(C))->id = 274;
	((T274*)(C))->a1 = T261c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_TOKEN]].default_create */
T0* T262c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T262));
	((T262*)(C))->id = 262;
	return C;
}

/* PR_TRANSITION.set_index */
void T79f8(T0* C, T4 a1)
{
	((T79*)(C))->a6 = (a1);
}

/* DS_NESTED_LIST_FLATTENER [PR_TOKEN].make */
T0* T75c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T75));
	((T75*)(C))->id = 75;
	return C;
}

/* DS_ARRAYED_STACK [PR_STATE].item */
T0* T78f1(T0* C)
{
	T0* R = 0;
	R = (((T93*)(((T78*)(C))->a2))->a2[((T78*)(C))->a3]);
	return R;
}

/* DS_ARRAYED_STACK [PR_STATE].remove */
void T78f9(T0* C)
{
	T0* l1 = 0;
	((T93*)(((T78*)(C))->a2))->a2[((T78*)(C))->a3] = (l1);
	((T78*)(C))->a3 = ((T4)((((T78*)(C))->a3)-((T4)(geint32(1)))));
}

/* PR_STATE.put_transition */
void T56f32(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T82*)(((T56*)(C))->a10))->a7);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		l2 = (T82f9(((T56*)(C))->a10, l1));
		t2 = (((T87*)(l2))->a1);
		t1 = ((t2)==(a2));
		if (t1) {
			T87f6(l2, a1);
			l1 = ((T4)(geint32(0)));
		} else {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
}

/* PR_REDUCTION.put_transition */
void T87f6(T0* C, T0* a1)
{
	T73f9(((T87*)(C))->a4, a1);
}

/* PR_STATE.shift */
T0* T56f22(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T54*)(((T56*)(C))->a1))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T54f2(((T56*)(C))->a1, l1));
		t2 = (((T56*)(t2))->a7);
		t1 = ((t2)==(a1));
		if (t1) {
			R = (T54f2(((T56*)(C))->a1, l1));
			l1 = ((T4)(geint32(0)));
		} else {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
	return R;
}

/* DS_ARRAYED_STACK [PR_STATE].put */
void T78f8(T0* C, T0* a1)
{
	((T78*)(C))->a3 = ((T4)((((T78*)(C))->a3)+((T4)(geint32(1)))));
	((T93*)(((T78*)(C))->a2))->a2[((T78*)(C))->a3] = (a1);
}

/* DS_ARRAYED_STACK [PR_STATE].wipe_out */
void T78f7(T0* C)
{
	T78f10(C, (T4)(geint32(1)), ((T78*)(C))->a3);
	((T78*)(C))->a3 = ((T4)(geint32(0)));
}

/* DS_ARRAYED_STACK [PR_STATE].clear_items */
void T78f10(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		((T93*)(((T78*)(C))->a2))->a2[l2] = (l1);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
}

/* PR_TRANSITION.symbol */
T0* T79f4(T0* C)
{
	T0* R = 0;
	R = (((T56*)(((T79*)(C))->a2))->a7);
	return R;
}

/* PR_VARIABLE.transition */
T0* T70f12(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (T73f1(((T70*)(C))->a8));
	T84f8(l1);
	t1 = (((T84*)(l1))->a1);
	while (!(t1)) {
		R = (T84f2(l1));
		t2 = (((T79*)(R))->a5);
		t1 = ((t2)==(a1));
		if (t1) {
			T84f12(l1);
		} else {
			T84f9(l1);
		}
		t1 = (((T84*)(l1))->a1);
	}
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].go_after */
void T84f12(T0* C)
{
	T73f14(((T84*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_TRANSITION].cursor_go_after */
void T73f14(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T73f7(C, a1));
	T84f13(a1);
	t1 = ((T2)(!(l1)));
	if (t1) {
		T73f13(C, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_TRANSITION].set_after */
void T84f13(T0* C)
{
	((T84*)(C))->a3 = (EIF_VOID);
	((T84*)(C))->a5 = (EIF_FALSE);
	((T84*)(C))->a1 = (EIF_TRUE);
}

/* DS_ARRAYED_STACK [PR_STATE].make */
T0* T78c6(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T78));
	((T78*)(C))->id = 78;
	((T78*)(C))->a4 = T179c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T78*)(C))->a2 = (T179f1(((T78*)(C))->a4, t1));
	((T78*)(C))->a5 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_STATE].make */
T0* T179f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T257c2(a1);
	R = (((T257*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_STATE].make_area */
T0* T257c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T257));
	((T257*)(C))->id = 257;
	((T257*)(C))->a1 = T93c4(a1);
	return C;
}

/* SPECIAL [PR_STATE].make */
T0* T93c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T93)+a1*sizeof(T0*));
	((T93*)(C))->a1 = a1;
	((T93*)(C))->id = 93;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_STATE].default_create */
T0* T179c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T179));
	((T179*)(C))->id = 179;
	return C;
}

/* PR_GRAMMAR.max_rhs */
T4 T26f4(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (((T67*)(((T26*)(C))->a1))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T67f2(((T26*)(C))->a1, l1));
		t2 = (((T69*)(t2))->a1);
		t3 = (((T77*)(t2))->a1);
		t1 = (T4f1(&t3, R));
		if (t1) {
			t2 = (T67f2(((T26*)(C))->a1, l1));
			t2 = (((T69*)(t2))->a1);
			R = (((T77*)(t2))->a1);
		}
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
	return R;
}

/* DS_LINKED_LIST [PR_TRANSITION].force_last */
void T73f9(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T73f3(C));
	if (t1) {
		((T73*)(C))->a4 = T195c3(a1);
		((T73*)(C))->a5 = (((T73*)(C))->a4);
		((T73*)(C))->a6 = ((T4)(geint32(1)));
	} else {
		l1 = (((T73*)(C))->a5);
		((T73*)(C))->a5 = T195c3(a1);
		T195f4(l1, ((T73*)(C))->a5);
		((T73*)(C))->a6 = ((T4)((((T73*)(C))->a6)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [PR_TRANSITION].put_right */
void T195f4(T0* C, T0* a1)
{
	((T195*)(C))->a2 = (a1);
}

/* DS_LINKABLE [PR_TRANSITION].make */
T0* T195c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T195));
	((T195*)(C))->id = 195;
	((T195*)(C))->a1 = (a1);
	return C;
}

/* PR_VARIABLE.put_transition */
void T70f19(T0* C, T0* a1)
{
	T73f9(((T70*)(C))->a8, a1);
}

/* PR_TRANSITION.make */
T0* T79c7(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T79));
	((T79*)(C))->id = 79;
	((T79*)(C))->a5 = (a1);
	((T79*)(C))->a2 = (a2);
	((T79*)(C))->a1 = T76c10();
	((T79*)(C))->a3 = T73c8();
	return C;
}

/* DS_LINKED_LIST [PR_REDUCTION].append_last */
void T71f9(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (T82f8(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l1 = (T82f5(a1));
		T207f8(l1);
		t2 = (T207f2(l1));
		l2 = T194c3(t2);
		l3 = (l2);
		T207f9(l1);
		t1 = (T207f3(l1));
		while (!(t1)) {
			t2 = (T207f2(l1));
			l4 = T194c3(t2);
			T194f4(l3, l4);
			l3 = (l4);
			T207f9(l1);
			t1 = (T207f3(l1));
		}
		t1 = (T71f3(C));
		if (t1) {
			((T71*)(C))->a4 = (l2);
			((T71*)(C))->a5 = (l3);
		} else {
			T194f4(((T71*)(C))->a5, l2);
			((T71*)(C))->a5 = (l3);
		}
		t3 = (((T82*)(a1))->a7);
		((T71*)(C))->a6 = ((T4)((((T71*)(C))->a6)+(t3)));
	}
}

/* DS_LINKED_LIST [PR_REDUCTION].is_empty */
T2 T71f3(T0* C)
{
	T2 R = 0;
	R = ((((T71*)(C))->a6)==((T4)(geint32(0))));
	return R;
}

/* DS_LINKABLE [PR_REDUCTION].put_right */
void T194f4(T0* C, T0* a1)
{
	((T194*)(C))->a2 = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].after */
T2 T207f3(T0* C)
{
	T2 R = 0;
	R = (T82f12(((T207*)(C))->a1, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_after */
T2 T82f12(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T207*)(a1))->a4);
	R = ((t1)==((T4)(geint32(-1))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].forth */
void T207f9(T0* C)
{
	T82f20(((T207*)(C))->a1, C);
}

/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_forth */
void T82f20(T0* C, T0* a1)
{
	T2 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (((T207*)(a1))->a4);
	l1 = ((l2)==((T4)(geint32(0))));
	l2 = ((T4)((l2)+((T4)(geint32(1)))));
	t1 = (T4f1(&l2, ((T82*)(C))->a7));
	if (t1) {
		l2 = ((T4)(geint32(-1)));
		t1 = ((T2)(!(l1)));
		if (t1) {
			T82f22(C, a1);
		}
	} else {
		if (l1) {
			T82f21(C, a1);
		}
	}
	T207f10(a1, l2);
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_position */
void T207f10(T0* C, T4 a1)
{
	((T207*)(C))->a4 = (a1);
}

/* DS_ARRAYED_LIST [PR_REDUCTION].add_traversing_cursor */
void T82f21(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T82*)(C))->a4));
	if (t1) {
		t2 = (((T207*)(((T82*)(C))->a4))->a6);
		T207f11(a1, t2);
		T207f11(((T82*)(C))->a4, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].set_next_cursor */
void T207f11(T0* C, T0* a1)
{
	((T207*)(C))->a6 = (a1);
}

/* DS_ARRAYED_LIST [PR_REDUCTION].remove_traversing_cursor */
void T82f22(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T82*)(C))->a4));
	if (t1) {
		l2 = (((T82*)(C))->a4);
		l1 = (((T207*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T207*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T207*)(a1))->a6);
			T207f11(l2, t2);
			T207f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKABLE [PR_REDUCTION].make */
T0* T194c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T194));
	((T194*)(C))->id = 194;
	((T194*)(C))->a1 = (a1);
	return C;
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].item */
T0* T207f2(T0* C)
{
	T0* R = 0;
	R = (T82f11(((T207*)(C))->a1, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_item */
T0* T82f11(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T207*)(a1))->a4);
	R = (T82f9(C, t1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].start */
void T207f8(T0* C)
{
	T82f19(((T207*)(C))->a1, C);
}

/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_start */
void T82f19(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T207f5(a1));
	t1 = (T82f8(C));
	if (t1) {
		T207f10(a1, (T4)(geint32(-1)));
	} else {
		T207f10(a1, (T4)(geint32(1)));
		if (l1) {
			T82f21(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].off */
T2 T207f5(T0* C)
{
	T2 R = 0;
	R = (T82f14(((T207*)(C))->a1, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_off */
T2 T82f14(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T82f12(C, a1));
	if (!(t1)) {
		R = (T82f15(C, a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].cursor_before */
T2 T82f15(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T207*)(a1))->a4);
	R = ((t1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].new_cursor */
T0* T82f5(T0* C)
{
	T0* R = 0;
	R = T207c7(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_REDUCTION].make */
T0* T207c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T207));
	((T207*)(C))->id = 207;
	((T207*)(C))->a1 = (a1);
	return C;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].is_empty */
T2 T82f8(T0* C)
{
	T2 R = 0;
	R = ((((T82*)(C))->a7)==((T4)(geint32(0))));
	return R;
}

/* PR_STATE.set_lookahead_needed */
void T56f31(T0* C)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	((T56*)(C))->a17 = (EIF_FALSE);
	t1 = (T82f8(((T56*)(C))->a10));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T82*)(((T56*)(C))->a10))->a7);
		t1 = (T4f1(&t2, (T4)(geint32(1))));
		if (t1) {
			((T56*)(C))->a17 = (EIF_TRUE);
		} else {
			t1 = (T54f12(((T56*)(C))->a1));
			t1 = ((T2)(!(t1)));
			if (t1) {
				l1 = (((T54*)(((T56*)(C))->a1))->a1);
				t1 = ((T2)((l1)<((T4)(geint32(1)))));
				while (!(t1)) {
					t3 = (T54f2(((T56*)(C))->a1, l1));
					t3 = (((T56*)(t3))->a7);
					t1 = ((((t3)->id==81)?EIF_TRUE:EIF_FALSE));
					if (t1) {
						((T56*)(C))->a17 = (EIF_TRUE);
						l1 = ((T4)(geint32(0)));
					} else {
						l1 = ((T4)((l1)-((T4)(geint32(1)))));
					}
					t1 = ((T2)((l1)<((T4)(geint32(1)))));
				}
			}
		}
	}
	t1 = ((T2)(!(((T56*)(C))->a17)));
	if (t1) {
		l1 = (((T54*)(((T56*)(C))->a1))->a1);
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t3 = (T54f2(((T56*)(C))->a1, l1));
			t3 = (((T56*)(t3))->a7);
			t2 = ((((t3)->id==81)?((T81*)(t3))->a8:((T70*)(t3))->a5));
			t1 = ((t2)==((T4)(geint32(1))));
			if (t1) {
				((T56*)(C))->a17 = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
}

/* DS_ARRAYED_LIST [PR_STATE].is_empty */
T2 T54f12(T0* C)
{
	T2 R = 0;
	R = ((((T54*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_LINKED_LIST [PR_TRANSITION].make */
T0* T73c8()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T73));
	((T73*)(C))->id = 73;
	((T73*)(C))->a2 = (T73f1(C));
	return C;
}

/* DS_LINKED_LIST [PR_REDUCTION].make */
T0* T71c8()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T71));
	((T71*)(C))->id = 71;
	((T71*)(C))->a2 = (T71f1(C));
	return C;
}

/* PR_FSM.build_nondeterministic */
void T19f18(T0* C)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T19f20(C);
	T19f21(C);
	l1 = ((T4)(geint32(1)));
	t1 = (((T54*)(((T19*)(C))->a2))->a1);
	t2 = (T4f1(&l1, t1));
	while (!(t2)) {
		t3 = (T54f2(((T19*)(C))->a2, l1));
		T19f22(C, t3);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (((T54*)(((T19*)(C))->a2))->a1);
		t2 = (T4f1(&l1, t1));
	}
	T19f23(C);
}

/* PR_FSM.put_final_state */
void T19f23(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = (T54f3(((T19*)(C))->a2, (T4)(geint32(3))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T54*)(((T19*)(C))->a2))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(3)))));
		T54f16(((T19*)(C))->a2, t2);
	}
	l1 = (T54f5(((T19*)(C))->a2));
	l5 = (((T26*)(((T19*)(C))->a1))->a3);
	t1 = (T56f24(l1, l5));
	if (t1) {
		l2 = (T56f22(l1, l5));
	} else {
		t2 = (((T54*)(((T19*)(C))->a2))->a1);
		l2 = T56c25(t2, l5);
		T54f17(((T19*)(C))->a2, l2);
		t3 = (((T56*)(l1))->a1);
		T54f18(t3, l2);
	}
	t3 = (T19f9(C));
	l6 = T81c20((T4)(geint32(0)), gems("$", 1), t3);
	t2 = (((T54*)(((T19*)(C))->a2))->a1);
	l3 = T56c25(t2, l6);
	T54f17(((T19*)(C))->a2, l3);
	t3 = (((T56*)(l2))->a1);
	T54f18(t3, l3);
	t2 = (((T54*)(((T19*)(C))->a2))->a1);
	l4 = T56c25(t2, l6);
	T54f17(((T19*)(C))->a2, l4);
	t3 = (((T56*)(l3))->a1);
	T54f18(t3, l4);
}

/* PR_TOKEN.make */
T0* T81c20(T4 a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T81));
	((T81*)(C))->id = 81;
	((T81*)(C))->a8 = (a1);
	((T81*)(C))->a3 = (a2);
	((T81*)(C))->a9 = (a3);
	return C;
}

/* PR_FSM.no_type */
unsigned char ge173os1335 = '\0';
T0* ge173ov1335;
T0* T19f9(T0* C)
{
	T0* R = 0;
	T0* t1;
	T2 t2;
	if (ge173os1335) {
		return ge173ov1335;
	} else {
		ge173os1335 = '\1';
	}
	t1 = (((T26*)(((T19*)(C))->a1))->a8);
	t2 = (T109f3(t1));
	if (t2) {
		R = T96c8((T4)(geint32(0)), gems("ANY", 3));
	} else {
		t1 = (((T26*)(((T19*)(C))->a1))->a8);
		R = (T109f4(t1));
	}
	ge173ov1335 = R;
	return R;
}

/* DS_ARRAYED_LIST [PR_TYPE].first */
T0* T109f4(T0* C)
{
	T0* R = 0;
	R = (((T135*)(((T109*)(C))->a5))->a2[(T4)(geint32(1))]);
	return R;
}

/* PR_TYPE.make */
T0* T96c8(T4 a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T96));
	((T96*)(C))->id = 96;
	((T96*)(C))->a2 = (a1);
	((T96*)(C))->a1 = (a2);
	return C;
}

/* DS_ARRAYED_LIST [PR_STATE].force_last */
void T54f18(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T54f3(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T54*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T54f11(C, t2));
		T54f16(C, t2);
	}
	((T54*)(C))->a1 = ((T4)((((T54*)(C))->a1)+((T4)(geint32(1)))));
	((T93*)(((T54*)(C))->a7))->a2[((T54*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_STATE].new_capacity */
T4 T54f11(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [PR_STATE].put_last */
void T54f17(T0* C, T0* a1)
{
	((T54*)(C))->a1 = ((T4)((((T54*)(C))->a1)+((T4)(geint32(1)))));
	((T93*)(((T54*)(C))->a7))->a2[((T54*)(C))->a1] = (a1);
}

/* PR_STATE.make */
T0* T56c25(T4 a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T56));
	((T56*)(C))->id = 56;
	((T56*)(C))->a6 = (a1);
	((T56*)(C))->a7 = (a2);
	((T56*)(C))->a5 = T64c14((T4)(geint32(50)));
	((T56*)(C))->a1 = T54c14((T4)(geint32(50)));
	((T56*)(C))->a10 = T82c16((T4)(geint32(50)));
	((T56*)(C))->a12 = T95c19((T4)(geint32(10)));
	return C;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].make */
T0* T82c16(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T82));
	((T82*)(C))->id = 82;
	((T82*)(C))->a1 = T205c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T82*)(C))->a2 = (T205f1(((T82*)(C))->a1, t1));
	((T82*)(C))->a3 = (a1);
	((T82*)(C))->a4 = (T82f5(C));
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_REDUCTION].make */
T0* T205f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T264c2(a1);
	R = (((T264*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_REDUCTION].make_area */
T0* T264c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T264));
	((T264*)(C))->id = 264;
	((T264*)(C))->a1 = T206c4(a1);
	return C;
}

/* SPECIAL [PR_REDUCTION].make */
T0* T206c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T206)+a1*sizeof(T0*));
	((T206*)(C))->a1 = a1;
	((T206*)(C))->id = 206;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_REDUCTION].default_create */
T0* T205c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T205));
	((T205*)(C))->id = 205;
	return C;
}

/* DS_ARRAYED_LIST [PR_POSITION].make_equal */
T0* T64c14(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T64));
	((T64*)(C))->id = 64;
	((T64*)(C))->a8 = T188c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T64*)(C))->a5 = (T188f1(((T64*)(C))->a8, t1));
	((T64*)(C))->a7 = (a1);
	((T64*)(C))->a9 = (T64f10(C));
	((T64*)(C))->a6 = T187c2();
	return C;
}

/* KL_EQUALITY_TESTER [PR_POSITION].default_create */
T0* T187c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T187));
	((T187*)(C))->id = 187;
	return C;
}

/* PR_STATE.has_shift */
T2 T56f24(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T54*)(((T56*)(C))->a1))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T54f2(((T56*)(C))->a1, l1));
		t2 = (((T56*)(t2))->a7);
		t1 = ((t2)==(a1));
		if (t1) {
			R = (EIF_TRUE);
			l1 = ((T4)(geint32(0)));
		} else {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
		}
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_STATE].first */
T0* T54f5(T0* C)
{
	T0* R = 0;
	R = (((T93*)(((T54*)(C))->a7))->a2[(T4)(geint32(1))]);
	return R;
}

/* DS_ARRAYED_LIST [PR_STATE].resize */
void T54f16(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T54*)(C))->a7 = (T179f2(((T54*)(C))->a8, ((T54*)(C))->a7, t1));
	((T54*)(C))->a4 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_STATE].resize */
T0* T179f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T93*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T93f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_STATE].resized_area */
T0* T93f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T93c4(a1);
	l2 = (((T93*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T93*)(C))->a2[l1]);
		((T93*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_STATE].extendible */
T2 T54f3(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T54*)(C))->a1)+(a1)));
	R = (T4f4(&(((T54*)(C))->a4), t1));
	return R;
}

/* PR_FSM.build_transitions */
void T19f22(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T4 l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T4 l12 = 0;
	T0* l13 = 0;
	T0* l14 = 0;
	T0* l15 = 0;
	T0* t1;
	T4 t2;
	T2 t3;
	t1 = (((T26*)(((T19*)(C))->a1))->a6);
	l4 = (((T95*)(t1))->a1);
	t1 = (((T26*)(((T19*)(C))->a1))->a5);
	l5 = (((T88*)(t1))->a1);
	t2 = ((T4)(-(l4)));
	l11 = T94c5(t2, l5);
	l1 = (((T56*)(a1))->a5);
	l3 = (((T64*)(l1))->a1);
	l14 = (((T56*)(a1))->a10);
	t3 = (T82f6(l14, l3));
	t3 = ((T2)(!(t3)));
	if (t3) {
		t2 = (((T82*)(l14))->a7);
		t2 = ((T4)((t2)+(l3)));
		T82f17(l14, t2);
	}
	l2 = ((T4)(geint32(1)));
	t3 = (T4f1(&l2, l3));
	while (!(t3)) {
		l6 = (T64f2(l1, l2));
		t3 = (T65f5(l6));
		t3 = ((T2)(!(t3)));
		if (t3) {
			l8 = (T65f9(l6));
			l9 = ((((l8)->id==70)?((T70*)(l8))->a5:((T81*)(l8))->a8));
			t3 = ((((l8)->id==70)?EIF_FALSE:EIF_TRUE));
			if (t3) {
				l9 = ((T4)(-(l9)));
			}
			l7 = (T94f4(l11, l9));
			t3 = ((l7)==(EIF_VOID));
			if (t3) {
				l7 = T56c25((T4)(geint32(0)), l8);
				T94f6(l11, l7, l9);
				l12 = ((T4)((l12)+((T4)(geint32(1)))));
			}
			l6 = (T65f10(l6));
			T56f27(l7, l6);
			t3 = (T65f5(l6));
			t3 = ((T2)(!(t3)));
			if (t3) {
				t1 = (T65f9(l6));
				if ((t1)==EIF_VOID) {
					l10 = EIF_VOID;
				} else {
					switch ((t1)->id) {
					case 70:
						l10 = t1;
						break;
					default:
						l10 = EIF_VOID;
					}
				}
				t3 = ((l10)!=(EIF_VOID));
				if (t3) {
					T19f24(C, l7, l10);
				}
			}
		} else {
			t1 = (((T65*)(l6))->a3);
			l15 = T87c5(t1);
			T82f18(l14, l15);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t3 = (T4f1(&l2, l3));
	}
	l13 = (((T56*)(a1))->a1);
	t3 = (T54f3(l13, l12));
	t3 = ((T2)(!(t3)));
	if (t3) {
		t2 = (((T54*)(l13))->a1);
		t2 = ((T4)((t2)+(l12)));
		T54f16(l13, t2);
	}
	t3 = (T54f3(((T19*)(C))->a2, l12));
	t3 = ((T2)(!(t3)));
	if (t3) {
		t2 = (((T54*)(((T19*)(C))->a2))->a4);
		t2 = ((T4)((t2)+(l12)));
		t2 = ((T4)((t2)+((T4)(geint32(100)))));
		T54f16(((T19*)(C))->a2, t2);
		t2 = (((T55*)(((T19*)(C))->a4))->a1);
		t2 = ((T4)((t2)+(l12)));
		t2 = ((T4)((t2)+((T4)(geint32(100)))));
		T55f34(((T19*)(C))->a4, t2);
	}
	l2 = ((T4)(-(l4)));
	t3 = (T4f1(&l2, l5));
	while (!(t3)) {
		l7 = (T94f4(l11, l2));
		t3 = ((l7)!=(EIF_VOID));
		if (t3) {
			l7 = (T19f8(C, l7));
			T54f17(l13, l7);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t3 = (T4f1(&l2, l5));
	}
}

/* PR_FSM.new_state */
T0* T19f8(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T4 t2;
	T56f26(a1);
	l3 = (((T56*)(a1))->a2);
	t1 = (T55f2(((T19*)(C))->a4, l3));
	if (t1) {
		l4 = (T55f3(((T19*)(C))->a4, l3));
		l1 = ((T4)(geint32(1)));
		l2 = (((T54*)(l4))->a1);
		t1 = ((R)!=(EIF_VOID));
		if (!(t1)) {
			t1 = (T4f1(&l1, l2));
		}
		while (!(t1)) {
			R = (T54f2(l4, l1));
			t1 = (T56f3(R, a1));
			t1 = ((T2)(!(t1)));
			if (t1) {
				R = (EIF_VOID);
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
			}
			t1 = ((R)!=(EIF_VOID));
			if (!(t1)) {
				t1 = (T4f1(&l1, l2));
			}
		}
	} else {
		l4 = T54c14((T4)(geint32(2)));
		T55f35(((T19*)(C))->a4, l4, l3);
	}
	t1 = ((R)==(EIF_VOID));
	if (t1) {
		R = (a1);
		t2 = (((T54*)(((T19*)(C))->a2))->a1);
		T56f28(R, t2);
		T54f17(((T19*)(C))->a2, a1);
		T54f18(l4, a1);
	}
	return R;
}

/* PR_STATE.set_id */
void T56f28(T0* C, T4 a1)
{
	((T56*)(C))->a6 = (a1);
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].put */
void T55f35(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T55f38(C);
	T55f36(C, a2);
	t1 = ((((T55*)(C))->a4)!=((T4)(geint32(0))));
	if (t1) {
		T55f45(C, a1, ((T55*)(C))->a4);
	} else {
		l1 = (((T55*)(C))->a17);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T55*)(C))->a11 = ((T4)((((T55*)(C))->a11)+((T4)(geint32(1)))));
			l1 = (((T55*)(C))->a11);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T55f12(C, l1));
			((T55*)(C))->a17 = ((T4)((t2)-(t3)));
		}
		l2 = (((T55*)(C))->a19);
		t2 = (T55f16(C, l2));
		T55f41(C, t2, l1);
		T55f40(C, l1, l2);
		T55f45(C, a1, l1);
		T55f46(C, a2, l1);
		((T55*)(C))->a20 = ((T4)((((T55*)(C))->a20)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].keys_put */
void T55f46(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T55*)(C))->a28))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].slots_put */
void T55f40(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T55*)(C))->a24))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].clashes_put */
void T55f41(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T55*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].slots_item */
T4 T55f16(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T55*)(C))->a24))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].clashes_item */
T4 T55f12(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T55*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].items_put */
void T55f45(T0* C, T0* a1, T4 a2)
{
	((T181*)(((T55*)(C))->a7))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].search_position */
void T55f36(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T4 t2;
	T2 t3;
	t1 = (EIF_FALSE);
	if (t1) {
		((T55*)(C))->a4 = (T55f16(C, ((T55*)(C))->a10));
		((T55*)(C))->a19 = (((T55*)(C))->a10);
		((T55*)(C))->a21 = ((T4)(geint32(0)));
	} else {
		l4 = (((T55*)(C))->a8);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T55*)(C))->a4)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T55f14(C, ((T55*)(C))->a4));
				t3 = (T38f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T38f1(l4, a1, l3));
			}
			if (t1) {
				((T55*)(C))->a19 = (T55f15(C, a1));
				l1 = (T55f16(C, ((T55*)(C))->a19));
				((T55*)(C))->a4 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T55f14(C, l1));
					t1 = (T38f1(l4, a1, t2));
					if (t1) {
						((T55*)(C))->a4 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T55f12(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T55*)(C))->a21 = (l2);
			}
		} else {
			t1 = ((((T55*)(C))->a4)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T55f14(C, ((T55*)(C))->a4));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T55*)(C))->a19 = (T55f15(C, a1));
				l1 = (T55f16(C, ((T55*)(C))->a19));
				((T55*)(C))->a4 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T55f14(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T55*)(C))->a4 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T55f12(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T55*)(C))->a21 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].hash_position */
T4 T55f15(T0* C, T4 a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = (EIF_TRUE);
	if (t1) {
		t2 = (T4f17(&a1));
		R = ((T4)((t2)%(((T55*)(C))->a10)));
	} else {
		R = (((T55*)(C))->a10);
	}
	return R;
}

/* INTEGER.hash_code */
T4 T4f17(T4* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (*C);
	R = (T4f18(&t1, (T4)(geint32(0x7FFFFFFF))));
	return R;
}

/* INTEGER.infix "&" */
T4 T4f18(T4* C, T4 a1)
{
	T4 R = 0;
	R = ((T4)((*C)&(a1)));
	return R;
}

/* KL_EQUALITY_TESTER [INTEGER].test */
T2 T38f1(T0* C, T4 a1, T4 a2)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t1 = (EIF_FALSE);
		if (t1) {
			R = (EIF_FALSE);
		} else {
			t1 = (EIF_FALSE);
			if (t1) {
				R = (EIF_FALSE);
			} else {
				R = (T4f16(&a1, a2));
			}
		}
	}
	return R;
}

/* INTEGER.is_equal */
T2 T4f16(T4* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	T4 t2;
	t1 = (a1);
	t2 = (*C);
	R = ((t1)==(t2));
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].keys_item */
T4 T55f14(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T55*)(C))->a28))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].unset_found_item */
void T55f38(T0* C)
{
	((T55*)(C))->a23 = ((T4)(geint32(0)));
}

/* PR_STATE.same_state */
T2 T56f3(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T4 t4;
	T0* t5;
	t1 = ((a1)==(C));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t2 = (T56f4(C));
		t1 = (T68f2(t2, C, a1));
		if (t1) {
			t3 = (((T56*)(a1))->a2);
			t1 = ((((T56*)(C))->a2)==(t3));
		}
		if (t1) {
			t3 = (((T64*)(((T56*)(C))->a5))->a1);
			t2 = (((T56*)(a1))->a5);
			t4 = (((T64*)(t2))->a1);
			t1 = ((t3)==(t4));
		}
		if (t1) {
			R = (EIF_TRUE);
			l2 = (((T56*)(a1))->a5);
			l1 = (((T64*)(((T56*)(C))->a5))->a1);
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
			while (!(t1)) {
				t2 = (T64f2(((T56*)(C))->a5, l1));
				t5 = (T64f2(l2, l1));
				t1 = (T65f7(t2, t5));
				t1 = ((T2)(!(t1)));
				if (t1) {
					R = (EIF_FALSE);
					l1 = ((T4)(geint32(0)));
				} else {
					l1 = ((T4)((l1)-((T4)(geint32(1)))));
				}
				t1 = ((T2)((l1)<((T4)(geint32(1)))));
			}
		}
	}
	return R;
}

/* PR_POSITION.same_position */
T2 T65f7(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	t1 = (((T65*)(a1))->a3);
	t2 = ((((T65*)(C))->a3)==(t1));
	if (t2) {
		t3 = (((T65*)(a1))->a2);
		R = ((((T65*)(C))->a2)==(t3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* PR_STATE.any_ */
T0* T56f4(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].item */
T0* T55f3(T0* C, T4 a1)
{
	T0* R = 0;
	T55f36(C, a1);
	R = (T55f6(C, ((T55*)(C))->a4));
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].items_item */
T0* T55f6(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T181*)(((T55*)(C))->a7))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].has */
T2 T55f2(T0* C, T4 a1)
{
	T2 R = 0;
	T55f36(C, a1);
	R = ((((T55*)(C))->a4)!=((T4)(geint32(0))));
	return R;
}

/* PR_STATE.sort_positions */
void T56f26(T0* C)
{
	T0* t1;
	t1 = (T56f14(C));
	T64f15(((T56*)(C))->a5, t1);
}

/* DS_ARRAYED_LIST [PR_POSITION].sort */
void T64f15(T0* C, T0* a1)
{
	T184f3(a1, C);
}

/* DS_BUBBLE_SORTER [PR_POSITION].sort */
void T184f3(T0* C, T0* a1)
{
	T184f4(C, a1, ((T184*)(C))->a1);
}

/* DS_BUBBLE_SORTER [PR_POSITION].sort_with_comparator */
void T184f4(T0* C, T0* a1, T0* a2)
{
	T2 t1;
	T4 t2;
	t1 = (T64f11(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T64*)(a1))->a1);
		T184f5(C, a1, a2, (T4)(geint32(1)), t2);
	}
}

/* DS_BUBBLE_SORTER [PR_POSITION].subsort_with_comparator */
void T184f5(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T4 t2;
	l1 = (a4);
	t1 = (T4f12(&l1, a3));
	while (!(t1)) {
		l2 = (a3);
		t1 = (T4f4(&l2, l1));
		while (!(t1)) {
			l4 = (T64f2(a1, l2));
			t2 = ((T4)((l2)+((T4)(geint32(1)))));
			l5 = (T64f2(a1, t2));
			t1 = (T245f1(a2, l5, l4));
			if (t1) {
				T64f17(a1, l5, l2);
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				T64f17(a1, l4, t2);
				l3 = (EIF_TRUE);
			}
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f4(&l2, l1));
		}
		if (l3) {
			l1 = ((T4)((l1)-((T4)(geint32(1)))));
			l3 = (EIF_FALSE);
		} else {
			l1 = (a3);
		}
		t1 = (T4f12(&l1, a3));
	}
}

/* DS_ARRAYED_LIST [PR_POSITION].replace */
void T64f17(T0* C, T0* a1, T4 a2)
{
	((T186*)(((T64*)(C))->a5))->a2[a2] = (a1);
}

/* KL_COMPARABLE_COMPARATOR [PR_POSITION].less_than */
T2 T245f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	R = (T65f8(a1, a2));
	return R;
}

/* PR_POSITION.infix "<" */
T2 T65f8(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	t1 = (((T65*)(a1))->a3);
	t2 = ((t1)==(((T65*)(C))->a3));
	if (t2) {
		t3 = (((T65*)(a1))->a2);
		R = ((T2)((((T65*)(C))->a2)<(t3)));
	} else {
		t3 = (((T69*)(((T65*)(C))->a3))->a6);
		t1 = (((T65*)(a1))->a3);
		t4 = (((T69*)(t1))->a6);
		R = ((T2)((t3)<(t4)));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_POSITION].is_empty */
T2 T64f11(T0* C)
{
	T2 R = 0;
	R = ((((T64*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* PR_STATE.position_sorter */
unsigned char ge176os3050 = '\0';
T0* ge176ov3050;
T0* T56f14(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	if (ge176os3050) {
		return ge176ov3050;
	} else {
		ge176os3050 = '\1';
	}
	l1 = T245c2();
	R = T184c2(l1);
	ge176ov3050 = R;
	return R;
}

/* DS_BUBBLE_SORTER [PR_POSITION].make */
T0* T184c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T184));
	((T184*)(C))->id = 184;
	((T184*)(C))->a1 = (a1);
	return C;
}

/* KL_COMPARABLE_COMPARATOR [PR_POSITION].make */
T0* T245c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T245));
	((T245*)(C))->id = 245;
	return C;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].resize */
void T55f34(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T55f38(C);
	l1 = (T55f9(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T55f39(C, t1);
	l2 = (((T55*)(C))->a10);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T55f40(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T55*)(C))->a10 = (l1);
	l2 = (((T55*)(C))->a11);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T55f12(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t1 = (T55f14(C, l2));
			l3 = (T55f15(C, t1));
			t1 = (T55f16(C, l3));
			T55f41(C, t1, l2);
			T55f40(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T55f42(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T55f43(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T55f44(C, t1);
	((T55*)(C))->a1 = (a1);
	((T55*)(C))->a4 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].clashes_resize */
void T55f44(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T55f25(C));
	((T55*)(C))->a26 = (T129f2(t1, ((T55*)(C))->a26, a1));
}

/* KL_SPECIAL_ROUTINES [INTEGER].resize */
T0* T129f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T98*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T98f4(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [INTEGER].resized_area */
T0* T98f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	R = T98c6(a1);
	l2 = (((T98*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T98*)(C))->a2[l1]);
		((T98*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].special_integer_ */
T0* T55f25(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].keys_resize */
void T55f43(T0* C, T4 a1)
{
	((T55*)(C))->a28 = (T129f2(((T55*)(C))->a29, ((T55*)(C))->a28, a1));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].items_resize */
void T55f42(T0* C, T4 a1)
{
	((T55*)(C))->a7 = (T182f1(((T55*)(C))->a27, ((T55*)(C))->a7, a1));
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].resize */
T0* T182f1(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T181*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T181f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].resized_area */
T0* T181f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T181c4(a1);
	l2 = (((T181*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T181*)(C))->a2[l1]);
		((T181*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make */
T0* T181c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T181)+a1*sizeof(T0*));
	((T181*)(C))->a1 = a1;
	((T181*)(C))->id = 181;
	return C;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].slots_resize */
void T55f39(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T55f25(C));
	((T55*)(C))->a24 = (T129f2(t1, ((T55*)(C))->a24, a1));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].new_modulus */
T4 T55f9(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].put_last */
void T82f18(T0* C, T0* a1)
{
	((T82*)(C))->a7 = ((T4)((((T82*)(C))->a7)+((T4)(geint32(1)))));
	((T206*)(((T82*)(C))->a2))->a2[((T82*)(C))->a7] = (a1);
}

/* PR_REDUCTION.make */
T0* T87c5(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T87));
	((T87*)(C))->id = 87;
	((T87*)(C))->a1 = (a1);
	((T87*)(C))->a2 = T95c19((T4)(geint32(10)));
	((T87*)(C))->a4 = T73c8();
	return C;
}

/* PR_FSM.put_closure_positions */
void T19f24(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* t1;
	T2 t2;
	t1 = (((T70*)(a2))->a2);
	l1 = (T91f1(t1));
	T97f8(l1);
	t2 = (((T97*)(l1))->a1);
	while (!(t2)) {
		l2 = (T97f2(l1));
		l3 = T65c12(l2, (T4)(geint32(1)));
		T56f27(a1, l3);
		T97f9(l1);
		t2 = (((T97*)(l1))->a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_RULE].forth */
void T97f9(T0* C)
{
	T91f12(((T97*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_RULE].cursor_forth */
void T91f12(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T97*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T91*)(C))->a4);
	} else {
		t2 = (((T97*)(a1))->a3);
		l3 = (((T220*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T97f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T91f14(C, a1);
		}
	} else {
		if (l1) {
			T91f13(C, a1);
		}
	}
}

/* DS_LINKED_LIST [PR_RULE].add_traversing_cursor */
void T91f13(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T91*)(C))->a2));
	if (t1) {
		t2 = (((T97*)(((T91*)(C))->a2))->a6);
		T97f11(a1, t2);
		T97f11(((T91*)(C))->a2, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_RULE].set_next_cursor */
void T97f11(T0* C, T0* a1)
{
	((T97*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [PR_RULE].remove_traversing_cursor */
void T91f14(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T91*)(C))->a2));
	if (t1) {
		l2 = (((T91*)(C))->a2);
		l1 = (((T97*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T97*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T97*)(a1))->a6);
			T97f11(l2, t2);
			T97f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [PR_RULE].set */
void T97f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T97*)(C))->a3 = (a1);
	((T97*)(C))->a5 = (a2);
	((T97*)(C))->a1 = (a3);
}

/* PR_POSITION.make */
T0* T65c12(T0* a1, T4 a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T65));
	((T65*)(C))->id = 65;
	((T65*)(C))->a3 = (a1);
	((T65*)(C))->a2 = (a2);
	return C;
}

/* DS_LINKED_LIST_CURSOR [PR_RULE].item */
T0* T97f2(T0* C)
{
	T0* R = 0;
	R = (((T220*)(((T97*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_RULE].start */
void T97f8(T0* C)
{
	T91f11(((T97*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_RULE].cursor_start */
void T91f11(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T91f3(C, a1));
	l2 = ((((T91*)(C))->a4)==(EIF_VOID));
	T97f10(a1, ((T91*)(C))->a4, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T91f13(C, a1);
	}
}

/* DS_LINKED_LIST [PR_RULE].cursor_off */
T2 T91f3(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T97*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_LINKED_LIST [PR_RULE].new_cursor */
T0* T91f1(T0* C)
{
	T0* R = 0;
	R = T97c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_RULE].make */
T0* T97c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T97));
	((T97*)(C))->id = 97;
	((T97*)(C))->a4 = (a1);
	((T97*)(C))->a5 = (EIF_TRUE);
	return C;
}

/* PR_STATE.put_position */
void T56f27(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T64f3(((T56*)(C))->a5, a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t1 = (T64f4(((T56*)(C))->a5));
		if (t1) {
			t2 = (((T64*)(((T56*)(C))->a5))->a1);
			t2 = ((T4)((t2)+((T4)(geint32(50)))));
			T64f16(((T56*)(C))->a5, t2);
		}
		T64f13(((T56*)(C))->a5, a1);
		t2 = (T65f1(a1));
		((T56*)(C))->a2 = ((T4)((((T56*)(C))->a2)+(t2)));
	}
}

/* PR_POSITION.hash_code */
T4 T65f1(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = (((T69*)(((T65*)(C))->a3))->a6);
	R = ((T4)((((T65*)(C))->a2)*(t1)));
	return R;
}

/* DS_ARRAYED_LIST [PR_POSITION].resize */
void T64f16(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T64*)(C))->a5 = (T188f2(((T64*)(C))->a8, ((T64*)(C))->a5, t1));
	((T64*)(C))->a7 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_POSITION].resize */
T0* T188f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T186*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T186f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_POSITION].resized_area */
T0* T186f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T186c4(a1);
	l2 = (((T186*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T186*)(C))->a2[l1]);
		((T186*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_POSITION].is_full */
T2 T64f4(T0* C)
{
	T2 R = 0;
	R = ((((T64*)(C))->a1)==(((T64*)(C))->a7));
	return R;
}

/* DS_ARRAYED_LIST [PR_POSITION].has */
T2 T64f3(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T64*)(C))->a1);
	l2 = (((T64*)(C))->a6);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T186*)(((T64*)(C))->a5))->a2[l1]);
			t1 = (T187f1(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T186*)(((T64*)(C))->a5))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* KL_EQUALITY_TESTER [PR_POSITION].test */
T2 T187f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = (EIF_FALSE);
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = (EIF_FALSE);
			} else {
				R = (T65f11(a1, a2));
			}
		}
	}
	return R;
}

/* PR_POSITION.is_equal */
T2 T65f11(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T65f8(C, a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t1 = (T65f8(a1, C));
		R = ((T2)(!(t1)));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* PR_POSITION.next */
T0* T65f10(T0* C)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((((T65*)(C))->a2)+((T4)(geint32(1)))));
	R = T65c12(((T65*)(C))->a3, t1);
	return R;
}

/* ARRAY [PR_STATE].put */
void T94f6(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T94*)(C))->a2)));
	((T93*)(((T94*)(C))->a1))->a2[t1] = (a1);
}

/* ARRAY [PR_STATE].item */
T0* T94f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T94*)(C))->a2)));
	R = (((T93*)(((T94*)(C))->a1))->a2[t1]);
	return R;
}

/* PR_POSITION.symbol */
T0* T65f9(T0* C)
{
	T0* R = 0;
	T0* t1;
	t1 = (((T69*)(((T65*)(C))->a3))->a1);
	R = (T77f2(t1, ((T65*)(C))->a2));
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].resize */
void T82f17(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T82*)(C))->a2 = (T205f2(((T82*)(C))->a1, ((T82*)(C))->a2, t1));
	((T82*)(C))->a3 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_REDUCTION].resize */
T0* T205f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T206*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T206f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_REDUCTION].resized_area */
T0* T206f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T206c4(a1);
	l2 = (((T206*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T206*)(C))->a2[l1]);
		((T206*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_REDUCTION].extendible */
T2 T82f6(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T82*)(C))->a7)+(a1)));
	R = (T4f4(&(((T82*)(C))->a3), t1));
	return R;
}

/* ARRAY [PR_STATE].make */
T0* T94c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T94));
	((T94*)(C))->id = 94;
	((T94*)(C))->a2 = (a1);
	((T94*)(C))->a3 = (a2);
	t1 = (T4f12(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T94f7(C, t2);
	} else {
		T94f7(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [PR_STATE].make_area */
void T94f7(T0* C, T4 a1)
{
	((T94*)(C))->a1 = T93c4(a1);
}

/* PR_FSM.put_start_state */
void T19f21(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	l2 = (((T26*)(((T19*)(C))->a1))->a3);
	l1 = T56c25((T4)(geint32(0)), l2);
	T19f24(C, l1, l2);
	T56f26(l1);
	T54f15(((T19*)(C))->a2, l1);
}

/* DS_ARRAYED_LIST [PR_STATE].put_first */
void T54f15(T0* C, T0* a1)
{
	T54f19(C, a1, (T4)(geint32(1)));
}

/* DS_ARRAYED_LIST [PR_STATE].put */
void T54f19(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T54*)(C))->a1)+((T4)(geint32(1)))));
	t2 = ((a2)==(t1));
	if (t2) {
		T54f17(C, a1);
	} else {
		T54f20(C, a2, (T4)(geint32(1)));
		T54f21(C, a2, (T4)(geint32(1)));
		((T93*)(((T54*)(C))->a7))->a2[a2] = (a1);
	}
}

/* DS_ARRAYED_LIST [PR_STATE].move_cursors_right */
void T54f21(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T54*)(C))->a9);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		l2 = (((T180*)(l1))->a1);
		t1 = (T4f4(&l2, a1));
		if (t1) {
			t2 = ((T4)((l2)+(a2)));
			T180f5(l1, t2);
		}
		l1 = (((T180*)(l1))->a2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST [PR_STATE].move_right */
void T54f20(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (((T54*)(C))->a1);
	((T54*)(C))->a1 = ((T4)((((T54*)(C))->a1)+(a2)));
	t1 = ((T2)((l1)<(a1)));
	while (!(t1)) {
		t2 = (((T93*)(((T54*)(C))->a7))->a2[l1]);
		t3 = ((T4)((l1)+(a2)));
		((T93*)(((T54*)(C))->a7))->a2[t3] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(a1)));
	}
}

/* PR_FSM.build_derives */
void T19f20(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T0* t2;
	T0* t3;
	l2 = (((T26*)(((T19*)(C))->a1))->a1);
	l1 = (((T67*)(l2))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		l3 = (T67f2(l2, l1));
		t2 = (((T69*)(l3))->a1);
		t1 = (T77f9(t2));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (((T69*)(l3))->a1);
			t2 = (T77f10(t2));
			if ((t2)==EIF_VOID) {
				l5 = EIF_VOID;
			} else {
				switch ((t2)->id) {
				case 70:
					l5 = t2;
					break;
				default:
					l5 = EIF_VOID;
				}
			}
			t1 = ((l5)!=(EIF_VOID));
			if (t1) {
				t2 = (((T69*)(l3))->a2);
				t2 = (((T70*)(t2))->a9);
				T90f9(t2, l5);
			}
		}
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
	l4 = (((T26*)(((T19*)(C))->a1))->a5);
	l1 = (((T88*)(l4))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(1)))));
	while (!(t1)) {
		l5 = (T88f2(l4, l1));
		t2 = (((T70*)(l5))->a2);
		t3 = (((T70*)(l5))->a1);
		T91f15(t2, t3);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
	}
	l6 = T89c1();
	T89f2(l6, l4);
}

/* DS_NESTED_LIST_FLATTENER [PR_RULE].flatten */
void T89f2(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (T88f11(a1));
	T210f10(l1);
	t1 = (T210f3(l1));
	while (!(t1)) {
		t2 = (T210f4(l1));
		T70f23(t2, (T4)(geint32(0)));
		T210f11(l1);
		t1 = (T210f3(l1));
	}
	t3 = (((T88*)(a1))->a1);
	l2 = T213c8(t3);
	T210f10(l1);
	t1 = (T210f3(l1));
	while (!(t1)) {
		l3 = (T210f4(l1));
		t3 = (((T70*)(l3))->a14);
		t1 = ((t3)==((T4)(geint32(0))));
		if (t1) {
			T89f3(C, l3, l2);
		}
		T210f11(l1);
		t1 = (T210f3(l1));
	}
}

/* DS_NESTED_LIST_FLATTENER [PR_RULE].traverse */
void T89f3(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T4 t1;
	T0* t2;
	T2 t3;
	T213f9(a2, a1);
	t1 = (((T213*)(a2))->a1);
	T70f23(a1, t1);
	l4 = (((T70*)(a1))->a2);
	t2 = (((T70*)(a1))->a9);
	l1 = (T90f2(t2));
	T218f8(l1);
	t3 = (((T218*)(l1))->a3);
	while (!(t3)) {
		l2 = (T218f4(l1));
		t3 = ((l2)!=(a1));
		if (t3) {
			t1 = (((T70*)(l2))->a14);
			t3 = ((t1)==((T4)(geint32(0))));
			if (t3) {
				T89f3(C, l2, a2);
			}
			l6 = (((T70*)(l2))->a14);
			t3 = (T4f1(&l6, (T4)(geint32(0))));
			if (t3) {
				t1 = (((T70*)(a1))->a14);
				t3 = (T4f1(&t1, l6));
			}
			if (t3) {
				l5 = (EIF_TRUE);
				T70f23(a1, l6);
			}
			t2 = (((T70*)(l2))->a2);
			l3 = (T91f1(t2));
			T97f8(l3);
			t3 = (((T97*)(l3))->a1);
			while (!(t3)) {
				l7 = (T97f2(l3));
				t3 = (T91f5(l4, l7));
				t3 = ((T2)(!(t3)));
				if (t3) {
					T70f24(a1, l7);
				}
				T97f9(l3);
				t3 = (((T97*)(l3))->a1);
			}
		}
		T218f9(l1);
		t3 = (((T218*)(l1))->a3);
	}
	t3 = ((T2)(!(l5)));
	if (t3) {
		l2 = (T213f2(a2));
		T70f23(l2, (T4)(geint32(-1)));
		T213f10(a2);
		t3 = ((l2)==(a1));
		while (!(t3)) {
			T70f25(l2, l4);
			l2 = (T213f2(a2));
			T70f23(l2, (T4)(geint32(-1)));
			T213f10(a2);
			t3 = ((l2)==(a1));
		}
	}
}

/* PR_VARIABLE.set_derives */
void T70f25(T0* C, T0* a1)
{
	((T70*)(C))->a2 = (a1);
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].remove */
void T213f10(T0* C)
{
	T0* l1 = 0;
	((T266*)(((T213*)(C))->a3))->a2[((T213*)(C))->a1] = (l1);
	((T213*)(C))->a1 = ((T4)((((T213*)(C))->a1)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].item */
T0* T213f2(T0* C)
{
	T0* R = 0;
	R = (((T266*)(((T213*)(C))->a3))->a2[((T213*)(C))->a1]);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].forth */
void T218f9(T0* C)
{
	T90f11(((T218*)(C))->a1, C);
}

/* DS_LINKED_LIST [PR_VARIABLE].cursor_forth */
void T90f11(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T218*)(a1))->a2);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T90*)(C))->a4);
	} else {
		t2 = (((T218*)(a1))->a5);
		l3 = (((T282*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T218f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T90f13(C, a1);
		}
	} else {
		if (l1) {
			T90f12(C, a1);
		}
	}
}

/* DS_LINKED_LIST [PR_VARIABLE].add_traversing_cursor */
void T90f12(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T90*)(C))->a1));
	if (t1) {
		t2 = (((T218*)(((T90*)(C))->a1))->a6);
		T218f11(a1, t2);
		T218f11(((T90*)(C))->a1, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
void T218f11(T0* C, T0* a1)
{
	((T218*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [PR_VARIABLE].remove_traversing_cursor */
void T90f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T90*)(C))->a1));
	if (t1) {
		l2 = (((T90*)(C))->a1);
		l1 = (((T218*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T218*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T218*)(a1))->a6);
			T218f11(l2, t2);
			T218f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].set */
void T218f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T218*)(C))->a5 = (a1);
	((T218*)(C))->a2 = (a2);
	((T218*)(C))->a3 = (a3);
}

/* PR_VARIABLE.add_derive */
void T70f24(T0* C, T0* a1)
{
	T91f16(((T70*)(C))->a2, a1);
}

/* DS_LINKED_LIST [PR_RULE].force_last */
void T91f16(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T91f7(C));
	if (t1) {
		((T91*)(C))->a4 = T220c3(a1);
		((T91*)(C))->a8 = (((T91*)(C))->a4);
		((T91*)(C))->a9 = ((T4)(geint32(1)));
	} else {
		l1 = (((T91*)(C))->a8);
		((T91*)(C))->a8 = T220c3(a1);
		T220f4(l1, ((T91*)(C))->a8);
		((T91*)(C))->a9 = ((T4)((((T91*)(C))->a9)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [PR_RULE].put_right */
void T220f4(T0* C, T0* a1)
{
	((T220*)(C))->a2 = (a1);
}

/* DS_LINKABLE [PR_RULE].make */
T0* T220c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T220));
	((T220*)(C))->id = 220;
	((T220*)(C))->a1 = (a1);
	return C;
}

/* DS_LINKED_LIST [PR_RULE].is_empty */
T2 T91f7(T0* C)
{
	T2 R = 0;
	R = ((((T91*)(C))->a9)==((T4)(geint32(0))));
	return R;
}

/* DS_LINKED_LIST [PR_RULE].has */
T2 T91f5(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T91*)(C))->a4);
	l2 = (((T91*)(C))->a6);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((l1)==(EIF_VOID));
		while (!(t1)) {
			t2 = (((T220*)(l1))->a1);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = (EIF_VOID);
			} else {
				l1 = (((T220*)(l1))->a2);
			}
			t1 = ((l1)==(EIF_VOID));
		}
	} else {
		t1 = ((l1)==(EIF_VOID));
		while (!(t1)) {
			t2 = (((T220*)(l1))->a1);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = (EIF_VOID);
			} else {
				l1 = (((T220*)(l1))->a2);
			}
			t1 = ((l1)==(EIF_VOID));
		}
	}
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].item */
T0* T218f4(T0* C)
{
	T0* R = 0;
	R = (((T282*)(((T218*)(C))->a5))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].start */
void T218f8(T0* C)
{
	T90f10(((T218*)(C))->a1, C);
}

/* DS_LINKED_LIST [PR_VARIABLE].cursor_start */
void T90f10(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T90f7(C, a1));
	l2 = ((((T90*)(C))->a4)==(EIF_VOID));
	T218f10(a1, ((T90*)(C))->a4, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T90f12(C, a1);
	}
}

/* DS_LINKED_LIST [PR_VARIABLE].cursor_off */
T2 T90f7(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T218*)(a1))->a5);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* DS_LINKED_LIST [PR_VARIABLE].new_cursor */
T0* T90f2(T0* C)
{
	T0* R = 0;
	R = T218c7(C);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_VARIABLE].make */
T0* T218c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T218));
	((T218*)(C))->id = 218;
	((T218*)(C))->a1 = (a1);
	((T218*)(C))->a2 = (EIF_TRUE);
	return C;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].force */
void T213f9(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T213f6(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T213*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T213f7(C, t2));
		T213f11(C, t2);
	}
	((T213*)(C))->a1 = ((T4)((((T213*)(C))->a1)+((T4)(geint32(1)))));
	((T266*)(((T213*)(C))->a3))->a2[((T213*)(C))->a1] = (a1);
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].resize */
void T213f11(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T213*)(C))->a3 = (T267f2(((T213*)(C))->a4, ((T213*)(C))->a3, t1));
	((T213*)(C))->a5 = (a1);
}

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].resize */
T0* T267f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T266*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T266f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [DS_NESTED_LIST [PR_RULE]].resized_area */
T0* T266f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T266c4(a1);
	l2 = (((T266*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T266*)(C))->a2[l1]);
		((T266*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [DS_NESTED_LIST [PR_RULE]].make */
T0* T266c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T266)+a1*sizeof(T0*));
	((T266*)(C))->a1 = a1;
	((T266*)(C))->id = 266;
	return C;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].new_capacity */
T4 T213f7(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].extendible */
T2 T213f6(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T213*)(C))->a1)+(a1)));
	R = (T4f4(&(((T213*)(C))->a5), t1));
	return R;
}

/* DS_ARRAYED_STACK [DS_NESTED_LIST [PR_RULE]].make */
T0* T213c8(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T213));
	((T213*)(C))->id = 213;
	((T213*)(C))->a4 = T267c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T213*)(C))->a3 = (T267f1(((T213*)(C))->a4, t1));
	((T213*)(C))->a5 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].make */
T0* T267f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T275c2(a1);
	R = (((T275*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [DS_NESTED_LIST [PR_RULE]].make_area */
T0* T275c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T275));
	((T275*)(C))->id = 275;
	((T275*)(C))->a1 = T266c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_NESTED_LIST [PR_RULE]].default_create */
T0* T267c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T267));
	((T267*)(C))->id = 267;
	return C;
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].forth */
void T210f11(T0* C)
{
	T88f36(((T210*)(C))->a5, C);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_forth */
void T88f36(T0* C, T0* a1)
{
	T2 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (((T210*)(a1))->a1);
	l1 = ((l2)==((T4)(geint32(0))));
	l2 = ((T4)((l2)+((T4)(geint32(1)))));
	t1 = (T4f1(&l2, ((T88*)(C))->a1));
	if (t1) {
		l2 = ((T4)(geint32(-1)));
		t1 = ((T2)(!(l1)));
		if (t1) {
			T88f38(C, a1);
		}
	} else {
		if (l1) {
			T88f37(C, a1);
		}
	}
	T210f8(a1, l2);
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_position */
void T210f8(T0* C, T4 a1)
{
	((T210*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].add_traversing_cursor */
void T88f37(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T88*)(C))->a10));
	if (t1) {
		t2 = (((T210*)(((T88*)(C))->a10))->a2);
		T210f9(a1, t2);
		T210f9(((T88*)(C))->a10, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].set_next_cursor */
void T210f9(T0* C, T0* a1)
{
	((T210*)(C))->a2 = (a1);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].remove_traversing_cursor */
void T88f38(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T88*)(C))->a10));
	if (t1) {
		l2 = (((T88*)(C))->a10);
		l1 = (((T210*)(l2))->a2);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T210*)(l1))->a2);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T210*)(a1))->a2);
			T210f9(l2, t2);
			T210f9(a1, EIF_VOID);
		}
	}
}

/* PR_VARIABLE.set_index */
void T70f23(T0* C, T4 a1)
{
	((T70*)(C))->a14 = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].item */
T0* T210f4(T0* C)
{
	T0* R = 0;
	R = (T88f16(((T210*)(C))->a5, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_item */
T0* T88f16(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T210*)(a1))->a1);
	R = (T88f2(C, t1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].after */
T2 T210f3(T0* C)
{
	T2 R = 0;
	R = (T88f15(((T210*)(C))->a5, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_after */
T2 T88f15(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T210*)(a1))->a1);
	R = ((t1)==((T4)(geint32(-1))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].start */
void T210f10(T0* C)
{
	T88f35(((T210*)(C))->a5, C);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_start */
void T88f35(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T210f6(a1));
	t1 = (T88f17(C));
	if (t1) {
		T210f8(a1, (T4)(geint32(-1)));
	} else {
		T210f8(a1, (T4)(geint32(1)));
		if (l1) {
			T88f37(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].is_empty */
T2 T88f17(T0* C)
{
	T2 R = 0;
	R = ((((T88*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].off */
T2 T210f6(T0* C)
{
	T2 R = 0;
	R = (T88f18(((T210*)(C))->a5, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_off */
T2 T88f18(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T88f15(C, a1));
	if (!(t1)) {
		R = (T88f19(C, a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cursor_before */
T2 T88f19(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T210*)(a1))->a1);
	R = ((t1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].new_cursor */
T0* T88f11(T0* C)
{
	T0* R = 0;
	R = T210c7(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_VARIABLE].make */
T0* T210c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T210));
	((T210*)(C))->id = 210;
	((T210*)(C))->a5 = (a1);
	return C;
}

/* DS_NESTED_LIST_FLATTENER [PR_RULE].make */
T0* T89c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T89));
	((T89*)(C))->id = 89;
	return C;
}

/* DS_LINKED_LIST [PR_RULE].append_last */
void T91f15(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (T67f3(a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		l1 = (T67f12(a1));
		T192f10(l1);
		t2 = (T192f4(l1));
		l2 = T220c3(t2);
		l3 = (l2);
		T192f11(l1);
		t1 = (T192f5(l1));
		while (!(t1)) {
			t2 = (T192f4(l1));
			l4 = T220c3(t2);
			T220f4(l3, l4);
			l3 = (l4);
			T192f11(l1);
			t1 = (T192f5(l1));
		}
		t1 = (T91f7(C));
		if (t1) {
			((T91*)(C))->a4 = (l2);
			((T91*)(C))->a8 = (l3);
		} else {
			T220f4(((T91*)(C))->a8, l2);
			((T91*)(C))->a8 = (l3);
		}
		t3 = (((T67*)(a1))->a1);
		((T91*)(C))->a9 = ((T4)((((T91*)(C))->a9)+(t3)));
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].after */
T2 T192f5(T0* C)
{
	T2 R = 0;
	R = (T67f18(((T192*)(C))->a3, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].cursor_after */
T2 T67f18(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T192*)(a1))->a1);
	R = ((t1)==((T4)(geint32(-1))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].forth */
void T192f11(T0* C)
{
	T67f33(((T192*)(C))->a3, C);
}

/* DS_ARRAYED_LIST [PR_RULE].cursor_forth */
void T67f33(T0* C, T0* a1)
{
	T2 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (((T192*)(a1))->a1);
	l1 = ((l2)==((T4)(geint32(0))));
	l2 = ((T4)((l2)+((T4)(geint32(1)))));
	t1 = (T4f1(&l2, ((T67*)(C))->a1));
	if (t1) {
		l2 = ((T4)(geint32(-1)));
		t1 = ((T2)(!(l1)));
		if (t1) {
			T67f35(C, a1);
		}
	} else {
		if (l1) {
			T67f34(C, a1);
		}
	}
	T192f8(a1, l2);
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_position */
void T192f8(T0* C, T4 a1)
{
	((T192*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST [PR_RULE].add_traversing_cursor */
void T67f34(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T67*)(C))->a11));
	if (t1) {
		t2 = (((T192*)(((T67*)(C))->a11))->a2);
		T192f9(a1, t2);
		T192f9(((T67*)(C))->a11, a1);
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].set_next_cursor */
void T192f9(T0* C, T0* a1)
{
	((T192*)(C))->a2 = (a1);
}

/* DS_ARRAYED_LIST [PR_RULE].remove_traversing_cursor */
void T67f35(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T67*)(C))->a11));
	if (t1) {
		l2 = (((T67*)(C))->a11);
		l1 = (((T192*)(l2))->a2);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T192*)(l1))->a2);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T192*)(a1))->a2);
			T192f9(l2, t2);
			T192f9(a1, EIF_VOID);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].item */
T0* T192f4(T0* C)
{
	T0* R = 0;
	R = (T67f17(((T192*)(C))->a3, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].cursor_item */
T0* T67f17(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T192*)(a1))->a1);
	R = (T67f2(C, t1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].start */
void T192f10(T0* C)
{
	T67f32(((T192*)(C))->a3, C);
}

/* DS_ARRAYED_LIST [PR_RULE].cursor_start */
void T67f32(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T192f6(a1));
	t1 = (T67f3(C));
	if (t1) {
		T192f8(a1, (T4)(geint32(-1)));
	} else {
		T192f8(a1, (T4)(geint32(1)));
		if (l1) {
			T67f34(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].off */
T2 T192f6(T0* C)
{
	T2 R = 0;
	R = (T67f19(((T192*)(C))->a3, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].cursor_off */
T2 T67f19(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T67f18(C, a1));
	if (!(t1)) {
		R = (T67f20(C, a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].cursor_before */
T2 T67f20(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T192*)(a1))->a1);
	R = ((t1)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].new_cursor */
T0* T67f12(T0* C)
{
	T0* R = 0;
	R = T192c7(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_RULE].make */
T0* T192c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T192));
	((T192*)(C))->id = 192;
	((T192*)(C))->a3 = (a1);
	return C;
}

/* DS_ARRAYED_LIST [PR_RULE].is_empty */
T2 T67f3(T0* C)
{
	T2 R = 0;
	R = ((((T67*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_LINKED_LIST [PR_VARIABLE].force_last */
void T90f9(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = (T90f3(C));
	if (t1) {
		((T90*)(C))->a4 = T282c3(a1);
		((T90*)(C))->a5 = (((T90*)(C))->a4);
		((T90*)(C))->a6 = ((T4)(geint32(1)));
	} else {
		l1 = (((T90*)(C))->a5);
		((T90*)(C))->a5 = T282c3(a1);
		T282f4(l1, ((T90*)(C))->a5);
		((T90*)(C))->a6 = ((T4)((((T90*)(C))->a6)+((T4)(geint32(1)))));
	}
}

/* DS_LINKABLE [PR_VARIABLE].put_right */
void T282f4(T0* C, T0* a1)
{
	((T282*)(C))->a2 = (a1);
}

/* DS_LINKABLE [PR_VARIABLE].make */
T0* T282c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T282));
	((T282*)(C))->id = 282;
	((T282*)(C))->a1 = (a1);
	return C;
}

/* DS_LINKED_LIST [PR_VARIABLE].is_empty */
T2 T90f3(T0* C)
{
	T2 R = 0;
	R = ((((T90*)(C))->a6)==((T4)(geint32(0))));
	return R;
}

/* DS_ARRAYED_LIST [PR_SYMBOL].first */
T0* T77f10(T0* C)
{
	T0* R = 0;
	R = (((T202*)(((T77*)(C))->a4))->a2[(T4)(geint32(1))]);
	return R;
}

/* DS_ARRAYED_LIST [PR_SYMBOL].is_empty */
T2 T77f9(T0* C)
{
	T2 R = 0;
	R = ((((T77*)(C))->a1)==((T4)(geint32(0))));
	return R;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make */
T0* T55c33(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T55));
	((T55*)(C))->id = 55;
	((T55*)(C))->a8 = T38c2();
	T55f37(C, a1, EIF_VOID, ((T55*)(C))->a8);
	return C;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_with_equality_testers */
void T55f37(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T55*)(C))->a22 = (a2);
	((T55*)(C))->a8 = (a3);
	T55f47(C, a1);
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_sparse_container */
void T55f47(T0* C, T4 a1)
{
	T4 t1;
	((T55*)(C))->a1 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T55f48(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T55f49(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T55f50(C, t1);
	((T55*)(C))->a10 = (T55f9(C, a1));
	t1 = ((T4)((((T55*)(C))->a10)+((T4)(geint32(1)))));
	T55f51(C, t1);
	((T55*)(C))->a11 = ((T4)(geint32(0)));
	((T55*)(C))->a17 = ((T4)(geint32(0)));
	((T55*)(C))->a4 = ((T4)(geint32(0)));
	T55f38(C);
	((T55*)(C))->a30 = (T55f31(C));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].new_cursor */
T0* T55f31(T0* C)
{
	T0* R = 0;
	R = T183c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [DS_ARRAYED_LIST [PR_STATE], INTEGER].make */
T0* T183c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T183));
	((T183*)(C))->id = 183;
	((T183*)(C))->a1 = (a1);
	((T183*)(C))->a2 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_slots */
void T55f51(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T55f25(C));
	((T55*)(C))->a24 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_clashes */
void T55f50(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T55f25(C));
	((T55*)(C))->a26 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_keys */
void T55f49(T0* C, T4 a1)
{
	((T55*)(C))->a29 = T129c4();
	((T55*)(C))->a28 = (T129f1(((T55*)(C))->a29, a1));
}

/* DS_HASH_TABLE [DS_ARRAYED_LIST [PR_STATE], INTEGER].make_items */
void T55f48(T0* C, T4 a1)
{
	((T55*)(C))->a27 = T182c3();
	((T55*)(C))->a7 = (T182f2(((T55*)(C))->a27, a1));
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].make */
T0* T182f2(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T258c2(a1);
	R = (((T258*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_STATE]].make_area */
T0* T258c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T258));
	((T258*)(C))->id = 258;
	((T258*)(C))->a1 = T181c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_STATE]].default_create */
T0* T182c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T182));
	((T182*)(C))->id = 182;
	return C;
}

/* KL_EQUALITY_TESTER [INTEGER].default_create */
T0* T38c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T38));
	((T38*)(C))->id = 38;
	return C;
}

/* DS_ARRAYED_LIST [PR_STATE].make */
T0* T54c14(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T54));
	((T54*)(C))->id = 54;
	((T54*)(C))->a8 = T179c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T54*)(C))->a7 = (T179f1(((T54*)(C))->a8, t1));
	((T54*)(C))->a4 = (a1);
	((T54*)(C))->a9 = (T54f10(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_STATE].new_cursor */
T0* T54f10(T0* C)
{
	T0* R = 0;
	R = T180c4(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_STATE].make */
T0* T180c4(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T180));
	((T180*)(C))->id = 180;
	((T180*)(C))->a3 = (a1);
	return C;
}

/* PR_GRAMMAR.set_nullable */
void T26f21(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T2 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T0* l12 = 0;
	T0* l13 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T4 t4;
	l3 = (((T67*)(((T26*)(C))->a1))->a1);
	l12 = T169c9(l3);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l3));
	while (!(t1)) {
		l4 = (T67f2(((T26*)(C))->a1, l1));
		l7 = (((T69*)(l4))->a2);
		l9 = (((T69*)(l4))->a1);
		t1 = (T77f9(l9));
		if (t1) {
			T70f20(l7);
		} else {
			t1 = (((T70*)(l7))->a11);
			t1 = ((T2)(!(t1)));
			if (t1) {
				l2 = (((T77*)(l9))->a1);
				t2 = ((T4)((l2)+((T4)(geint32(1)))));
				l10 = T88c20(t2);
				T88f21(l10, l7);
				l5 = (EIF_FALSE);
				if (!(l5)) {
					t1 = ((T2)((l2)<((T4)(geint32(1)))));
				} else {
					t1 = EIF_TRUE;
				}
				while (!(t1)) {
					t3 = (T77f2(l9, l2));
					if ((t3)==EIF_VOID) {
						l8 = EIF_VOID;
					} else {
						switch ((t3)->id) {
						case 70:
							l8 = t3;
							break;
						default:
							l8 = EIF_VOID;
						}
					}
					t1 = ((l8)==(EIF_VOID));
					if (t1) {
						l5 = (EIF_TRUE);
					} else {
						t1 = (((T70*)(l8))->a11);
						t1 = ((T2)(!(t1)));
						if (t1) {
							T88f22(l10, l8);
						}
					}
					l2 = ((T4)((l2)-((T4)(geint32(1)))));
					if (!(l5)) {
						t1 = ((T2)((l2)<((T4)(geint32(1)))));
					} else {
						t1 = EIF_TRUE;
					}
				}
				t1 = ((T2)(!(l5)));
				if (t1) {
					t2 = (((T88*)(l10))->a1);
					t1 = (T4f1(&t2, (T4)(geint32(1))));
					if (t1) {
						T169f10(l12, l10);
					} else {
						T70f20(l7);
					}
				}
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l3));
	}
	t2 = (((T169*)(l12))->a1);
	l11 = T169c9(t2);
	t2 = (((T169*)(l11))->a1);
	t4 = (((T169*)(l12))->a1);
	t1 = ((t2)==(t4));
	while (!(t1)) {
		l13 = (l11);
		l11 = (l12);
		l12 = (l13);
		T169f11(l12);
		l3 = (((T169*)(l11))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l3));
		while (!(t1)) {
			l10 = (T169f2(l11, l1));
			t3 = (T88f4(l10));
			t1 = (((T70*)(t3))->a11);
			t1 = ((T2)(!(t1)));
			if (t1) {
				l2 = (((T88*)(l10))->a1);
				l6 = (EIF_FALSE);
				if (!(l6)) {
					t1 = ((l2)==((T4)(geint32(1))));
				} else {
					t1 = EIF_TRUE;
				}
				while (!(t1)) {
					t3 = (T88f5(l10));
					t1 = (((T70*)(t3))->a11);
					if (t1) {
						T88f23(l10);
						l2 = ((T4)((l2)-((T4)(geint32(1)))));
					} else {
						l6 = (EIF_TRUE);
					}
					if (!(l6)) {
						t1 = ((l2)==((T4)(geint32(1))));
					} else {
						t1 = EIF_TRUE;
					}
				}
				t1 = ((T2)(!(l6)));
				if (t1) {
					t3 = (T88f4(l10));
					T70f20(t3);
				} else {
					T169f10(l12, l10);
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l3));
		}
		t2 = (((T169*)(l11))->a1);
		t4 = (((T169*)(l12))->a1);
		t1 = ((t2)==(t4));
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].remove_last */
void T88f23(T0* C)
{
	T0* l1 = 0;
	T88f27(C);
	((T208*)(((T88*)(C))->a6))->a2[((T88*)(C))->a1] = (l1);
	((T88*)(C))->a1 = ((T4)((((T88*)(C))->a1)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_LIST [PR_VARIABLE].move_last_cursors_after */
void T88f27(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T88*)(C))->a1);
	l2 = (((T88*)(C))->a10);
	t1 = (((T210*)(l2))->a1);
	t2 = ((t1)==(l1));
	if (t2) {
		T210f8(l2, (T4)(geint32(-1)));
	}
	l3 = (l2);
	l2 = (((T210*)(l2))->a2);
	t2 = ((l2)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T210*)(l2))->a1);
		t2 = ((t1)==(l1));
		if (t2) {
			T210f8(l2, (T4)(geint32(-1)));
			l4 = (((T210*)(l2))->a2);
			T210f9(l3, l4);
			T210f9(l2, EIF_VOID);
			l2 = (l4);
		} else {
			l3 = (l2);
			l2 = (((T210*)(l2))->a2);
		}
		t2 = ((l2)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].last */
T0* T88f5(T0* C)
{
	T0* R = 0;
	R = (((T208*)(((T88*)(C))->a6))->a2[((T88*)(C))->a1]);
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].first */
T0* T88f4(T0* C)
{
	T0* R = 0;
	R = (((T208*)(((T88*)(C))->a6))->a2[(T4)(geint32(1))]);
	return R;
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].item */
T0* T169f2(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T253*)(((T169*)(C))->a3))->a2[a1]);
	return R;
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].wipe_out */
void T169f11(T0* C)
{
	T169f12(C);
	T169f13(C, (T4)(geint32(1)), ((T169*)(C))->a1);
	((T169*)(C))->a1 = ((T4)(geint32(0)));
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].clear_items */
void T169f13(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (a1);
	t1 = (T4f1(&l2, a2));
	while (!(t1)) {
		((T253*)(((T169*)(C))->a3))->a2[l2] = (l1);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, a2));
	}
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].move_all_cursors_after */
void T169f12(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T169*)(C))->a6);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T255f5(l1, (T4)(geint32(-1)));
		l2 = (((T255*)(l1))->a1);
		T255f6(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_next_cursor */
void T255f6(T0* C, T0* a1)
{
	((T255*)(C))->a1 = (a1);
}

/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].set_position */
void T255f5(T0* C, T4 a1)
{
	((T255*)(C))->a3 = (a1);
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].put_last */
void T169f10(T0* C, T0* a1)
{
	((T169*)(C))->a1 = ((T4)((((T169*)(C))->a1)+((T4)(geint32(1)))));
	((T253*)(((T169*)(C))->a3))->a2[((T169*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].put_last */
void T88f22(T0* C, T0* a1)
{
	((T88*)(C))->a1 = ((T4)((((T88*)(C))->a1)+((T4)(geint32(1)))));
	((T208*)(((T88*)(C))->a6))->a2[((T88*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].put_first */
void T88f21(T0* C, T0* a1)
{
	T88f26(C, a1, (T4)(geint32(1)));
}

/* DS_ARRAYED_LIST [PR_VARIABLE].put */
void T88f26(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T88*)(C))->a1)+((T4)(geint32(1)))));
	t2 = ((a2)==(t1));
	if (t2) {
		T88f22(C, a1);
	} else {
		T88f32(C, a2, (T4)(geint32(1)));
		T88f33(C, a2, (T4)(geint32(1)));
		((T208*)(((T88*)(C))->a6))->a2[a2] = (a1);
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_right */
void T88f33(T0* C, T4 a1, T4 a2)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T88*)(C))->a10);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		l2 = (((T210*)(l1))->a1);
		t1 = (T4f4(&l2, a1));
		if (t1) {
			t2 = ((T4)((l2)+(a2)));
			T210f8(l1, t2);
		}
		l1 = (((T210*)(l1))->a2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].move_right */
void T88f32(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (((T88*)(C))->a1);
	((T88*)(C))->a1 = ((T4)((((T88*)(C))->a1)+(a2)));
	t1 = ((T2)((l1)<(a1)));
	while (!(t1)) {
		t2 = (((T208*)(((T88*)(C))->a6))->a2[l1]);
		t3 = ((T4)((l1)+(a2)));
		((T208*)(((T88*)(C))->a6))->a2[t3] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<(a1)));
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].make */
T0* T88c20(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T88));
	((T88*)(C))->id = 88;
	((T88*)(C))->a8 = T209c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T88*)(C))->a6 = (T209f1(((T88*)(C))->a8, t1));
	((T88*)(C))->a9 = (a1);
	((T88*)(C))->a10 = (T88f11(C));
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_VARIABLE].make */
T0* T209f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T265c2(a1);
	R = (((T265*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_VARIABLE].make_area */
T0* T265c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T265));
	((T265*)(C))->id = 265;
	((T265*)(C))->a1 = T208c5(a1);
	return C;
}

/* SPECIAL [PR_VARIABLE].make */
T0* T208c5(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T208)+a1*sizeof(T0*));
	((T208*)(C))->a1 = a1;
	((T208*)(C))->id = 208;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_VARIABLE].default_create */
T0* T209c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T209));
	((T209*)(C))->id = 209;
	return C;
}

/* PR_VARIABLE.set_nullable */
void T70f20(T0* C)
{
	((T70*)(C))->a11 = (EIF_TRUE);
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].make */
T0* T169c9(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T169));
	((T169*)(C))->id = 169;
	((T169*)(C))->a4 = T254c2();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T169*)(C))->a3 = (T254f1(((T169*)(C))->a4, t1));
	((T169*)(C))->a5 = (a1);
	((T169*)(C))->a6 = (T169f7(C));
	return C;
}

/* DS_ARRAYED_LIST [DS_ARRAYED_LIST [PR_VARIABLE]].new_cursor */
T0* T169f7(T0* C)
{
	T0* R = 0;
	R = T255c4(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [DS_ARRAYED_LIST [PR_VARIABLE]].make */
T0* T255c4(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T255));
	((T255*)(C))->id = 255;
	((T255*)(C))->a2 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].make */
T0* T254f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T273c2(a1);
	R = (((T273*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make_area */
T0* T273c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T273));
	((T273*)(C))->id = 273;
	((T273*)(C))->a1 = T253c2(a1);
	return C;
}

/* SPECIAL [DS_ARRAYED_LIST [PR_VARIABLE]].make */
T0* T253c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T253)+a1*sizeof(T0*));
	((T253*)(C))->a1 = a1;
	((T253*)(C))->id = 253;
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
T0* T254c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T254));
	((T254*)(C))->id = 254;
	return C;
}

/* PR_GRAMMAR.reduce */
void T26f23(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T26f28(C);
	T26f29(C);
	l1 = ((T4)(geint32(1)));
	t1 = (((T67*)(((T26*)(C))->a1))->a1);
	t2 = (T4f1(&l1, t1));
	while (!(t2)) {
		l3 = (T67f2(((T26*)(C))->a1, l1));
		t2 = (((T69*)(l3))->a14);
		if (t2) {
			T69f28(l3, l1);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
		} else {
			T67f22(((T26*)(C))->a1, l1);
			l7 = ((T4)((l7)+((T4)(geint32(1)))));
		}
		t1 = (((T67*)(((T26*)(C))->a1))->a1);
		t2 = (T4f1(&l1, t1));
	}
	l1 = ((T4)(geint32(1)));
	t1 = (((T88*)(((T26*)(C))->a5))->a1);
	t2 = (T4f1(&l1, t1));
	while (!(t2)) {
		l4 = (T88f2(((T26*)(C))->a5, l1));
		t2 = (((T70*)(l4))->a3);
		if (t2) {
			t1 = ((T4)((l1)-((T4)(geint32(1)))));
			T70f22(l4, t1);
			l5 = (((T70*)(l4))->a1);
			l2 = (((T67*)(l5))->a1);
			t2 = ((T2)((l2)<((T4)(geint32(1)))));
			while (!(t2)) {
				t3 = (T67f2(l5, l2));
				t2 = (((T69*)(t3))->a14);
				t2 = ((T2)(!(t2)));
				if (t2) {
					T67f22(l5, l2);
				}
				l2 = ((T4)((l2)-((T4)(geint32(1)))));
				t2 = ((T2)((l2)<((T4)(geint32(1)))));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
		} else {
			T88f24(((T26*)(C))->a5, l1);
			l6 = ((T4)((l6)+((T4)(geint32(1)))));
		}
		t1 = (((T88*)(((T26*)(C))->a5))->a1);
		t2 = (T4f1(&l1, t1));
	}
	t2 = (T4f1(&l6, (T4)(geint32(0))));
	if (!(t2)) {
		t2 = (T4f1(&l7, (T4)(geint32(0))));
	}
	if (t2) {
		l8 = T16c25((T4)(geint32(128)));
		T16f26(l8, gems("Parser contains ", 16));
		t2 = ((l6)==((T4)(geint32(1))));
		if (t2) {
			T16f26(l8, gems("1 useless nonterminal", 21));
		} else {
			t2 = (T4f1(&l6, (T4)(geint32(1))));
			if (t2) {
				t3 = (T26f14(C));
				T63f2(t3, l6, l8);
				T16f26(l8, gems(" useless nonterminals", 21));
			}
		}
		t2 = (T4f1(&l6, (T4)(geint32(0))));
		if (t2) {
			t2 = (T4f1(&l7, (T4)(geint32(0))));
		}
		if (t2) {
			T16f26(l8, gems(" and ", 5));
		}
		t2 = ((l7)==((T4)(geint32(1))));
		if (t2) {
			T16f26(l8, gems("1 useless rule", 14));
		} else {
			t2 = (T4f1(&l7, (T4)(geint32(1))));
			if (t2) {
				t3 = (T26f14(C));
				T63f2(t3, l7, l8);
				T16f26(l8, gems(" useless rules", 14));
			}
		}
		T16f26(l8, gems(".\n", 2));
		l9 = T59c7(l8);
		T25f9(a1, l9);
	}
}

/* PR_GRAMMAR.integer_ */
T0* T26f14(T0* C)
{
	T0* R = 0;
	if (ge255os1336) {
		return ge255ov1336;
	} else {
		ge255os1336 = '\1';
	}
	R = T63c1();
	ge255ov1336 = R;
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].remove */
void T88f24(T0* C, T4 a1)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==(((T88*)(C))->a1));
	if (t1) {
		T88f23(C);
	} else {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T88f28(C, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T88f29(C, t2, (T4)(geint32(1)));
		t2 = ((T4)((((T88*)(C))->a1)+((T4)(geint32(1)))));
		((T208*)(((T88*)(C))->a6))->a2[t2] = (l1);
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].move_left */
void T88f29(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (a1);
	l2 = (((T88*)(C))->a1);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T208*)(((T88*)(C))->a6))->a2[l1]);
		t3 = ((T4)((l1)-(a2)));
		((T208*)(((T88*)(C))->a6))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	((T88*)(C))->a1 = ((T4)((((T88*)(C))->a1)-(a2)));
}

/* DS_ARRAYED_LIST [PR_VARIABLE].move_cursors_left */
void T88f28(T0* C, T4 a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	l2 = (((T88*)(C))->a10);
	t1 = ((l2)==(EIF_VOID));
	while (!(t1)) {
		l1 = (((T210*)(l2))->a1);
		t1 = (T4f4(&l1, a1));
		if (t1) {
			t2 = ((T4)((l1)-((T4)(geint32(1)))));
			T210f8(l2, t2);
		}
		l2 = (((T210*)(l2))->a2);
		t1 = ((l2)==(EIF_VOID));
	}
}

/* PR_VARIABLE.set_id */
void T70f22(T0* C, T4 a1)
{
	((T70*)(C))->a5 = (a1);
}

/* DS_ARRAYED_LIST [PR_RULE].remove */
void T67f22(T0* C, T4 a1)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)==(((T67*)(C))->a1));
	if (t1) {
		T67f26(C);
	} else {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T67f27(C, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T67f28(C, t2, (T4)(geint32(1)));
		t2 = ((T4)((((T67*)(C))->a1)+((T4)(geint32(1)))));
		((T190*)(((T67*)(C))->a7))->a2[t2] = (l1);
	}
}

/* DS_ARRAYED_LIST [PR_RULE].move_left */
void T67f28(T0* C, T4 a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (a1);
	l2 = (((T67*)(C))->a1);
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (((T190*)(((T67*)(C))->a7))->a2[l1]);
		t3 = ((T4)((l1)-(a2)));
		((T190*)(((T67*)(C))->a7))->a2[t3] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	((T67*)(C))->a1 = ((T4)((((T67*)(C))->a1)-(a2)));
}

/* DS_ARRAYED_LIST [PR_RULE].move_cursors_left */
void T67f27(T0* C, T4 a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	l2 = (((T67*)(C))->a11);
	t1 = ((l2)==(EIF_VOID));
	while (!(t1)) {
		l1 = (((T192*)(l2))->a1);
		t1 = (T4f4(&l1, a1));
		if (t1) {
			t2 = ((T4)((l1)-((T4)(geint32(1)))));
			T192f8(l2, t2);
		}
		l2 = (((T192*)(l2))->a2);
		t1 = ((l2)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST [PR_RULE].remove_last */
void T67f26(T0* C)
{
	T0* l1 = 0;
	T67f31(C);
	((T190*)(((T67*)(C))->a7))->a2[((T67*)(C))->a1] = (l1);
	((T67*)(C))->a1 = ((T4)((((T67*)(C))->a1)-((T4)(geint32(1)))));
}

/* DS_ARRAYED_LIST [PR_RULE].move_last_cursors_after */
void T67f31(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 t1;
	T2 t2;
	l1 = (((T67*)(C))->a1);
	l2 = (((T67*)(C))->a11);
	t1 = (((T192*)(l2))->a1);
	t2 = ((t1)==(l1));
	if (t2) {
		T192f8(l2, (T4)(geint32(-1)));
	}
	l3 = (l2);
	l2 = (((T192*)(l2))->a2);
	t2 = ((l2)==(EIF_VOID));
	while (!(t2)) {
		t1 = (((T192*)(l2))->a1);
		t2 = ((t1)==(l1));
		if (t2) {
			T192f8(l2, (T4)(geint32(-1)));
			l4 = (((T192*)(l2))->a2);
			T192f9(l3, l4);
			T192f9(l2, EIF_VOID);
			l2 = (l4);
		} else {
			l3 = (l2);
			l2 = (((T192*)(l2))->a2);
		}
		t2 = ((l2)==(EIF_VOID));
	}
}

/* PR_RULE.set_id */
void T69f28(T0* C, T4 a1)
{
	((T69*)(C))->a6 = (a1);
}

/* PR_GRAMMAR.mark_useful_rules */
void T26f29(T0* C)
{
	T2 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = ((((T26*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		l1 = (((T70*)(((T26*)(C))->a3))->a3);
	} else {
		l1 = EIF_FALSE;
	}
	l2 = (((T88*)(((T26*)(C))->a5))->a1);
	t1 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T88f2(((T26*)(C))->a5, l2));
		T70f18(t2, EIF_FALSE);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t1 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	if (l1) {
		T70f18(((T26*)(C))->a3, EIF_TRUE);
		T26f30(C, ((T26*)(C))->a3);
	}
	l2 = (((T67*)(((T26*)(C))->a1))->a1);
	t1 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t1)) {
		l3 = (T67f2(((T26*)(C))->a1, l2));
		t2 = (((T69*)(l3))->a2);
		t1 = (((T70*)(t2))->a3);
		t1 = ((T2)(!(t1)));
		if (t1) {
			T69f29(l3, EIF_FALSE);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t1 = ((T2)((l2)<((T4)(geint32(1)))));
	}
}

/* PR_RULE.set_useful */
void T69f29(T0* C, T2 a1)
{
	((T69*)(C))->a14 = (a1);
}

/* PR_GRAMMAR.traverse_variable */
void T26f30(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T2 t1;
	l2 = (((T70*)(a1))->a1);
	l6 = (((T67*)(l2))->a1);
	t1 = ((T2)((l6)<((T4)(geint32(1)))));
	while (!(t1)) {
		l5 = (T67f2(l2, l6));
		t1 = (((T69*)(l5))->a14);
		if (t1) {
			l1 = (((T69*)(l5))->a1);
			l7 = (((T77*)(l1))->a1);
			t1 = ((T2)((l7)<((T4)(geint32(1)))));
			while (!(t1)) {
				l4 = (T77f2(l1, l7));
				if ((l4)==EIF_VOID) {
					l3 = EIF_VOID;
				} else {
					switch ((l4)->id) {
					case 70:
						l3 = l4;
						break;
					default:
						l3 = EIF_VOID;
					}
				}
				t1 = ((l3)!=(EIF_VOID));
				if (t1) {
					t1 = (((T70*)(l3))->a3);
					t1 = ((T2)(!(t1)));
					if (t1) {
						T70f18(l3, EIF_TRUE);
						T26f30(C, l3);
					}
				} else {
					if ((l4)->id==70) {
						T70f18(l4, EIF_TRUE);
					} else {
						T81f28(l4, EIF_TRUE);
					}
				}
				l7 = ((T4)((l7)-((T4)(geint32(1)))));
				t1 = ((T2)((l7)<((T4)(geint32(1)))));
			}
		}
		l6 = ((T4)((l6)-((T4)(geint32(1)))));
		t1 = ((T2)((l6)<((T4)(geint32(1)))));
	}
}

/* PR_TOKEN.set_useful */
void T81f28(T0* C, T2 a1)
{
	((T81*)(C))->a14 = (a1);
}

/* PR_VARIABLE.set_useful */
void T70f18(T0* C, T2 a1)
{
	((T70*)(C))->a3 = (a1);
}

/* PR_GRAMMAR.mark_useful_variables */
void T26f28(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T2 l7 = 0;
	T4 l8 = 0;
	T2 t1;
	l8 = (((T67*)(((T26*)(C))->a1))->a1);
	l7 = (EIF_TRUE);
	t1 = ((T2)(!(l7)));
	while (!(t1)) {
		l7 = (EIF_FALSE);
		l5 = ((T4)(geint32(1)));
		t1 = (T4f1(&l5, l8));
		while (!(t1)) {
			l4 = (T67f2(((T26*)(C))->a1, l5));
			t1 = (((T69*)(l4))->a14);
			t1 = ((T2)(!(t1)));
			if (t1) {
				T69f29(l4, EIF_TRUE);
				l1 = (((T69*)(l4))->a1);
				l6 = (((T77*)(l1))->a1);
				t1 = ((T2)((l6)<((T4)(geint32(1)))));
				while (!(t1)) {
					l3 = (T77f2(l1, l6));
					t1 = ((((l3)->id==70)?EIF_FALSE:EIF_TRUE));
					if (!(t1)) {
						t1 = ((((l3)->id==70)?((T70*)(l3))->a3:((T81*)(l3))->a14));
					}
					if (t1) {
						l6 = ((T4)((l6)-((T4)(geint32(1)))));
					} else {
						T69f29(l4, EIF_FALSE);
						l6 = ((T4)(geint32(0)));
					}
					t1 = ((T2)((l6)<((T4)(geint32(1)))));
				}
				t1 = (((T69*)(l4))->a14);
				if (t1) {
					l2 = (((T69*)(l4))->a2);
					t1 = (((T70*)(l2))->a3);
					t1 = ((T2)(!(t1)));
					if (t1) {
						T70f18(l2, EIF_TRUE);
						l7 = (EIF_TRUE);
					}
				}
				l6 = ((T4)((l6)-((T4)(geint32(1)))));
			}
			l5 = ((T4)((l5)+((T4)(geint32(1)))));
			t1 = (T4f1(&l5, l8));
		}
		t1 = ((T2)(!(l7)));
	}
}

/* PR_FSM.make_verbose */
T0* T19c10(T0* a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T19));
	((T19*)(C))->id = 19;
	T26f20(a1, a2, a3);
	T26f21(a1);
	T19f12(C, a1);
	T19f13(C, a2, a3);
	T19f14(C, a2, a3);
	T19f15(C, a3);
	return C;
}

/* PR_FSM.print_machine */
void T19f15(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T26f22(((T19*)(C))->a1, a1);
	l2 = (((T54*)(((T19*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T54f2(((T19*)(C))->a2, l1));
		T56f30(t2, a1);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* PR_STATE.print_state */
void T56f30(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 l6 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T2 t4;
	T21f23(a1, gems("\n\nstate ", 8));
	T21f24(a1, ((T56*)(C))->a6);
	T21f23(a1, gems("\n\n", 2));
	l2 = (((T64*)(((T56*)(C))->a5))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		T21f25(a1, (T1)('\t'));
		t2 = (T64f2(((T56*)(C))->a5, l1));
		T65f13(t2, a1);
		T21f25(a1, (T1)('\n'));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	T21f25(a1, (T1)('\n'));
	t1 = (T54f12(((T56*)(C))->a1));
	if (t1) {
		t1 = (T82f8(((T56*)(C))->a10));
	}
	if (t1) {
		t3 = ((((((T56*)(C))->a7)->id==81)?((T81*)(((T56*)(C))->a7))->a8:((T70*)(((T56*)(C))->a7))->a5));
		t1 = ((t3)==((T4)(geint32(0))));
		if (t1) {
			T21f23(a1, gems("\t$default\taccept\n", 17));
		} else {
			T21f23(a1, gems("\tNO ACTIONS\n", 12));
		}
	} else {
		l2 = (((T54*)(((T56*)(C))->a1))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			l3 = (T54f2(((T56*)(C))->a1, l1));
			l4 = (((T56*)(l3))->a7);
			t1 = ((((l4)->id==81)?EIF_TRUE:EIF_FALSE));
			if (t1) {
				l6 = (EIF_TRUE);
				t3 = ((((l4)->id==81)?((T81*)(l4))->a8:((T70*)(l4))->a5));
				t1 = ((t3)==((T4)(geint32(0))));
				if (t1) {
					T21f23(a1, gems("\t$\t", 3));
				} else {
					T21f25(a1, (T1)('\t'));
					t2 = ((((l4)->id==81)?((T81*)(l4))->a3:((T70*)(l4))->a6));
					T21f23(a1, t2);
					T21f23(a1, gems("\tshift, and ", 12));
				}
				T21f23(a1, gems("go to state ", 12));
				t3 = (((T56*)(l3))->a6);
				T21f24(a1, t3);
				T21f25(a1, (T1)('\n'));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
		if (l6) {
			T21f25(a1, (T1)('\n'));
			l6 = (EIF_FALSE);
		}
		l2 = (((T95*)(((T56*)(C))->a12))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			T21f25(a1, (T1)('\t'));
			t2 = (T95f2(((T56*)(C))->a12, l1));
			t2 = (((T81*)(t2))->a3);
			T21f23(a1, t2);
			T21f23(a1, gems("\terror (nonassociative)\n", 24));
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
		t1 = (T4f1(&l2, (T4)(geint32(0))));
		if (t1) {
			T21f25(a1, (T1)('\n'));
		}
		if (((T56*)(C))->a17) {
			t4 = (T82f8(((T56*)(C))->a10));
			t1 = ((T2)(!(t4)));
		} else {
			t1 = EIF_FALSE;
		}
		if (t1) {
			T56f34(C, a1);
		} else {
			t1 = (T82f8(((T56*)(C))->a10));
			t1 = ((T2)(!(t1)));
			if (t1) {
				t2 = (T82f10(((T56*)(C))->a10));
				l5 = (((T87*)(t2))->a1);
				T21f23(a1, gems("\t$default\treduce using rule ", 28));
				t3 = (((T69*)(l5))->a6);
				T21f24(a1, t3);
				T21f23(a1, gems(" (", 2));
				t2 = (((T69*)(l5))->a2);
				t2 = (((T70*)(t2))->a6);
				T21f23(a1, t2);
				T21f23(a1, gems(")\n\n", 3));
			}
		}
		l2 = (((T54*)(((T56*)(C))->a1))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			l3 = (T54f2(((T56*)(C))->a1, l1));
			l4 = (((T56*)(l3))->a7);
			t1 = ((((l4)->id==81)?EIF_TRUE:EIF_FALSE));
			t1 = ((T2)(!(t1)));
			if (t1) {
				l6 = (EIF_TRUE);
				T21f25(a1, (T1)('\t'));
				t2 = ((((l4)->id==81)?((T81*)(l4))->a3:((T70*)(l4))->a6));
				T21f23(a1, t2);
				T21f23(a1, gems("\tgo to state ", 13));
				t3 = (((T56*)(l3))->a6);
				T21f24(a1, t3);
				T21f25(a1, (T1)('\n'));
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
		if (l6) {
			T21f25(a1, (T1)('\n'));
			l6 = (EIF_FALSE);
		}
	}
}

/* PR_STATE.print_reductions */
void T56f34(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T4 l12 = 0;
	T4 l13 = 0;
	T4 l14 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T4 t4;
	T4 t5;
	l12 = (((T54*)(((T56*)(C))->a1))->a1);
	l3 = T95c19(l12);
	t1 = ((T2)((l12)<((T4)(geint32(1)))));
	while (!(t1)) {
		t2 = (T54f2(((T56*)(C))->a1, l12));
		t2 = (((T56*)(t2))->a7);
		if ((t2)==EIF_VOID) {
			l9 = EIF_VOID;
		} else {
			switch ((t2)->id) {
			case 81:
				l9 = t2;
				break;
			default:
				l9 = EIF_VOID;
			}
		}
		t1 = ((l9)!=(EIF_VOID));
		if (t1) {
			T95f21(l3, l9);
			t3 = (((T81*)(l9))->a8);
			t1 = ((t3)==((T4)(geint32(1))));
			if (t1) {
				l1 = (EIF_TRUE);
			}
		}
		l12 = ((T4)((l12)-((T4)(geint32(1)))));
		t1 = ((T2)((l12)<((T4)(geint32(1)))));
	}
	t3 = (((T82*)(((T56*)(C))->a10))->a7);
	t1 = ((t3)==((T4)(geint32(1))));
	if (t1) {
		t1 = ((T2)(!(l1)));
	}
	if (t1) {
		l6 = (T82f10(((T56*)(C))->a10));
		l8 = (((T87*)(l6))->a1);
		l5 = (((T87*)(l6))->a2);
		l12 = (((T95*)(l5))->a1);
		t1 = ((T2)((l12)<((T4)(geint32(1)))));
		while (!(t1)) {
			l9 = (T95f2(l5, l12));
			t1 = (T95f9(l3, l9));
			if (!(t1)) {
				t1 = (T95f9(((T56*)(C))->a12, l9));
			}
			if (t1) {
				T21f25(a1, (T1)('\t'));
				t2 = (((T81*)(l9))->a3);
				T21f23(a1, t2);
				T21f23(a1, gems("\t[reduce using rule ", 20));
				t3 = (((T69*)(l8))->a6);
				T21f24(a1, t3);
				T21f23(a1, gems(" (", 2));
				t2 = (((T69*)(l8))->a2);
				t2 = (((T70*)(t2))->a6);
				T21f23(a1, t2);
				T21f23(a1, gems(")]\n", 3));
			}
			l12 = ((T4)((l12)-((T4)(geint32(1)))));
			t1 = ((T2)((l12)<((T4)(geint32(1)))));
		}
		T21f23(a1, gems("\t$default\treduce using rule ", 28));
		t3 = (((T69*)(l8))->a6);
		T21f24(a1, t3);
		T21f23(a1, gems(" (", 2));
		t2 = (((T69*)(l8))->a2);
		t2 = (((T70*)(t2))->a6);
		T21f23(a1, t2);
		T21f23(a1, gems(")\n\n", 3));
	} else {
		t3 = (((T82*)(((T56*)(C))->a10))->a7);
		t1 = (T4f4(&t3, (T4)(geint32(1))));
		if (t1) {
			t3 = (T4)(geint32(2));
			t4 = (((T95*)(l3))->a1);
			t5 = (((T95*)(((T56*)(C))->a12))->a1);
			t4 = ((T4)((t4)+(t5)));
			t3 = ((T4)((t3)*(t4)));
			l4 = T95c19(t3);
			T95f24(l4, l3);
			T95f24(l4, ((T56*)(C))->a12);
			t1 = ((T2)(!(l1)));
			if (t1) {
				l12 = (((T82*)(((T56*)(C))->a10))->a7);
				t1 = ((T2)((l12)<((T4)(geint32(1)))));
				while (!(t1)) {
					l6 = (T82f9(((T56*)(C))->a10, l12));
					l5 = (((T87*)(l6))->a2);
					l13 = (((T95*)(l5))->a1);
					t1 = ((T2)((l13)<((T4)(geint32(1)))));
					while (!(t1)) {
						l9 = (T95f2(l5, l13));
						t1 = (T95f9(l4, l9));
						t1 = ((T2)(!(t1)));
						if (t1) {
							T95f23(l4, l9);
							l10 = ((T4)((l10)+((T4)(geint32(1)))));
						}
						l13 = ((T4)((l13)-((T4)(geint32(1)))));
						t1 = ((T2)((l13)<((T4)(geint32(1)))));
					}
					l12 = ((T4)((l12)-((T4)(geint32(1)))));
					t1 = ((T2)((l12)<((T4)(geint32(1)))));
				}
				t1 = (T4f1(&l10, l11));
				if (t1) {
					l11 = (l10);
					l7 = (l6);
				}
				l10 = ((T4)(geint32(0)));
			}
			l12 = (((T95*)(l4))->a1);
			t1 = ((T2)((l12)<((T4)(geint32(1)))));
			while (!(t1)) {
				l9 = (T95f2(l4, l12));
				l2 = (EIF_FALSE);
				t1 = (T95f9(l3, l9));
				if (t1) {
					l10 = ((T4)(geint32(1)));
				} else {
					l10 = ((T4)(geint32(0)));
				}
				l14 = (((T82*)(((T56*)(C))->a10))->a7);
				l13 = ((T4)(geint32(1)));
				t1 = (T4f1(&l13, l14));
				while (!(t1)) {
					l6 = (T82f9(((T56*)(C))->a10, l13));
					t2 = (((T87*)(l6))->a2);
					t1 = (T95f9(t2, l9));
					if (t1) {
						t1 = ((l10)==((T4)(geint32(0))));
						if (t1) {
							t1 = ((l6)!=(l7));
							if (t1) {
								l8 = (((T87*)(l6))->a1);
								T21f25(a1, (T1)('\t'));
								t2 = (((T81*)(l9))->a3);
								T21f23(a1, t2);
								T21f23(a1, gems("\treduce using rule ", 19));
								t3 = (((T69*)(l8))->a6);
								T21f24(a1, t3);
								T21f23(a1, gems(" (", 2));
								t2 = (((T69*)(l8))->a2);
								t2 = (((T70*)(t2))->a6);
								T21f23(a1, t2);
								T21f23(a1, gems(")\n", 2));
							} else {
								l2 = (EIF_TRUE);
							}
							l10 = ((T4)((l10)+((T4)(geint32(1)))));
						} else {
							if (l2) {
								l8 = (((T87*)(l7))->a1);
								T21f25(a1, (T1)('\t'));
								t2 = (((T81*)(l9))->a3);
								T21f23(a1, t2);
								T21f23(a1, gems("\treduce using rule ", 19));
								t3 = (((T69*)(l8))->a6);
								T21f24(a1, t3);
								T21f23(a1, gems(" (", 2));
								t2 = (((T69*)(l8))->a2);
								t2 = (((T70*)(t2))->a6);
								T21f23(a1, t2);
								T21f23(a1, gems(")\n", 2));
								l2 = (EIF_FALSE);
							}
							l8 = (((T87*)(l6))->a1);
							T21f25(a1, (T1)('\t'));
							t2 = (((T81*)(l9))->a3);
							T21f23(a1, t2);
							T21f23(a1, gems("\t[reduce using rule ", 20));
							t3 = (((T69*)(l8))->a6);
							T21f24(a1, t3);
							T21f23(a1, gems(" (", 2));
							t2 = (((T69*)(l8))->a2);
							t2 = (((T70*)(t2))->a6);
							T21f23(a1, t2);
							T21f23(a1, gems(")]\n", 3));
						}
					}
					l13 = ((T4)((l13)+((T4)(geint32(1)))));
					t1 = (T4f1(&l13, l14));
				}
				l12 = ((T4)((l12)-((T4)(geint32(1)))));
				t1 = ((T2)((l12)<((T4)(geint32(1)))));
			}
			t1 = ((l7)!=(EIF_VOID));
			if (t1) {
				l8 = (((T87*)(l7))->a1);
				T21f23(a1, gems("\t$default\treduce using rule ", 28));
				t3 = (((T69*)(l8))->a6);
				T21f24(a1, t3);
				T21f23(a1, gems(" (", 2));
				t2 = (((T69*)(l8))->a2);
				t2 = (((T70*)(t2))->a6);
				T21f23(a1, t2);
				T21f23(a1, gems(")\n", 2));
			}
			T21f25(a1, (T1)('\n'));
		}
	}
}

/* DS_ARRAYED_LIST [PR_TOKEN].extend_last */
void T95f24(T0* C, T0* a1)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = ((T4)((((T95*)(C))->a1)+((T4)(geint32(1)))));
	l2 = (T95f7(a1));
	T219f8(l2);
	t1 = (T219f2(l2));
	while (!(t1)) {
		t2 = (T219f3(l2));
		((T139*)(((T95*)(C))->a3))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		T219f9(l2);
		t1 = (T219f2(l2));
	}
	t3 = (((T95*)(a1))->a1);
	((T95*)(C))->a1 = ((T4)((((T95*)(C))->a1)+(t3)));
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].forth */
void T219f9(T0* C)
{
	T95f33(((T219*)(C))->a1, C);
}

/* DS_ARRAYED_LIST [PR_TOKEN].cursor_forth */
void T95f33(T0* C, T0* a1)
{
	T2 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	l2 = (((T219*)(a1))->a4);
	l1 = ((l2)==((T4)(geint32(0))));
	l2 = ((T4)((l2)+((T4)(geint32(1)))));
	t1 = (T4f1(&l2, ((T95*)(C))->a1));
	if (t1) {
		l2 = ((T4)(geint32(-1)));
		t1 = ((T2)(!(l1)));
		if (t1) {
			T95f36(C, a1);
		}
	} else {
		if (l1) {
			T95f35(C, a1);
		}
	}
	T219f10(a1, l2);
}

/* DS_ARRAYED_LIST [PR_TOKEN].add_traversing_cursor */
void T95f35(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T95*)(C))->a6));
	if (t1) {
		t2 = (((T219*)(((T95*)(C))->a6))->a5);
		T219f11(a1, t2);
		T219f11(((T95*)(C))->a6, a1);
	}
}

/* DS_ARRAYED_LIST [PR_TOKEN].remove_traversing_cursor */
void T95f36(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T95*)(C))->a6));
	if (t1) {
		l2 = (((T95*)(C))->a6);
		l1 = (((T219*)(l2))->a5);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T219*)(l1))->a5);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T219*)(a1))->a5);
			T219f11(l2, t2);
			T219f11(a1, EIF_VOID);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].item */
T0* T219f3(T0* C)
{
	T0* R = 0;
	R = (T95f16(((T219*)(C))->a1, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].cursor_item */
T0* T95f16(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T219*)(a1))->a4);
	R = (T95f2(C, t1));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].after */
T2 T219f2(T0* C)
{
	T2 R = 0;
	R = (T95f15(((T219*)(C))->a1, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].cursor_after */
T2 T95f15(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T219*)(a1))->a4);
	R = ((t1)==((T4)(geint32(-1))));
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].start */
void T219f8(T0* C)
{
	T95f32(((T219*)(C))->a1, C);
}

/* DS_ARRAYED_LIST [PR_TOKEN].cursor_start */
void T95f32(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 t1;
	l1 = (T219f6(a1));
	t1 = (T95f13(C));
	if (t1) {
		T219f10(a1, (T4)(geint32(-1)));
	} else {
		T219f10(a1, (T4)(geint32(1)));
		if (l1) {
			T95f35(C, a1);
		}
	}
}

/* DS_ARRAYED_LIST_CURSOR [PR_TOKEN].off */
T2 T219f6(T0* C)
{
	T2 R = 0;
	R = (T95f17(((T219*)(C))->a1, C));
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].cursor_off */
T2 T95f17(T0* C, T0* a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T95f15(C, a1));
	if (!(t1)) {
		R = (T95f18(C, a1));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_TOKEN].cursor_before */
T2 T95f18(T0* C, T0* a1)
{
	T2 R = 0;
	T4 t1;
	t1 = (((T219*)(a1))->a4);
	R = ((t1)==((T4)(geint32(0))));
	return R;
}

/* PR_POSITION.print_position */
void T65f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	t1 = (((T69*)(((T65*)(C))->a3))->a2);
	t1 = (((T70*)(t1))->a6);
	T21f23(a1, t1);
	T21f23(a1, gems("  ->  ", 6));
	l1 = (((T69*)(((T65*)(C))->a3))->a1);
	l3 = (((T77*)(l1))->a1);
	l2 = ((T4)(geint32(1)));
	t2 = ((l2)==(((T65*)(C))->a2));
	while (!(t2)) {
		t1 = (T77f2(l1, l2));
		t1 = ((((t1)->id==70)?((T70*)(t1))->a6:((T81*)(t1))->a3));
		T21f23(a1, t1);
		T21f25(a1, (T1)(' '));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l2)==(((T65*)(C))->a2));
	}
	T21f25(a1, (T1)('.'));
	t2 = (T4f1(&l2, l3));
	while (!(t2)) {
		T21f25(a1, (T1)(' '));
		t1 = (T77f2(l1, l2));
		t1 = ((((t1)->id==70)?((T70*)(t1))->a6:((T81*)(t1))->a3));
		T21f23(a1, t1);
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = (T4f1(&l2, l3));
	}
	T21f23(a1, gems("   (rule ", 9));
	t3 = (((T69*)(((T65*)(C))->a3))->a6);
	T21f24(a1, t3);
	T21f25(a1, (T1)(')'));
}

/* PR_GRAMMAR.print_grammar */
void T26f22(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T21f23(a1, gems("Grammar\n\n", 9));
	l2 = (((T67*)(((T26*)(C))->a1))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T67f2(((T26*)(C))->a1, l1));
		T69f27(t2, a1);
		T21f25(a1, (T1)('\n'));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	T21f23(a1, gems("\nTerminals, with rules where they appear\n\n", 42));
	T21f23(a1, gems("$ (token 0)\n", 12));
	l2 = (((T95*)(((T26*)(C))->a6))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T95f2(((T26*)(C))->a6, l1));
		T81f30(t2, C, a1);
		T21f25(a1, (T1)('\n'));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	T21f23(a1, gems("\nNonterminals, with rules where they appear\n\n", 45));
	l2 = (((T88*)(((T26*)(C))->a5))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		t2 = (T88f2(((T26*)(C))->a5, l1));
		T70f21(t2, C, a1);
		T21f25(a1, (T1)('\n'));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* PR_VARIABLE.print_variable */
void T70f21(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 l5 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T21f23(a2, ((T70*)(C))->a6);
	T21f23(a2, gems(" (", 2));
	T21f24(a2, ((T70*)(C))->a5);
	T21f25(a2, (T1)(')'));
	t1 = (T67f3(((T70*)(C))->a1));
	t1 = ((T2)(!(t1)));
	if (t1) {
		T21f23(a2, gems(" on left:", 9));
		l2 = (((T67*)(((T70*)(C))->a1))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			T21f25(a2, (T1)(' '));
			t2 = (T67f2(((T70*)(C))->a1, l1));
			t3 = (((T69*)(t2))->a6);
			T21f24(a2, t3);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
	}
	l4 = (((T26*)(a1))->a1);
	l2 = (((T67*)(l4))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T67f2(l4, l1));
		t2 = (((T69*)(l3))->a1);
		t1 = (T77f11(t2, C));
		if (t1) {
			t1 = ((T2)(!(l5)));
			if (t1) {
				l5 = (EIF_TRUE);
				t1 = (T67f3(((T70*)(C))->a1));
				t1 = ((T2)(!(t1)));
				if (t1) {
					T21f25(a2, (T1)(','));
				}
				T21f23(a2, gems(" on right:", 10));
			}
			T21f25(a2, (T1)(' '));
			t3 = (((T69*)(l3))->a6);
			T21f24(a2, t3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* DS_ARRAYED_LIST [PR_SYMBOL].has */
T2 T77f11(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T77*)(C))->a1);
	l2 = (((T77*)(C))->a12);
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T202*)(((T77*)(C))->a4))->a2[l1]);
			t1 = ((T2)gevoid(l2, t2, a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	} else {
		t1 = ((T2)((l1)<((T4)(geint32(1)))));
		while (!(t1)) {
			t2 = (((T202*)(((T77*)(C))->a4))->a2[l1]);
			t1 = ((t2)==(a1));
			if (t1) {
				R = (EIF_TRUE);
				l1 = ((T4)(geint32(0)));
			} else {
				l1 = ((T4)((l1)-((T4)(geint32(1)))));
			}
			t1 = ((T2)((l1)<((T4)(geint32(1)))));
		}
	}
	return R;
}

/* PR_TOKEN.print_token */
void T81f30(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	T21f23(a2, ((T81*)(C))->a3);
	T21f23(a2, gems(" (token ", 8));
	T21f24(a2, ((T81*)(C))->a2);
	T21f25(a2, (T1)(')'));
	l3 = (((T26*)(a1))->a1);
	l2 = (((T67*)(l3))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l4 = (T67f2(l3, l1));
		t2 = (((T69*)(l4))->a1);
		t1 = (T77f11(t2, C));
		if (t1) {
			T21f25(a2, (T1)(' '));
			t3 = (((T69*)(l4))->a6);
			T21f24(a2, t3);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* PR_RULE.print_rule */
void T69f27(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* t1;
	T2 t2;
	T21f23(a1, gems("rule ", 5));
	T21f24(a1, ((T69*)(C))->a6);
	T21f25(a1, (T1)(' '));
	t1 = (((T70*)(((T69*)(C))->a2))->a6);
	T21f23(a1, t1);
	T21f23(a1, gems(" ->", 3));
	t2 = (T77f9(((T69*)(C))->a1));
	if (t2) {
		T21f23(a1, gems(" -- Empty", 9));
	} else {
		l2 = (((T77*)(((T69*)(C))->a1))->a1);
		l1 = ((T4)(geint32(1)));
		t2 = (T4f1(&l1, l2));
		while (!(t2)) {
			T21f25(a1, (T1)(' '));
			t1 = (T77f2(((T69*)(C))->a1, l1));
			t1 = ((((t1)->id==70)?((T70*)(t1))->a6:((T81*)(t1))->a3));
			T21f23(a1, t1);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t2 = (T4f1(&l1, l2));
		}
	}
}

/* PR_FSM.set_error_actions_verbose */
void T19f14(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T2 l12 = 0;
	T0* l13 = 0;
	T0* l14 = 0;
	T0* l15 = 0;
	T0* l16 = 0;
	T4 l17 = 0;
	T4 l18 = 0;
	T4 l19 = 0;
	T0* l20 = 0;
	T0* l21 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l2 = (((T54*)(((T19*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l7 = (T54f2(((T19*)(C))->a2, l1));
		l12 = (EIF_TRUE);
		l8 = (((T56*)(l7))->a5);
		l4 = (((T64*)(l8))->a1);
		l3 = ((T4)(geint32(1)));
		t1 = (T4f1(&l3, l4));
		while (!(t1)) {
			l10 = (T64f2(l8, l3));
			t1 = (T65f4(l10));
			t1 = ((T2)(!(t1)));
			if (t1) {
				l12 = (EIF_FALSE);
				t1 = (T65f5(l10));
				t1 = ((T2)(!(t1)));
				if (t1) {
					t1 = ((l11)!=(EIF_VOID));
					if (t1) {
						l13 = (T65f6(l10));
						l14 = (T65f6(l11));
						t2 = (T19f6(C));
						t1 = (T68f1(t2, l13, l14));
						t1 = ((T2)(!(t1)));
						if (t1) {
							t1 = ((l9)==(EIF_VOID));
							if (t1) {
								l9 = T64c12(l4);
								T64f13(l9, l11);
							}
							T64f13(l9, l10);
						}
						t1 = ((l13)!=(EIF_VOID));
						if (t1) {
							l17 = (((T66*)(l13))->a2);
						} else {
							t2 = (((T65*)(l10))->a3);
							l17 = (((T69*)(t2))->a5);
						}
						t1 = ((l14)!=(EIF_VOID));
						if (t1) {
							l18 = (((T66*)(l14))->a2);
						} else {
							t2 = (((T65*)(l11))->a3);
							l18 = (((T69*)(t2))->a5);
						}
						t1 = ((T2)((l17)<(l18)));
						if (t1) {
							l11 = (l10);
						}
					} else {
						l11 = (l10);
					}
				} else {
					l11 = (EIF_VOID);
					l3 = ((T4)((l4)+((T4)(geint32(1)))));
				}
			}
			l3 = ((T4)((l3)+((T4)(geint32(1)))));
			t1 = (T4f1(&l3, l4));
		}
		if (l12) {
			t2 = (((T26*)(((T19*)(C))->a1))->a3);
			l15 = (((T70*)(t2))->a1);
			l16 = T64c12(l4);
			l3 = ((T4)(geint32(1)));
			t1 = (T4f1(&l3, l4));
			while (!(t1)) {
				l10 = (T64f2(l8, l3));
				t2 = (((T65*)(l10))->a3);
				t1 = (T67f15(l15, t2));
				if (t1) {
					T64f13(l16, l10);
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = (T4f1(&l3, l4));
			}
			l4 = (((T64*)(l16))->a1);
			l3 = ((T4)(geint32(1)));
			t1 = (T4f1(&l3, l4));
			while (!(t1)) {
				l10 = (T64f2(l16, l3));
				t1 = ((l11)!=(EIF_VOID));
				if (t1) {
					l13 = (T65f6(l10));
					l14 = (T65f6(l11));
					t2 = (T19f6(C));
					t1 = (T68f1(t2, l13, l14));
					t1 = ((T2)(!(t1)));
					if (t1) {
						t1 = ((l9)==(EIF_VOID));
						if (t1) {
							l9 = T64c12(l4);
							T64f13(l9, l11);
						}
						T64f13(l9, l10);
					}
					t1 = ((l13)!=(EIF_VOID));
					if (t1) {
						l17 = (((T66*)(l13))->a2);
					} else {
						t2 = (((T65*)(l10))->a3);
						l17 = (((T69*)(t2))->a5);
					}
					t1 = ((l14)!=(EIF_VOID));
					if (t1) {
						l18 = (((T66*)(l14))->a2);
					} else {
						t2 = (((T65*)(l11))->a3);
						l18 = (((T69*)(t2))->a5);
					}
					t1 = ((T2)((l17)<(l18)));
					if (t1) {
						l11 = (l10);
					}
				} else {
					l11 = (l10);
				}
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = (T4f1(&l3, l4));
			}
		}
		t1 = ((l9)!=(EIF_VOID));
		if (t1) {
			T21f23(a2, gems("State ", 6));
			t3 = (((T56*)(l7))->a6);
			T21f24(a2, t3);
			T21f27(a2, gems(" contains 1 error action conflict:", 34));
			l6 = (((T64*)(l9))->a1);
			l5 = ((T4)(geint32(1)));
			t1 = (T4f1(&l5, l6));
			while (!(t1)) {
				T21f25(a2, (T1)('\t'));
				t2 = (T64f2(l9, l5));
				T65f13(t2, a2);
				T21f26(a2);
				l5 = ((T4)((l5)+((T4)(geint32(1)))));
				t1 = (T4f1(&l5, l6));
			}
			l19 = ((T4)((l19)+((T4)(geint32(1)))));
			l9 = (EIF_VOID);
		}
		t1 = ((l11)!=(EIF_VOID));
		if (t1) {
			t2 = (T65f6(l11));
			T56f29(l7, t2);
			l11 = (EIF_VOID);
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t1 = (T4f4(&l19, (T4)(geint32(1))));
	if (t1) {
		T21f26(a2);
		l20 = T16c25((T4)(geint32(128)));
		T16f26(l20, gems("Parser contains ", 16));
		t1 = ((l19)==((T4)(geint32(1))));
		if (t1) {
			T16f26(l20, gems("1 error action conflict.\n", 25));
		} else {
			t2 = (T19f5(C));
			T63f2(t2, l19, l20);
			T16f26(l20, gems(" error action conflicts.\n", 25));
		}
		l21 = T59c7(l20);
		T25f9(a1, l21);
	}
}

/* PR_FSM.resolve_conflicts_verbose */
void T19f13(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T0* l10 = 0;
	T0* l11 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l2 = (((T54*)(((T19*)(C))->a2))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T54f2(((T19*)(C))->a2, l1));
		t1 = (((T56*)(l3))->a17);
		if (t1) {
			l8 = (T56f18(l3));
			l9 = (T60f1(l8));
			T276f8(l9);
			t1 = (((T276*)(l9))->a1);
			while (!(t1)) {
				t2 = (T276f2(l9));
				T62f6(t2, a2);
				T276f9(l9);
				t1 = (((T276*)(l9))->a1);
			}
			t1 = (((T56*)(l3))->a19);
			if (t1) {
				l4 = (T56f20(l3));
				l6 = (T56f21(l3));
				l5 = ((T4)((l5)+(l4)));
				l7 = ((T4)((l7)+(l6)));
				T21f23(a2, gems("State ", 6));
				t3 = (((T56*)(l3))->a6);
				T21f24(a2, t3);
				T21f23(a2, gems(" contains ", 10));
				t1 = ((l4)==((T4)(geint32(1))));
				if (t1) {
					T21f23(a2, gems("1 shift/reduce conflict", 23));
				} else {
					t1 = (T4f1(&l4, (T4)(geint32(1))));
					if (t1) {
						T21f24(a2, l4);
						T21f23(a2, gems(" shift/reduce conflicts", 23));
					}
				}
				t1 = (T4f1(&l4, (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f1(&l6, (T4)(geint32(0))));
				}
				if (t1) {
					T21f23(a2, gems(" and ", 5));
				}
				t1 = ((l6)==((T4)(geint32(1))));
				if (t1) {
					T21f23(a2, gems("1 reduce/reduce conflict", 24));
				} else {
					t1 = (T4f1(&l6, (T4)(geint32(1))));
					if (t1) {
						T21f24(a2, l6);
						T21f23(a2, gems(" reduce/reduce conflicts", 24));
					}
				}
				T21f25(a2, (T1)('.'));
				T21f26(a2);
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	t1 = (T4f1(&l5, (T4)(geint32(0))));
	if (!(t1)) {
		t1 = (T4f1(&l7, (T4)(geint32(0))));
	}
	if (t1) {
		T21f26(a2);
	}
	t1 = (T4f1(&l5, (T4)(geint32(0))));
	if (t1) {
		t3 = (((T26*)(((T19*)(C))->a1))->a2);
		t1 = ((l5)!=(t3));
	}
	if (!(t1)) {
		t1 = (T4f1(&l7, (T4)(geint32(0))));
	}
	if (t1) {
		l10 = T16c25((T4)(geint32(128)));
		T16f26(l10, gems("Parser contains ", 16));
		t1 = ((l5)==((T4)(geint32(1))));
		if (t1) {
			T16f26(l10, gems("1 shift/reduce conflict", 23));
		} else {
			t1 = (T4f1(&l5, (T4)(geint32(1))));
			if (t1) {
				t2 = (T19f5(C));
				T63f2(t2, l5, l10);
				T16f26(l10, gems(" shift/reduce conflicts", 23));
			}
		}
		t1 = (T4f1(&l5, (T4)(geint32(0))));
		if (t1) {
			t1 = (T4f1(&l7, (T4)(geint32(0))));
		}
		if (t1) {
			T16f26(l10, gems(" and ", 5));
		}
		t1 = ((l7)==((T4)(geint32(1))));
		if (t1) {
			T16f26(l10, gems("1 reduce/reduce conflict", 24));
		} else {
			t1 = (T4f1(&l7, (T4)(geint32(1))));
			if (t1) {
				t2 = (T19f5(C));
				T63f2(t2, l7, l10);
				T16f26(l10, gems(" reduce/reduce conflicts", 24));
			}
		}
		T16f26(l10, gems(".\n", 2));
		l11 = T59c7(l10);
		T25f9(a1, l11);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].forth */
void T276f9(T0* C)
{
	T60f11(((T276*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_CONFLICT].cursor_forth */
void T60f11(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	t1 = (((T276*)(a1))->a5);
	if (t1) {
		l1 = (EIF_TRUE);
		l3 = (((T60*)(C))->a4);
	} else {
		t2 = (((T276*)(a1))->a3);
		l3 = (((T277*)(t2))->a2);
	}
	l2 = ((l3)==(EIF_VOID));
	T276f10(a1, l3, EIF_FALSE, l2);
	if (l2) {
		t1 = ((T2)(!(l1)));
		if (t1) {
			T60f13(C, a1);
		}
	} else {
		if (l1) {
			T60f12(C, a1);
		}
	}
}

/* DS_LINKED_LIST [PR_CONFLICT].add_traversing_cursor */
void T60f12(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T60*)(C))->a2));
	if (t1) {
		t2 = (((T276*)(((T60*)(C))->a2))->a6);
		T276f11(a1, t2);
		T276f11(((T60*)(C))->a2, a1);
	}
}

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set_next_cursor */
void T276f11(T0* C, T0* a1)
{
	((T276*)(C))->a6 = (a1);
}

/* DS_LINKED_LIST [PR_CONFLICT].remove_traversing_cursor */
void T60f13(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((a1)!=(((T60*)(C))->a2));
	if (t1) {
		l2 = (((T60*)(C))->a2);
		l1 = (((T276*)(l2))->a6);
		t1 = ((l1)==(a1));
		if (!(t1)) {
			t1 = ((l1)==(EIF_VOID));
		}
		while (!(t1)) {
			l2 = (l1);
			l1 = (((T276*)(l1))->a6);
			t1 = ((l1)==(a1));
			if (!(t1)) {
				t1 = ((l1)==(EIF_VOID));
			}
		}
		t1 = ((l1)==(a1));
		if (t1) {
			t2 = (((T276*)(a1))->a6);
			T276f11(l2, t2);
			T276f11(a1, EIF_VOID);
		}
	}
}

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].set */
void T276f10(T0* C, T0* a1, T2 a2, T2 a3)
{
	((T276*)(C))->a3 = (a1);
	((T276*)(C))->a5 = (a2);
	((T276*)(C))->a1 = (a3);
}

/* PR_CONFLICT.print_conflict */
void T62f6(T0* C, T0* a1)
{
	T4 t1;
	T0* t2;
	T21f23(a1, gems("Conflict in state ", 18));
	t1 = (((T56*)(((T62*)(C))->a1))->a6);
	T21f24(a1, t1);
	T21f23(a1, gems(" between rule ", 14));
	t1 = (((T69*)(((T62*)(C))->a2))->a6);
	T21f24(a1, t1);
	T21f23(a1, gems(" and token ", 11));
	t1 = (((T81*)(((T62*)(C))->a3))->a2);
	T21f24(a1, t1);
	T21f23(a1, gems(" (", 2));
	t2 = (((T81*)(((T62*)(C))->a3))->a3);
	T21f23(a1, t2);
	T21f23(a1, gems(") resolved as ", 14));
	T21f23(a1, ((T62*)(C))->a4);
	T21f23(a1, gems(".\n", 2));
}

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].item */
T0* T276f2(T0* C)
{
	T0* R = 0;
	R = (((T277*)(((T276*)(C))->a3))->a1);
	return R;
}

/* DS_LINKED_LIST_CURSOR [PR_CONFLICT].start */
void T276f8(T0* C)
{
	T60f10(((T276*)(C))->a4, C);
}

/* DS_LINKED_LIST [PR_CONFLICT].cursor_start */
void T60f10(T0* C, T0* a1)
{
	T2 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	l1 = (T60f7(C, a1));
	l2 = ((((T60*)(C))->a4)==(EIF_VOID));
	T276f10(a1, ((T60*)(C))->a4, EIF_FALSE, l2);
	t1 = ((T2)(!(l2)));
	if (t1) {
		t1 = (l1);
	}
	if (t1) {
		T60f12(C, a1);
	}
}

/* DS_LINKED_LIST [PR_CONFLICT].cursor_off */
T2 T60f7(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T276*)(a1))->a3);
	R = ((t1)==(EIF_VOID));
	return R;
}

/* PR_GRAMMAR.reduce_verbose */
void T26f20(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T0* l8 = 0;
	T0* l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T4 l12 = 0;
	T4 l13 = 0;
	T4 t1;
	T4 t2;
	T2 t3;
	T0* t4;
	l1 = (T88f3(((T26*)(C))->a5));
	l2 = (T67f5(((T26*)(C))->a1));
	T26f23(C, a1);
	t1 = (((T88*)(l1))->a1);
	t2 = (((T88*)(((T26*)(C))->a5))->a1);
	l3 = ((T4)((t1)-(t2)));
	t1 = (((T67*)(l2))->a1);
	t2 = (((T67*)(((T26*)(C))->a1))->a1);
	l5 = ((T4)((t1)-(t2)));
	t3 = (T4f1(&l3, (T4)(geint32(0))));
	if (t3) {
		T21f23(a2, gems("Useless nonterminals:\n\n", 23));
		l12 = (((T88*)(l1))->a1);
		l10 = ((T4)(geint32(1)));
		t3 = (T4f1(&l10, l12));
		while (!(t3)) {
			l6 = (T88f2(l1, l10));
			t3 = (((T70*)(l6))->a3);
			t3 = ((T2)(!(t3)));
			if (t3) {
				T21f25(a2, (T1)('\t'));
				t4 = (((T70*)(l6))->a6);
				T21f23(a2, t4);
				T21f25(a2, (T1)('\n'));
			}
			l10 = ((T4)((l10)+((T4)(geint32(1)))));
			t3 = (T4f1(&l10, l12));
		}
		T21f25(a2, (T1)('\n'));
	}
	l12 = (((T95*)(((T26*)(C))->a6))->a1);
	l10 = ((T4)(geint32(1)));
	t3 = (T4f1(&l10, l12));
	while (!(t3)) {
		l7 = (T95f2(((T26*)(C))->a6, l10));
		t3 = (((T81*)(l7))->a14);
		t3 = ((T2)(!(t3)));
		if (t3) {
			t3 = ((l4)==((T4)(geint32(0))));
			if (t3) {
				T21f23(a2, gems("Terminals which are not used:\n\n", 31));
			}
			l4 = ((T4)((l4)+((T4)(geint32(1)))));
			T21f25(a2, (T1)('\t'));
			t4 = (((T81*)(l7))->a3);
			T21f23(a2, t4);
			T21f25(a2, (T1)('\n'));
		}
		l10 = ((T4)((l10)+((T4)(geint32(1)))));
		t3 = (T4f1(&l10, l12));
	}
	t3 = (T4f1(&l4, (T4)(geint32(0))));
	if (t3) {
		T21f25(a2, (T1)('\n'));
	}
	t3 = (T4f1(&l5, (T4)(geint32(0))));
	if (t3) {
		T21f23(a2, gems("Useless rules:\n\n", 16));
		l12 = (((T67*)(l2))->a1);
		l10 = ((T4)(geint32(1)));
		t3 = (T4f1(&l10, l12));
		while (!(t3)) {
			l8 = (T67f2(l2, l10));
			t3 = (((T69*)(l8))->a14);
			t3 = ((T2)(!(t3)));
			if (t3) {
				T21f25(a2, (T1)('#'));
				T21f24(a2, l10);
				T21f25(a2, (T1)('\t'));
				t4 = (((T69*)(l8))->a2);
				t4 = (((T70*)(t4))->a6);
				T21f23(a2, t4);
				T21f23(a2, gems(": ", 2));
				l9 = (((T69*)(l8))->a1);
				l13 = (((T77*)(l9))->a1);
				l11 = ((T4)(geint32(1)));
				t3 = (T4f1(&l11, l13));
				while (!(t3)) {
					t4 = (T77f2(l9, l11));
					t4 = ((((t4)->id==70)?((T70*)(t4))->a6:((T81*)(t4))->a3));
					T21f23(a2, t4);
					T21f25(a2, (T1)(' '));
					l11 = ((T4)((l11)+((T4)(geint32(1)))));
					t3 = (T4f1(&l11, l13));
				}
				T21f23(a2, gems(";\n", 2));
			}
			l10 = ((T4)((l10)+((T4)(geint32(1)))));
			t3 = (T4f1(&l10, l12));
		}
		T21f25(a2, (T1)('\n'));
	}
	t3 = (T4f1(&l3, (T4)(geint32(0))));
	if (!(t3)) {
		t3 = (T4f1(&l4, (T4)(geint32(0))));
	}
	if (!(t3)) {
		t3 = (T4f1(&l5, (T4)(geint32(0))));
	}
	if (t3) {
		T21f25(a2, (T1)('\n'));
	}
}

/* DS_ARRAYED_LIST [PR_RULE].cloned_object */
T0* T67f5(T0* C)
{
	T0* R = 0;
	R = (T67f8(C));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].twin */
T0* T67f8(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T67));
	((T67*)(R))->id = 67;
	T67f25(R, C);
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].copy */
void T67f25(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = ((a1)!=(C));
	if (t1) {
		l1 = (((T67*)(C))->a11);
		T67f29(C);
		*(T67*)(C) = *(T67*)(a1);
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T67f13(C, l1));
		}
		if (t1) {
			((T67*)(C))->a11 = (l1);
		} else {
			((T67*)(C))->a11 = (EIF_VOID);
			((T67*)(C))->a11 = (T67f12(C));
		}
		((T67*)(C))->a7 = (T190f4(((T67*)(C))->a7));
	}
}

/* SPECIAL [PR_RULE].twin */
T0* T190f4(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T190)+((T190*)(C))->a1*sizeof(T0*));
	*(T190*)(R) = *(T190*)(C);
	memcpy(((T190*)(R))->a2,((T190*)(C))->a2,  ((T190*)(C))->a1*sizeof(T0*));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].valid_cursor */
T2 T67f13(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T192*)(a1))->a3);
	R = ((t1)==(C));
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].move_all_cursors_after */
void T67f29(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T67*)(C))->a11);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T192f8(l1, (T4)(geint32(-1)));
		l2 = (((T192*)(l1))->a2);
		T192f9(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* DS_ARRAYED_LIST [PR_VARIABLE].cloned_object */
T0* T88f3(T0* C)
{
	T0* R = 0;
	R = (T88f7(C));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].twin */
T0* T88f7(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T88));
	((T88*)(R))->id = 88;
	T88f25(R, C);
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].copy */
void T88f25(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	t1 = ((a1)!=(C));
	if (t1) {
		l1 = (((T88*)(C))->a10);
		T88f30(C);
		*(T88*)(C) = *(T88*)(a1);
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t1 = (T88f12(C, l1));
		}
		if (t1) {
			((T88*)(C))->a10 = (l1);
		} else {
			((T88*)(C))->a10 = (EIF_VOID);
			((T88*)(C))->a10 = (T88f11(C));
		}
		((T88*)(C))->a6 = (T208f2(((T88*)(C))->a6));
	}
}

/* SPECIAL [PR_VARIABLE].twin */
T0* T208f2(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T208)+((T208*)(C))->a1*sizeof(T0*));
	*(T208*)(R) = *(T208*)(C);
	memcpy(((T208*)(R))->a2,((T208*)(C))->a2,  ((T208*)(C))->a1*sizeof(T0*));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].valid_cursor */
T2 T88f12(T0* C, T0* a1)
{
	T2 R = 0;
	T0* t1;
	t1 = (((T210*)(a1))->a5);
	R = ((t1)==(C));
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].move_all_cursors_after */
void T88f30(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	l1 = (((T88*)(C))->a10);
	t1 = ((l1)==(EIF_VOID));
	while (!(t1)) {
		T210f8(l1, (T4)(geint32(-1)));
		l2 = (((T210*)(l1))->a2);
		T210f9(l1, EIF_VOID);
		l1 = (l2);
		t1 = ((l1)==(EIF_VOID));
	}
}

/* KL_STANDARD_FILES.output */
unsigned char ge290os2353 = '\0';
T0* ge290ov2353;
T0* T32f1(T0* C)
{
	T0* R = 0;
	if (ge290os2353) {
		return ge290ov2353;
	} else {
		ge290os2353 = '\1';
	}
	R = T33c9();
	ge290ov2353 = R;
	return R;
}

/* KL_STDOUT_FILE.make */
T0* T33c9()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T33));
	((T33*)(C))->id = 33;
	T33f15(C, gems("stdout", 6));
	return C;
}

/* KL_STDOUT_FILE.make_open_stdout */
void T33f15(T0* C, T0* a1)
{
	T33f18(C, a1);
	((T33*)(C))->a3 = (T33f4(C, (T4)(geint32(1))));
	T33f19(C);
}

/* KL_STDOUT_FILE.set_write_mode */
void T33f19(T0* C)
{
	((T33*)(C))->a6 = ((T4)(geint32(2)));
}

/* KL_STDOUT_FILE.console_def */
T14 T33f4(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDOUT_FILE.old_make */
void T33f18(T0* C, T0* a1)
{
	((T33*)(C))->a5 = (a1);
	((T33*)(C))->a6 = ((T4)(geint32(0)));
}

/* GEYACC.std */
unsigned char ge288os1312 = '\0';
T0* ge288ov1312;
T0* T18f9(T0* C)
{
	T0* R = 0;
	if (ge288os1312) {
		return ge288ov1312;
	} else {
		ge288os1312 = '\1';
	}
	R = T32c4();
	ge288ov1312 = R;
	return R;
}

/* KL_STANDARD_FILES.default_create */
T0* T32c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T32));
	((T32*)(C))->id = 32;
	return C;
}

/* KL_EXCEPTIONS.die */
void T31f2(T0* C, T4 a1)
{
	esdie(a1);
}

/* GEYACC.exceptions */
unsigned char ge306os1309 = '\0';
T0* ge306ov1309;
T0* T18f8(T0* C)
{
	T0* R = 0;
	if (ge306os1309) {
		return ge306ov1309;
	} else {
		ge306os1309 = '\1';
	}
	R = T31c1();
	ge306ov1309 = R;
	return R;
}

/* KL_EXCEPTIONS.default_create */
T0* T31c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T31));
	((T31*)(C))->id = 31;
	return C;
}

/* UT_ERROR_HANDLER.report_error */
void T25f7(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T25f5(C, a1));
	T25f10(C, t1);
}

/* UT_ERROR_HANDLER.report_error_message */
void T25f10(T0* C, T0* a1)
{
	T122f10(((T25*)(C))->a1, a1);
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.make */
T0* T22c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T22));
	((T22*)(C))->id = 22;
	((T22*)(C))->a1 = T121c6((T4)(geint32(1)), (T4)(geint32(1)));
	T121f7(((T22*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* KL_TEXT_OUTPUT_FILE.close */
void T21f22(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		T21f30(C);
	}
}

/* KL_TEXT_OUTPUT_FILE.old_close */
void T21f30(T0* C)
{
	T21f33(C, ((T21*)(C))->a15);
	((T21*)(C))->a3 = ((T4)(geint32(0)));
	((T21*)(C))->a17 = (EIF_FALSE);
}

/* KL_TEXT_OUTPUT_FILE.file_close */
void T21f33(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* PR_HTML_DOC_GENERATOR.print_grammar */
void T28f5(T0* C, T0* a1)
{
	T28f6(C, a1);
	T28f7(C, a1);
	T28f8(C, a1);
}

/* PR_HTML_DOC_GENERATOR.print_grammar_footer */
void T28f8(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("</body>", 7));
	} else {
		T33f10(a1, gems("</body>", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("</html>", 7));
	} else {
		T33f10(a1, gems("</html>", 7));
	}
}

/* PR_HTML_DOC_GENERATOR.print_rules */
void T28f7(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T0* t2;
	T1 t3;
	l3 = (((T26*)(((T28*)(C))->a1))->a1);
	l2 = (((T67*)(l3))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l4 = (T67f2(l3, l1));
		l5 = (((T69*)(l4))->a2);
		t2 = (((T70*)(l5))->a6);
		t3 = (T16f14(t2, (T4)(geint32(1))));
		t1 = ((t3)!=((T1)('@')));
		if (t1) {
			if (((T28*)(C))->a2) {
				t1 = ((l6)==(l5));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
				T28f10(C, a1);
				t2 = (((T69*)(l4))->a1);
				T28f11(C, t2, a1);
				T28f12(C, a1);
			} else {
				if (((T28*)(C))->a2) {
					t1 = ((l6)!=(EIF_VOID));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					T28f13(C, a1);
				}
				T28f14(C, a1);
				t2 = (((T69*)(l4))->a2);
				T28f15(C, t2, a1);
				T28f16(C, a1);
				t2 = (((T69*)(l4))->a1);
				T28f11(C, t2, a1);
				T28f17(C, a1);
				l6 = (l5);
			}
			t1 = ((T2)(!(((T28*)(C))->a2)));
			if (t1) {
				T28f13(C, a1);
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	if (((T28*)(C))->a2) {
		t1 = ((l6)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T28f13(C, a1);
	}
}

/* PR_HTML_DOC_GENERATOR.print_first_rhs_footer */
void T28f17(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("</div>", 6));
	} else {
		T33f10(a1, gems("</div>", 6));
	}
}

/* PR_HTML_DOC_GENERATOR.print_first_rhs_header */
void T28f16(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("<div class=\"rhs\">", 17));
	} else {
		T33f10(a1, gems("<div class=\"rhs\">", 17));
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("&nbsp; ", 7));
	} else {
		T33f11(a1, gems("&nbsp; ", 7));
	}
}

/* PR_HTML_DOC_GENERATOR.print_lhs */
void T28f15(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	if ((a2)->id==21) {
		T21f27(a2, gems("<div class=\"lhs\">", 17));
	} else {
		T33f10(a2, gems("<div class=\"lhs\">", 17));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("<span class=\"lhs_variable\" id=\"", 31));
	} else {
		T33f11(a2, gems("<span class=\"lhs_variable\" id=\"", 31));
	}
	t1 = (((T70*)(a1))->a6);
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("\">", 2));
	} else {
		T33f11(a2, gems("\">", 2));
	}
	t1 = (((T70*)(a1))->a6);
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("</span>", 7));
	} else {
		T33f11(a2, gems("</span>", 7));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems(": ", 2));
	} else {
		T33f11(a2, gems(": ", 2));
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("</div>", 6));
	} else {
		T33f10(a2, gems("</div>", 6));
	}
}

/* PR_HTML_DOC_GENERATOR.print_rule_header */
void T28f14(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("<div class=\"rule\">", 18));
	} else {
		T33f10(a1, gems("<div class=\"rule\">", 18));
	}
}

/* PR_HTML_DOC_GENERATOR.print_rule_footer */
void T28f13(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("</div>", 6));
	} else {
		T33f10(a1, gems("</div>", 6));
	}
	if ((a1)->id==21) {
		T21f26(a1);
	} else {
		T33f13(a1);
	}
}

/* PR_HTML_DOC_GENERATOR.print_next_rhs_footer */
void T28f12(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("</div>", 6));
	} else {
		T33f10(a1, gems("</div>", 6));
	}
}

/* PR_HTML_DOC_GENERATOR.print_rhs */
void T28f11(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T1 t3;
	t1 = (T77f9(a1));
	if (t1) {
		T28f18(C, a2);
	} else {
		l2 = (((T77*)(a1))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			t2 = (T77f2(a1, l1));
			if ((t2)==EIF_VOID) {
				l3 = EIF_VOID;
			} else {
				switch ((t2)->id) {
				case 81:
					l3 = t2;
					break;
				default:
					l3 = EIF_VOID;
				}
			}
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				T28f19(C, l3, a2);
			} else {
				t2 = (T77f2(a1, l1));
				if ((t2)==EIF_VOID) {
					l4 = EIF_VOID;
				} else {
					switch ((t2)->id) {
					case 70:
						l4 = t2;
						break;
					default:
						l4 = EIF_VOID;
					}
				}
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					t2 = (((T70*)(l4))->a6);
					t3 = (T16f14(t2, (T4)(geint32(1))));
					t1 = ((t3)!=((T1)('@')));
				}
				if (t1) {
					T28f20(C, l4, a2);
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
	}
}

/* PR_HTML_DOC_GENERATOR.print_variable */
void T28f20(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	if ((a2)->id==21) {
		T21f23(a2, gems("<span class=\"rhs_variable\">", 27));
	} else {
		T33f11(a2, gems("<span class=\"rhs_variable\">", 27));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("<a href=\"#", 10));
	} else {
		T33f11(a2, gems("<a href=\"#", 10));
	}
	t1 = (((T70*)(a1))->a6);
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("\">", 2));
	} else {
		T33f11(a2, gems("\">", 2));
	}
	t1 = (((T70*)(a1))->a6);
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("</a> ", 5));
	} else {
		T33f11(a2, gems("</a> ", 5));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("</span>", 7));
	} else {
		T33f11(a2, gems("</span>", 7));
	}
}

/* PR_HTML_DOC_GENERATOR.print_token */
void T28f19(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T2 t2;
	T1 t3;
	T0* t4;
	T4 t5;
	t1 = (((T81*)(a1))->a4);
	t2 = ((t1)!=(EIF_VOID));
	if (t2) {
		if ((a2)->id==21) {
			T21f23(a2, gems("<span class=\"literal_token\">", 28));
		} else {
			T33f11(a2, gems("<span class=\"literal_token\">", 28));
		}
		t1 = (((T81*)(a1))->a4);
		t3 = (T16f14(t1, (T4)(geint32(1))));
		switch (t3) {
		case (T1)(T1)('\"'):
		case (T1)(T1)('\''):
			t1 = (((T81*)(a1))->a4);
			t4 = (((T81*)(a1))->a4);
			t5 = (((T16*)(t4))->a2);
			t5 = ((T4)((t5)-((T4)(geint32(1)))));
			t1 = (T16f5(t1, (T4)(geint32(2)), t5));
			T28f21(C, t1, a2);
			break;
		default:
			t1 = (((T81*)(a1))->a4);
			T28f21(C, t1, a2);
			break;
		}
	} else {
		t1 = (((T81*)(a1))->a3);
		t3 = (T16f14(t1, (T4)(geint32(1))));
		switch (t3) {
		case (T1)(T1)('\"'):
		case (T1)(T1)('\''):
			if ((a2)->id==21) {
				T21f23(a2, gems("<span class=\"literal_token\">", 28));
			} else {
				T33f11(a2, gems("<span class=\"literal_token\">", 28));
			}
			t1 = (((T81*)(a1))->a3);
			t4 = (((T81*)(a1))->a3);
			t5 = (((T16*)(t4))->a2);
			t5 = ((T4)((t5)-((T4)(geint32(1)))));
			t1 = (T16f5(t1, (T4)(geint32(2)), t5));
			T28f21(C, t1, a2);
			break;
		default:
			if ((a2)->id==21) {
				T21f23(a2, gems("<span class=\"token\">", 20));
			} else {
				T33f11(a2, gems("<span class=\"token\">", 20));
			}
			t1 = (((T81*)(a1))->a3);
			T28f21(C, t1, a2);
			break;
		}
	}
	if ((a2)->id==21) {
		T21f25(a2, (T1)(' '));
	} else {
		T33f12(a2, (T1)(' '));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("</span>", 7));
	} else {
		T33f11(a2, gems("</span>", 7));
	}
}

/* PR_HTML_DOC_GENERATOR.print_escaped */
void T28f21(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l2 = (((T16*)(a1))->a2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T16f14(a1, l1));
		switch (l3) {
		case (T1)(T1)('\''):
			if ((a2)->id==21) {
				T21f23(a2, gems("&apos;", 6));
			} else {
				T33f11(a2, gems("&apos;", 6));
			}
			break;
		case (T1)(T1)('\"'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&quot;", 6));
			} else {
				T33f11(a2, gems("&quot;", 6));
			}
			break;
		case (T1)(T1)('<'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&lt;", 4));
			} else {
				T33f11(a2, gems("&lt;", 4));
			}
			break;
		case (T1)(T1)('>'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&gt;", 4));
			} else {
				T33f11(a2, gems("&gt;", 4));
			}
			break;
		case (T1)(T1)('&'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&amp;", 5));
			} else {
				T33f11(a2, gems("&amp;", 5));
			}
			break;
		case (T1)'A':
		case (T1)'B':
		case (T1)'C':
		case (T1)'D':
		case (T1)'E':
		case (T1)'F':
		case (T1)'G':
		case (T1)'H':
		case (T1)'I':
		case (T1)'J':
		case (T1)'K':
		case (T1)'L':
		case (T1)'M':
		case (T1)'N':
		case (T1)'O':
		case (T1)'P':
		case (T1)'Q':
		case (T1)'R':
		case (T1)'S':
		case (T1)'T':
		case (T1)'U':
		case (T1)'V':
		case (T1)'W':
		case (T1)'X':
		case (T1)'Y':
		case (T1)'Z':
		case (T1)'a':
		case (T1)'b':
		case (T1)'c':
		case (T1)'d':
		case (T1)'e':
		case (T1)'f':
		case (T1)'g':
		case (T1)'h':
		case (T1)'i':
		case (T1)'j':
		case (T1)'k':
		case (T1)'l':
		case (T1)'m':
		case (T1)'n':
		case (T1)'o':
		case (T1)'p':
		case (T1)'q':
		case (T1)'r':
		case (T1)'s':
		case (T1)'t':
		case (T1)'u':
		case (T1)'v':
		case (T1)'w':
		case (T1)'x':
		case (T1)'y':
		case (T1)'z':
		case (T1)'0':
		case (T1)'1':
		case (T1)'2':
		case (T1)'3':
		case (T1)'4':
		case (T1)'5':
		case (T1)'6':
		case (T1)'7':
		case (T1)'8':
		case (T1)'9':
		case (T1)(T1)('_'):
			if ((a2)->id==21) {
				T21f25(a2, l3);
			} else {
				T33f12(a2, l3);
			}
			break;
		default:
			if ((a2)->id==21) {
				T21f23(a2, gems("&#", 2));
			} else {
				T33f11(a2, gems("&#", 2));
			}
			t2 = ((T4)(l3));
			t3 = (T4f11(&t2));
			if ((a2)->id==21) {
				T21f23(a2, t3);
			} else {
				T33f11(a2, t3);
			}
			if ((a2)->id==21) {
				T21f25(a2, (T1)(';'));
			} else {
				T33f12(a2, (T1)(';'));
			}
			break;
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* STRING.substring */
T0* T16f5(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T4 t4;
	t1 = (T4)(geint32(1));
	t2 = (T4f12(&t1, a1));
	if (t2) {
		t2 = (T4f12(&a1, a2));
	}
	if (t2) {
		t2 = (T4f12(&a2, ((T16*)(C))->a2));
	}
	if (t2) {
		t1 = ((T4)((a2)-(a1)));
		t1 = ((T4)((t1)+((T4)(geint32(1)))));
		R = (T16f8(C, t1));
		t3 = (((T16*)(R))->a1);
		t1 = ((T4)((a1)-((T4)(geint32(1)))));
		t4 = ((T4)((a2)-(a1)));
		t4 = ((T4)((t4)+((T4)(geint32(1)))));
		T15f8(t3, ((T16*)(C))->a1, t1, (T4)(geint32(0)), t4);
		t1 = ((T4)((a2)-(a1)));
		t1 = ((T4)((t1)+((T4)(geint32(1)))));
		T16f30(R, t1);
	} else {
		R = (T16f8(C, (T4)(geint32(0))));
	}
	return R;
}

/* STRING.set_count */
void T16f30(T0* C, T4 a1)
{
	((T16*)(C))->a2 = (a1);
	((T16*)(C))->a11 = ((T4)(geint32(0)));
}

/* STRING.new_string */
T0* T16f8(T0* C, T4 a1)
{
	T0* R = 0;
	R = T16c25(a1);
	return R;
}

/* PR_HTML_DOC_GENERATOR.print_empty_rhs */
void T28f18(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f23(a1, gems("<span class=\"empty\">-/-</span>", 30));
	} else {
		T33f11(a1, gems("<span class=\"empty\">-/-</span>", 30));
	}
}

/* PR_HTML_DOC_GENERATOR.print_next_rhs_header */
void T28f10(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("<div class=\"rhs\">", 17));
	} else {
		T33f10(a1, gems("<div class=\"rhs\">", 17));
	}
	if ((a1)->id==21) {
		T21f23(a1, gems("| ", 2));
	} else {
		T33f11(a1, gems("| ", 2));
	}
}

/* PR_HTML_DOC_GENERATOR.print_grammar_header */
void T28f6(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("<html>", 6));
	} else {
		T33f10(a1, gems("<html>", 6));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("<head>", 6));
	} else {
		T33f10(a1, gems("<head>", 6));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t<title>Grammar</title>", 23));
	} else {
		T33f10(a1, gems("\t<title>Grammar</title>", 23));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t<style type=\"text/css\">", 24));
	} else {
		T33f10(a1, gems("\t<style type=\"text/css\">", 24));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t<!--", 5));
	} else {
		T33f10(a1, gems("\t<!--", 5));
	}
	T28f9(C, a1);
	if ((a1)->id==21) {
		T21f27(a1, gems("\t-->", 4));
	} else {
		T33f10(a1, gems("\t-->", 4));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t</style>", 9));
	} else {
		T33f10(a1, gems("\t</style>", 9));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("</head>", 7));
	} else {
		T33f10(a1, gems("</head>", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("<body>", 6));
	} else {
		T33f10(a1, gems("<body>", 6));
	}
}

/* PR_HTML_DOC_GENERATOR.print_css */
void T28f9(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\tbody {", 7));
	} else {
		T33f10(a1, gems("\tbody {", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-family: Verdana,Georgia,Geneva,sans serif;", 49));
	} else {
		T33f10(a1, gems("\t\tfont-family: Verdana,Georgia,Geneva,sans serif;", 49));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-size: 11pt;", 18));
	} else {
		T33f10(a1, gems("\t\tfont-size: 11pt;", 18));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\ta:link {", 9));
	} else {
		T33f10(a1, gems("\ta:link {", 9));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: green;", 15));
	} else {
		T33f10(a1, gems("\t\tcolor: green;", 15));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\ta:visited {", 12));
	} else {
		T33f10(a1, gems("\ta:visited {", 12));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: green;", 15));
	} else {
		T33f10(a1, gems("\t\tcolor: green;", 15));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\ta:hover {", 10));
	} else {
		T33f10(a1, gems("\ta:hover {", 10));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: white;", 15));
	} else {
		T33f10(a1, gems("\t\tcolor: white;", 15));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tbackground-color: blue;", 25));
	} else {
		T33f10(a1, gems("\t\tbackground-color: blue;", 25));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\ta:active {", 11));
	} else {
		T33f10(a1, gems("\ta:active {", 11));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: red;", 13));
	} else {
		T33f10(a1, gems("\t\tcolor: red;", 13));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.lhs {", 7));
	} else {
		T33f10(a1, gems("\t.lhs {", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-weight: bold;", 20));
	} else {
		T33f10(a1, gems("\t\tfont-weight: bold;", 20));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.rhs {", 7));
	} else {
		T33f10(a1, gems("\t.rhs {", 7));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tmargin: 0\045 0\045 0\045 3\045;", 22));
	} else {
		T33f10(a1, gems("\t\tmargin: 0\045 0\045 0\045 3\045;", 22));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.empty {", 9));
	} else {
		T33f10(a1, gems("\t.empty {", 9));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: gray;", 14));
	} else {
		T33f10(a1, gems("\t\tcolor: gray;", 14));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.literal_token {", 17));
	} else {
		T33f10(a1, gems("\t.literal_token {", 17));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-family: Courier New,Courier; ", 36));
	} else {
		T33f10(a1, gems("\t\tfont-family: Courier New,Courier; ", 36));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: blue;", 14));
	} else {
		T33f10(a1, gems("\t\tcolor: blue;", 14));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.token {", 9));
	} else {
		T33f10(a1, gems("\t.token {", 9));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-family: Courier New,Courier; ", 36));
	} else {
		T33f10(a1, gems("\t\tfont-family: Courier New,Courier; ", 36));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-style: italic;", 21));
	} else {
		T33f10(a1, gems("\t\tfont-style: italic;", 21));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: black;", 15));
	} else {
		T33f10(a1, gems("\t\tcolor: black;", 15));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.rule {", 8));
	} else {
		T33f10(a1, gems("\t.rule {", 8));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tmargin: 2\045 0\045 0\045 1\045;", 22));
	} else {
		T33f10(a1, gems("\t\tmargin: 2\045 0\045 0\045 1\045;", 22));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.lhs_variable {", 16));
	} else {
		T33f10(a1, gems("\t.lhs_variable {", 16));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-family: Verdana,Georgia,sans serif; ", 43));
	} else {
		T33f10(a1, gems("\t\tfont-family: Verdana,Georgia,sans serif; ", 43));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: navy;", 14));
	} else {
		T33f10(a1, gems("\t\tcolor: navy;", 14));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t.rhs_variable {", 16));
	} else {
		T33f10(a1, gems("\t.rhs_variable {", 16));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tfont-family: Verdana,Georgia,sans serif; ", 43));
	} else {
		T33f10(a1, gems("\t\tfont-family: Verdana,Georgia,sans serif; ", 43));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\tcolor: green;", 15));
	} else {
		T33f10(a1, gems("\t\tcolor: green;", 15));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("\t}", 2));
	} else {
		T33f10(a1, gems("\t}", 2));
	}
}

/* PR_XML_DOC_GENERATOR.print_grammar */
void T27f5(T0* C, T0* a1)
{
	T27f6(C, a1);
	T27f7(C, a1);
	T27f8(C, a1);
}

/* PR_XML_DOC_GENERATOR.print_grammar_footer */
void T27f8(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("</grammar>", 10));
	} else {
		T33f10(a1, gems("</grammar>", 10));
	}
}

/* PR_XML_DOC_GENERATOR.print_rules */
void T27f7(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T2 t1;
	T0* t2;
	T1 t3;
	l3 = (((T26*)(((T27*)(C))->a1))->a1);
	l2 = (((T67*)(l3))->a1);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l4 = (T67f2(l3, l1));
		l5 = (((T69*)(l4))->a2);
		t2 = (((T70*)(l5))->a6);
		t3 = (T16f14(t2, (T4)(geint32(1))));
		t1 = ((t3)!=((T1)('@')));
		if (t1) {
			if (((T27*)(C))->a2) {
				t1 = ((l6)==(l5));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
				T27f9(C, a1);
				t2 = (((T69*)(l4))->a1);
				T27f10(C, t2, a1);
				T27f11(C, a1);
			} else {
				if (((T27*)(C))->a2) {
					t1 = ((l6)!=(EIF_VOID));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					T27f12(C, a1);
				}
				T27f13(C, a1);
				t2 = (((T69*)(l4))->a2);
				T27f14(C, t2, a1);
				T27f15(C, a1);
				t2 = (((T69*)(l4))->a1);
				T27f10(C, t2, a1);
				T27f16(C, a1);
				l6 = (l5);
			}
			t1 = ((T2)(!(((T27*)(C))->a2)));
			if (t1) {
				T27f12(C, a1);
			}
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
	if (((T27*)(C))->a2) {
		t1 = ((l6)!=(EIF_VOID));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T27f12(C, a1);
	}
}

/* PR_XML_DOC_GENERATOR.print_first_rhs_footer */
void T27f16(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t</rhs>", 8));
	} else {
		T33f10(a1, gems("\t\t</rhs>", 8));
	}
}

/* PR_XML_DOC_GENERATOR.print_first_rhs_header */
void T27f15(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t<rhs>", 7));
	} else {
		T33f10(a1, gems("\t\t<rhs>", 7));
	}
}

/* PR_XML_DOC_GENERATOR.print_lhs */
void T27f14(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	if ((a2)->id==21) {
		T21f27(a2, gems("\t\t<lhs>", 7));
	} else {
		T33f10(a2, gems("\t\t<lhs>", 7));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("\t\t\t<variable>", 13));
	} else {
		T33f11(a2, gems("\t\t\t<variable>", 13));
	}
	t1 = (((T70*)(a1))->a6);
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("</variable>", 11));
	} else {
		T33f10(a2, gems("</variable>", 11));
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\t\t</lhs>", 8));
	} else {
		T33f10(a2, gems("\t\t</lhs>", 8));
	}
}

/* PR_XML_DOC_GENERATOR.print_rule_header */
void T27f13(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t<rule>", 7));
	} else {
		T33f10(a1, gems("\t<rule>", 7));
	}
}

/* PR_XML_DOC_GENERATOR.print_rule_footer */
void T27f12(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t</rule>", 8));
	} else {
		T33f10(a1, gems("\t</rule>", 8));
	}
}

/* PR_XML_DOC_GENERATOR.print_next_rhs_footer */
void T27f11(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t</rhs>", 8));
	} else {
		T33f10(a1, gems("\t\t</rhs>", 8));
	}
}

/* PR_XML_DOC_GENERATOR.print_rhs */
void T27f10(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T1 t3;
	t1 = (T77f9(a1));
	if (t1) {
		T27f17(C, a2);
	} else {
		l2 = (((T77*)(a1))->a1);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			t2 = (T77f2(a1, l1));
			if ((t2)==EIF_VOID) {
				l3 = EIF_VOID;
			} else {
				switch ((t2)->id) {
				case 81:
					l3 = t2;
					break;
				default:
					l3 = EIF_VOID;
				}
			}
			t1 = ((l3)!=(EIF_VOID));
			if (t1) {
				T27f18(C, l3, a2);
			} else {
				t2 = (T77f2(a1, l1));
				if ((t2)==EIF_VOID) {
					l4 = EIF_VOID;
				} else {
					switch ((t2)->id) {
					case 70:
						l4 = t2;
						break;
					default:
						l4 = EIF_VOID;
					}
				}
				t1 = ((l4)!=(EIF_VOID));
				if (t1) {
					t2 = (((T70*)(l4))->a6);
					t3 = (T16f14(t2, (T4)(geint32(1))));
					t1 = ((t3)!=((T1)('@')));
				}
				if (t1) {
					T27f19(C, l4, a2);
				}
			}
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
	}
}

/* PR_XML_DOC_GENERATOR.print_variable */
void T27f19(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	if ((a2)->id==21) {
		T21f23(a2, gems("\t\t\t<variable>", 13));
	} else {
		T33f11(a2, gems("\t\t\t<variable>", 13));
	}
	t1 = (((T70*)(a1))->a6);
	if ((a2)->id==21) {
		T21f23(a2, t1);
	} else {
		T33f11(a2, t1);
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("</variable>", 11));
	} else {
		T33f10(a2, gems("</variable>", 11));
	}
}

/* PR_XML_DOC_GENERATOR.print_token */
void T27f18(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T2 t2;
	if ((a2)->id==21) {
		T21f27(a2, gems("\t\t\t<token>", 10));
	} else {
		T33f10(a2, gems("\t\t\t<token>", 10));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("\t\t\t\t<name>", 10));
	} else {
		T33f11(a2, gems("\t\t\t\t<name>", 10));
	}
	t1 = (((T81*)(a1))->a3);
	T27f20(C, t1, a2);
	if ((a2)->id==21) {
		T21f27(a2, gems("</name>", 7));
	} else {
		T33f10(a2, gems("</name>", 7));
	}
	if ((a2)->id==21) {
		T21f23(a2, gems("\t\t\t\t<literal", 12));
	} else {
		T33f11(a2, gems("\t\t\t\t<literal", 12));
	}
	t1 = (((T81*)(a1))->a4);
	t2 = ((t1)==(EIF_VOID));
	if (t2) {
		if ((a2)->id==21) {
			T21f27(a2, gems("/>", 2));
		} else {
			T33f10(a2, gems("/>", 2));
		}
	} else {
		if ((a2)->id==21) {
			T21f23(a2, gems(">", 1));
		} else {
			T33f11(a2, gems(">", 1));
		}
		t1 = (((T81*)(a1))->a4);
		T27f20(C, t1, a2);
		if ((a2)->id==21) {
			T21f27(a2, gems("</literal>", 10));
		} else {
			T33f10(a2, gems("</literal>", 10));
		}
	}
	if ((a2)->id==21) {
		T21f27(a2, gems("\t\t\t</token>", 11));
	} else {
		T33f10(a2, gems("\t\t\t</token>", 11));
	}
}

/* PR_XML_DOC_GENERATOR.print_escaped */
void T27f20(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T2 t1;
	l2 = (((T16*)(a1))->a2);
	l1 = ((T4)(geint32(1)));
	t1 = (T4f1(&l1, l2));
	while (!(t1)) {
		l3 = (T16f14(a1, l1));
		switch (l3) {
		case (T1)(T1)('\''):
			if ((a2)->id==21) {
				T21f23(a2, gems("&apos;", 6));
			} else {
				T33f11(a2, gems("&apos;", 6));
			}
			break;
		case (T1)(T1)('\"'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&quot;", 6));
			} else {
				T33f11(a2, gems("&quot;", 6));
			}
			break;
		case (T1)(T1)('<'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&lt;", 4));
			} else {
				T33f11(a2, gems("&lt;", 4));
			}
			break;
		case (T1)(T1)('>'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&gt;", 4));
			} else {
				T33f11(a2, gems("&gt;", 4));
			}
			break;
		case (T1)(T1)('&'):
			if ((a2)->id==21) {
				T21f23(a2, gems("&amp;", 5));
			} else {
				T33f11(a2, gems("&amp;", 5));
			}
			break;
		default:
			if ((a2)->id==21) {
				T21f25(a2, l3);
			} else {
				T33f12(a2, l3);
			}
			break;
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
	}
}

/* PR_XML_DOC_GENERATOR.print_empty_rhs */
void T27f17(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t\t<empty/>", 11));
	} else {
		T33f10(a1, gems("\t\t\t<empty/>", 11));
	}
}

/* PR_XML_DOC_GENERATOR.print_next_rhs_header */
void T27f9(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("\t\t<rhs>", 7));
	} else {
		T33f10(a1, gems("\t\t<rhs>", 7));
	}
}

/* PR_XML_DOC_GENERATOR.print_grammar_header */
void T27f6(T0* C, T0* a1)
{
	if ((a1)->id==21) {
		T21f27(a1, gems("<\?xml version=\"1.0\" encoding=\"iso-8859-1\"\?>", 43));
	} else {
		T33f10(a1, gems("<\?xml version=\"1.0\" encoding=\"iso-8859-1\"\?>", 43));
	}
	if ((a1)->id==21) {
		T21f27(a1, gems("<grammar>", 9));
	} else {
		T33f10(a1, gems("<grammar>", 9));
	}
}

/* KL_TEXT_OUTPUT_FILE.is_open_write */
T2 T21f1(T0* C)
{
	T2 R = 0;
	R = (T21f2(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_open_write */
T2 T21f2(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T21*)(C))->a3)==((T4)(geint32(2))));
	if (!(t1)) {
		t1 = ((((T21*)(C))->a3)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		t1 = ((((T21*)(C))->a3)==((T4)(geint32(5))));
	}
	if (!(t1)) {
		R = ((((T21*)(C))->a3)==((T4)(geint32(3))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T21f21(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t1 = ((((T21*)(C))->a11)!=(ge361ov1477));
		if (t1) {
			T21f29(C);
		}
	} else {
		t1 = (T21f12(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T21f22(C);
		}
	}
}

/* KL_TEXT_OUTPUT_FILE.is_closed */
T2 T21f12(T0* C)
{
	T2 R = 0;
	R = (T21f19(C));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_is_closed */
T2 T21f19(T0* C)
{
	T2 R = 0;
	R = ((((T21*)(C))->a3)==((T4)(geint32(0))));
	return R;
}

/* KL_TEXT_OUTPUT_FILE.old_open_write */
void T21f29(T0* C)
{
	T14 t1;
	T2 t2;
	T21f29p1(C);
	t1 = (T21f16(C));
	t2 = ((((T21*)(C))->a15)==(t1));
	if (t2) {
		((T21*)(C))->a3 = ((T4)(geint32(0)));
		((T21*)(C))->a17 = (EIF_FALSE);
	}
}

/* KL_TEXT_OUTPUT_FILE.default_pointer */
T14 T21f16(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_OUTPUT_FILE.open_write */
void T21f29p1(T0* C)
{
	T0* l1 = 0;
	T119 t1;
	T14 t2;
	l1 = (T16f3(((T21*)(C))->a11));
	t1.id = 119;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T119f2(&t1));
	((T21*)(C))->a15 = (T21f18(C, t2, (T4)(geint32(1))));
	((T21*)(C))->a3 = ((T4)(geint32(2)));
}

/* KL_TEXT_OUTPUT_FILE.file_open */
T14 T21f18(T0* C, T14 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* STRING.to_c */
T0* T16f3(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = (((T16*)(C))->a1);
	((T15*)(l1))->a2[((T16*)(C))->a2] = ((T1)('\000'));
	R = (l1);
	return R;
}

/* KL_TEXT_OUTPUT_FILE.make */
T0* T21c20(T0* a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T21));
	((T21*)(C))->id = 21;
	((T21*)(C))->a8 = (a1);
	t1 = (((T16*)(a1))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		t3 = (T21f9(C));
		t3 = (T116f1(t3, a1));
		T21f28(C, t3);
	} else {
		T21f28(C, ge361ov1477);
	}
	return C;
}

/* KL_TEXT_OUTPUT_FILE.old_make */
void T21f28(T0* C, T0* a1)
{
	((T21*)(C))->a11 = (a1);
	((T21*)(C))->a3 = ((T4)(geint32(0)));
}

/* PR_HTML_DOC_GENERATOR.set_lhs_shared */
void T28f4(T0* C, T2 a1)
{
	((T28*)(C))->a2 = (a1);
}

/* PR_XML_DOC_GENERATOR.set_lhs_shared */
void T27f4(T0* C, T2 a1)
{
	((T27*)(C))->a2 = (a1);
}

/* PR_HTML_DOC_GENERATOR.make */
T0* T28c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T28));
	((T28*)(C))->id = 28;
	((T28*)(C))->a1 = (a1);
	return C;
}

/* PR_XML_DOC_GENERATOR.make */
T0* T27c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T27));
	((T27*)(C))->id = 27;
	((T27*)(C))->a1 = (a1);
	return C;
}

/* STRING.is_equal */
T2 T16f4(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = ((a1)==(C));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		l1 = (((T16*)(C))->a2);
		t2 = (((T16*)(a1))->a2);
		t1 = ((l1)==(t2));
		if (t1) {
			t3 = (((T16*)(a1))->a1);
			t2 = (T16f7(C, ((T16*)(C))->a1, t3, l1));
			R = ((t2)==((T4)(geint32(0))));
		}
	}
	return R;
}

/* STRING.str_strict_cmp */
T4 T16f7(T0* C, T0* a1, T0* a2, T4 a3)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	t1 = ((l1)==(a3));
	while (!(t1)) {
		t2 = (((T15*)(a1))->a2[l1]);
		l2 = ((T4)(t2));
		t2 = (((T15*)(a2))->a2[l1]);
		l3 = ((T4)(t2));
		t1 = ((l2)!=(l3));
		if (t1) {
			R = ((T4)((l2)-(l3)));
			l1 = ((T4)((a3)-((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(a3));
	}
	return R;
}

/* GEYACC.parse_input_file */
void T18f21(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l1 = T47c255(((T18*)(C))->a2);
	T47f256(l1, ((T18*)(C))->a3);
	t1 = ((((T18*)(C))->a11)!=(EIF_VOID));
	if (t1) {
		l2 = T48c35(((T18*)(C))->a11);
		T48f36(l2);
		t1 = (T48f1(l2));
		if (t1) {
			T47f257(l1, l2);
			T48f37(l2);
		} else {
			l3 = T49c7(((T18*)(C))->a11);
			T25f7(((T18*)(C))->a2, l3);
			t2 = (T18f8(C));
			T31f2(t2, (T4)(geint32(1)));
		}
	} else {
		t2 = (T18f9(C));
		t2 = (T32f2(t2));
		T47f257(l1, t2);
	}
	t1 = (((T47*)(l1))->a1);
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T18f8(C));
		T31f2(t2, (T4)(geint32(1)));
	} else {
		((T18*)(C))->a5 = (((T47*)(l1))->a2);
	}
}

/* KL_STANDARD_FILES.input */
unsigned char ge290os2352 = '\0';
T0* ge290ov2352;
T0* T32f2(T0* C)
{
	T0* R = 0;
	if (ge290os2352) {
		return ge290ov2352;
	} else {
		ge290os2352 = '\1';
	}
	R = T51c18();
	ge290ov2352 = R;
	return R;
}

/* KL_STDIN_FILE.make */
T0* T51c18()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T51));
	((T51*)(C))->id = 51;
	T51f19(C, gems("stdin", 5));
	((T51*)(C))->a1 = (EIF_FALSE);
	return C;
}

/* KL_STDIN_FILE.make_open_stdin */
void T51f19(T0* C, T0* a1)
{
	T51f20(C, a1);
	((T51*)(C))->a2 = (T51f3(C, (T4)(geint32(0))));
	T51f21(C);
}

/* KL_STDIN_FILE.set_read_mode */
void T51f21(T0* C)
{
	((T51*)(C))->a5 = ((T4)(geint32(1)));
}

/* KL_STDIN_FILE.console_def */
T14 T51f3(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDIN_FILE.old_make */
void T51f20(T0* C, T0* a1)
{
	((T51*)(C))->a4 = (a1);
	((T51*)(C))->a5 = ((T4)(geint32(0)));
}

/* UT_CANNOT_READ_FILE_ERROR.make */
T0* T49c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T49));
	((T49*)(C))->id = 49;
	((T49*)(C))->a1 = T121c6((T4)(geint32(1)), (T4)(geint32(1)));
	T121f7(((T49*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* KL_TEXT_INPUT_FILE.close */
void T48f37(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		T48f40(C);
		((T48*)(C))->a11 = (EIF_VOID);
	}
}

/* KL_TEXT_INPUT_FILE.old_close */
void T48f40(T0* C)
{
	T48f41(C, ((T48*)(C))->a17);
	((T48*)(C))->a3 = ((T4)(geint32(0)));
	((T48*)(C))->a19 = (EIF_FALSE);
}

/* KL_TEXT_INPUT_FILE.file_close */
void T48f41(T0* C, T14 a1)
{
	file_close((FILE *)a1);
}

/* PR_YACC_PARSER.parse_file */
void T47f257(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T47f11(C, a1));
	T47f260(C, t1);
	T47f261(C);
}

/* PR_YACC_PARSER.parse */
void T47f261(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((((T47*)(C))->a25)==((T4)(geint32(105))));
	if (t1) {
		l1 = (((T47*)(C))->a27);
		l2 = (((T47*)(C))->a28);
		l3 = (((T47*)(C))->a29);
		l4 = (((T47*)(C))->a30);
		l5 = (((T47*)(C))->a31);
		l6 = (((T47*)(C))->a32);
		l7 = (((T47*)(C))->a33);
		((T47*)(C))->a25 = ((T4)(geint32(104)));
	} else {
		((T47*)(C))->a35 = ((T4)(geint32(0)));
		((T47*)(C))->a36 = (EIF_TRUE);
		((T47*)(C))->a37 = ((T4)(geint32(0)));
		T47f266(C);
		((T47*)(C))->a38 = ((T4)(geint32(-1)));
		l1 = (((T98*)(((T47*)(C))->a17))->a1);
		((T47*)(C))->a25 = ((T4)(geint32(104)));
		l7 = ((T4)(geint32(1)));
	}
	t1 = ((((T47*)(C))->a25)!=((T4)(geint32(104))));
	while (!(t1)) {
		switch (l7) {
		case (T4)(T4)(geint32(1)):
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a38), l1));
			if (t1) {
				l1 = ((T4)((l1)+((T4)(geint32(200)))));
				t2 = (T47f18(C));
				((T47*)(C))->a17 = (T129f2(t2, ((T47*)(C))->a17, l1));
			}
			((T98*)(((T47*)(C))->a17))->a2[((T47*)(C))->a38] = (l2);
			l3 = (((T98*)(((T47*)(C))->a45))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(-32768))));
			if (t1) {
				l7 = ((T4)(geint32(2)));
			} else {
				if (((T47*)(C))->a36) {
					T47f267(C);
					((T47*)(C))->a36 = (EIF_FALSE);
				}
				t1 = (T4f1(&(((T47*)(C))->a47), (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f12(&(((T47*)(C))->a47), (T4)(geint32(282))));
					if (t1) {
						l4 = (((T98*)(((T47*)(C))->a50))->a2[((T47*)(C))->a47]);
					} else {
						l4 = ((T4)(geint32(67)));
					}
					l3 = ((T4)((l3)+(l4)));
				} else {
					t1 = ((((T47*)(C))->a47)==((T4)(geint32(0))));
					if (t1) {
						l4 = ((T4)(geint32(0)));
					} else {
						((T47*)(C))->a35 = ((T4)((((T47*)(C))->a35)+((T4)(geint32(1)))));
						T47f268(C, l2);
						T47f269(C);
						l3 = ((T4)(geint32(-1)));
					}
				}
				t1 = ((T2)((l3)<((T4)(geint32(0)))));
				if (!(t1)) {
					t1 = (T4f1(&l3, (T4)(geint32(237))));
				}
				if (!(t1)) {
					t3 = (((T98*)(((T47*)(C))->a53))->a2[l3]);
					t1 = ((t3)!=(l4));
				}
				if (t1) {
					l7 = ((T4)(geint32(2)));
				} else {
					l3 = (((T98*)(((T47*)(C))->a54))->a2[l3]);
					t1 = ((T2)((l3)<((T4)(geint32(0)))));
					if (t1) {
						t1 = ((l3)==((T4)(geint32(-32768))));
						if (t1) {
							l7 = ((T4)(geint32(4)));
						} else {
							l3 = ((T4)(-(l3)));
							l7 = ((T4)(geint32(3)));
						}
					} else {
						t1 = ((l3)==((T4)(geint32(0))));
						if (t1) {
							l7 = ((T4)(geint32(4)));
						} else {
							t1 = ((l3)==((T4)(geint32(117))));
							if (t1) {
								T47f270(C);
							} else {
								t1 = (T4f1(&(((T47*)(C))->a47), (T4)(geint32(0))));
								if (t1) {
									((T47*)(C))->a36 = (EIF_TRUE);
								}
								T47f271(C, l4);
								t1 = ((((T47*)(C))->a37)!=((T4)(geint32(0))));
								if (t1) {
									((T47*)(C))->a37 = ((T4)((((T47*)(C))->a37)-((T4)(geint32(1)))));
								}
								l2 = (l3);
							}
						}
					}
				}
			}
			break;
		case (T4)(T4)(geint32(2)):
			l3 = (((T98*)(((T47*)(C))->a56))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(0))));
			if (t1) {
				l7 = ((T4)(geint32(4)));
			} else {
				l7 = ((T4)(geint32(3)));
			}
			break;
		case (T4)(T4)(geint32(3)):
			T47f272(C, l3);
			switch (((T47*)(C))->a25) {
			case (T4)(T4)(geint32(104)):
				l3 = (((T98*)(((T47*)(C))->a58))->a2[l3]);
				l6 = (((T98*)(((T47*)(C))->a17))->a2[((T47*)(C))->a38]);
				l5 = ((T4)((l3)-((T4)(geint32(38)))));
				t3 = (((T98*)(((T47*)(C))->a60))->a2[l5]);
				l2 = ((T4)((t3)+(l6)));
				t1 = (T4f4(&l2, (T4)(geint32(0))));
				if (t1) {
					t1 = (T4f12(&l2, (T4)(geint32(237))));
				}
				if (t1) {
					t3 = (((T98*)(((T47*)(C))->a53))->a2[l2]);
					t1 = ((t3)==(l6));
				}
				if (t1) {
					l2 = (((T98*)(((T47*)(C))->a54))->a2[l2]);
				} else {
					l2 = (((T98*)(((T47*)(C))->a61))->a2[l5]);
				}
				l7 = ((T4)(geint32(1)));
				break;
			case (T4)(T4)(geint32(105)):
				((T47*)(C))->a27 = (l1);
				((T47*)(C))->a28 = (l2);
				((T47*)(C))->a29 = (l3);
				((T47*)(C))->a30 = (l4);
				((T47*)(C))->a31 = (l5);
				((T47*)(C))->a32 = (l6);
				((T47*)(C))->a33 = (l7);
				break;
			case (T4)(T4)(geint32(103)):
				((T47*)(C))->a25 = ((T4)(geint32(104)));
				l7 = ((T4)(geint32(4)));
				break;
			default:
				break;
			}
			break;
		case (T4)(T4)(geint32(4)):
			t1 = ((((T47*)(C))->a37)==((T4)(geint32(3))));
			if (t1) {
				t1 = (T4f12(&(((T47*)(C))->a47), (T4)(geint32(0))));
				if (t1) {
					T47f269(C);
				} else {
					((T47*)(C))->a36 = (EIF_TRUE);
					l7 = ((T4)(geint32(5)));
				}
			} else {
				t1 = ((((T47*)(C))->a37)==((T4)(geint32(0))));
				if (t1) {
					((T47*)(C))->a35 = ((T4)((((T47*)(C))->a35)+((T4)(geint32(1)))));
					T47f268(C, l2);
				}
				((T47*)(C))->a37 = ((T4)(geint32(3)));
				l7 = ((T4)(geint32(5)));
			}
			break;
		case (T4)(T4)(geint32(5)):
			l3 = (((T98*)(((T47*)(C))->a45))->a2[l2]);
			t1 = ((l3)==((T4)(geint32(-32768))));
			if (t1) {
				l7 = ((T4)(geint32(6)));
			} else {
				l3 = ((T4)((l3)+((T4)(geint32(1)))));
				t1 = ((T2)((l3)<((T4)(geint32(0)))));
				if (!(t1)) {
					t1 = (T4f1(&l3, (T4)(geint32(237))));
				}
				if (!(t1)) {
					t3 = (((T98*)(((T47*)(C))->a53))->a2[l3]);
					t1 = ((t3)!=((T4)(geint32(1))));
				}
				if (t1) {
					l7 = ((T4)(geint32(6)));
				} else {
					l3 = (((T98*)(((T47*)(C))->a54))->a2[l3]);
					t1 = ((T2)((l3)<((T4)(geint32(0)))));
					if (t1) {
						t1 = ((l3)==((T4)(geint32(-32768))));
						if (t1) {
							l7 = ((T4)(geint32(6)));
						} else {
							l3 = ((T4)(-(l3)));
							l7 = ((T4)(geint32(3)));
						}
					} else {
						t1 = ((l3)==((T4)(geint32(0))));
						if (t1) {
							l7 = ((T4)(geint32(6)));
						} else {
							t1 = ((l3)==((T4)(geint32(117))));
							if (t1) {
								T47f270(C);
							} else {
								T47f273(C);
								l2 = (l3);
								l7 = ((T4)(geint32(1)));
							}
						}
					}
				}
			}
			break;
		case (T4)(T4)(geint32(6)):
			t1 = ((((T47*)(C))->a38)==((T4)(geint32(0))));
			if (t1) {
				T47f269(C);
			} else {
				T47f274(C, l2);
				((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
				l2 = (((T98*)(((T47*)(C))->a17))->a2[((T47*)(C))->a38]);
				l7 = ((T4)(geint32(5)));
			}
			break;
		default:
			break;
		}
		t1 = ((((T47*)(C))->a25)!=((T4)(geint32(104))));
	}
	t1 = ((((T47*)(C))->a25)!=((T4)(geint32(105))));
	if (t1) {
		T47f275(C);
	}
}

/* PR_YACC_PARSER.yy_clear_all */
void T47f275(T0* C)
{
	T47f301(C);
}

/* PR_YACC_PARSER.clear_all */
void T47f301(T0* C)
{
	T47f319(C);
}

/* PR_YACC_PARSER.clear_stacks */
void T47f319(T0* C)
{
	T47f322(C);
}

/* PR_YACC_PARSER.yy_clear_value_stacks */
void T47f322(T0* C)
{
	T2 t1;
	t1 = ((((T47*)(C))->a128)!=(EIF_VOID));
	if (t1) {
		T131f6(((T47*)(C))->a128);
	}
	t1 = ((((T47*)(C))->a133)!=(EIF_VOID));
	if (t1) {
		T120f6(((T47*)(C))->a133);
	}
	t1 = ((((T47*)(C))->a137)!=(EIF_VOID));
	if (t1) {
		T98f10(((T47*)(C))->a137);
	}
	t1 = ((((T47*)(C))->a156)!=(EIF_VOID));
	if (t1) {
		T139f6(((T47*)(C))->a156);
	}
	t1 = ((((T47*)(C))->a144)!=(EIF_VOID));
	if (t1) {
		T135f6(((T47*)(C))->a144);
	}
	t1 = ((((T47*)(C))->a149)!=(EIF_VOID));
	if (t1) {
		T137f6(((T47*)(C))->a149);
	}
}

/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].clear_all */
void T137f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T137*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T137*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [PR_TYPE].clear_all */
void T135f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T135*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T135*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [PR_TOKEN].clear_all */
void T139f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T139*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T139*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [INTEGER].clear_all */
void T98f10(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T98*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T98*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [STRING].clear_all */
void T120f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T120*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T120*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* SPECIAL [ANY].clear_all */
void T131f6(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T4 t1;
	T2 t2;
	t1 = (((T131*)(C))->a1);
	l1 = ((T4)((t1)-((T4)(geint32(1)))));
	t2 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t2)) {
		((T131*)(C))->a2[l1] = (l2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t2 = ((T2)((l1)<((T4)(geint32(0)))));
	}
}

/* PR_YACC_PARSER.yy_pop_last_value */
void T47f274(T0* C, T4 a1)
{
	T4 l1 = 0;
	l1 = (((T98*)(((T47*)(C))->a65))->a2[a1]);
	switch (l1) {
	case (T4)(T4)(geint32(1)):
		((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(2)):
		((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(3)):
		((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(4)):
		((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(5)):
		((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)-((T4)(geint32(1)))));
		break;
	case (T4)(T4)(geint32(6)):
		((T47*)(C))->a81 = ((T4)((((T47*)(C))->a81)-((T4)(geint32(1)))));
		break;
	default:
		T47f269(C);
		break;
	}
}

/* PR_YACC_PARSER.yy_push_error_value */
void T47f273(T0* C)
{
	T0* l1 = 0;
	T2 t1;
	((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
	t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
	if (t1) {
		t1 = ((((T47*)(C))->a128)==(EIF_VOID));
		if (t1) {
			((T47*)(C))->a129 = T132c3();
			((T47*)(C))->a127 = ((T4)(geint32(10)));
			((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
		} else {
			((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
			((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
		}
	}
	((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
}

/* KL_SPECIAL_ROUTINES [ANY].resize */
T0* T132f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T131*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T131f2(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [ANY].resized_area */
T0* T131f2(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T131c4(a1);
	l2 = (((T131*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T131*)(C))->a2[l1]);
		((T131*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [ANY].make */
T0* T131c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T131)+a1*sizeof(T0*));
	((T131*)(C))->a1 = a1;
	((T131*)(C))->id = 131;
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].make */
T0* T132f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T234c2(a1);
	R = (((T234*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [ANY].make_area */
T0* T234c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T234));
	((T234*)(C))->id = 234;
	((T234*)(C))->a1 = T131c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [ANY].default_create */
T0* T132c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T132));
	((T132*)(C))->id = 132;
	return C;
}

/* PR_YACC_PARSER.yy_do_action */
void T47f272(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T0* t2;
	T0* t3;
	T4 t4;
	T4 t5;
	switch (a1) {
	case (T4)(T4)(geint32(1)):
		if (((T47*)(C))->a1) {
			T47f284(C);
			T47f285(C);
		}
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(5)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(4)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(2)):
		T47f286(C);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(3)):
		((T47*)(C))->a140 = ((T4)(geint32(1)));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(4)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(5)):
		t2 = (((T26*)(((T47*)(C))->a2))->a7);
		t3 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T108f11(t2, t3);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(6)):
		((T47*)(C))->a141 = (EIF_VOID);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(2)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(7)):
		((T47*)(C))->a141 = (EIF_VOID);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(2)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(8)):
		((T47*)(C))->a140 = ((T4)((((T47*)(C))->a140)+((T4)(geint32(1)))));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(9)):
		((T47*)(C))->a140 = ((T4)((((T47*)(C))->a140)+((T4)(geint32(1)))));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(10)):
		((T47*)(C))->a140 = ((T4)((((T47*)(C))->a140)+((T4)(geint32(1)))));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(11)):
		t1 = ((((T47*)(C))->a142)!=(EIF_VOID));
		if (t1) {
			T47f287(C);
		} else {
			t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
			((T47*)(C))->a142 = T134c3(t2, ((T47*)(C))->a16);
		}
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(12)):
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T26f24(((T47*)(C))->a2, t4);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(13)):
		((T47*)(C))->a141 = (T47f143(C));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(14)):
		((T47*)(C))->a141 = (((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(15)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f145(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(16)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f148(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(17)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f148(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(18)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f148(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(19)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f148(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(20)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f148(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(21)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f148(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(22)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t3 = (((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81]);
		l2 = (T47f150(C, t2, t3));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T47*)(C))->a81 = ((T4)((((T47*)(C))->a81)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(23)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l2 = (T47f151(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			t1 = (T4f4(&(((T47*)(C))->a80), ((T47*)(C))->a146));
			if (t1) {
				t1 = ((((T47*)(C))->a144)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a147 = T136c3();
					((T47*)(C))->a146 = ((T4)(geint32(10)));
					((T47*)(C))->a144 = (T136f1(((T47*)(C))->a147, ((T47*)(C))->a146));
				} else {
					((T47*)(C))->a146 = ((T4)((((T47*)(C))->a146)+((T4)(geint32(10)))));
					((T47*)(C))->a144 = (T136f2(((T47*)(C))->a147, ((T47*)(C))->a144, ((T47*)(C))->a146));
				}
			}
			((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80] = (l2);
		}
		break;
	case (T4)(T4)(geint32(24)):
		l3 = (((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(2)))));
			((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81] = (l3);
		}
		break;
	case (T4)(T4)(geint32(25)):
		l3 = (EIF_VOID);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a81 = ((T4)((((T47*)(C))->a81)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a81), ((T47*)(C))->a152));
			if (t1) {
				t1 = ((((T47*)(C))->a149)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a153 = T138c3();
					((T47*)(C))->a152 = ((T4)(geint32(10)));
					((T47*)(C))->a149 = (T138f1(((T47*)(C))->a153, ((T47*)(C))->a152));
				} else {
					((T47*)(C))->a152 = ((T4)((((T47*)(C))->a152)+((T4)(geint32(10)))));
					((T47*)(C))->a149 = (T138f2(((T47*)(C))->a153, ((T47*)(C))->a149, ((T47*)(C))->a152));
				}
			}
			((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81] = (l3);
		}
		break;
	case (T4)(T4)(geint32(26)):
		l3 = T109c13((T4)(geint32(5)));
		t2 = (((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80]);
		T109f14(l3, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a81 = ((T4)((((T47*)(C))->a81)+((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a81), ((T47*)(C))->a152));
			if (t1) {
				t1 = ((((T47*)(C))->a149)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a153 = T138c3();
					((T47*)(C))->a152 = ((T4)(geint32(10)));
					((T47*)(C))->a149 = (T138f1(((T47*)(C))->a153, ((T47*)(C))->a152));
				} else {
					((T47*)(C))->a152 = ((T4)((((T47*)(C))->a152)+((T4)(geint32(10)))));
					((T47*)(C))->a149 = (T138f2(((T47*)(C))->a153, ((T47*)(C))->a149, ((T47*)(C))->a152));
				}
			}
			((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81] = (l3);
		}
		break;
	case (T4)(T4)(geint32(27)):
		l3 = (((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81]);
		t2 = (((T135*)(((T47*)(C))->a144))->a2[((T47*)(C))->a80]);
		T109f14(l3, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a80 = ((T4)((((T47*)(C))->a80)-((T4)(geint32(1)))));
			((T137*)(((T47*)(C))->a149))->a2[((T47*)(C))->a81] = (l3);
		}
		break;
	case (T4)(T4)(geint32(28)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(29)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(30)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(31)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f154(C, t2, ((T47*)(C))->a141));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(32)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f154(C, t2, ((T47*)(C))->a141));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(33)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f154(C, t2, ((T47*)(C))->a141));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(34)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f154(C, t2, ((T47*)(C))->a141));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(35)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f158(C, t2, ((T47*)(C))->a141));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(36)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(37)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(38)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(39)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f159(C, t2, ((T47*)(C))->a140));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(40)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f159(C, t2, ((T47*)(C))->a140));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(41)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f159(C, t2, ((T47*)(C))->a140));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(42)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f159(C, t2, ((T47*)(C))->a140));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(43)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f160(C, t2, ((T47*)(C))->a140));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(44)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(45)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(46)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(47)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f161(C, t2, ((T47*)(C))->a140));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(48)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f161(C, t2, ((T47*)(C))->a140));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(49)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f161(C, t2, ((T47*)(C))->a140));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(50)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f161(C, t2, ((T47*)(C))->a140));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(51)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f162(C, t2, ((T47*)(C))->a140));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(52)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(53)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(54)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(55)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f163(C, t2, ((T47*)(C))->a140));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(56)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f163(C, t2, ((T47*)(C))->a140));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(57)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f163(C, t2, ((T47*)(C))->a140));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(58)):
		t4 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
		t2 = (((T120*)(((T47*)(C))->a133))->a2[t4]);
		l4 = (T47f163(C, t2, ((T47*)(C))->a140));
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T47f288(C, l4, t4);
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T47f289(C, l4, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(2)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(59)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f164(C, t2, ((T47*)(C))->a140));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(60)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(61)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(62)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(2)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(63)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l1 = (T47f165(C, t2, ((T47*)(C))->a141));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(64)):
		T47f290(C);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(65)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(66)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(67)):
		T47f291(C, ((T47*)(C))->a166);
		((T47*)(C))->a166 = (EIF_VOID);
		((T47*)(C))->a167 = (EIF_VOID);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(4)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(3)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(68)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = (T47f168(C, t2));
		if (t1) {
			t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
			T47f292(C, t2);
			t2 = (T47f169(C));
			((T47*)(C))->a166 = (T47f170(C, t2));
		} else {
			t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
			t2 = (T47f171(C, t2));
			((T47*)(C))->a166 = (T47f170(C, t2));
			t2 = (((T69*)(((T47*)(C))->a166))->a2);
			t2 = (((T70*)(t2))->a1);
			t4 = (((T67*)(t2))->a1);
			t1 = (T4f1(&t4, (T4)(geint32(1))));
			if (t1) {
				t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
				T47f293(C, t2);
			}
		}
		((T47*)(C))->a167 = (EIF_VOID);
		T47f294(C, ((T47*)(C))->a166);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(69)):
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T69f21(((T47*)(C))->a166, t4);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(70)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(71)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(2)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(72)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(73)):
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		t1 = ((T2)((t4)<((T4)(geint32(1)))));
		if (!(t1)) {
			t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
			t2 = (((T69*)(((T47*)(C))->a166))->a3);
			t5 = (((T141*)(t2))->a1);
			t1 = (T4f1(&t4, t5));
		}
		if (t1) {
			t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
			T47f295(C, t4);
		} else {
			t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
			t4 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t4 = (((T98*)(((T47*)(C))->a137))->a2[t4]);
			t2 = (T47f172(C, t2, t4));
			t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
			T47f296(C, t2, t4, ((T47*)(C))->a166);
		}
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(6)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(2)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(74)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(75)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t2 = (T47f173(C, t2));
		T47f297(C, t2, ((T47*)(C))->a166);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(76)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t2 = (T47f174(C, t2));
		T47f297(C, t2, ((T47*)(C))->a166);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(77)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t2 = (T47f175(C, t2));
		T47f297(C, t2, ((T47*)(C))->a166);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(78)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t2 = (T47f176(C, t2));
		T47f298(C, t2, ((T47*)(C))->a166);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(79)):
		t1 = ((((T47*)(C))->a167)!=(EIF_VOID));
		if (t1) {
			T47f299(C);
		} else {
			((T47*)(C))->a167 = (((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79]);
		}
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(3)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(80)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = (T47f168(C, t2));
		if (t1) {
			t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
			l4 = (T47f177(C, t2));
		} else {
			t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
			T47f300(C, t2);
			l4 = (T47f174(C, gems("\'a\'", 3)));
		}
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(81)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		l4 = (T47f174(C, t2));
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a79 = ((T4)((((T47*)(C))->a79)+((T4)(geint32(1)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a79), ((T47*)(C))->a155));
			if (t1) {
				t1 = ((((T47*)(C))->a156)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a157 = T140c3();
					((T47*)(C))->a155 = ((T4)(geint32(10)));
					((T47*)(C))->a156 = (T140f1(((T47*)(C))->a157, ((T47*)(C))->a155));
				} else {
					((T47*)(C))->a155 = ((T4)((((T47*)(C))->a155)+((T4)(geint32(10)))));
					((T47*)(C))->a156 = (T140f2(((T47*)(C))->a157, ((T47*)(C))->a156, ((T47*)(C))->a155));
				}
			}
			((T139*)(((T47*)(C))->a156))->a2[((T47*)(C))->a79] = (l4);
		}
		break;
	case (T4)(T4)(geint32(82)):
		T47f291(C, ((T47*)(C))->a166);
		t2 = (((T69*)(((T47*)(C))->a166))->a2);
		((T47*)(C))->a166 = (T47f170(C, t2));
		((T47*)(C))->a167 = (EIF_VOID);
		t4 = (((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78]);
		T69f21(((T47*)(C))->a166, t4);
		T47f294(C, ((T47*)(C))->a166);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)-((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(83)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(0)))));
			((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
			t1 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
			if (t1) {
				t1 = ((((T47*)(C))->a128)==(EIF_VOID));
				if (t1) {
					((T47*)(C))->a129 = T132c3();
					((T47*)(C))->a127 = ((T4)(geint32(10)));
					((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
				} else {
					((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
					((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
				}
			}
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(84)):
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(85)):
		t2 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		T26f25(((T47*)(C))->a2, t2);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(2)))));
			((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)-((T4)(geint32(1)))));
			((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (l1);
		}
		break;
	case (T4)(T4)(geint32(86)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(87)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(88)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(89)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(90)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(91)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(92)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	case (T4)(T4)(geint32(93)):
		l5 = (((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77]);
		t1 = ((((T47*)(C))->a25)==((T4)(geint32(104))));
		if (t1) {
			((T47*)(C))->a38 = ((T4)((((T47*)(C))->a38)-((T4)(geint32(1)))));
			((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (l5);
		}
		break;
	default:
		T47f269(C);
		break;
	}
}

/* PR_GRAMMAR.set_eiffel_code */
void T26f25(T0* C, T0* a1)
{
	((T26*)(C))->a9 = (a1);
}

/* PR_YACC_PARSER.report_prec_not_token_error */
void T47f300(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T150c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_PREC_NOT_TOKEN_ERROR.make */
T0* T150c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T150));
	((T150*)(C))->id = 150;
	((T150*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T150*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T150*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T150*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.filename */
T0* T47f229(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	T0* t2;
	if ((((T47*)(C))->a20)==EIF_VOID) {
		l1 = EIF_VOID;
	} else {
		switch ((((T47*)(C))->a20)->id) {
		case 127:
			l1 = ((T47*)(C))->a20;
			break;
		default:
			l1 = EIF_VOID;
		}
	}
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		t2 = (((T127*)(l1))->a9);
		R = ((((t2)->id==48)?((T48*)(t2))->a7:((T51*)(t2))->a4));
	} else {
		R = (gems("string", 6));
	}
	return R;
}

/* PR_YACC_PARSER.new_token */
T0* T47f177(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (T16f10(a1));
	t1 = (T124f1(((T47*)(C))->a4, l1));
	if (t1) {
		R = (T124f2(((T47*)(C))->a4, l1));
	} else {
		t2 = (((T26*)(((T47*)(C))->a2))->a6);
		t3 = (((T95*)(t2))->a1);
		l2 = ((T4)((t3)+((T4)(geint32(1)))));
		t2 = (T47f244(C));
		R = T81c20(l2, a1, t2);
		T124f35(((T47*)(C))->a4, R, l1);
		T26f33(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_GRAMMAR.put_token */
void T26f33(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T95f8(((T26*)(C))->a6));
	if (t1) {
		t2 = (((T95*)(((T26*)(C))->a6))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(100)))));
		T95f20(((T26*)(C))->a6, t2);
	}
	T95f21(((T26*)(C))->a6, a1);
}

/* DS_ARRAYED_LIST [PR_TOKEN].is_full */
T2 T95f8(T0* C)
{
	T2 R = 0;
	R = ((((T95*)(C))->a1)==(((T95*)(C))->a5));
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].force */
void T124f35(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T124f38(C);
	T124f36(C, a2);
	t1 = ((((T124*)(C))->a3)!=((T4)(geint32(0))));
	if (t1) {
		T124f39(C, a1, ((T124*)(C))->a3);
	} else {
		t1 = ((((T124*)(C))->a8)==(((T124*)(C))->a9));
		if (t1) {
			t2 = ((T4)((((T124*)(C))->a8)+((T4)(geint32(1)))));
			t2 = (T124f10(C, t2));
			T124f40(C, t2);
			l2 = (T124f11(C, a2));
		} else {
			l2 = (((T124*)(C))->a12);
		}
		l1 = (((T124*)(C))->a13);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T124*)(C))->a14 = ((T4)((((T124*)(C))->a14)+((T4)(geint32(1)))));
			l1 = (((T124*)(C))->a14);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T124f16(C, l1));
			((T124*)(C))->a13 = ((T4)((t2)-(t3)));
		}
		t2 = (T124f17(C, l2));
		T124f41(C, t2, l1);
		T124f42(C, l1, l2);
		T124f39(C, a1, l1);
		T124f43(C, a2, l1);
		((T124*)(C))->a8 = ((T4)((((T124*)(C))->a8)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].keys_put */
void T124f43(T0* C, T0* a1, T4 a2)
{
	((T120*)(((T124*)(C))->a27))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].slots_put */
void T124f42(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T124*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].clashes_put */
void T124f41(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T124*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].slots_item */
T4 T124f17(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T124*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].clashes_item */
T4 T124f16(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T124*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].hash_position */
T4 T124f11(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T16f22(a1));
		R = ((T4)((t2)%(((T124*)(C))->a18)));
	} else {
		R = (((T124*)(C))->a18);
	}
	return R;
}

/* STRING.hash_code */
T4 T16f22(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	T4 t4;
	R = (((T16*)(C))->a11);
	t1 = ((R)==((T4)(geint32(0))));
	if (t1) {
		l1 = ((T4)(geint32(0)));
		l2 = (((T16*)(C))->a2);
		l3 = (((T16*)(C))->a1);
		t1 = ((l1)==(l2));
		while (!(t1)) {
			t2 = ((T4)((R)%((T4)(geint32(8388593)))));
			t2 = (T4f20(&t2, (T4)(geint32(8))));
			t3 = (((T15*)(l3))->a2[l1]);
			t4 = ((T4)(t3));
			R = ((T4)((t2)+(t4)));
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
		}
		((T16*)(C))->a11 = (R);
	}
	return R;
}

/* INTEGER.infix "|<<" */
T4 T4f20(T4* C, T4 a1)
{
	T4 R = 0;
	R = ((T4)((*C)<<(a1)));
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].resize */
void T124f40(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T124f38(C);
	l1 = (T124f23(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T124f45(C, t1);
	l2 = (((T124*)(C))->a18);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T124f42(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T124*)(C))->a18 = (l1);
	l2 = (((T124*)(C))->a14);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T124f16(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t3 = (T124f20(C, l2));
			l3 = (T124f11(C, t3));
			t1 = (T124f17(C, l3));
			T124f41(C, t1, l2);
			T124f42(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T124f46(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T124f47(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T124f48(C, t1);
	((T124*)(C))->a9 = (a1);
	((T124*)(C))->a3 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].clashes_resize */
void T124f48(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T124f30(C));
	((T124*)(C))->a25 = (T129f2(t1, ((T124*)(C))->a25, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].special_integer_ */
T0* T124f30(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].keys_resize */
void T124f47(T0* C, T4 a1)
{
	((T124*)(C))->a27 = (T133f2(((T124*)(C))->a32, ((T124*)(C))->a27, a1));
}

/* KL_SPECIAL_ROUTINES [STRING].resize */
T0* T133f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T120*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T120f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [STRING].resized_area */
T0* T120f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T120c4(a1);
	l2 = (((T120*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T120*)(C))->a2[l1]);
		((T120*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].items_resize */
void T124f46(T0* C, T4 a1)
{
	((T124*)(C))->a6 = (T140f2(((T124*)(C))->a31, ((T124*)(C))->a6, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].keys_item */
T0* T124f20(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T120*)(((T124*)(C))->a27))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].slots_resize */
void T124f45(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T124f30(C));
	((T124*)(C))->a26 = (T129f2(t1, ((T124*)(C))->a26, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].new_modulus */
T4 T124f23(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].new_capacity */
T4 T124f10(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].items_put */
void T124f39(T0* C, T0* a1, T4 a2)
{
	((T139*)(((T124*)(C))->a6))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].search_position */
void T124f36(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T124*)(C))->a3 = (T124f17(C, ((T124*)(C))->a18));
		((T124*)(C))->a12 = (((T124*)(C))->a18);
		((T124*)(C))->a19 = ((T4)(geint32(0)));
	} else {
		l4 = (((T124*)(C))->a7);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T124*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T124f20(C, ((T124*)(C))->a3));
				t3 = (T39f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T39f1(l4, a1, l3));
			}
			if (t1) {
				((T124*)(C))->a12 = (T124f11(C, a1));
				l1 = (T124f17(C, ((T124*)(C))->a12));
				((T124*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T124f20(C, l1));
					t1 = (T39f1(l4, a1, t2));
					if (t1) {
						((T124*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T124f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T124*)(C))->a19 = (l2);
			}
		} else {
			t1 = ((((T124*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T124f20(C, ((T124*)(C))->a3));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T124*)(C))->a12 = (T124f11(C, a1));
				l1 = (T124f17(C, ((T124*)(C))->a12));
				((T124*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T124f20(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T124*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T124f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T124*)(C))->a19 = (l2);
			}
		}
	}
}

/* KL_EQUALITY_TESTER [STRING].test */
T2 T39f1(T0* C, T0* a1, T0* a2)
{
	T2 R = 0;
	T2 t1;
	t1 = ((a1)==(a2));
	if (t1) {
		R = (EIF_TRUE);
	} else {
		t1 = ((a1)==(EIF_VOID));
		if (t1) {
			R = (EIF_FALSE);
		} else {
			t1 = ((a2)==(EIF_VOID));
			if (t1) {
				R = (EIF_FALSE);
			} else {
				R = (T16f4(a1, a2));
			}
		}
	}
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].unset_found_item */
void T124f38(T0* C)
{
	((T124*)(C))->a22 = ((T4)(geint32(0)));
}

/* PR_YACC_PARSER.unknown_type */
unsigned char ge201os3352 = '\0';
T0* ge201ov3352;
T0* T47f244(T0* C)
{
	T0* R = 0;
	if (ge201os3352) {
		return ge201ov3352;
	} else {
		ge201os3352 = '\1';
	}
	R = (T47f145(C, gems("ANY", 3)));
	ge201ov3352 = R;
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].item */
T0* T124f2(T0* C, T0* a1)
{
	T0* R = 0;
	T124f36(C, a1);
	R = (T124f5(C, ((T124*)(C))->a3));
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].items_item */
T0* T124f5(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T139*)(((T124*)(C))->a6))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].has */
T2 T124f1(T0* C, T0* a1)
{
	T2 R = 0;
	T124f36(C, a1);
	R = ((((T124*)(C))->a3)!=((T4)(geint32(0))));
	return R;
}

/* STRING.as_lower */
T0* T16f10(T0* C)
{
	T0* R = 0;
	R = (T16f9(C));
	T16f33(R);
	return R;
}

/* STRING.to_lower */
void T16f33(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T1 t2;
	l1 = ((T4)((((T16*)(C))->a2)-((T4)(geint32(1)))));
	l2 = (((T16*)(C))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t1)) {
		t2 = (((T15*)(l2))->a2[l1]);
		t2 = (T1f3(&t2));
		((T15*)(l2))->a2[l1] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(0)))));
	}
	((T16*)(C))->a11 = ((T4)(geint32(0)));
}

/* STRING.twin */
T0* T16f9(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T16));
	((T16*)(R))->id = 16;
	T16f32(R, C);
	return R;
}

/* STRING.copy */
void T16f32(T0* C, T0* a1)
{
	T0* l1 = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(C));
	if (t1) {
		l1 = (((T16*)(C))->a1);
		*(T16*)(C) = *(T16*)(a1);
		t1 = ((l1)==(EIF_VOID));
		if (!(t1)) {
			t2 = (((T15*)(l1))->a1);
			t1 = (T4f12(&t2, ((T16*)(C))->a2));
		}
		if (t1) {
			((T16*)(C))->a1 = (T15f3(((T16*)(C))->a1));
		} else {
			T15f8(l1, ((T16*)(C))->a1, (T4)(geint32(0)), (T4)(geint32(0)), ((T16*)(C))->a2);
			((T16*)(C))->a1 = (l1);
		}
		((T16*)(C))->a11 = ((T4)(geint32(0)));
	}
}

/* SPECIAL [CHARACTER].twin */
T0* T15f3(T0* C)
{
	T0* R = 0;
	R = (T0*)gealloc(sizeof(T15)+((T15*)(C))->a1*sizeof(T1));
	*(T15*)(R) = *(T15*)(C);
	memcpy(((T15*)(R))->a2,((T15*)(C))->a2,  ((T15*)(C))->a1*sizeof(T1));
	return R;
}

/* PR_YACC_PARSER.report_prec_specified_twice_error */
void T47f299(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T149c7(t1, ((T47*)(C))->a16);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.make */
T0* T149c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T149));
	((T149*)(C))->id = 149;
	((T149*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(2)));
	T121f7(((T149*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T149*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* PR_YACC_PARSER.put_action */
void T47f298(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T0* t2;
	T2 t3;
	T4 t4;
	t1 = (((T69*)(a2))->a4);
	t2 = (T47f231(C));
	t3 = ((t1)!=(t2));
	if (t3) {
		l2 = (T47f169(C));
		t1 = (((T69*)(a2))->a2);
		t1 = (((T70*)(t1))->a4);
		T70f16(l2, t1);
		l1 = (T47f170(C, l2));
		t1 = (((T69*)(a2))->a4);
		T69f24(l1, t1);
		t4 = (((T69*)(a2))->a5);
		T69f21(l1, t4);
		T47f294(C, l1);
		T69f23(a2, l2);
	}
	T69f24(a2, a1);
}

/* PR_RULE.put_symbol */
void T69f23(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T77f3(((T69*)(C))->a1));
	if (t1) {
		t2 = (((T77*)(((T69*)(C))->a1))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(20)))));
		T77f14(((T69*)(C))->a1, t2);
	}
	T77f15(((T69*)(C))->a1, a1);
	t1 = (T141f2(((T69*)(C))->a3));
	if (t1) {
		t2 = (((T141*)(((T69*)(C))->a3))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(20)))));
		T141f11(((T69*)(C))->a3, t2);
	}
	T141f12(((T69*)(C))->a3, EIF_VOID);
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].put_last */
void T141f12(T0* C, T0* a1)
{
	((T141*)(C))->a1 = ((T4)((((T141*)(C))->a1)+((T4)(geint32(1)))));
	((T240*)(((T141*)(C))->a5))->a2[((T141*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].resize */
void T141f11(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T141*)(C))->a5 = (T239f2(((T141*)(C))->a4, ((T141*)(C))->a5, t1));
	((T141*)(C))->a3 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].resize */
T0* T239f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T240*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T240f2(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_ERROR_ACTION].resized_area */
T0* T240f2(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T240c4(a1);
	l2 = (((T240*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T240*)(C))->a2[l1]);
		((T240*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [PR_ERROR_ACTION].make */
T0* T240c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T240)+a1*sizeof(T0*));
	((T240*)(C))->a1 = a1;
	((T240*)(C))->id = 240;
	return C;
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].is_full */
T2 T141f2(T0* C)
{
	T2 R = 0;
	R = ((((T141*)(C))->a1)==(((T141*)(C))->a3));
	return R;
}

/* DS_ARRAYED_LIST [PR_SYMBOL].put_last */
void T77f15(T0* C, T0* a1)
{
	((T77*)(C))->a1 = ((T4)((((T77*)(C))->a1)+((T4)(geint32(1)))));
	((T202*)(((T77*)(C))->a4))->a2[((T77*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_SYMBOL].resize */
void T77f14(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T77*)(C))->a4 = (T203f2(((T77*)(C))->a6, ((T77*)(C))->a4, t1));
	((T77*)(C))->a5 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_SYMBOL].resize */
T0* T203f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T202*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T202f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_SYMBOL].resized_area */
T0* T202f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T202c4(a1);
	l2 = (((T202*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T202*)(C))->a2[l1]);
		((T202*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [PR_SYMBOL].make */
T0* T202c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T202)+a1*sizeof(T0*));
	((T202*)(C))->a1 = a1;
	((T202*)(C))->id = 202;
	return C;
}

/* DS_ARRAYED_LIST [PR_SYMBOL].is_full */
T2 T77f3(T0* C)
{
	T2 R = 0;
	R = ((((T77*)(C))->a1)==(((T77*)(C))->a5));
	return R;
}

/* PR_RULE.set_action */
void T69f24(T0* C, T0* a1)
{
	((T69*)(C))->a4 = (a1);
}

/* PR_VARIABLE.set_type */
void T70f16(T0* C, T0* a1)
{
	((T70*)(C))->a4 = (a1);
}

/* PR_YACC_PARSER.no_action */
unsigned char ge201os3350 = '\0';
T0* ge201ov3350;
T0* T47f231(T0* C)
{
	T0* R = 0;
	if (ge201os3350) {
		return ge201ov3350;
	} else {
		ge201os3350 = '\1';
	}
	R = (T123f1(((T47*)(C))->a3, gems("", 0)));
	ge201ov3350 = R;
	return R;
}

/* PR_ACTION_FACTORY.new_action */
T0* T123f1(T0* C, T0* a1)
{
	T0* R = 0;
	R = T171c6(a1);
	return R;
}

/* PR_ACTION.make */
T0* T171c6(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T171));
	((T171*)(C))->id = 171;
	((T171*)(C))->a1 = (a1);
	return C;
}

/* PR_YACC_PARSER.new_action */
T0* T47f176(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T123f1(((T47*)(C))->a3, a1));
	return R;
}

/* PR_YACC_PARSER.new_string_token */
T0* T47f175(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = (T124f1(((T47*)(C))->a4, a1));
	if (t1) {
		R = (T124f2(((T47*)(C))->a4, a1));
	} else {
		T47f328(C, a1);
		t2 = (((T26*)(((T47*)(C))->a2))->a6);
		t3 = (((T95*)(t2))->a1);
		l1 = ((T4)((t3)+((T4)(geint32(1)))));
		t2 = (T47f244(C));
		R = T81c20(l1, a1, t2);
		T81f22(R, a1);
		T124f35(((T47*)(C))->a4, R, a1);
		T26f33(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_TOKEN.set_literal_string */
void T81f22(T0* C, T0* a1)
{
	((T81*)(C))->a4 = (a1);
}

/* PR_YACC_PARSER.report_undefined_string_token_error */
void T47f328(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T176c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.make */
T0* T176c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T176));
	((T176*)(C))->id = 176;
	((T176*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T176*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T176*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T176*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.new_char_token */
T0* T47f174(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T1 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 t1;
	T2 t2;
	T1 t3;
	T4 t4;
	T0* t5;
	t1 = (((T16*)(a1))->a2);
	t2 = ((t1)==((T4)(geint32(3))));
	if (t2) {
		t3 = (T16f14(a1, (T4)(geint32(2))));
		l1 = ((T4)(t3));
	} else {
		l3 = (T16f14(a1, (T4)(geint32(3))));
		switch (l3) {
		case (T1)(T1)('b'):
			l1 = ((T4)(geint32(8)));
			break;
		case (T1)(T1)('f'):
			l1 = ((T4)(geint32(12)));
			break;
		case (T1)(T1)('n'):
			l1 = ((T4)(geint32(10)));
			break;
		case (T1)(T1)('r'):
			l1 = ((T4)(geint32(13)));
			break;
		case (T1)(T1)('t'):
			l1 = ((T4)(geint32(9)));
			break;
		case (T1)(T1)('a'):
			l1 = ((T4)(geint32(7)));
			break;
		case (T1)(T1)('v'):
			l1 = ((T4)(geint32(13)));
			break;
		case (T1)'0':
		case (T1)'1':
		case (T1)'2':
		case (T1)'3':
		case (T1)'4':
		case (T1)'5':
		case (T1)'6':
		case (T1)'7':
			t1 = (((T16*)(a1))->a2);
			l5 = ((T4)((t1)-((T4)(geint32(1)))));
			l1 = ((T4)(geint32(0)));
			l4 = ((T4)(geint32(3)));
			t2 = (T4f1(&l4, l5));
			while (!(t2)) {
				t1 = ((T4)((l1)*((T4)(geint32(8)))));
				t3 = (T16f14(a1, l4));
				t4 = ((T4)(t3));
				t1 = ((T4)((t1)+(t4)));
				l1 = ((T4)((t1)-((T4)(geint32(48)))));
				l4 = ((T4)((l4)+((T4)(geint32(1)))));
				t2 = (T4f1(&l4, l5));
			}
			break;
		case (T1)(T1)('x'):
		case (T1)(T1)('X'):
			t1 = (((T16*)(a1))->a2);
			l5 = ((T4)((t1)-((T4)(geint32(1)))));
			t2 = ((l5)==((T4)(geint32(3))));
			if (t2) {
				l1 = ((T4)(l3));
			} else {
				l1 = ((T4)(geint32(0)));
				l4 = ((T4)(geint32(4)));
				t2 = (T4f1(&l4, l5));
				while (!(t2)) {
					l1 = ((T4)((l1)*((T4)(geint32(16)))));
					l3 = (T16f14(a1, l4));
					switch (l3) {
					case (T1)'0':
					case (T1)'1':
					case (T1)'2':
					case (T1)'3':
					case (T1)'4':
					case (T1)'5':
					case (T1)'6':
					case (T1)'7':
					case (T1)'8':
					case (T1)'9':
						t1 = ((T4)(l3));
						t1 = ((T4)((l1)+(t1)));
						l1 = ((T4)((t1)-((T4)(geint32(48)))));
						break;
					case (T1)'a':
					case (T1)'b':
					case (T1)'c':
					case (T1)'d':
					case (T1)'e':
					case (T1)'f':
					case (T1)'g':
					case (T1)'h':
					case (T1)'i':
					case (T1)'j':
					case (T1)'k':
					case (T1)'l':
					case (T1)'m':
					case (T1)'n':
					case (T1)'o':
					case (T1)'p':
					case (T1)'q':
					case (T1)'r':
					case (T1)'s':
					case (T1)'t':
					case (T1)'u':
					case (T1)'v':
					case (T1)'w':
					case (T1)'x':
					case (T1)'y':
					case (T1)'z':
						t1 = ((T4)(l3));
						t1 = ((T4)((l1)+(t1)));
						t1 = ((T4)((t1)-((T4)(geint32(97)))));
						l1 = ((T4)((t1)+((T4)(geint32(10)))));
						break;
					case (T1)'A':
					case (T1)'B':
					case (T1)'C':
					case (T1)'D':
					case (T1)'E':
					case (T1)'F':
					case (T1)'G':
					case (T1)'H':
					case (T1)'I':
					case (T1)'J':
					case (T1)'K':
					case (T1)'L':
					case (T1)'M':
					case (T1)'N':
					case (T1)'O':
					case (T1)'P':
					case (T1)'Q':
					case (T1)'R':
					case (T1)'S':
					case (T1)'T':
					case (T1)'U':
					case (T1)'V':
					case (T1)'W':
					case (T1)'X':
					case (T1)'Y':
					case (T1)'Z':
						t1 = ((T4)(l3));
						t1 = ((T4)((l1)+(t1)));
						t1 = ((T4)((t1)-((T4)(geint32(65)))));
						l1 = ((T4)((t1)+((T4)(geint32(10)))));
						break;
					default:
						break;
					}
					l4 = ((T4)((l4)+((T4)(geint32(1)))));
					t2 = (T4f1(&l4, l5));
				}
			}
			break;
		default:
			l1 = ((T4)(l3));
			break;
		}
	}
	l2 = (T4f11(&l1));
	t2 = (T124f1(((T47*)(C))->a4, l2));
	if (t2) {
		R = (T124f2(((T47*)(C))->a4, l2));
	} else {
		t5 = (((T26*)(((T47*)(C))->a2))->a6);
		t1 = (((T95*)(t5))->a1);
		l6 = ((T4)((t1)+((T4)(geint32(1)))));
		t5 = (T47f244(C));
		R = T81c20(l6, a1, t5);
		T81f21(R, l1);
		T124f35(((T47*)(C))->a4, R, l2);
		T26f33(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_TOKEN.set_token_id */
void T81f21(T0* C, T4 a1)
{
	((T81*)(C))->a2 = (a1);
}

/* PR_YACC_PARSER.put_symbol */
void T47f297(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T0* t1;
	T0* t2;
	T2 t3;
	T4 t4;
	t1 = (((T69*)(a2))->a4);
	t2 = (T47f231(C));
	t3 = ((t1)!=(t2));
	if (t3) {
		l2 = (T47f169(C));
		t1 = (((T69*)(a2))->a2);
		t1 = (((T70*)(t1))->a4);
		T70f16(l2, t1);
		l1 = (T47f170(C, l2));
		t1 = (((T69*)(a2))->a4);
		T69f24(l1, t1);
		t4 = (((T69*)(a2))->a5);
		T69f21(l1, t4);
		T47f294(C, l1);
		T69f23(a2, l2);
		t1 = (T47f231(C));
		T69f24(a2, t1);
	}
	T69f23(a2, a1);
}

/* PR_YACC_PARSER.new_symbol */
T0* T47f173(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T0* t2;
	l1 = (T16f10(a1));
	t1 = (T125f2(((T47*)(C))->a6, l1));
	if (t1) {
		R = (T125f3(((T47*)(C))->a6, l1));
	} else {
		t1 = (T124f1(((T47*)(C))->a4, l1));
		if (t1) {
			R = (T124f2(((T47*)(C))->a4, l1));
		} else {
			t2 = (((T26*)(((T47*)(C))->a2))->a5);
			l3 = (((T88*)(t2))->a1);
			t2 = (T47f244(C));
			l2 = T70c15(l3, a1, t2);
			T125f35(((T47*)(C))->a6, l2, l1);
			T26f32(((T47*)(C))->a2, l2);
			R = (l2);
		}
	}
	return R;
}

/* PR_GRAMMAR.put_variable */
void T26f32(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T88f14(((T26*)(C))->a5));
	if (t1) {
		t2 = (((T88*)(((T26*)(C))->a5))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(300)))));
		T88f34(((T26*)(C))->a5, t2);
	}
	T88f22(((T26*)(C))->a5, a1);
}

/* DS_ARRAYED_LIST [PR_VARIABLE].resize */
void T88f34(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T88*)(C))->a6 = (T209f2(((T88*)(C))->a8, ((T88*)(C))->a6, t1));
	((T88*)(C))->a9 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_VARIABLE].resize */
T0* T209f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T208*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T208f4(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_VARIABLE].resized_area */
T0* T208f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T208c5(a1);
	l2 = (((T208*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T208*)(C))->a2[l1]);
		((T208*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_VARIABLE].is_full */
T2 T88f14(T0* C)
{
	T2 R = 0;
	R = ((((T88*)(C))->a1)==(((T88*)(C))->a9));
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].force */
void T125f35(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T125f38(C);
	T125f36(C, a2);
	t1 = ((((T125*)(C))->a4)!=((T4)(geint32(0))));
	if (t1) {
		T125f39(C, a1, ((T125*)(C))->a4);
	} else {
		t1 = ((((T125*)(C))->a1)==(((T125*)(C))->a9));
		if (t1) {
			t2 = ((T4)((((T125*)(C))->a1)+((T4)(geint32(1)))));
			t2 = (T125f10(C, t2));
			T125f40(C, t2);
			l2 = (T125f11(C, a2));
		} else {
			l2 = (((T125*)(C))->a12);
		}
		l1 = (((T125*)(C))->a13);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T125*)(C))->a14 = ((T4)((((T125*)(C))->a14)+((T4)(geint32(1)))));
			l1 = (((T125*)(C))->a14);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T125f16(C, l1));
			((T125*)(C))->a13 = ((T4)((t2)-(t3)));
		}
		t2 = (T125f17(C, l2));
		T125f41(C, t2, l1);
		T125f42(C, l1, l2);
		T125f39(C, a1, l1);
		T125f43(C, a2, l1);
		((T125*)(C))->a1 = ((T4)((((T125*)(C))->a1)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].keys_put */
void T125f43(T0* C, T0* a1, T4 a2)
{
	((T120*)(((T125*)(C))->a27))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].slots_put */
void T125f42(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T125*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].clashes_put */
void T125f41(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T125*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].slots_item */
T4 T125f17(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T125*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].clashes_item */
T4 T125f16(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T125*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].hash_position */
T4 T125f11(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T16f22(a1));
		R = ((T4)((t2)%(((T125*)(C))->a18)));
	} else {
		R = (((T125*)(C))->a18);
	}
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].resize */
void T125f40(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T125f38(C);
	l1 = (T125f23(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T125f45(C, t1);
	l2 = (((T125*)(C))->a18);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T125f42(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T125*)(C))->a18 = (l1);
	l2 = (((T125*)(C))->a14);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T125f16(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t3 = (T125f20(C, l2));
			l3 = (T125f11(C, t3));
			t1 = (T125f17(C, l3));
			T125f41(C, t1, l2);
			T125f42(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T125f46(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T125f47(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T125f48(C, t1);
	((T125*)(C))->a9 = (a1);
	((T125*)(C))->a4 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].clashes_resize */
void T125f48(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T125f30(C));
	((T125*)(C))->a25 = (T129f2(t1, ((T125*)(C))->a25, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].special_integer_ */
T0* T125f30(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].keys_resize */
void T125f47(T0* C, T4 a1)
{
	((T125*)(C))->a27 = (T133f2(((T125*)(C))->a32, ((T125*)(C))->a27, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].items_resize */
void T125f46(T0* C, T4 a1)
{
	((T125*)(C))->a7 = (T209f2(((T125*)(C))->a31, ((T125*)(C))->a7, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].keys_item */
T0* T125f20(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T120*)(((T125*)(C))->a27))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].slots_resize */
void T125f45(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T125f30(C));
	((T125*)(C))->a26 = (T129f2(t1, ((T125*)(C))->a26, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].new_modulus */
T4 T125f23(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].new_capacity */
T4 T125f10(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].items_put */
void T125f39(T0* C, T0* a1, T4 a2)
{
	((T208*)(((T125*)(C))->a7))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].search_position */
void T125f36(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T125*)(C))->a4 = (T125f17(C, ((T125*)(C))->a18));
		((T125*)(C))->a12 = (((T125*)(C))->a18);
		((T125*)(C))->a19 = ((T4)(geint32(0)));
	} else {
		l4 = (((T125*)(C))->a8);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T125*)(C))->a4)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T125f20(C, ((T125*)(C))->a4));
				t3 = (T39f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T39f1(l4, a1, l3));
			}
			if (t1) {
				((T125*)(C))->a12 = (T125f11(C, a1));
				l1 = (T125f17(C, ((T125*)(C))->a12));
				((T125*)(C))->a4 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T125f20(C, l1));
					t1 = (T39f1(l4, a1, t2));
					if (t1) {
						((T125*)(C))->a4 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T125f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T125*)(C))->a19 = (l2);
			}
		} else {
			t1 = ((((T125*)(C))->a4)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T125f20(C, ((T125*)(C))->a4));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T125*)(C))->a12 = (T125f11(C, a1));
				l1 = (T125f17(C, ((T125*)(C))->a12));
				((T125*)(C))->a4 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T125f20(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T125*)(C))->a4 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T125f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T125*)(C))->a19 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].unset_found_item */
void T125f38(T0* C)
{
	((T125*)(C))->a22 = ((T4)(geint32(0)));
}

/* PR_VARIABLE.make */
T0* T70c15(T4 a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T70));
	((T70*)(C))->id = 70;
	((T70*)(C))->a5 = (a1);
	((T70*)(C))->a6 = (a2);
	((T70*)(C))->a4 = (a3);
	((T70*)(C))->a1 = T67c21((T4)(geint32(5)));
	((T70*)(C))->a8 = T73c8();
	((T70*)(C))->a2 = T91c10();
	((T70*)(C))->a9 = T90c8();
	return C;
}

/* DS_LINKED_LIST [PR_VARIABLE].make */
T0* T90c8()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T90));
	((T90*)(C))->id = 90;
	((T90*)(C))->a1 = (T90f2(C));
	return C;
}

/* DS_LINKED_LIST [PR_RULE].make */
T0* T91c10()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T91));
	((T91*)(C))->id = 91;
	((T91*)(C))->a2 = (T91f1(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_RULE].make */
T0* T67c21(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T67));
	((T67*)(C))->id = 67;
	((T67*)(C))->a10 = T191c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T67*)(C))->a7 = (T191f1(((T67*)(C))->a10, t1));
	((T67*)(C))->a9 = (a1);
	((T67*)(C))->a11 = (T67f12(C));
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_RULE].make */
T0* T191f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T260c2(a1);
	R = (((T260*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_RULE].make_area */
T0* T260c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T260));
	((T260*)(C))->id = 260;
	((T260*)(C))->a1 = T190c5(a1);
	return C;
}

/* SPECIAL [PR_RULE].make */
T0* T190c5(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T190)+a1*sizeof(T0*));
	((T190*)(C))->a1 = a1;
	((T190*)(C))->id = 190;
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_RULE].default_create */
T0* T191c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T191));
	((T191*)(C))->id = 191;
	return C;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].item */
T0* T125f3(T0* C, T0* a1)
{
	T0* R = 0;
	T125f36(C, a1);
	R = (T125f6(C, ((T125*)(C))->a4));
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].items_item */
T0* T125f6(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T208*)(((T125*)(C))->a7))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].has */
T2 T125f2(T0* C, T0* a1)
{
	T2 R = 0;
	T125f36(C, a1);
	R = ((((T125*)(C))->a4)!=((T4)(geint32(0))));
	return R;
}

/* PR_YACC_PARSER.put_error_action */
void T47f296(T0* C, T0* a1, T4 a2, T0* a3)
{
	T69f22(a3, a1, a2);
}

/* PR_RULE.set_error_action */
void T69f22(T0* C, T0* a1, T4 a2)
{
	T141f10(((T69*)(C))->a3, a1, a2);
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].replace */
void T141f10(T0* C, T0* a1, T4 a2)
{
	((T240*)(((T141*)(C))->a5))->a2[a2] = (a1);
}

/* PR_YACC_PARSER.new_error_action */
T0* T47f172(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T0* t1;
	t1 = (T123f1(((T47*)(C))->a3, a1));
	R = T66c6(t1, a2);
	return R;
}

/* PR_ERROR_ACTION.make */
T0* T66c6(T0* a1, T4 a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T66));
	((T66*)(C))->id = 66;
	((T66*)(C))->a1 = (a1);
	((T66*)(C))->a2 = (a2);
	return C;
}

/* PR_YACC_PARSER.report_invalid_error_n_error */
void T47f295(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T148c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_INVALID_ERROR_N_ERROR.make */
T0* T148c7(T0* a1, T4 a2, T4 a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T148));
	((T148*)(C))->id = 148;
	((T148*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T148*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T148*)(C))->a5, t1, (T4)(geint32(2)));
	t1 = (T4f11(&a3));
	T121f7(((T148*)(C))->a5, t1, (T4)(geint32(3)));
	return C;
}

/* PR_RULE.set_line_nb */
void T69f21(T0* C, T4 a1)
{
	((T69*)(C))->a5 = (a1);
}

/* PR_YACC_PARSER.put_rule */
void T47f294(T0* C, T0* a1)
{
	T26f27(((T47*)(C))->a2, a1);
}

/* PR_GRAMMAR.put_rule */
void T26f27(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T67f6(((T26*)(C))->a1));
	if (t1) {
		t2 = (((T67*)(((T26*)(C))->a1))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(500)))));
		T67f23(((T26*)(C))->a1, t2);
	}
	T67f24(((T26*)(C))->a1, a1);
}

/* DS_ARRAYED_LIST [PR_RULE].put_last */
void T67f24(T0* C, T0* a1)
{
	((T67*)(C))->a1 = ((T4)((((T67*)(C))->a1)+((T4)(geint32(1)))));
	((T190*)(((T67*)(C))->a7))->a2[((T67*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_RULE].resize */
void T67f23(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T67*)(C))->a7 = (T191f2(((T67*)(C))->a10, ((T67*)(C))->a7, t1));
	((T67*)(C))->a9 = (a1);
}

/* KL_SPECIAL_ROUTINES [PR_RULE].resize */
T0* T191f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T190*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T190f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_RULE].resized_area */
T0* T190f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T190c5(a1);
	l2 = (((T190*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T190*)(C))->a2[l1]);
		((T190*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* DS_ARRAYED_LIST [PR_RULE].is_full */
T2 T67f6(T0* C)
{
	T2 R = 0;
	R = ((((T67*)(C))->a1)==(((T67*)(C))->a9));
	return R;
}

/* PR_YACC_PARSER.report_rule_declared_twice_warning */
void T47f293(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T147c7(t1, ((T47*)(C))->a16, a1);
	T25f9(((T47*)(C))->a13, l1);
}

/* PR_RULE_DECLARED_TWICE_ERROR.make */
T0* T147c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T147));
	((T147*)(C))->id = 147;
	((T147*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T147*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T147*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T147*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.new_variable */
T0* T47f171(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (T16f10(a1));
	t1 = (T125f2(((T47*)(C))->a6, l1));
	if (t1) {
		R = (T125f3(((T47*)(C))->a6, l1));
	} else {
		t2 = (((T26*)(((T47*)(C))->a2))->a5);
		l2 = (((T88*)(t2))->a1);
		t2 = (T47f244(C));
		R = T70c15(l2, a1, t2);
		T125f35(((T47*)(C))->a6, R, l1);
		T26f32(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_YACC_PARSER.new_rule */
T0* T47f170(T0* C, T0* a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T0* t1;
	T4 t2;
	t1 = (((T26*)(((T47*)(C))->a2))->a1);
	t2 = (((T67*)(t1))->a1);
	l1 = ((T4)((t2)+((T4)(geint32(1)))));
	t1 = (T47f231(C));
	R = T69c16(l1, a1, t1);
	T70f17(a1, R);
	return R;
}

/* PR_VARIABLE.put_rule */
void T70f17(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T67f6(((T70*)(C))->a1));
	if (t1) {
		t2 = (((T67*)(((T70*)(C))->a1))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(5)))));
		T67f23(((T70*)(C))->a1, t2);
	}
	T67f24(((T70*)(C))->a1, a1);
}

/* PR_RULE.make */
T0* T69c16(T4 a1, T0* a2, T0* a3)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T69));
	((T69*)(C))->id = 69;
	((T69*)(C))->a6 = (a1);
	((T69*)(C))->a2 = (a2);
	((T69*)(C))->a4 = (a3);
	((T69*)(C))->a1 = T77c13((T4)(geint32(20)));
	((T69*)(C))->a3 = T141c9((T4)(geint32(20)));
	return C;
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].make */
T0* T141c9(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T141));
	((T141*)(C))->id = 141;
	((T141*)(C))->a4 = T239c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T141*)(C))->a5 = (T239f1(((T141*)(C))->a4, t1));
	((T141*)(C))->a3 = (a1);
	((T141*)(C))->a6 = (T141f7(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_ERROR_ACTION].new_cursor */
T0* T141f7(T0* C)
{
	T0* R = 0;
	R = T241c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_ERROR_ACTION].make */
T0* T241c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T241));
	((T241*)(C))->id = 241;
	((T241*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].make */
T0* T239f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T269c2(a1);
	R = (((T269*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_ERROR_ACTION].make_area */
T0* T269c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T269));
	((T269*)(C))->id = 269;
	((T269*)(C))->a1 = T240c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_ERROR_ACTION].default_create */
T0* T239c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T239));
	((T239*)(C))->id = 239;
	return C;
}

/* DS_ARRAYED_LIST [PR_SYMBOL].make */
T0* T77c13(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T77));
	((T77*)(C))->id = 77;
	((T77*)(C))->a6 = T203c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T77*)(C))->a4 = (T203f1(((T77*)(C))->a6, t1));
	((T77*)(C))->a5 = (a1);
	((T77*)(C))->a7 = (T77f8(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_SYMBOL].new_cursor */
T0* T77f8(T0* C)
{
	T0* R = 0;
	R = T204c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_SYMBOL].make */
T0* T204c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T204));
	((T204*)(C))->id = 204;
	((T204*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_SYMBOL].make */
T0* T203f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T263c2(a1);
	R = (((T263*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [PR_SYMBOL].make_area */
T0* T263c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T263));
	((T263*)(C))->id = 263;
	((T263*)(C))->a1 = T202c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_SYMBOL].default_create */
T0* T203c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T203));
	((T203*)(C))->id = 203;
	return C;
}

/* PR_YACC_PARSER.new_dummy_variable */
T0* T47f169(T0* C)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T0* t1;
	T4 t2;
	l1 = T16c25((T4)(geint32(10)));
	T16f28(l1, (T1)('@'));
	t1 = (T47f243(C));
	t2 = (((T125*)(((T47*)(C))->a6))->a1);
	T63f2(t1, t2, l1);
	t1 = (((T26*)(((T47*)(C))->a2))->a5);
	l2 = (((T88*)(t1))->a1);
	t1 = (T47f244(C));
	R = T70c15(l2, l1, t1);
	T125f35(((T47*)(C))->a6, R, l1);
	T26f32(((T47*)(C))->a2, R);
	return R;
}

/* PR_YACC_PARSER.integer_ */
T0* T47f243(T0* C)
{
	T0* R = 0;
	if (ge255os1336) {
		return ge255ov1336;
	} else {
		ge255os1336 = '\1';
	}
	R = T63c1();
	ge255ov1336 = R;
	return R;
}

/* PR_YACC_PARSER.report_lhs_symbol_token_error */
void T47f292(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T146c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.make */
T0* T146c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T146));
	((T146*)(C))->id = 146;
	((T146*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T146*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T146*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T146*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.is_terminal */
T2 T47f168(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	l1 = (T16f10(a1));
	R = (T124f1(((T47*)(C))->a4, l1));
	return R;
}

/* PR_YACC_PARSER.process_rule */
void T47f291(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((((T47*)(C))->a167)!=(EIF_VOID));
	if (t1) {
		l2 = (((T47*)(C))->a167);
		T81f28(l2, EIF_TRUE);
	} else {
		l1 = (((T69*)(a1))->a1);
		l3 = (((T77*)(l1))->a1);
		t1 = ((T2)((l3)<((T4)(geint32(1)))));
		if (!(t1)) {
			t1 = ((l2)!=(EIF_VOID));
		}
		while (!(t1)) {
			t2 = (T77f2(l1, l3));
			if ((t2)==EIF_VOID) {
				l2 = EIF_VOID;
			} else {
				switch ((t2)->id) {
				case 81:
					l2 = t2;
					break;
				default:
					l2 = EIF_VOID;
				}
			}
			l3 = ((T4)((l3)-((T4)(geint32(1)))));
			t1 = ((T2)((l3)<((T4)(geint32(1)))));
			if (!(t1)) {
				t1 = ((l2)!=(EIF_VOID));
			}
		}
	}
	t1 = ((l2)!=(EIF_VOID));
	if (t1) {
		t1 = (T81f16(l2));
		if (t1) {
			T69f17(a1);
		} else {
			t1 = (T81f17(l2));
			if (t1) {
				T69f18(a1);
			} else {
				t1 = (T81f18(l2));
				if (t1) {
					T69f19(a1);
				}
			}
		}
		t3 = (((T81*)(l2))->a7);
		T69f20(a1, t3);
	}
}

/* PR_RULE.set_precedence */
void T69f20(T0* C, T4 a1)
{
	((T69*)(C))->a12 = (a1);
}

/* PR_RULE.set_non_associative */
void T69f19(T0* C)
{
	((T69*)(C))->a8 = ((T4)(geint32(3)));
}

/* PR_RULE.set_right_associative */
void T69f18(T0* C)
{
	((T69*)(C))->a8 = ((T4)(geint32(2)));
}

/* PR_RULE.set_left_associative */
void T69f17(T0* C)
{
	((T69*)(C))->a8 = ((T4)(geint32(1)));
}

/* PR_YACC_PARSER.report_no_rules_error */
void T47f290(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T145c7(t1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_NO_RULES_ERROR.make */
T0* T145c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T145));
	((T145*)(C))->id = 145;
	((T145*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(1)));
	T121f7(((T145*)(C))->a5, a1, (T4)(geint32(1)));
	return C;
}

/* PR_YACC_PARSER.new_nonterminal */
T0* T47f165(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T47f168(C, a1));
	if (t1) {
		T47f326(C, a1);
		R = (T47f169(C));
	} else {
		t1 = (T47f230(C, a1));
		if (t1) {
			T47f327(C, a1);
			R = (T47f169(C));
		} else {
			R = (T47f171(C, a1));
		}
	}
	T70f16(R, a2);
	return R;
}

/* PR_YACC_PARSER.report_variable_declared_twice_error */
void T47f327(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T175c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.make */
T0* T175c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T175));
	((T175*)(C))->id = 175;
	((T175*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T175*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T175*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T175*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.is_nonterminal */
T2 T47f230(T0* C, T0* a1)
{
	T2 R = 0;
	T0* l1 = 0;
	l1 = (T16f10(a1));
	R = (T125f2(((T47*)(C))->a6, l1));
	return R;
}

/* PR_YACC_PARSER.report_variable_declared_as_token_error */
void T47f326(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T174c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.make */
T0* T174c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T174));
	((T174*)(C))->id = 174;
	((T174*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T174*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T174*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T174*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.new_nonassoc_char_terminal */
T0* T47f164(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	R = (T47f174(C, a1));
	T81f27(R);
	T47f325(C, R, a2);
	return R;
}

/* PR_YACC_PARSER.set_precedence */
void T47f325(T0* C, T0* a1, T4 a2)
{
	T2 t1;
	T0* t2;
	t1 = (T81f6(a1));
	if (t1) {
		t2 = (((T81*)(a1))->a3);
		T47f329(C, t2);
	}
	T81f29(a1, a2);
}

/* PR_TOKEN.set_precedence */
void T81f29(T0* C, T4 a1)
{
	((T81*)(C))->a7 = (a1);
}

/* PR_YACC_PARSER.report_precedence_defined_twice_error */
void T47f329(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T177c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.make */
T0* T177c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T177));
	((T177*)(C))->id = 177;
	((T177*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T177*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T177*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T177*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_TOKEN.set_non_associative */
void T81f27(T0* C)
{
	((T81*)(C))->a10 = ((T4)(geint32(3)));
}

/* PR_YACC_PARSER.new_nonassoc_terminal */
T0* T47f163(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T47f230(C, a1));
	if (t1) {
		T47f323(C, a1);
		R = (T47f174(C, gems("\'a\'", 3)));
	} else {
		R = (T47f177(C, a1));
	}
	T81f27(R);
	T47f325(C, R, a2);
	return R;
}

/* PR_YACC_PARSER.report_token_declared_as_variable_error */
void T47f323(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T172c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.make */
T0* T172c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T172));
	((T172*)(C))->id = 172;
	((T172*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T172*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T172*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T172*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.new_right_char_terminal */
T0* T47f162(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	R = (T47f174(C, a1));
	T81f26(R);
	T47f325(C, R, a2);
	return R;
}

/* PR_TOKEN.set_right_associative */
void T81f26(T0* C)
{
	((T81*)(C))->a10 = ((T4)(geint32(2)));
}

/* PR_YACC_PARSER.new_right_terminal */
T0* T47f161(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T47f230(C, a1));
	if (t1) {
		T47f323(C, a1);
		R = (T47f174(C, gems("\'a\'", 3)));
	} else {
		R = (T47f177(C, a1));
	}
	T81f26(R);
	T47f325(C, R, a2);
	return R;
}

/* PR_YACC_PARSER.new_left_char_terminal */
T0* T47f160(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	R = (T47f174(C, a1));
	T81f25(R);
	T47f325(C, R, a2);
	return R;
}

/* PR_TOKEN.set_left_associative */
void T81f25(T0* C)
{
	((T81*)(C))->a10 = ((T4)(geint32(1)));
}

/* PR_YACC_PARSER.new_left_terminal */
T0* T47f159(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T47f230(C, a1));
	if (t1) {
		T47f323(C, a1);
		R = (T47f174(C, gems("\'a\'", 3)));
	} else {
		R = (T47f177(C, a1));
	}
	T81f25(R);
	T47f325(C, R, a2);
	return R;
}

/* PR_YACC_PARSER.new_char_terminal */
T0* T47f158(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T2 t1;
	R = (T47f174(C, a1));
	t1 = (((T81*)(R))->a5);
	if (t1) {
		T47f324(C, a1);
	} else {
		T81f23(R);
	}
	T81f24(R, a2);
	return R;
}

/* PR_TOKEN.set_type */
void T81f24(T0* C, T0* a1)
{
	((T81*)(C))->a9 = (a1);
}

/* PR_TOKEN.set_declared */
void T81f23(T0* C)
{
	((T81*)(C))->a5 = (EIF_TRUE);
}

/* PR_YACC_PARSER.report_token_declared_twice_error */
void T47f324(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T173c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.make */
T0* T173c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T173));
	((T173*)(C))->id = 173;
	((T173*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T173*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T173*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T173*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.set_literal_string */
void T47f289(T0* C, T0* a1, T0* a2)
{
	T0* t1;
	T2 t2;
	T2 t3;
	T0* t4;
	t1 = (((T81*)(a1))->a4);
	t2 = ((t1)!=(EIF_VOID));
	if (t2) {
		t1 = (((T81*)(a1))->a4);
		t3 = (T16f4(t1, a2));
		t2 = ((T2)(!(t3)));
	}
	if (t2) {
		t1 = (((T81*)(a1))->a3);
		t4 = (((T81*)(a1))->a4);
		T47f317(C, t1, t4, a2);
	} else {
		t2 = (T124f1(((T47*)(C))->a4, a2));
		if (t2) {
			t1 = (T124f2(((T47*)(C))->a4, a2));
			t2 = ((t1)!=(a1));
		}
		if (t2) {
			t1 = (T124f2(((T47*)(C))->a4, a2));
			t1 = (((T81*)(t1))->a3);
			t4 = (((T81*)(a1))->a3);
			T47f318(C, a2, t1, t4);
		}
	}
	T81f22(a1, a2);
	T124f35(((T47*)(C))->a4, a1, a2);
}

/* PR_YACC_PARSER.report_string_token_defined_twice_error */
void T47f318(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T161c7(t1, ((T47*)(C))->a16, a1, a2, a3);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.make */
T0* T161c7(T0* a1, T4 a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T161));
	((T161*)(C))->id = 161;
	((T161*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(5)));
	T121f7(((T161*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T161*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T161*)(C))->a5, a3, (T4)(geint32(3)));
	T121f7(((T161*)(C))->a5, a4, (T4)(geint32(4)));
	T121f7(((T161*)(C))->a5, a5, (T4)(geint32(5)));
	return C;
}

/* PR_YACC_PARSER.report_two_strings_token_error */
void T47f317(T0* C, T0* a1, T0* a2, T0* a3)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T160c7(t1, ((T47*)(C))->a16, a1, a2, a3);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_TWO_STRINGS_TOKEN_ERROR.make */
T0* T160c7(T0* a1, T4 a2, T0* a3, T0* a4, T0* a5)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T160));
	((T160*)(C))->id = 160;
	((T160*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(5)));
	T121f7(((T160*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T160*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T160*)(C))->a5, a3, (T4)(geint32(3)));
	T121f7(((T160*)(C))->a5, a4, (T4)(geint32(4)));
	T121f7(((T160*)(C))->a5, a5, (T4)(geint32(5)));
	return C;
}

/* PR_YACC_PARSER.set_token_id */
void T47f288(T0* C, T0* a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* t3;
	t1 = (T81f1(a1));
	if (t1) {
		t2 = (((T81*)(a1))->a2);
		t1 = ((t2)!=(a2));
	}
	if (t1) {
		t3 = (((T81*)(a1))->a3);
		t2 = (((T81*)(a1))->a2);
		T47f316(C, t3, t2, a2);
	}
	T81f21(a1, a2);
}

/* PR_YACC_PARSER.report_two_token_ids_token_error */
void T47f316(T0* C, T0* a1, T4 a2, T4 a3)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T159c7(t1, ((T47*)(C))->a16, a1, a2, a3);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.make */
T0* T159c7(T0* a1, T4 a2, T0* a3, T4 a4, T4 a5)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T159));
	((T159*)(C))->id = 159;
	((T159*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(5)));
	T121f7(((T159*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T159*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T159*)(C))->a5, a3, (T4)(geint32(3)));
	t1 = (T4f11(&a4));
	T121f7(((T159*)(C))->a5, t1, (T4)(geint32(4)));
	t1 = (T4f11(&a5));
	T121f7(((T159*)(C))->a5, t1, (T4)(geint32(5)));
	return C;
}

/* PR_TOKEN.has_token_id */
T2 T81f1(T0* C)
{
	T2 R = 0;
	R = ((((T81*)(C))->a2)!=((T4)(geint32(0))));
	return R;
}

/* PR_YACC_PARSER.new_terminal */
T0* T47f154(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T2 t1;
	t1 = (T47f230(C, a1));
	if (t1) {
		T47f323(C, a1);
		R = (T47f174(C, gems("\'a\'", 3)));
	} else {
		R = (T47f177(C, a1));
	}
	t1 = (((T81*)(R))->a5);
	if (t1) {
		T47f324(C, a1);
	} else {
		T81f23(R);
	}
	T81f24(R, a2);
	return R;
}

/* DS_ARRAYED_LIST [PR_TYPE].force_last */
void T109f14(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T109f10(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T109*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T109f11(C, t2));
		T109f15(C, t2);
	}
	((T109*)(C))->a1 = ((T4)((((T109*)(C))->a1)+((T4)(geint32(1)))));
	((T135*)(((T109*)(C))->a5))->a2[((T109*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_TYPE].resize */
void T109f15(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T109*)(C))->a5 = (T136f2(((T109*)(C))->a6, ((T109*)(C))->a5, t1));
	((T109*)(C))->a7 = (a1);
}

/* DS_ARRAYED_LIST [PR_TYPE].new_capacity */
T4 T109f11(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [PR_TYPE].extendible */
T2 T109f10(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T109*)(C))->a1)+(a1)));
	R = (T4f4(&(((T109*)(C))->a7), t1));
	return R;
}

/* DS_ARRAYED_LIST [PR_TYPE].make */
T0* T109c13(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T109));
	((T109*)(C))->id = 109;
	((T109*)(C))->a6 = T136c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T109*)(C))->a5 = (T136f1(((T109*)(C))->a6, t1));
	((T109*)(C))->a7 = (a1);
	((T109*)(C))->a8 = (T109f9(C));
	return C;
}

/* DS_ARRAYED_LIST [PR_TYPE].new_cursor */
T0* T109f9(T0* C)
{
	T0* R = 0;
	R = T228c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [PR_TYPE].make */
T0* T228c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T228));
	((T228*)(C))->id = 228;
	((T228*)(C))->a1 = (a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].resize */
T0* T138f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T137*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T137f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].resized_area */
T0* T137f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T137c4(a1);
	l2 = (((T137*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T137*)(C))->a2[l1]);
		((T137*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make */
T0* T137c4(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T137)+a1*sizeof(T0*));
	((T137*)(C))->a1 = a1;
	((T137*)(C))->id = 137;
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].make */
T0* T138f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T237c2(a1);
	R = (((T237*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [DS_ARRAYED_LIST [PR_TYPE]].make_area */
T0* T237c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T237));
	((T237*)(C))->id = 237;
	((T237*)(C))->a1 = T137c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]].default_create */
T0* T138c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T138));
	((T138*)(C))->id = 138;
	return C;
}

/* PR_YACC_PARSER.new_anchored_type */
T0* T47f151(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (T16f10(a1));
	t1 = (T126f1(((T47*)(C))->a8, l1));
	if (t1) {
		R = (T126f2(((T47*)(C))->a8, l1));
	} else {
		t2 = (((T26*)(((T47*)(C))->a2))->a8);
		t3 = (((T109*)(t2))->a1);
		l2 = ((T4)((t3)+((T4)(geint32(1)))));
		R = T96c10(l2, a1);
		T126f35(((T47*)(C))->a8, R, l1);
		T26f31(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_GRAMMAR.put_type */
void T26f31(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T109f12(((T26*)(C))->a8));
	if (t1) {
		t2 = (((T109*)(((T26*)(C))->a8))->a1);
		t2 = ((T4)((t2)+((T4)(geint32(300)))));
		T109f15(((T26*)(C))->a8, t2);
	}
	T109f16(((T26*)(C))->a8, a1);
}

/* DS_ARRAYED_LIST [PR_TYPE].put_last */
void T109f16(T0* C, T0* a1)
{
	((T109*)(C))->a1 = ((T4)((((T109*)(C))->a1)+((T4)(geint32(1)))));
	((T135*)(((T109*)(C))->a5))->a2[((T109*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [PR_TYPE].is_full */
T2 T109f12(T0* C)
{
	T2 R = 0;
	R = ((((T109*)(C))->a1)==(((T109*)(C))->a7));
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].force */
void T126f35(T0* C, T0* a1, T0* a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T126f38(C);
	T126f36(C, a2);
	t1 = ((((T126*)(C))->a3)!=((T4)(geint32(0))));
	if (t1) {
		T126f39(C, a1, ((T126*)(C))->a3);
	} else {
		t1 = ((((T126*)(C))->a8)==(((T126*)(C))->a9));
		if (t1) {
			t2 = ((T4)((((T126*)(C))->a8)+((T4)(geint32(1)))));
			t2 = (T126f10(C, t2));
			T126f40(C, t2);
			l2 = (T126f11(C, a2));
		} else {
			l2 = (((T126*)(C))->a12);
		}
		l1 = (((T126*)(C))->a13);
		t1 = ((l1)==((T4)(geint32(0))));
		if (t1) {
			((T126*)(C))->a14 = ((T4)((((T126*)(C))->a14)+((T4)(geint32(1)))));
			l1 = (((T126*)(C))->a14);
		} else {
			t2 = (T4)(geint32(-1));
			t3 = (T126f16(C, l1));
			((T126*)(C))->a13 = ((T4)((t2)-(t3)));
		}
		t2 = (T126f17(C, l2));
		T126f41(C, t2, l1);
		T126f42(C, l1, l2);
		T126f39(C, a1, l1);
		T126f43(C, a2, l1);
		((T126*)(C))->a8 = ((T4)((((T126*)(C))->a8)+((T4)(geint32(1)))));
	}
}

/* DS_HASH_TABLE [PR_TYPE, STRING].keys_put */
void T126f43(T0* C, T0* a1, T4 a2)
{
	((T120*)(((T126*)(C))->a27))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TYPE, STRING].slots_put */
void T126f42(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T126*)(C))->a26))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TYPE, STRING].clashes_put */
void T126f41(T0* C, T4 a1, T4 a2)
{
	((T98*)(((T126*)(C))->a25))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TYPE, STRING].slots_item */
T4 T126f17(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T126*)(C))->a26))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].clashes_item */
T4 T126f16(T0* C, T4 a1)
{
	T4 R = 0;
	R = (((T98*)(((T126*)(C))->a25))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].hash_position */
T4 T126f11(T0* C, T0* a1)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((a1)!=(EIF_VOID));
	if (t1) {
		t2 = (T16f22(a1));
		R = ((T4)((t2)%(((T126*)(C))->a18)));
	} else {
		R = (((T126*)(C))->a18);
	}
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].resize */
void T126f40(T0* C, T4 a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	T126f38(C);
	l1 = (T126f23(C, a1));
	t1 = ((T4)((l1)+((T4)(geint32(1)))));
	T126f45(C, t1);
	l2 = (((T126*)(C))->a18);
	t2 = ((T2)((l2)<((T4)(geint32(0)))));
	while (!(t2)) {
		T126f42(C, (T4)(geint32(0)), l2);
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(0)))));
	}
	((T126*)(C))->a18 = (l1);
	l2 = (((T126*)(C))->a14);
	t2 = ((T2)((l2)<((T4)(geint32(1)))));
	while (!(t2)) {
		t1 = (T126f16(C, l2));
		t2 = (T4f1(&t1, (T4)(geint32(-1))));
		if (t2) {
			t3 = (T126f20(C, l2));
			l3 = (T126f11(C, t3));
			t1 = (T126f17(C, l3));
			T126f41(C, t1, l2);
			T126f42(C, l2, l3);
		}
		l2 = ((T4)((l2)-((T4)(geint32(1)))));
		t2 = ((T2)((l2)<((T4)(geint32(1)))));
	}
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T126f46(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T126f47(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T126f48(C, t1);
	((T126*)(C))->a9 = (a1);
	((T126*)(C))->a3 = ((T4)(geint32(0)));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].clashes_resize */
void T126f48(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T126f30(C));
	((T126*)(C))->a25 = (T129f2(t1, ((T126*)(C))->a25, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].special_integer_ */
T0* T126f30(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].keys_resize */
void T126f47(T0* C, T4 a1)
{
	((T126*)(C))->a27 = (T133f2(((T126*)(C))->a32, ((T126*)(C))->a27, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].items_resize */
void T126f46(T0* C, T4 a1)
{
	((T126*)(C))->a6 = (T136f2(((T126*)(C))->a31, ((T126*)(C))->a6, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].keys_item */
T0* T126f20(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T120*)(((T126*)(C))->a27))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].slots_resize */
void T126f45(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T126f30(C));
	((T126*)(C))->a26 = (T129f2(t1, ((T126*)(C))->a26, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].new_modulus */
T4 T126f23(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].new_capacity */
T4 T126f10(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = (T4)(geint32(2));
	R = ((T4)((t1)*(a1)));
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].items_put */
void T126f39(T0* C, T0* a1, T4 a2)
{
	((T135*)(((T126*)(C))->a6))->a2[a2] = (a1);
}

/* DS_HASH_TABLE [PR_TYPE, STRING].search_position */
void T126f36(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T2 t1;
	T0* t2;
	T2 t3;
	t1 = ((a1)==(EIF_VOID));
	if (t1) {
		((T126*)(C))->a3 = (T126f17(C, ((T126*)(C))->a18));
		((T126*)(C))->a12 = (((T126*)(C))->a18);
		((T126*)(C))->a19 = ((T4)(geint32(0)));
	} else {
		l4 = (((T126*)(C))->a7);
		t1 = ((l4)!=(EIF_VOID));
		if (t1) {
			t1 = ((((T126*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T126f20(C, ((T126*)(C))->a3));
				t3 = (T39f1(l4, a1, t2));
				t1 = ((T2)(!(t3)));
			}
			if (!(t1)) {
				t1 = (T39f1(l4, a1, l3));
			}
			if (t1) {
				((T126*)(C))->a12 = (T126f11(C, a1));
				l1 = (T126f17(C, ((T126*)(C))->a12));
				((T126*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T126f20(C, l1));
					t1 = (T39f1(l4, a1, t2));
					if (t1) {
						((T126*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T126f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T126*)(C))->a19 = (l2);
			}
		} else {
			t1 = ((((T126*)(C))->a3)==((T4)(geint32(0))));
			if (!(t1)) {
				t2 = (T126f20(C, ((T126*)(C))->a3));
				t1 = ((a1)!=(t2));
			}
			if (!(t1)) {
				t1 = ((a1)==(l3));
			}
			if (t1) {
				((T126*)(C))->a12 = (T126f11(C, a1));
				l1 = (T126f17(C, ((T126*)(C))->a12));
				((T126*)(C))->a3 = ((T4)(geint32(0)));
				l2 = ((T4)(geint32(0)));
				t1 = ((l1)==((T4)(geint32(0))));
				while (!(t1)) {
					t2 = (T126f20(C, l1));
					t1 = ((a1)==(t2));
					if (t1) {
						((T126*)(C))->a3 = (l1);
						l1 = ((T4)(geint32(0)));
					} else {
						l2 = (l1);
						l1 = (T126f16(C, l1));
					}
					t1 = ((l1)==((T4)(geint32(0))));
				}
				((T126*)(C))->a19 = (l2);
			}
		}
	}
}

/* DS_HASH_TABLE [PR_TYPE, STRING].unset_found_item */
void T126f38(T0* C)
{
	((T126*)(C))->a22 = ((T4)(geint32(0)));
}

/* PR_TYPE.make_anchored */
T0* T96c10(T4 a1, T0* a2)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T96));
	((T96*)(C))->id = 96;
	((T96*)(C))->a2 = (a1);
	t1 = (((T16*)(a2))->a2);
	t1 = ((T4)((t1)+((T4)(geint32(5)))));
	((T96*)(C))->a1 = T16c25(t1);
	T16f26(((T96*)(C))->a1, gems("like ", 5));
	T16f26(((T96*)(C))->a1, a2);
	return C;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].item */
T0* T126f2(T0* C, T0* a1)
{
	T0* R = 0;
	T126f36(C, a1);
	R = (T126f5(C, ((T126*)(C))->a3));
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].items_item */
T0* T126f5(T0* C, T4 a1)
{
	T0* R = 0;
	R = (((T135*)(((T126*)(C))->a6))->a2[a1]);
	return R;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].has */
T2 T126f1(T0* C, T0* a1)
{
	T2 R = 0;
	T126f36(C, a1);
	R = ((((T126*)(C))->a3)!=((T4)(geint32(0))));
	return R;
}

/* PR_YACC_PARSER.new_generic_type */
T0* T47f150(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	t1 = ((a2)!=(EIF_VOID));
	if (t1) {
		t2 = (((T26*)(((T47*)(C))->a2))->a8);
		t3 = (((T109*)(t2))->a1);
		l2 = ((T4)((t3)+((T4)(geint32(1)))));
		R = T96c9(l2, a1, a2);
		t2 = ((((R)->id==96)?((T96*)(R))->a1:((T170*)(R))->a2));
		l1 = (T16f6(t2));
		t1 = (T126f1(((T47*)(C))->a8, l1));
		if (t1) {
			R = (T126f2(((T47*)(C))->a8, l1));
		} else {
			T126f35(((T47*)(C))->a8, R, l1);
			T26f31(((T47*)(C))->a2, R);
		}
	} else {
		R = (T47f145(C, a1));
	}
	return R;
}

/* STRING.as_upper */
T0* T16f6(T0* C)
{
	T0* R = 0;
	R = (T16f9(C));
	T16f31(R);
	return R;
}

/* STRING.to_upper */
void T16f31(T0* C)
{
	T4 l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T1 t2;
	l1 = ((T4)((((T16*)(C))->a2)-((T4)(geint32(1)))));
	l2 = (((T16*)(C))->a1);
	t1 = ((T2)((l1)<((T4)(geint32(0)))));
	while (!(t1)) {
		t2 = (((T15*)(l2))->a2[l1]);
		t2 = (T1f2(&t2));
		((T15*)(l2))->a2[l1] = (t2);
		l1 = ((T4)((l1)-((T4)(geint32(1)))));
		t1 = ((T2)((l1)<((T4)(geint32(0)))));
	}
	((T16*)(C))->a11 = ((T4)(geint32(0)));
}

/* CHARACTER.upper */
T1 T1f2(T1* C)
{
	T1 R = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	T4 t4;
	t1 = (T1f6(C));
	if (t1) {
		t2 = (*C);
		t3 = ((T4)(t2));
		t2 = (T1)('a');
		t4 = ((T4)(t2));
		t3 = ((T4)((t3)-(t4)));
		t2 = (T1)('A');
		t4 = ((T4)(t2));
		t3 = ((T4)((t3)+(t4)));
		R = ((T1)(t3));
	} else {
		R = (*C);
	}
	return R;
}

/* CHARACTER.is_lower */
T2 T1f6(T1* C)
{
	T2 R = 0;
	T1 t1;
	T4 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T4)(t1));
	t3 = (T1f9(C, t2));
	t3 = (T8f1(&t3, (T5)(geint8(0x02))));
	R = (T8f2(&t3, (T8)(genat8(0))));
	return R;
}

/* PR_TYPE.make_generic */
T0* T96c9(T4 a1, T0* a2, T0* a3)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T96));
	((T96*)(C))->id = 96;
	((T96*)(C))->a2 = (a1);
	t1 = (T109f3(a3));
	if (t1) {
		((T96*)(C))->a1 = (a2);
	} else {
		((T96*)(C))->a1 = T16c25((T4)(geint32(50)));
		T16f26(((T96*)(C))->a1, a2);
		T16f26(((T96*)(C))->a1, gems(" [", 2));
		t2 = (T109f2(a3, (T4)(geint32(1))));
		t2 = ((((t2)->id==96)?((T96*)(t2))->a1:((T170*)(t2))->a2));
		T16f26(((T96*)(C))->a1, t2);
		l2 = (((T109*)(a3))->a1);
		l1 = ((T4)(geint32(2)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			T16f26(((T96*)(C))->a1, gems(", ", 2));
			t2 = (T109f2(a3, l1));
			t2 = ((((t2)->id==96)?((T96*)(t2))->a1:((T170*)(t2))->a2));
			T16f26(((T96*)(C))->a1, t2);
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = (T4f1(&l1, l2));
		}
		T16f28(((T96*)(C))->a1, (T1)(']'));
	}
	return C;
}

/* PR_YACC_PARSER.new_basic_type */
T0* T47f148(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (T16f6(a1));
	t1 = (T126f1(((T47*)(C))->a8, l1));
	if (t1) {
		R = (T126f2(((T47*)(C))->a8, l1));
	} else {
		t2 = (((T26*)(((T47*)(C))->a2))->a8);
		t3 = (((T109*)(t2))->a1);
		l2 = ((T4)((t3)+((T4)(geint32(1)))));
		R = T170c8(l2, a1);
		T126f35(((T47*)(C))->a8, R, l1);
		T26f31(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_BASIC_TYPE.make */
T0* T170c8(T4 a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T170));
	((T170*)(C))->id = 170;
	((T170*)(C))->a1 = (a1);
	((T170*)(C))->a2 = (a2);
	return C;
}

/* KL_SPECIAL_ROUTINES [PR_TYPE].resize */
T0* T136f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T4 t1;
	T2 t2;
	t1 = (((T135*)(a1))->a1);
	t2 = (T4f1(&a2, t1));
	if (t2) {
		R = (T135f3(a1, a2));
	} else {
		R = (a1);
	}
	return R;
}

/* SPECIAL [PR_TYPE].resized_area */
T0* T135f3(T0* C, T4 a1)
{
	T0* R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	R = T135c4(a1);
	l2 = (((T135*)(C))->a1);
	t1 = ((l1)==(l2));
	while (!(t1)) {
		t2 = (((T135*)(C))->a2[l1]);
		((T135*)(R))->a2[l1] = (t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l1)==(l2));
	}
	return R;
}

/* PR_YACC_PARSER.new_type */
T0* T47f145(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T0* t2;
	T4 t3;
	l1 = (T16f6(a1));
	t1 = (T126f1(((T47*)(C))->a8, l1));
	if (t1) {
		R = (T126f2(((T47*)(C))->a8, l1));
	} else {
		t2 = (((T26*)(((T47*)(C))->a2))->a8);
		t3 = (((T109*)(t2))->a1);
		l2 = ((T4)((t3)+((T4)(geint32(1)))));
		R = T96c8(l2, a1);
		T126f35(((T47*)(C))->a8, R, l1);
		T26f31(((T47*)(C))->a2, R);
	}
	return R;
}

/* PR_YACC_PARSER.no_type */
unsigned char ge201os3351 = '\0';
T0* ge201ov3351;
T0* T47f143(T0* C)
{
	T0* R = 0;
	if (ge201os3351) {
		return ge201ov3351;
	} else {
		ge201os3351 = '\1';
	}
	R = (T47f145(C, gems("ANY", 3)));
	ge201ov3351 = R;
	return R;
}

/* PR_GRAMMAR.set_expected_conflicts */
void T26f24(T0* C, T4 a1)
{
	((T26*)(C))->a2 = (a1);
}

/* DS_PAIR [STRING, INTEGER].make */
T0* T134c3(T0* a1, T4 a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T134));
	((T134*)(C))->id = 134;
	((T134*)(C))->a1 = (a1);
	((T134*)(C))->a2 = (a2);
	return C;
}

/* PR_YACC_PARSER.report_multiple_start_declarations_error */
void T47f287(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T144c7(t1, ((T47*)(C))->a16);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.make */
T0* T144c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T144));
	((T144*)(C))->id = 144;
	((T144*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(2)));
	T121f7(((T144*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T144*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* DS_ARRAYED_LIST [STRING].force_last */
void T108f11(T0* C, T0* a1)
{
	T2 t1;
	T4 t2;
	t1 = (T108f8(C, (T4)(geint32(1))));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = ((T4)((((T108*)(C))->a1)+((T4)(geint32(1)))));
		t2 = (T108f9(C, t2));
		T108f12(C, t2);
	}
	((T108*)(C))->a1 = ((T4)((((T108*)(C))->a1)+((T4)(geint32(1)))));
	((T120*)(((T108*)(C))->a3))->a2[((T108*)(C))->a1] = (a1);
}

/* DS_ARRAYED_LIST [STRING].resize */
void T108f12(T0* C, T4 a1)
{
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T108*)(C))->a3 = (T133f2(((T108*)(C))->a4, ((T108*)(C))->a3, t1));
	((T108*)(C))->a5 = (a1);
}

/* DS_ARRAYED_LIST [STRING].new_capacity */
T4 T108f9(T0* C, T4 a1)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = ((T4)((t1)*((T4)(geint32(3)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* DS_ARRAYED_LIST [STRING].extendible */
T2 T108f8(T0* C, T4 a1)
{
	T2 R = 0;
	T4 t1;
	t1 = ((T4)((((T108*)(C))->a1)+(a1)));
	R = (T4f4(&(((T108*)(C))->a5), t1));
	return R;
}

/* PR_YACC_PARSER.initialize_grammar */
void T47f286(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	l2 = (T47f145(C, gems("ANY", 3)));
	l1 = (T47f177(C, gems("error", 5)));
	T81f21(l1, (T4)(geint32(256)));
	T81f28(l1, EIF_TRUE);
	l1 = (T47f177(C, gems("$undefined.", 11)));
	T81f28(l1, EIF_TRUE);
}

/* PR_YACC_PARSER.process_symbols */
void T47f285(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T0* l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	T0* l7 = 0;
	T4 l8 = 0;
	T0* l9 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	l4 = (((T26*)(((T47*)(C))->a2))->a6);
	l1 = ((T4)(geint32(256)));
	l3 = (((T95*)(l4))->a1);
	l2 = ((T4)(geint32(1)));
	t1 = (T4f1(&l2, l3));
	while (!(t1)) {
		l5 = (T95f2(l4, l2));
		t1 = (T81f1(l5));
		t1 = ((T2)(!(t1)));
		if (t1) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			T81f21(l5, l1);
		}
		t2 = (((T81*)(l5))->a2);
		t1 = (T4f1(&t2, l8));
		if (t1) {
			l8 = (((T81*)(l5))->a2);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l3));
	}
	l9 = T143c5((T4)(geint32(0)), l8);
	l2 = ((T4)(geint32(1)));
	t1 = (T4f1(&l2, l3));
	while (!(t1)) {
		l5 = (T95f2(l4, l2));
		t2 = (((T81*)(l5))->a2);
		t3 = (T143f4(l9, t2));
		t1 = ((t3)!=(EIF_VOID));
		if (t1) {
			t2 = (((T81*)(l5))->a2);
			t3 = (T143f4(l9, t2));
			T47f314(C, t3, l5);
		} else {
			t2 = (((T81*)(l5))->a2);
			T143f6(l9, l5, t2);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l3));
	}
	l6 = (((T26*)(((T47*)(C))->a2))->a5);
	l3 = (((T88*)(l6))->a1);
	l2 = ((T4)(geint32(1)));
	t1 = (T4f1(&l2, l3));
	while (!(t1)) {
		l7 = (T88f2(l6, l2));
		t3 = (((T70*)(l7))->a1);
		t1 = (T67f3(t3));
		if (t1) {
			t3 = (((T70*)(l7))->a6);
			T47f315(C, t3);
		}
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = (T4f1(&l2, l3));
	}
}

/* PR_YACC_PARSER.report_undefined_symbol_error */
void T47f315(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T158c7(t1, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_UNDEFINED_SYMBOL_ERROR.make */
T0* T158c7(T0* a1, T0* a2)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T158));
	((T158*)(C))->id = 158;
	((T158*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(2)));
	T121f7(((T158*)(C))->a5, a1, (T4)(geint32(1)));
	T121f7(((T158*)(C))->a5, a2, (T4)(geint32(2)));
	return C;
}

/* ARRAY [PR_TOKEN].put */
void T143f6(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T143*)(C))->a2)));
	((T139*)(((T143*)(C))->a1))->a2[t1] = (a1);
}

/* PR_YACC_PARSER.report_token_id_used_twice_warning */
void T47f314(T0* C, T0* a1, T0* a2)
{
	T0* l1 = 0;
	T0* t1;
	T0* t2;
	T0* t3;
	T4 t4;
	t1 = (T47f229(C));
	t2 = (((T81*)(a1))->a3);
	t3 = (((T81*)(a2))->a3);
	t4 = (((T81*)(a1))->a2);
	l1 = T157c7(t1, t2, t3, t4);
	T25f9(((T47*)(C))->a13, l1);
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.make */
T0* T157c7(T0* a1, T0* a2, T0* a3, T4 a4)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T157));
	((T157*)(C))->id = 157;
	((T157*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(4)));
	T121f7(((T157*)(C))->a5, a1, (T4)(geint32(1)));
	T121f7(((T157*)(C))->a5, a2, (T4)(geint32(2)));
	T121f7(((T157*)(C))->a5, a3, (T4)(geint32(3)));
	t1 = (T4f11(&a4));
	T121f7(((T157*)(C))->a5, t1, (T4)(geint32(4)));
	return C;
}

/* ARRAY [PR_TOKEN].item */
T0* T143f4(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T143*)(C))->a2)));
	R = (((T139*)(((T143*)(C))->a1))->a2[t1]);
	return R;
}

/* ARRAY [PR_TOKEN].make */
T0* T143c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T143));
	((T143*)(C))->id = 143;
	((T143*)(C))->a2 = (a1);
	((T143*)(C))->a3 = (a2);
	t1 = (T4f12(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T143f7(C, t2);
	} else {
		T143f7(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [PR_TOKEN].make_area */
void T143f7(T0* C, T4 a1)
{
	((T143*)(C))->a1 = T139c4(a1);
}

/* PR_YACC_PARSER.set_start_symbol */
void T47f284(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	t1 = ((((T47*)(C))->a142)!=(EIF_VOID));
	if (t1) {
		l2 = (((T134*)(((T47*)(C))->a142))->a1);
		t1 = (T47f168(C, l2));
		if (t1) {
			T47f312(C);
		} else {
			t1 = (T47f230(C, l2));
			t1 = ((T2)(!(t1)));
			if (t1) {
				T47f313(C);
			} else {
				l1 = (T47f171(C, l2));
				T26f26(((T47*)(C))->a2, l1);
			}
		}
		((T47*)(C))->a142 = (EIF_VOID);
	} else {
		t2 = (((T26*)(((T47*)(C))->a2))->a1);
		t1 = (T67f3(t2));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t2 = (((T26*)(((T47*)(C))->a2))->a1);
			t2 = (T67f4(t2));
			l1 = (((T69*)(t2))->a2);
			T26f26(((T47*)(C))->a2, l1);
		}
	}
}

/* DS_ARRAYED_LIST [PR_RULE].first */
T0* T67f4(T0* C)
{
	T0* R = 0;
	R = (((T190*)(((T67*)(C))->a7))->a2[(T4)(geint32(1))]);
	return R;
}

/* PR_GRAMMAR.set_start_symbol */
void T26f26(T0* C, T0* a1)
{
	((T26*)(C))->a3 = (a1);
}

/* PR_YACC_PARSER.report_unknown_start_symbol_error */
void T47f313(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T0* t1;
	l2 = (((T134*)(((T47*)(C))->a142))->a1);
	l3 = (((T134*)(((T47*)(C))->a142))->a2);
	t1 = (T47f229(C));
	l1 = T156c7(t1, l3, l2);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.make */
T0* T156c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T156));
	((T156*)(C))->id = 156;
	((T156*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T156*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T156*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T156*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.report_start_symbol_token_error */
void T47f312(T0* C)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T0* t1;
	l2 = (((T134*)(((T47*)(C))->a142))->a1);
	l3 = (((T134*)(((T47*)(C))->a142))->a2);
	t1 = (T47f229(C));
	l1 = T155c7(t1, l3, l2);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_START_SYMBOL_TOKEN_ERROR.make */
T0* T155c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T155));
	((T155*)(C))->id = 155;
	((T155*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T155*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T155*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T155*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.yy_push_last_value */
void T47f271(T0* C, T4 a1)
{
	T4 t1;
	T2 t2;
	t1 = (((T98*)(((T47*)(C))->a67))->a2[a1]);
	switch (t1) {
	case (T4)(T4)(geint32(1)):
		((T47*)(C))->a76 = ((T4)((((T47*)(C))->a76)+((T4)(geint32(1)))));
		t2 = (T4f4(&(((T47*)(C))->a76), ((T47*)(C))->a127));
		if (t2) {
			t2 = ((((T47*)(C))->a128)==(EIF_VOID));
			if (t2) {
				((T47*)(C))->a129 = T132c3();
				((T47*)(C))->a127 = ((T4)(geint32(10)));
				((T47*)(C))->a128 = (T132f1(((T47*)(C))->a129, ((T47*)(C))->a127));
			} else {
				((T47*)(C))->a127 = ((T4)((((T47*)(C))->a127)+((T4)(geint32(10)))));
				((T47*)(C))->a128 = (T132f2(((T47*)(C))->a129, ((T47*)(C))->a128, ((T47*)(C))->a127));
			}
		}
		((T131*)(((T47*)(C))->a128))->a2[((T47*)(C))->a76] = (((T47*)(C))->a131);
		break;
	case (T4)(T4)(geint32(2)):
		((T47*)(C))->a77 = ((T4)((((T47*)(C))->a77)+((T4)(geint32(1)))));
		t2 = (T4f4(&(((T47*)(C))->a77), ((T47*)(C))->a132));
		if (t2) {
			t2 = ((((T47*)(C))->a133)==(EIF_VOID));
			if (t2) {
				((T47*)(C))->a134 = T133c3();
				((T47*)(C))->a132 = ((T4)(geint32(10)));
				((T47*)(C))->a133 = (T133f1(((T47*)(C))->a134, ((T47*)(C))->a132));
			} else {
				((T47*)(C))->a132 = ((T4)((((T47*)(C))->a132)+((T4)(geint32(10)))));
				((T47*)(C))->a133 = (T133f2(((T47*)(C))->a134, ((T47*)(C))->a133, ((T47*)(C))->a132));
			}
		}
		((T120*)(((T47*)(C))->a133))->a2[((T47*)(C))->a77] = (((T47*)(C))->a135);
		break;
	case (T4)(T4)(geint32(3)):
		((T47*)(C))->a78 = ((T4)((((T47*)(C))->a78)+((T4)(geint32(1)))));
		t2 = (T4f4(&(((T47*)(C))->a78), ((T47*)(C))->a136));
		if (t2) {
			t2 = ((((T47*)(C))->a137)==(EIF_VOID));
			if (t2) {
				((T47*)(C))->a138 = T129c4();
				((T47*)(C))->a136 = ((T4)(geint32(10)));
				((T47*)(C))->a137 = (T129f1(((T47*)(C))->a138, ((T47*)(C))->a136));
			} else {
				((T47*)(C))->a136 = ((T4)((((T47*)(C))->a136)+((T4)(geint32(10)))));
				((T47*)(C))->a137 = (T129f2(((T47*)(C))->a138, ((T47*)(C))->a137, ((T47*)(C))->a136));
			}
		}
		((T98*)(((T47*)(C))->a137))->a2[((T47*)(C))->a78] = (((T47*)(C))->a139);
		break;
	default:
		T47f269(C);
		break;
	}
}

/* KL_SPECIAL_ROUTINES [STRING].make */
T0* T133f1(T0* C, T4 a1)
{
	T0* R = 0;
	T0* l1 = 0;
	l1 = T235c2(a1);
	R = (((T235*)(l1))->a1);
	return R;
}

/* TO_SPECIAL [STRING].make_area */
T0* T235c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T235));
	((T235*)(C))->id = 235;
	((T235*)(C))->a1 = T120c4(a1);
	return C;
}

/* KL_SPECIAL_ROUTINES [STRING].default_create */
T0* T133c3()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T133));
	((T133*)(C))->id = 133;
	return C;
}

/* PR_YACC_PARSER.accept */
void T47f270(T0* C)
{
	((T47*)(C))->a25 = ((T4)(geint32(101)));
}

/* PR_YACC_PARSER.abort */
void T47f269(T0* C)
{
	((T47*)(C))->a25 = ((T4)(geint32(102)));
}

/* PR_YACC_PARSER.yy_do_error_action */
void T47f268(T0* C, T4 a1)
{
	switch (a1) {
	case (T4)(T4)(geint32(115)):
		T47f282(C);
		break;
	default:
		T47f283(C, gems("parse error", 11));
		break;
	}
}

/* PR_YACC_PARSER.report_error */
void T47f283(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T142c7(t1, ((T47*)(C))->a16);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* UT_SYNTAX_ERROR.make */
T0* T142c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T142));
	((T142*)(C))->id = 142;
	((T142*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(2)));
	T121f7(((T142*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T142*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* PR_YACC_PARSER.report_eof_expected_error */
void T47f282(T0* C)
{
	T47f283(C, gems("parse error", 11));
}

/* PR_YACC_PARSER.read_token */
void T47f267(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T4 l6 = 0;
	T4 l7 = 0;
	T4 l8 = 0;
	T2 l9 = 0;
	T4 l10 = 0;
	T4 l11 = 0;
	T4 l12 = 0;
	T2 l13 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	((T47*)(C))->a47 = ((T4)(geint32(-2)));
	l7 = ((T4)(geint32(1)));
	t1 = ((((T47*)(C))->a47)!=((T4)(geint32(-2))));
	while (!(t1)) {
		switch (l7) {
		case (T4)(T4)(geint32(1)):
			if (((T47*)(C))->a88) {
				((T47*)(C))->a89 = ((T4)((((T47*)(C))->a21)-(((T47*)(C))->a75)));
				((T47*)(C))->a88 = (EIF_FALSE);
			} else {
				((T47*)(C))->a89 = ((T4)(geint32(0)));
				((T47*)(C))->a90 = (((T47*)(C))->a23);
				((T47*)(C))->a91 = (((T47*)(C))->a24);
				((T47*)(C))->a92 = (((T47*)(C))->a22);
			}
			l1 = (((T47*)(C))->a21);
			l2 = (l1);
			t1 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a6:((T128*)(((T47*)(C))->a20))->a6));
			if (t1) {
				l3 = ((T4)((((T47*)(C))->a93)+((T4)(geint32(1)))));
			} else {
				l3 = (((T47*)(C))->a93);
			}
			if (EIF_FALSE) {
				((T98*)(((T47*)(C))->a95))->a2[(T4)(geint32(0))] = (l3);
				((T47*)(C))->a96 = ((T4)(geint32(1)));
			}
			l7 = ((T4)(geint32(2)));
			break;
		case (T4)(T4)(geint32(2)):
			l13 = (EIF_FALSE);
			while (!(l13)) {
				t1 = ((((T47*)(C))->a97)!=(EIF_VOID));
				if (t1) {
					t1 = ((((T47*)(C))->a98)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(((T47*)(C))->a98))->a2[l1]);
						t3 = ((T4)(t2));
						l8 = (((T98*)(((T47*)(C))->a97))->a2[t3]);
					} else {
						t2 = (T252f1(((T47*)(C))->a99, l1));
						t3 = ((T4)(t2));
						l8 = (((T98*)(((T47*)(C))->a97))->a2[t3]);
					}
				} else {
					t1 = ((((T47*)(C))->a98)!=(EIF_VOID));
					if (t1) {
						t2 = (((T15*)(((T47*)(C))->a98))->a2[l1]);
						l8 = ((T4)(t2));
					} else {
						t2 = (T252f1(((T47*)(C))->a99, l1));
						l8 = ((T4)(t2));
					}
				}
				t1 = EIF_FALSE;
				t1 = ((T2)(!(t1)));
				if (t1) {
					t3 = (((T98*)(((T47*)(C))->a100))->a2[l3]);
					t1 = ((t3)!=((T4)(geint32(0))));
				}
				if (t1) {
					((T47*)(C))->a101 = (l3);
					((T47*)(C))->a102 = (l1);
				}
				t3 = (((T98*)(((T47*)(C))->a104))->a2[l3]);
				t3 = ((T4)((t3)+(l8)));
				t3 = (((T98*)(((T47*)(C))->a103))->a2[t3]);
				t1 = ((t3)==(l3));
				while (!(t1)) {
					l3 = (((T98*)(((T47*)(C))->a105))->a2[l3]);
					t1 = ((((T47*)(C))->a106)!=(EIF_VOID));
					if (t1) {
						t1 = (T4f4(&l3, (T4)(geint32(202))));
					}
					if (t1) {
						l8 = (((T98*)(((T47*)(C))->a106))->a2[l8]);
					}
					t3 = (((T98*)(((T47*)(C))->a104))->a2[l3]);
					t3 = ((T4)((t3)+(l8)));
					t3 = (((T98*)(((T47*)(C))->a103))->a2[t3]);
					t1 = ((t3)==(l3));
				}
				t3 = (((T98*)(((T47*)(C))->a104))->a2[l3]);
				t3 = ((T4)((t3)+(l8)));
				l3 = (((T98*)(((T47*)(C))->a108))->a2[t3]);
				if (EIF_FALSE) {
					((T98*)(((T47*)(C))->a95))->a2[((T47*)(C))->a96] = (l3);
					((T47*)(C))->a96 = ((T4)((((T47*)(C))->a96)+((T4)(geint32(1)))));
				}
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
				l13 = ((l3)==((T4)(geint32(201))));
			}
			t1 = EIF_FALSE;
			t1 = ((T2)(!(t1)));
			if (t1) {
				l1 = (((T47*)(C))->a102);
				l3 = (((T47*)(C))->a101);
			}
			l7 = ((T4)(geint32(3)));
			break;
		case (T4)(T4)(geint32(3)):
			t1 = EIF_FALSE;
			t1 = ((T2)(!(t1)));
			if (t1) {
				l6 = (((T98*)(((T47*)(C))->a100))->a2[l3]);
				l7 = ((T4)(geint32(4)));
			} else {
				((T47*)(C))->a96 = ((T4)((((T47*)(C))->a96)-((T4)(geint32(1)))));
				l3 = (((T98*)(((T47*)(C))->a95))->a2[((T47*)(C))->a96]);
				((T47*)(C))->a110 = (((T98*)(((T47*)(C))->a100))->a2[l3]);
				l7 = ((T4)(geint32(5)));
			}
			break;
		case (T4)(T4)(geint32(5)):
			l9 = (EIF_FALSE);
			while (!(l9)) {
				t1 = ((((T47*)(C))->a110)!=((T4)(geint32(0))));
				if (t1) {
					t3 = ((T4)((l3)+((T4)(geint32(1)))));
					t3 = (((T98*)(((T47*)(C))->a100))->a2[t3]);
					t1 = ((T2)((((T47*)(C))->a110)<(t3)));
				}
				if (t1) {
					l6 = ((T4)gevoid(((T47*)(C))->a111, ((T47*)(C))->a110));
					if (EIF_FALSE) {
						t3 = (T4)(geint32(65));
						t3 = ((T4)(-(t3)));
						t1 = ((T2)((l6)<(t3)));
						if (!(t1)) {
							t1 = ((((T47*)(C))->a114)!=((T4)(geint32(0))));
						}
						if (t1) {
							t1 = ((l6)==(((T47*)(C))->a114));
							if (t1) {
								((T47*)(C))->a114 = ((T4)(geint32(0)));
								t3 = ((T4)(-(l6)));
								l6 = ((T4)((t3)-((T4)(geint32(65)))));
								l9 = (EIF_TRUE);
							} else {
								((T47*)(C))->a110 = ((T4)((((T47*)(C))->a110)+((T4)(geint32(1)))));
							}
						} else {
							t1 = ((T2)((l6)<((T4)(geint32(0)))));
							if (t1) {
								((T47*)(C))->a114 = ((T4)((l6)-((T4)(geint32(65)))));
								if (EIF_FALSE) {
									((T47*)(C))->a116 = (l1);
									((T47*)(C))->a117 = (((T47*)(C))->a96);
									((T47*)(C))->a118 = (((T47*)(C))->a110);
								}
								((T47*)(C))->a110 = ((T4)((((T47*)(C))->a110)+((T4)(geint32(1)))));
							} else {
								((T47*)(C))->a116 = (l1);
								((T47*)(C))->a117 = (((T47*)(C))->a96);
								((T47*)(C))->a118 = (((T47*)(C))->a110);
								l9 = (EIF_TRUE);
							}
						}
					} else {
						((T47*)(C))->a116 = (l1);
						l9 = (EIF_TRUE);
					}
				} else {
					l1 = ((T4)((l1)-((T4)(geint32(1)))));
					((T47*)(C))->a96 = ((T4)((((T47*)(C))->a96)-((T4)(geint32(1)))));
					l3 = (((T98*)(((T47*)(C))->a95))->a2[((T47*)(C))->a96]);
					((T47*)(C))->a110 = (((T98*)(((T47*)(C))->a100))->a2[l3]);
				}
			}
			l10 = (((T47*)(C))->a23);
			l11 = (((T47*)(C))->a24);
			l12 = (((T47*)(C))->a22);
			l7 = ((T4)(geint32(4)));
			break;
		case (T4)(T4)(geint32(4)):
			l2 = ((T4)((l2)-(((T47*)(C))->a89)));
			((T47*)(C))->a75 = (l2);
			((T47*)(C))->a21 = (l1);
			l7 = ((T4)(geint32(1)));
			t1 = ((l6)==((T4)(geint32(0))));
			if (t1) {
				t1 = EIF_FALSE;
				t1 = ((T2)(!(t1)));
				if (t1) {
					l1 = (((T47*)(C))->a102);
					l2 = ((T4)((l2)+(((T47*)(C))->a89)));
					l3 = (((T47*)(C))->a101);
					l7 = ((T4)(geint32(3)));
				} else {
					((T47*)(C))->a47 = ((T4)(geint32(-1)));
					T47f278(C, gems("fatal scanner internal error: no action found", 45));
				}
			} else {
				t1 = ((l6)==((T4)(geint32(66))));
				if (t1) {
					t3 = ((T4)((l1)-(l2)));
					l5 = ((T4)((t3)-((T4)(geint32(1)))));
					t3 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a7:((T128*)(((T47*)(C))->a20))->a7));
					t3 = ((T4)((t3)+((T4)(geint32(1)))));
					t1 = (T4f12(&(((T47*)(C))->a21), t3));
					if (t1) {
						((T47*)(C))->a21 = ((T4)((l2)+(l5)));
						l3 = (T47f121(C));
						l4 = (T47f122(C, l3));
						l2 = ((T4)((l2)+(((T47*)(C))->a89)));
						t1 = ((l4)!=((T4)(geint32(0))));
						if (t1) {
							l1 = ((T4)((((T47*)(C))->a21)+((T4)(geint32(1)))));
							((T47*)(C))->a21 = (l1);
							l3 = (l4);
							l7 = ((T4)(geint32(2)));
						} else {
							if (EIF_FALSE) {
								l1 = (((T47*)(C))->a21);
								((T47*)(C))->a96 = ((T4)((((T47*)(C))->a96)-((T4)(geint32(1)))));
							} else {
								l1 = (((T47*)(C))->a102);
								l3 = (((T47*)(C))->a101);
							}
							l7 = ((T4)(geint32(3)));
						}
					} else {
						((T47*)(C))->a21 = ((T4)((((T47*)(C))->a21)-((T4)(geint32(1)))));
						T47f279(C);
						t1 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a8:((T128*)(((T47*)(C))->a20))->a8));
						if (t1) {
							l3 = (T47f121(C));
							l1 = (((T47*)(C))->a21);
							l2 = ((T4)((((T47*)(C))->a75)+(((T47*)(C))->a89)));
							l7 = ((T4)(geint32(2)));
						} else {
							t3 = ((T4)((((T47*)(C))->a21)-(((T47*)(C))->a75)));
							t3 = ((T4)((t3)-(((T47*)(C))->a89)));
							t1 = ((t3)!=((T4)(geint32(0))));
							if (t1) {
								l3 = (T47f121(C));
								l1 = (((T47*)(C))->a21);
								l2 = ((T4)((((T47*)(C))->a75)+(((T47*)(C))->a89)));
								l7 = ((T4)(geint32(3)));
							} else {
								t1 = (T47f123(C));
								if (t1) {
									l2 = (((T47*)(C))->a75);
									l1 = (((T47*)(C))->a21);
									t3 = ((T4)((((T47*)(C))->a93)-((T4)(geint32(1)))));
									t3 = ((T4)((t3)/((T4)(geint32(2)))));
									T47f280(C, t3);
								}
							}
						}
					}
				} else {
					T47f281(C, l6);
					if (((T47*)(C))->a124) {
						((T47*)(C))->a124 = (EIF_FALSE);
						((T47*)(C))->a23 = (l10);
						((T47*)(C))->a24 = (l11);
						((T47*)(C))->a22 = (l12);
						l1 = (((T47*)(C))->a116);
						if (EIF_FALSE) {
							((T47*)(C))->a110 = (((T47*)(C))->a118);
							((T47*)(C))->a96 = (((T47*)(C))->a117);
							t3 = ((T4)((((T47*)(C))->a96)-((T4)(geint32(1)))));
							l3 = (((T98*)(((T47*)(C))->a95))->a2[t3]);
						}
						((T47*)(C))->a110 = ((T4)((((T47*)(C))->a110)+((T4)(geint32(1)))));
						l7 = ((T4)(geint32(5)));
					}
				}
			}
			break;
		default:
			break;
		}
		t1 = ((((T47*)(C))->a47)!=((T4)(geint32(-2))));
	}
}

/* PR_YACC_PARSER.yy_execute_action */
void T47f281(T0* C, T4 a1)
{
	T2 t1;
	T0* t2;
	T4 t3;
	T4 t4;
	T1 t5;
	t1 = (T4f12(&a1, (T4)(geint32(33))));
	if (t1) {
		t1 = (T4f12(&a1, (T4)(geint32(17))));
		if (t1) {
			t1 = (T4f12(&a1, (T4)(geint32(9))));
			if (t1) {
				t1 = (T4f12(&a1, (T4)(geint32(5))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(3))));
					if (t1) {
						t1 = (T4f12(&a1, (T4)(geint32(2))));
						if (t1) {
							t1 = ((a1)==((T4)(geint32(1))));
							if (t1) {
								((T47*)(C))->a47 = ((T4)(geint32(258)));
							} else {
								((T47*)(C))->a47 = ((T4)(geint32(259)));
							}
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(260)));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(4))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(261)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(265)));
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(7))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(6))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(264)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(262)));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(8))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(44)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(60)));
						}
					}
				}
			} else {
				t1 = (T4f12(&a1, (T4)(geint32(13))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(11))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(10))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(62)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(91)));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(12))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(93)));
						} else {
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+((T4)(geint32(1)))));
							T47f304(C, (T4)(geint32(3)));
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(15))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(14))));
						if (t1) {
							T47f304(C, (T4)(geint32(3)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(266)));
							T47f304(C, (T4)(geint32(1)));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(16))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(267)));
						} else {
						}
					}
				}
			}
		} else {
			t1 = (T4f12(&a1, (T4)(geint32(25))));
			if (t1) {
				t1 = (T4f12(&a1, (T4)(geint32(21))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(19))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(18))));
						if (t1) {
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+((T4)(geint32(1)))));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(274)));
							((T47*)(C))->a135 = (T47f202(C));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(20))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(275)));
							((T47*)(C))->a135 = (T47f202(C));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(277)));
							((T47*)(C))->a135 = (T47f202(C));
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(23))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(22))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(278)));
							((T47*)(C))->a135 = (T47f202(C));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(276)));
							((T47*)(C))->a135 = (T47f202(C));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(24))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(279)));
							((T47*)(C))->a135 = (T47f202(C));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(280)));
							((T47*)(C))->a135 = (T47f202(C));
						}
					}
				}
			} else {
				t1 = (T4f12(&a1, (T4)(geint32(29))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(27))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(26))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(269)));
							((T47*)(C))->a135 = (T47f202(C));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(281)));
							t2 = (T47f202(C));
							((T47*)(C))->a139 = (T16f15(t2));
							t1 = ((((T47*)(C))->a139)==((T4)(geint32(0))));
							if (t1) {
								T47f306(C);
							}
						}
					} else {
						t1 = ((a1)==((T4)(geint32(28))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(272)));
							((T47*)(C))->a135 = (T47f202(C));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(273)));
							((T47*)(C))->a135 = (T47f202(C));
							t3 = (T47f180(C));
							t1 = ((T2)((t3)<((T4)(geint32(4)))));
							if (t1) {
								t2 = (T47f202(C));
								T47f307(C, t2);
							}
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(31))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(30))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(263)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(282)));
							((T47*)(C))->a139 = (((T47*)(C))->a16);
							T47f304(C, (T4)(geint32(5)));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(32))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(58)));
							((T47*)(C))->a139 = (((T47*)(C))->a16);
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(124)));
							((T47*)(C))->a139 = (((T47*)(C))->a16);
						}
					}
				}
			}
		}
	} else {
		t1 = (T4f12(&a1, (T4)(geint32(49))));
		if (t1) {
			t1 = (T4f12(&a1, (T4)(geint32(41))));
			if (t1) {
				t1 = (T4f12(&a1, (T4)(geint32(37))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(35))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(34))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(59)));
						} else {
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+((T4)(geint32(1)))));
							T47f304(C, (T4)(geint32(4)));
						}
					} else {
						t1 = ((a1)==((T4)(geint32(36))));
						if (t1) {
							T47f304(C, (T4)(geint32(4)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(266)));
							T47f304(C, (T4)(geint32(2)));
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(39))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(38))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(271)));
							((T47*)(C))->a135 = (T47f202(C));
						} else {
						}
					} else {
						t1 = ((a1)==((T4)(geint32(40))));
						if (t1) {
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+((T4)(geint32(1)))));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(40)));
						}
					}
				}
			} else {
				t1 = (T4f12(&a1, (T4)(geint32(45))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(43))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(42))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(41)));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(281)));
							t2 = (T47f202(C));
							((T47*)(C))->a224 = (T16f15(t2));
							((T47*)(C))->a139 = (((T47*)(C))->a224);
						}
					} else {
						t1 = ((a1)==((T4)(geint32(44))));
						if (t1) {
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+((T4)(geint32(1)))));
							T47f304(C, (T4)(geint32(6)));
						} else {
							T47f304(C, (T4)(geint32(6)));
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(47))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(46))));
						if (t1) {
							T47f308(C);
						} else {
							T47f308(C);
						}
					} else {
						t1 = ((a1)==((T4)(geint32(48))));
						if (t1) {
							T47f308(C);
						} else {
							T47f308(C);
						}
					}
				}
			}
		} else {
			t1 = (T4f12(&a1, (T4)(geint32(57))));
			if (t1) {
				t1 = (T4f12(&a1, (T4)(geint32(53))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(51))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(50))));
						if (t1) {
							T47f308(C);
						} else {
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+((T4)(geint32(1)))));
							T47f308(C);
						}
					} else {
						t1 = ((a1)==((T4)(geint32(52))));
						if (t1) {
							((T47*)(C))->a47 = ((T4)(geint32(268)));
							t3 = (T47f180(C));
							t3 = ((T4)((t3)-((T4)(geint32(2)))));
							((T47*)(C))->a135 = (T47f181(C, (T4)(geint32(1)), t3));
							T47f304(C, (T4)(geint32(0)));
						} else {
							t2 = (T47f202(C));
							T16f26(((T47*)(C))->a14, t2);
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(55))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(54))));
						if (t1) {
							t2 = (T47f202(C));
							T16f26(((T47*)(C))->a14, t2);
						} else {
							t2 = (T47f202(C));
							T16f26(((T47*)(C))->a14, t2);
						}
					} else {
						t1 = ((a1)==((T4)(geint32(56))));
						if (t1) {
							t2 = (T47f202(C));
							T16f26(((T47*)(C))->a14, t2);
						} else {
							t2 = (T47f202(C));
							T16f26(((T47*)(C))->a14, t2);
						}
					}
				}
			} else {
				t1 = (T4f12(&a1, (T4)(geint32(61))));
				if (t1) {
					t1 = (T4f12(&a1, (T4)(geint32(59))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(58))));
						if (t1) {
							t3 = (T47f180(C));
							((T47*)(C))->a16 = ((T4)((((T47*)(C))->a16)+(t3)));
							t2 = (T47f202(C));
							T16f26(((T47*)(C))->a14, t2);
						} else {
							t3 = (T47f226(C));
							t1 = ((t3)==((T4)(geint32(6))));
							if (t1) {
								T47f309(C);
								T16f26(((T47*)(C))->a14, gems("$$", 2));
							} else {
								t1 = ((((T47*)(C))->a166)!=(EIF_VOID));
								if (t1) {
									T47f310(C, ((T47*)(C))->a166);
								} else {
									T16f26(((T47*)(C))->a14, gems("$$", 2));
								}
							}
						}
					} else {
						t1 = ((a1)==((T4)(geint32(60))));
						if (t1) {
							t1 = ((((T47*)(C))->a166)!=(EIF_VOID));
							if (t1) {
								t3 = (T47f226(C));
								t1 = ((t3)==((T4)(geint32(6))));
								if (t1) {
									t3 = (T47f180(C));
									t2 = (T47f181(C, (T4)(geint32(2)), t3));
									t3 = (T16f15(t2));
									t4 = ((T4)((((T47*)(C))->a224)-((T4)(geint32(1)))));
									T47f311(C, t3, t4, ((T47*)(C))->a166);
								} else {
									t3 = (T47f180(C));
									t2 = (T47f181(C, (T4)(geint32(2)), t3));
									t3 = (T16f15(t2));
									t2 = (((T69*)(((T47*)(C))->a166))->a1);
									t4 = (((T77*)(t2))->a1);
									T47f311(C, t3, t4, ((T47*)(C))->a166);
								}
							} else {
								t2 = (T47f202(C));
								T16f26(((T47*)(C))->a14, t2);
							}
						} else {
							t1 = ((((T47*)(C))->a166)!=(EIF_VOID));
							if (t1) {
								t3 = (T47f226(C));
								t1 = ((t3)==((T4)(geint32(6))));
								if (t1) {
									t3 = (T47f180(C));
									t2 = (T47f181(C, (T4)(geint32(3)), t3));
									t3 = (T16f15(t2));
									t3 = ((T4)(-(t3)));
									t4 = ((T4)((((T47*)(C))->a224)-((T4)(geint32(1)))));
									T47f311(C, t3, t4, ((T47*)(C))->a166);
								} else {
									t3 = (T47f180(C));
									t2 = (T47f181(C, (T4)(geint32(3)), t3));
									t3 = (T16f15(t2));
									t3 = ((T4)(-(t3)));
									t2 = (((T69*)(((T47*)(C))->a166))->a1);
									t4 = (((T77*)(t2))->a1);
									T47f311(C, t3, t4, ((T47*)(C))->a166);
								}
							} else {
								t2 = (T47f202(C));
								T16f26(((T47*)(C))->a14, t2);
							}
						}
					}
				} else {
					t1 = (T4f12(&a1, (T4)(geint32(63))));
					if (t1) {
						t1 = ((a1)==((T4)(geint32(62))));
						if (t1) {
							T16f28(((T47*)(C))->a14, (T1)('{'));
							((T47*)(C))->a227 = ((T4)((((T47*)(C))->a227)+((T4)(geint32(1)))));
						} else {
							t1 = ((((T47*)(C))->a227)==((T4)(geint32(0))));
							if (t1) {
								((T47*)(C))->a47 = ((T4)(geint32(270)));
								((T47*)(C))->a135 = (T47f184(C, ((T47*)(C))->a14));
								T16f27(((T47*)(C))->a14);
								T47f304(C, (T4)(geint32(1)));
							} else {
								T16f28(((T47*)(C))->a14, (T1)('}'));
								((T47*)(C))->a227 = ((T4)((((T47*)(C))->a227)-((T4)(geint32(1)))));
							}
						}
					} else {
						t1 = ((a1)==((T4)(geint32(64))));
						if (t1) {
							t5 = (T47f228(C, (T4)(geint32(1))));
							((T47*)(C))->a47 = ((T4)(t5));
						} else {
							((T47*)(C))->a47 = ((T4)(geint32(-1)));
							T47f278(C, gems("scanner jammed", 14));
						}
					}
				}
			}
		}
	}
}

/* PR_YACC_PARSER.text_item */
T1 T47f228(T0* C, T4 a1)
{
	T1 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T47*)(C))->a98)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((((T47*)(C))->a75)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		R = (((T15*)(((T47*)(C))->a98))->a2[t2]);
	} else {
		t2 = ((T4)((((T47*)(C))->a75)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		R = (T252f1(((T47*)(C))->a99, t2));
	}
	return R;
}

/* STRING.wipe_out */
void T16f27(T0* C)
{
	((T16*)(C))->a1 = T15c9((T4)(geint32(1)));
	((T16*)(C))->a2 = ((T4)(geint32(0)));
	((T16*)(C))->a11 = ((T4)(geint32(0)));
}

/* PR_YACC_PARSER.cloned_string */
T0* T47f184(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T16*)(a1))->a2);
	R = T16c25(t1);
	T16f26(R, a1);
	return R;
}

/* PR_YACC_PARSER.process_dollar_n */
void T47f311(T0* C, T4 a1, T4 a2, T0* a3)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T0* t2;
	l1 = (((T69*)(a3))->a1);
	t1 = (T4f12(&a1, (T4)(geint32(0))));
	if (t1) {
		if (((T47*)(C))->a10) {
			T47f320(C, a1);
		} else {
			T47f321(C, a1);
		}
	} else {
		t1 = (T4f1(&a1, a2));
		if (t1) {
			T47f321(C, a1);
		} else {
			t2 = (T77f2(l1, a1));
			l2 = ((((t2)->id==70)?((T70*)(t2))->a4:((T81*)(t2))->a9));
			if (((T47*)(C))->a10) {
				if ((l2)->id==96) {
					T96f24(l2, a1, a2, a3, ((T47*)(C))->a14);
				} else {
					T170f22(l2, a1, a2, a3, ((T47*)(C))->a14);
				}
			} else {
				if ((l2)->id==96) {
					T96f25(l2, a1, a2, a3, ((T47*)(C))->a14);
				} else {
					T170f23(l2, a1, a2, a3, ((T47*)(C))->a14);
				}
			}
		}
	}
}

/* PR_BASIC_TYPE.append_dollar_n_to_string */
void T170f23(T0* C, T4 a1, T4 a2, T0* a3, T0* a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l3 = (((T69*)(a3))->a1);
	l1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = (T4f1(&l1, a2));
	while (!(t1)) {
		t2 = (T77f2(l3, l1));
		t2 = ((((t2)->id==70)?((T70*)(t2))->a4:((T81*)(t2))->a9));
		t1 = ((t2)==(C));
		if (t1) {
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, a2));
	}
	t1 = ((l2)==((T4)(geint32(0))));
	if (t1) {
		T16f26(a4, gems("yyvs", 4));
		t2 = (T170f7(C));
		T63f2(t2, ((T170*)(C))->a1, a4);
		T16f26(a4, gems(".item (yyvsp", 12));
		t2 = (T170f7(C));
		T63f2(t2, ((T170*)(C))->a1, a4);
		T16f28(a4, (T1)(')'));
	} else {
		T16f26(a4, gems("yyvs", 4));
		t2 = (T170f7(C));
		T63f2(t2, ((T170*)(C))->a1, a4);
		T16f26(a4, gems(".item (yyvsp", 12));
		t2 = (T170f7(C));
		T63f2(t2, ((T170*)(C))->a1, a4);
		T16f26(a4, gems(" - ", 3));
		t2 = (T170f7(C));
		T63f2(t2, l2, a4);
		T16f28(a4, (T1)(')'));
	}
}

/* PR_BASIC_TYPE.integer_ */
T0* T170f7(T0* C)
{
	T0* R = 0;
	if (ge255os1336) {
		return ge255ov1336;
	} else {
		ge255os1336 = '\1';
	}
	R = T63c1();
	ge255ov1336 = R;
	return R;
}

/* PR_TYPE.append_dollar_n_to_string */
void T96f25(T0* C, T4 a1, T4 a2, T0* a3, T0* a4)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T0* t2;
	l3 = (((T69*)(a3))->a1);
	l1 = ((T4)((a1)+((T4)(geint32(1)))));
	t1 = (T4f1(&l1, a2));
	while (!(t1)) {
		t2 = (T77f2(l3, l1));
		t2 = ((((t2)->id==70)?((T70*)(t2))->a4:((T81*)(t2))->a9));
		t1 = ((t2)==(C));
		if (t1) {
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, a2));
	}
	t1 = ((l2)==((T4)(geint32(0))));
	if (t1) {
		T16f26(a4, gems("yyvs", 4));
		t2 = (T96f3(C));
		T63f2(t2, ((T96*)(C))->a2, a4);
		T16f26(a4, gems(".item (yyvsp", 12));
		t2 = (T96f3(C));
		T63f2(t2, ((T96*)(C))->a2, a4);
		T16f28(a4, (T1)(')'));
	} else {
		T16f26(a4, gems("yyvs", 4));
		t2 = (T96f3(C));
		T63f2(t2, ((T96*)(C))->a2, a4);
		T16f26(a4, gems(".item (yyvsp", 12));
		t2 = (T96f3(C));
		T63f2(t2, ((T96*)(C))->a2, a4);
		T16f26(a4, gems(" - ", 3));
		t2 = (T96f3(C));
		T63f2(t2, l2, a4);
		T16f28(a4, (T1)(')'));
	}
}

/* PR_TYPE.integer_ */
T0* T96f3(T0* C)
{
	T0* R = 0;
	if (ge255os1336) {
		return ge255ov1336;
	} else {
		ge255os1336 = '\1';
	}
	R = T63c1();
	ge255ov1336 = R;
	return R;
}

/* PR_BASIC_TYPE.old_append_dollar_n_to_string */
void T170f22(T0* C, T4 a1, T4 a2, T0* a3, T0* a4)
{
	T4 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T0* t2;
	t1 = (T16f4(((T170*)(C))->a2, gems("ANY", 3)));
	l2 = ((T2)(!(t1)));
	if (l2) {
		((T170*)(C))->a3 = (EIF_TRUE);
		T16f26(a4, gems("yytype", 6));
		t2 = (T170f7(C));
		T63f2(t2, ((T170*)(C))->a1, a4);
		T16f26(a4, gems(" (", 2));
	}
	l1 = ((T4)((a2)-(a1)));
	t1 = ((l1)==((T4)(geint32(0))));
	if (t1) {
		T16f26(a4, gems("yyvs.item (yyvsp)", 17));
	} else {
		T16f26(a4, gems("yyvs.item (yyvsp - ", 19));
		t2 = (T170f7(C));
		T63f2(t2, l1, a4);
		T16f28(a4, (T1)(')'));
	}
	if (l2) {
		T16f28(a4, (T1)(')'));
	}
}

/* PR_TYPE.old_append_dollar_n_to_string */
void T96f24(T0* C, T4 a1, T4 a2, T0* a3, T0* a4)
{
	T4 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T0* t2;
	t1 = (T16f4(((T96*)(C))->a1, gems("ANY", 3)));
	l2 = ((T2)(!(t1)));
	if (l2) {
		((T96*)(C))->a4 = (EIF_TRUE);
		T16f26(a4, gems("yytype", 6));
		t2 = (T96f3(C));
		T63f2(t2, ((T96*)(C))->a2, a4);
		T16f26(a4, gems(" (", 2));
	}
	l1 = ((T4)((a2)-(a1)));
	t1 = ((l1)==((T4)(geint32(0))));
	if (t1) {
		T16f26(a4, gems("yyvs.item (yyvsp)", 17));
	} else {
		T16f26(a4, gems("yyvs.item (yyvsp - ", 19));
		t2 = (T96f3(C));
		T63f2(t2, l1, a4);
		T16f28(a4, (T1)(')'));
	}
	if (l2) {
		T16f28(a4, (T1)(')'));
	}
}

/* PR_YACC_PARSER.report_invalid_dollar_n_error */
void T47f321(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T163c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_INVALID_DOLLAR_N_ERROR.make */
T0* T163c7(T0* a1, T4 a2, T4 a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T163));
	((T163*)(C))->id = 163;
	((T163*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T163*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T163*)(C))->a5, t1, (T4)(geint32(2)));
	t1 = (T4f11(&a3));
	T121f7(((T163*)(C))->a5, t1, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.report_dangerous_dollar_n_warning */
void T47f320(T0* C, T4 a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T162c7(t1, ((T47*)(C))->a16, a1);
	T25f9(((T47*)(C))->a13, l1);
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.make */
T0* T162c7(T0* a1, T4 a2, T4 a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T162));
	((T162*)(C))->id = 162;
	((T162*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T162*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T162*)(C))->a5, t1, (T4)(geint32(2)));
	t1 = (T4f11(&a3));
	T121f7(((T162*)(C))->a5, t1, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.process_dollar_dollar */
void T47f310(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (((T69*)(a1))->a2);
	l1 = (((T70*)(t1))->a4);
	if (((T47*)(C))->a10) {
		if ((l1)->id==96) {
			T96f11(l1, ((T47*)(C))->a14);
		} else {
			T170f9(l1, ((T47*)(C))->a14);
		}
	} else {
		if ((l1)->id==96) {
			T96f12(l1, ((T47*)(C))->a14);
		} else {
			T170f10(l1, ((T47*)(C))->a14);
		}
	}
}

/* PR_BASIC_TYPE.append_dollar_dollar_to_string */
void T170f10(T0* C, T0* a1)
{
	T0* t1;
	T16f26(a1, gems("yyval", 5));
	t1 = (T170f7(C));
	T63f2(t1, ((T170*)(C))->a1, a1);
}

/* PR_TYPE.append_dollar_dollar_to_string */
void T96f12(T0* C, T0* a1)
{
	T0* t1;
	T16f26(a1, gems("yyval", 5));
	t1 = (T96f3(C));
	T63f2(t1, ((T96*)(C))->a2, a1);
}

/* PR_BASIC_TYPE.old_append_dollar_dollar_to_string */
void T170f9(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	T16f26(a1, gems("yyval", 5));
	t1 = (T16f4(((T170*)(C))->a2, gems("ANY", 3)));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T170f7(C));
		T63f2(t2, ((T170*)(C))->a1, a1);
	}
}

/* PR_TYPE.old_append_dollar_dollar_to_string */
void T96f11(T0* C, T0* a1)
{
	T2 t1;
	T0* t2;
	T16f26(a1, gems("yyval", 5));
	t1 = (T16f4(((T96*)(C))->a1, gems("ANY", 3)));
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (T96f3(C));
		T63f2(t2, ((T96*)(C))->a2, a1);
	}
}

/* PR_YACC_PARSER.report_invalid_dollar_dollar_error */
void T47f309(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T154c7(t1, ((T47*)(C))->a16);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.make */
T0* T154c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T154));
	((T154*)(C))->id = 154;
	((T154*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(2)));
	T121f7(((T154*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T154*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* PR_YACC_PARSER.start_condition */
T4 T47f226(T0* C)
{
	T4 R = 0;
	T4 t1;
	t1 = ((T4)((((T47*)(C))->a93)-((T4)(geint32(1)))));
	R = ((T4)((t1)/((T4)(geint32(2)))));
	return R;
}

/* PR_YACC_PARSER.text_substring */
T0* T47f181(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a2)<(a1)));
	if (t1) {
		R = T16c25((T4)(geint32(0)));
	} else {
		t2 = ((T4)((((T47*)(C))->a75)+(a1)));
		t2 = ((T4)((t2)-((T4)(geint32(1)))));
		t3 = ((T4)((((T47*)(C))->a75)+(a2)));
		t3 = ((T4)((t3)-((T4)(geint32(1)))));
		R = (T252f2(((T47*)(C))->a99, t2, t3));
	}
	return R;
}

/* KL_CHARACTER_BUFFER.substring */
T0* T252f2(T0* C, T4 a1, T4 a2)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((T2)((a2)<(a1)));
	if (t1) {
		R = T16c25((T4)(geint32(0)));
	} else {
		t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a2)+((T4)(geint32(1)))));
			R = (T16f5(((T252*)(C))->a6, t2, t3));
		} else {
			R = (T16f5(((T252*)(C))->a6, a1, a2));
		}
	}
	return R;
}

/* PR_YACC_PARSER.more */
void T47f308(T0* C)
{
	((T47*)(C))->a88 = (EIF_TRUE);
}

/* PR_YACC_PARSER.report_invalid_string_token_error */
void T47f307(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T153c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_INVALID_STRING_TOKEN_ERROR.make */
T0* T153c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T153));
	((T153*)(C))->id = 153;
	((T153*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T153*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T153*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T153*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.text_count */
T4 T47f180(T0* C)
{
	T4 R = 0;
	R = ((T4)((((T47*)(C))->a21)-(((T47*)(C))->a75)));
	return R;
}

/* PR_YACC_PARSER.report_null_integer_error */
void T47f306(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T152c7(t1, ((T47*)(C))->a16);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_NULL_INTEGER_ERROR.make */
T0* T152c7(T0* a1, T4 a2)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T152));
	((T152*)(C))->id = 152;
	((T152*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(2)));
	T121f7(((T152*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T152*)(C))->a5, t1, (T4)(geint32(2)));
	return C;
}

/* STRING.to_integer */
T4 T16f15(T0* C)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	t1 = (T16f21(C));
	t2 = ((T4)(geint32(3)));
	T243f16(t1, C, t2);
	t1 = (T16f21(C));
	R = (T243f1(t1));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parsed_integer */
T4 T243f1(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	l1 = ((T4)(((T243*)(C))->a2));
	l1 = ((T4)((l1)*((T4)(geint32(10)))));
	t1 = ((((T243*)(C))->a3)==((T4)(geint32(1))));
	if (t1) {
		t2 = ((T4)(-(l1)));
		t3 = ((T4)(((T243*)(C))->a4));
		R = ((T4)((t2)-(t3)));
	} else {
		t2 = ((T4)(((T243*)(C))->a4));
		R = ((T4)((l1)+(t2)));
	}
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.parse_string_with_type */
void T243f16(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T1 t2;
	T243f21(C, a2);
	l1 = ((T4)(geint32(1)));
	l2 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l1, l2));
	if (!(t1)) {
		t1 = ((((T243*)(C))->a6)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		t1 = ((((T243*)(C))->a6)==((T4)(geint32(5))));
	}
	while (!(t1)) {
		t2 = (T16f14(a1, l1));
		T243f22(C, t2);
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f1(&l1, l2));
		if (!(t1)) {
			t1 = ((((T243*)(C))->a6)==((T4)(geint32(4))));
		}
		if (!(t1)) {
			t1 = ((((T243*)(C))->a6)==((T4)(geint32(5))));
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.parse_character */
void T243f22(T0* C, T1 a1)
{
	T11 l1 = 0;
	T11 l2 = 0;
	T2 t1;
	T4 t2;
	T0* t3;
	T11 t4;
	t1 = ((((T243*)(C))->a6)!=((T4)(geint32(4))));
	if (t1) {
		t1 = ((((T243*)(C))->a6)!=((T4)(geint32(5))));
	}
	if (t1) {
		t2 = (T4)(geint32(0));
		l1 = (T4f21(&t2));
		t2 = (T4)(geint32(0));
		l2 = (T4f21(&t2));
		switch (((T243*)(C))->a6) {
		case (T4)(T4)(geint32(0)):
			t1 = (T1f19(&a1));
			if (t1) {
				((T243*)(C))->a6 = ((T4)(geint32(2)));
				((T243*)(C))->a2 = ((T11)(genat64(0)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T243*)(C))->a4 = (T4f21(&t2));
			} else {
				t1 = ((a1)==((T1)('-')));
				if (!(t1)) {
					t1 = ((a1)==((T1)('+')));
				}
				if (t1) {
					((T243*)(C))->a6 = ((T4)(geint32(1)));
					t1 = ((a1)==((T1)('-')));
					if (t1) {
						((T243*)(C))->a3 = ((T4)(geint32(1)));
					} else {
						((T243*)(C))->a3 = ((T4)(geint32(0)));
					}
				} else {
					if (((T243*)(C))->a9) {
						t1 = (T16f24(((T243*)(C))->a7, a1));
					} else {
						t1 = EIF_FALSE;
					}
					if (t1) {
					} else {
						((T243*)(C))->a6 = ((T4)(geint32(4)));
					}
				}
			}
			break;
		case (T4)(T4)(geint32(1)):
			t1 = (T1f19(&a1));
			if (t1) {
				((T243*)(C))->a2 = ((T11)(genat64(0)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T243*)(C))->a4 = (T4f21(&t2));
				t1 = ((((T243*)(C))->a11)!=((T4)(geint32(0))));
				if (t1) {
					t3 = (T243f13(C));
					((T243*)(C))->a12 = (T271f1(t3, ((T243*)(C))->a2, ((T243*)(C))->a4, ((T243*)(C))->a11, ((T243*)(C))->a3));
					if (((T243*)(C))->a12) {
						((T243*)(C))->a2 = (l1);
						((T243*)(C))->a4 = (l2);
						((T243*)(C))->a6 = ((T4)(geint32(5)));
					}
				}
				((T243*)(C))->a6 = ((T4)(geint32(2)));
			} else {
				((T243*)(C))->a6 = ((T4)(geint32(4)));
			}
			break;
		case (T4)(T4)(geint32(2)):
			t1 = (T1f19(&a1));
			if (t1) {
				l1 = (((T243*)(C))->a2);
				l2 = (((T243*)(C))->a4);
				t4 = ((T11)((((T243*)(C))->a2)*((T11)(genat64(10)))));
				((T243*)(C))->a2 = ((T11)((t4)+(((T243*)(C))->a4)));
				t2 = ((T4)(a1));
				t2 = ((T4)((t2)-((T4)(geint32(48)))));
				((T243*)(C))->a4 = (T4f21(&t2));
				t1 = ((((T243*)(C))->a11)!=((T4)(geint32(0))));
				if (t1) {
					t3 = (T243f13(C));
					((T243*)(C))->a12 = (T271f1(t3, ((T243*)(C))->a2, ((T243*)(C))->a4, ((T243*)(C))->a11, ((T243*)(C))->a3));
					t1 = (T243f14(C));
					if (t1) {
						((T243*)(C))->a6 = ((T4)(geint32(5)));
						((T243*)(C))->a2 = (l1);
						((T243*)(C))->a4 = (l2);
					}
				}
			} else {
				if (((T243*)(C))->a10) {
					t1 = (T16f24(((T243*)(C))->a8, a1));
				} else {
					t1 = EIF_FALSE;
				}
				if (t1) {
					((T243*)(C))->a6 = ((T4)(geint32(3)));
				} else {
					((T243*)(C))->a6 = ((T4)(geint32(4)));
				}
			}
			break;
		case (T4)(T4)(geint32(3)):
			if (((T243*)(C))->a10) {
				t1 = (T16f24(((T243*)(C))->a8, a1));
			} else {
				t1 = EIF_FALSE;
			}
			if (t1) {
			} else {
				((T243*)(C))->a6 = ((T4)(geint32(4)));
			}
			break;
		default:
			break;
		}
	}
}

/* STRING_TO_INTEGER_CONVERTOR.overflowed */
T2 T243f14(T0* C)
{
	T2 R = 0;
	if (((T243*)(C))->a12) {
		R = ((((T243*)(C))->a3)==((T4)(geint32(0))));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.will_overflow */
T2 T271f1(T0* C, T11 a1, T11 a2, T4 a3, T4 a4)
{
	T2 R = 0;
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	T11 t3;
	t1 = ((a3)==((T4)(geint32(0))));
	if (t1) {
		R = (EIF_FALSE);
	} else {
		t1 = ((a3)==((T4)(geint32(1))));
		if (!(t1)) {
			t1 = ((a3)==((T4)(geint32(2))));
		}
		if (!(t1)) {
			t1 = ((a3)==((T4)(geint32(3))));
		}
		if (!(t1)) {
			t1 = ((a3)==((T4)(geint32(4))));
		}
		if (t1) {
			t2 = ((T4)((a4)*((T4)(geint32(4)))));
			l1 = ((T4)((t2)+(a3)));
			t3 = (T284f4(((T271*)(C))->a7, l1));
			t1 = (T11f4(&a1, t3));
			if (!(t1)) {
				t3 = (T284f4(((T271*)(C))->a7, l1));
				t1 = ((a1)==(t3));
				if (t1) {
					t3 = (T284f4(((T271*)(C))->a8, l1));
					R = (T11f4(&a2, t3));
				} else {
					R = EIF_FALSE;
				}
			} else {
				R = EIF_TRUE;
			}
		} else {
			l1 = ((T4)((a3)-((T4)(geint32(10)))));
			t1 = ((a4)==((T4)(geint32(1))));
			if (t1) {
				t1 = (T11f4(&a1, (T11)(genat64(0))));
				if (!(t1)) {
					R = (T11f4(&a2, (T11)(genat64(0))));
				} else {
					R = EIF_TRUE;
				}
			} else {
				t3 = (T284f4(((T271*)(C))->a10, l1));
				t1 = (T11f4(&a1, t3));
				if (!(t1)) {
					t3 = (T284f4(((T271*)(C))->a10, l1));
					t1 = ((a1)==(t3));
					if (t1) {
						t3 = (T284f4(((T271*)(C))->a11, l1));
						R = (T11f4(&a2, t3));
					} else {
						R = EIF_FALSE;
					}
				} else {
					R = EIF_TRUE;
				}
			}
		}
	}
	return R;
}

/* NATURAL_64.infix ">" */
T2 T11f4(T11* C, T11 a1)
{
	T2 R = 0;
	R = ((T2)((a1)<(*C)));
	return R;
}

/* ARRAY [NATURAL_64].item */
T11 T284f4(T0* C, T4 a1)
{
	T11 R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T284*)(C))->a2)));
	R = (((T283*)(((T284*)(C))->a1))->a2[t1]);
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.overflow_checker */
unsigned char ge524os5567 = '\0';
T0* ge524ov5567;
T0* T243f13(T0* C)
{
	T0* R = 0;
	if (ge524os5567) {
		return ge524ov5567;
	} else {
		ge524os5567 = '\1';
	}
	R = T271c13();
	ge524ov5567 = R;
	return R;
}

/* INTEGER_OVERFLOW_CHECKER.make */
T0* T271c13()
{
	T4 t1;
	T5 t2;
	T11 t3;
	T6 t4;
	T7 t5;
	T8 t6;
	T9 t7;
	T10 t8;
	T0* C;
	C = (T0*)gealloc(sizeof(T271));
	((T271*)(C))->id = 271;
	t1 = (T4)(geint32(4));
	t1 = ((T4)((t1)*((T4)(geint32(2)))));
	((T271*)(C))->a7 = T284c5((T4)(geint32(1)), t1);
	t1 = (T4)(geint32(4));
	t1 = ((T4)((t1)*((T4)(geint32(2)))));
	((T271*)(C))->a8 = T284c5((T4)(geint32(1)), t1);
	t2 = ((T5)(geint8(127)));
	t2 = ((T5)((t2)/((T5)(geint8(10)))));
	t3 = (T5f3(&t2));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(1)));
	t2 = ((T5)(geint8(127)));
	t2 = ((T5)((t2)%((T5)(geint8(10)))));
	t3 = (T5f3(&t2));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(1)));
	t4 = ((T6)(geint16(32767)));
	t4 = ((T6)((t4)/((T6)(geint16(10)))));
	t3 = (T6f3(&t4));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(2)));
	t4 = ((T6)(geint16(32767)));
	t4 = ((T6)((t4)%((T6)(geint16(10)))));
	t3 = (T6f3(&t4));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(2)));
	t1 = ((T4)(geint32(2147483647)));
	t1 = ((T4)((t1)/((T4)(geint32(10)))));
	t3 = (T4f21(&t1));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(3)));
	t1 = ((T4)(geint32(2147483647)));
	t1 = ((T4)((t1)%((T4)(geint32(10)))));
	t3 = (T4f21(&t1));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(3)));
	t5 = ((T7)(geint64(9223372036854775807)));
	t5 = ((T7)((t5)/((T7)(geint64(10)))));
	t3 = (T7f3(&t5));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(4)));
	t5 = ((T7)(geint64(9223372036854775807)));
	t5 = ((T7)((t5)%((T7)(geint64(10)))));
	t3 = (T7f3(&t5));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(4)));
	t2 = ((T5)(geint8(-128)));
	t2 = ((T5)((t2)/((T5)(geint8(10)))));
	t2 = ((T5)(-(t2)));
	t3 = (T5f3(&t2));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(5)));
	t2 = ((T5)(geint8(-128)));
	t2 = ((T5)((t2)%((T5)(geint8(10)))));
	t2 = ((T5)(-(t2)));
	t3 = (T5f3(&t2));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(5)));
	t4 = ((T6)(geint16(-32768)));
	t4 = ((T6)((t4)/((T6)(geint16(10)))));
	t4 = ((T6)(-(t4)));
	t3 = (T6f3(&t4));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(6)));
	t4 = ((T6)(geint16(-32768)));
	t4 = ((T6)((t4)%((T6)(geint16(10)))));
	t4 = ((T6)(-(t4)));
	t3 = (T6f3(&t4));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(6)));
	t1 = ((T4)(geint32(-2147483647)-1));
	t1 = ((T4)((t1)/((T4)(geint32(10)))));
	t1 = ((T4)(-(t1)));
	t3 = (T4f21(&t1));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(7)));
	t1 = ((T4)(geint32(-2147483647)-1));
	t1 = ((T4)((t1)%((T4)(geint32(10)))));
	t1 = ((T4)(-(t1)));
	t3 = (T4f21(&t1));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(7)));
	t5 = ((T7)(geint64(-9223372036854775807)-1));
	t5 = ((T7)((t5)/((T7)(geint64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	T284f6(((T271*)(C))->a7, t3, (T4)(geint32(8)));
	t5 = ((T7)(geint64(-9223372036854775807)-1));
	t5 = ((T7)((t5)%((T7)(geint64(10)))));
	t5 = ((T7)(-(t5)));
	t3 = (T7f3(&t5));
	T284f6(((T271*)(C))->a8, t3, (T4)(geint32(8)));
	((T271*)(C))->a10 = T284c5((T4)(geint32(1)), (T4)(geint32(4)));
	((T271*)(C))->a11 = T284c5((T4)(geint32(1)), (T4)(geint32(4)));
	t6 = ((T8)(genat8(255)));
	t6 = ((T8)((t6)/((T8)(genat8(10)))));
	t3 = (T8f9(&t6));
	T284f6(((T271*)(C))->a10, t3, (T4)(geint32(1)));
	t6 = ((T8)(genat8(255)));
	t6 = ((T8)((t6)%((T8)(genat8(10)))));
	t3 = (T8f9(&t6));
	T284f6(((T271*)(C))->a11, t3, (T4)(geint32(1)));
	t7 = ((T9)(genat16(65535)));
	t7 = ((T9)((t7)/((T9)(genat16(10)))));
	t3 = (T9f3(&t7));
	T284f6(((T271*)(C))->a10, t3, (T4)(geint32(2)));
	t7 = ((T9)(genat16(65535)));
	t7 = ((T9)((t7)%((T9)(genat16(10)))));
	t3 = (T9f3(&t7));
	T284f6(((T271*)(C))->a11, t3, (T4)(geint32(2)));
	t8 = ((T10)(genat32(4294967295)));
	t8 = ((T10)((t8)/((T10)(genat32(10)))));
	t3 = (T10f3(&t8));
	T284f6(((T271*)(C))->a10, t3, (T4)(geint32(3)));
	t8 = ((T10)(genat32(4294967295)));
	t8 = ((T10)((t8)%((T10)(genat32(10)))));
	t3 = (T10f3(&t8));
	T284f6(((T271*)(C))->a11, t3, (T4)(geint32(3)));
	t3 = ((T11)(genat64(18446744073709551615)));
	t3 = ((T11)((t3)/((T11)(genat64(10)))));
	t3 = (T11f7(&t3));
	T284f6(((T271*)(C))->a10, t3, (T4)(geint32(4)));
	t3 = ((T11)(genat64(18446744073709551615)));
	t3 = ((T11)((t3)%((T11)(genat64(10)))));
	t3 = (T11f7(&t3));
	T284f6(((T271*)(C))->a11, t3, (T4)(geint32(4)));
	return C;
}

/* NATURAL_64.to_natural_64 */
T11 T11f7(T11* C)
{
	T11 R = 0;
	R = (*C);
	return R;
}

/* NATURAL_32.to_natural_64 */
T11 T10f3(T10* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* NATURAL_16.to_natural_64 */
T11 T9f3(T9* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* NATURAL_8.to_natural_64 */
T11 T8f9(T8* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_64.to_natural_64 */
T11 T7f3(T7* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* INTEGER_16.to_natural_64 */
T11 T6f3(T6* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* ARRAY [NATURAL_64].put */
void T284f6(T0* C, T11 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-(((T284*)(C))->a2)));
	((T283*)(((T284*)(C))->a1))->a2[t1] = (a1);
}

/* INTEGER_8.to_natural_64 */
T11 T5f3(T5* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* ARRAY [NATURAL_64].make */
T0* T284c5(T4 a1, T4 a2)
{
	T2 t1;
	T4 t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T284));
	((T284*)(C))->id = 284;
	((T284*)(C))->a2 = (a1);
	((T284*)(C))->a3 = (a2);
	t1 = (T4f12(&a1, a2));
	if (t1) {
		t2 = ((T4)((a2)-(a1)));
		t2 = ((T4)((t2)+((T4)(geint32(1)))));
		T284f7(C, t2);
	} else {
		T284f7(C, (T4)(geint32(0)));
	}
	return C;
}

/* ARRAY [NATURAL_64].make_area */
void T284f7(T0* C, T4 a1)
{
	((T284*)(C))->a1 = T283c2(a1);
}

/* SPECIAL [NATURAL_64].make */
T0* T283c2(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T283)+a1*sizeof(T11));
	((T283*)(C))->a1 = a1;
	((T283*)(C))->id = 283;
	return C;
}

/* STRING.has */
T2 T16f24(T0* C, T1 a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T1 t2;
	l2 = (((T16*)(C))->a2);
	t1 = (T4f1(&l2, (T4)(geint32(0))));
	if (t1) {
		l3 = (((T16*)(C))->a1);
		t1 = ((l1)==(l2));
		if (!(t1)) {
			t2 = (((T15*)(l3))->a2[l1]);
			t1 = ((t2)==(a1));
		}
		while (!(t1)) {
			l1 = ((T4)((l1)+((T4)(geint32(1)))));
			t1 = ((l1)==(l2));
			if (!(t1)) {
				t2 = (((T15*)(l3))->a2[l1]);
				t1 = ((t2)==(a1));
			}
		}
		R = ((T2)((l1)<(l2)));
	}
	return R;
}

/* CHARACTER.is_digit */
T2 T1f19(T1* C)
{
	T2 R = 0;
	T1 t1;
	T4 t2;
	T8 t3;
	t1 = (*C);
	t2 = ((T4)(t1));
	t3 = (T1f9(C, t2));
	t3 = (T8f1(&t3, (T5)(geint8(0x04))));
	R = (T8f2(&t3, (T8)(genat8(0))));
	return R;
}

/* INTEGER.to_natural_64 */
T11 T4f21(T4* C)
{
	T11 R = 0;
	R = ((T11)(*C));
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.reset */
void T243f21(T0* C, T4 a1)
{
	((T243*)(C))->a6 = ((T4)(geint32(0)));
	((T243*)(C))->a2 = ((T11)(genat64(0)));
	((T243*)(C))->a4 = ((T11)(genat64(0)));
	((T243*)(C))->a3 = ((T4)(geint32(0)));
	((T243*)(C))->a11 = (a1);
	((T243*)(C))->a12 = (EIF_FALSE);
}

/* STRING.ctoi_convertor */
unsigned char ge6os1167 = '\0';
T0* ge6ov1167;
T0* T16f21(T0* C)
{
	T0* R = 0;
	if (ge6os1167) {
		return ge6ov1167;
	} else {
		ge6os1167 = '\1';
	}
	R = T243c15();
	T243f17(R, gems(" ", 1));
	T243f18(R, gems(" ", 1));
	T243f19(R, EIF_TRUE);
	T243f20(R, EIF_TRUE);
	ge6ov1167 = R;
	return R;
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators_acceptable */
void T243f20(T0* C, T2 a1)
{
	((T243*)(C))->a10 = (a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators_acceptable */
void T243f19(T0* C, T2 a1)
{
	((T243*)(C))->a9 = (a1);
}

/* STRING_TO_INTEGER_CONVERTOR.set_trailing_separators */
void T243f18(T0* C, T0* a1)
{
	((T243*)(C))->a8 = T16c38(a1);
}

/* STRING.make_from_string */
T0* T16c38(T0* a1)
{
	T2 t1;
	T0* t2;
	T0* C;
	C = (T0*)gealloc(sizeof(T16));
	((T16*)(C))->id = 16;
	t1 = ((C)!=(a1));
	if (t1) {
		t2 = (((T16*)(a1))->a1);
		((T16*)(C))->a1 = (T15f3(t2));
		((T16*)(C))->a2 = (((T16*)(a1))->a2);
		((T16*)(C))->a11 = ((T4)(geint32(0)));
	}
	return C;
}

/* STRING_TO_INTEGER_CONVERTOR.set_leading_separators */
void T243f17(T0* C, T0* a1)
{
	((T243*)(C))->a7 = T16c38(a1);
}

/* STRING_TO_INTEGER_CONVERTOR.make */
T0* T243c15()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T243));
	((T243*)(C))->id = 243;
	T243f21(C, (T4)(geint32(0)));
	T243f17(C, gems(" ", 1));
	T243f18(C, gems(" ", 1));
	return C;
}

/* PR_YACC_PARSER.text */
T0* T47f202(T0* C)
{
	T0* R = 0;
	T2 t1;
	T4 t2;
	t1 = ((T2)((((T47*)(C))->a75)<(((T47*)(C))->a21)));
	if (t1) {
		t2 = ((T4)((((T47*)(C))->a21)-((T4)(geint32(1)))));
		R = (T252f2(((T47*)(C))->a99, ((T47*)(C))->a75, t2));
	} else {
		R = T16c25((T4)(geint32(0)));
	}
	return R;
}

/* PR_YACC_PARSER.set_start_condition */
void T47f304(T0* C, T4 a1)
{
	T4 t1;
	t1 = (T4)(geint32(2));
	t1 = ((T4)((t1)*(a1)));
	((T47*)(C))->a93 = ((T4)((t1)+((T4)(geint32(1)))));
}

/* PR_YACC_PARSER.yy_execute_eof_action */
void T47f280(T0* C, T4 a1)
{
	T4 t1;
	switch (a1) {
	case (T4)(T4)(geint32(3)):
		T47f303(C, gems("\045}", 2));
		((T47*)(C))->a47 = ((T4)(geint32(268)));
		t1 = (T47f180(C));
		((T47*)(C))->a135 = (T47f181(C, (T4)(geint32(1)), t1));
		T47f304(C, (T4)(geint32(0)));
		break;
	case (T4)(T4)(geint32(4)):
	case (T4)(T4)(geint32(6)):
		T47f303(C, gems("}", 1));
		((T47*)(C))->a47 = ((T4)(geint32(270)));
		((T47*)(C))->a135 = (T47f184(C, ((T47*)(C))->a14));
		T16f27(((T47*)(C))->a14);
		T47f304(C, (T4)(geint32(1)));
		break;
	default:
		T47f305(C);
		break;
	}
}

/* PR_YACC_PARSER.terminate */
void T47f305(T0* C)
{
	((T47*)(C))->a47 = ((T4)(geint32(0)));
}

/* PR_YACC_PARSER.report_missing_characters_error */
void T47f303(T0* C, T0* a1)
{
	T0* l1 = 0;
	T0* t1;
	t1 = (T47f229(C));
	l1 = T151c7(t1, ((T47*)(C))->a16, a1);
	T25f7(((T47*)(C))->a13, l1);
	((T47*)(C))->a1 = (EIF_FALSE);
}

/* PR_MISSING_CHARACTERS_ERROR.make */
T0* T151c7(T0* a1, T4 a2, T0* a3)
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T151));
	((T151*)(C))->id = 151;
	((T151*)(C))->a5 = T121c6((T4)(geint32(1)), (T4)(geint32(3)));
	T121f7(((T151*)(C))->a5, a1, (T4)(geint32(1)));
	t1 = (T4f11(&a2));
	T121f7(((T151*)(C))->a5, t1, (T4)(geint32(2)));
	T121f7(((T151*)(C))->a5, a3, (T4)(geint32(3)));
	return C;
}

/* PR_YACC_PARSER.wrap */
T2 T47f123(T0* C)
{
	T2 R = 0;
	R = (EIF_TRUE);
	return R;
}

/* PR_YACC_PARSER.yy_refill_input_buffer */
void T47f279(T0* C)
{
	T4 l1 = 0;
	T0* t1;
	T4 t2;
	if ((((T47*)(C))->a20)->id==127) {
		T127f17(((T47*)(C))->a20, ((T47*)(C))->a75);
	} else {
		T128f13(((T47*)(C))->a20, ((T47*)(C))->a75);
	}
	if ((((T47*)(C))->a20)->id==127) {
		T127f19(((T47*)(C))->a20);
	} else {
		T128f15(((T47*)(C))->a20);
	}
	t1 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a1:((T128*)(((T47*)(C))->a20))->a1));
	T47f277(C, t1);
	l1 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a2:((T128*)(((T47*)(C))->a20))->a2));
	t2 = ((T4)((((T47*)(C))->a21)-(((T47*)(C))->a75)));
	((T47*)(C))->a21 = ((T4)((t2)+(l1)));
	((T47*)(C))->a75 = (l1);
}

/* PR_YACC_PARSER.yy_set_content */
void T47f277(T0* C, T0* a1)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	T0* t3;
	((T47*)(C))->a99 = (a1);
	((T47*)(C))->a98 = (((T252*)(a1))->a3);
	if (EIF_FALSE) {
		t1 = (T252f4(a1));
		l1 = ((T4)((t1)+((T4)(geint32(1)))));
		t1 = (((T98*)(((T47*)(C))->a95))->a1);
		t2 = ((T2)((t1)<(l1)));
		if (t2) {
			t3 = (T47f18(C));
			((T47*)(C))->a95 = (T129f2(t3, ((T47*)(C))->a95, l1));
		}
	}
}

/* KL_CHARACTER_BUFFER.count */
T4 T252f4(T0* C)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = (((T16*)(((T252*)(C))->a6))->a2);
		R = ((T4)((t2)-((T4)(geint32(1)))));
	} else {
		R = (((T16*)(((T252*)(C))->a6))->a2);
	}
	return R;
}

/* YY_BUFFER.fill */
void T128f15(T0* C)
{
	((T128*)(C))->a8 = (EIF_FALSE);
}

/* YY_FILE_BUFFER.fill */
void T127f19(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	if (((T127*)(C))->a8) {
		t1 = ((T2)(!(((T127*)(C))->a11)));
	} else {
		t1 = EIF_FALSE;
	}
	if (t1) {
		T127f21(C);
		l3 = (((T127*)(C))->a1);
		l1 = ((T4)((((T127*)(C))->a12)-(((T127*)(C))->a7)));
		if (((T127*)(C))->a13) {
			if ((((T127*)(C))->a9)->id==48) {
				T48f43(((T127*)(C))->a9);
			} else {
				T51f22(((T127*)(C))->a9);
			}
			t1 = ((((((T127*)(C))->a9)->id==48)?T48f24(((T127*)(C))->a9):((T51*)(((T127*)(C))->a9))->a1));
			t1 = ((T2)(!(t1)));
			if (t1) {
				((T127*)(C))->a7 = ((T4)((((T127*)(C))->a7)+((T4)(geint32(1)))));
				t2 = ((((((T127*)(C))->a9)->id==48)?((T48*)(((T127*)(C))->a9))->a25:((T51*)(((T127*)(C))->a9))->a8));
				T252f9(l3, t2, ((T127*)(C))->a7);
				((T127*)(C))->a8 = (EIF_TRUE);
			} else {
				((T127*)(C))->a8 = (EIF_FALSE);
				((T127*)(C))->a11 = (EIF_TRUE);
			}
		} else {
			t3 = ((T4)((((T127*)(C))->a7)+((T4)(geint32(1)))));
			l2 = (T252f5(l3, ((T127*)(C))->a9, t3, l1));
			t1 = ((T2)((l2)<(l1)));
			if (t1) {
				((T127*)(C))->a11 = ((((((T127*)(C))->a9)->id==48)?T48f24(((T127*)(C))->a9):((T51*)(((T127*)(C))->a9))->a1));
			}
			t1 = (T4f1(&l2, (T4)(geint32(0))));
			if (t1) {
				((T127*)(C))->a8 = (EIF_TRUE);
			} else {
				((T127*)(C))->a8 = (EIF_FALSE);
			}
			((T127*)(C))->a7 = ((T4)((((T127*)(C))->a7)+(l2)));
		}
		t3 = ((T4)((((T127*)(C))->a7)+((T4)(geint32(1)))));
		T252f9(l3, (T1)('\000'), t3);
		t3 = ((T4)((((T127*)(C))->a7)+((T4)(geint32(2)))));
		T252f9(l3, (T1)('\000'), t3);
	} else {
		((T127*)(C))->a8 = (EIF_FALSE);
	}
}

/* KL_CHARACTER_BUFFER.fill_from_stream */
T4 T252f5(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T2 t1;
	T4 t2;
	t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((a2)+((T4)(geint32(1)))));
		R = ((((a1)->id==48)?T48f29(a1, ((T252*)(C))->a6, t2, a3):T51f13(a1, ((T252*)(C))->a6, t2, a3)));
	} else {
		R = ((((a1)->id==48)?T48f29(a1, ((T252*)(C))->a6, a2, a3):T51f13(a1, ((T252*)(C))->a6, a2, a3)));
	}
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T4 T51f13(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T0* l5 = 0;
	T2 t1;
	T1 t2;
	T0* t3;
	T4 t4;
	l2 = (a2);
	t1 = ((l1)==(a3));
	if (!(t1)) {
		t1 = ((((T51*)(C))->a9)==(EIF_VOID));
	}
	while (!(t1)) {
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = ((T1)gevoid(((T51*)(C))->a9));
		T16f39(a1, t2, l2);
		((T51*)(C))->a9 = ((T0*)gevoid(((T51*)(C))->a9));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t1 = ((l1)==(a3));
		if (!(t1)) {
			t1 = ((((T51*)(C))->a9)==(EIF_VOID));
		}
	}
	t1 = ((T2)((l1)<(a3)));
	if (t1) {
		t1 = (T51f10(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (T51f14(C));
			t1 = (T68f2(t3, a1, ge385ov4265));
			if (t1) {
				t4 = ((T4)((a3)-(l1)));
				t4 = (T51f16(C, a1, l2, t4));
				R = ((T4)((l1)+(t4)));
			} else {
				l4 = ((T4)((a3)-(l1)));
				l5 = T16c25(l4);
				T16f30(l5, l4);
				l4 = (T51f16(C, l5, (T4)(geint32(1)), l4));
				l3 = ((T4)(geint32(1)));
				t1 = (T4f1(&l3, l4));
				while (!(t1)) {
					t2 = (T16f14(l5, l3));
					T16f39(a1, t2, l2);
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
					l3 = ((T4)((l3)+((T4)(geint32(1)))));
					t1 = (T4f1(&l3, l4));
				}
				R = ((T4)((l1)+(l4)));
			}
		} else {
			R = (l1);
		}
		((T51*)(C))->a1 = (T51f10(C));
	} else {
		R = (l1);
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T4 T51f16(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	T14 t3;
	t1 = (((T16*)(a1))->a1);
	t2 = ((T4)((a2)-((T4)(geint32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T51f17(C, ((T51*)(C))->a2, t3, a3));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T4 T51f17(T0* C, T14 a1, T14 a2, T4 a3)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* SPECIAL [CHARACTER].item_address */
T14 T15f5(T0* C, T4 a1)
{
	T14 R = 0;
	T256 t1;
	T4 t2;
	t1.id = 256;
	t1.a1 = (T14)(((T15*)(C))->a2);
	R = (T256f2(&t1));
	t2 = (sizeof(T1));
	t2 = ((T4)((a1)*(t2)));
	R = ((T14)(((char*)(R))+(t2)));
	return R;
}

/* TYPED_POINTER [SPECIAL [CHARACTER]].to_pointer */
T14 T256f2(T256* C)
{
	T14 R = 0;
	R = ((*C).a1);
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T51f14(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* KL_STDIN_FILE.old_end_of_file */
T2 T51f10(T0* C)
{
	T2 R = 0;
	R = (T51f12(C, ((T51*)(C))->a2));
	return R;
}

/* KL_STDIN_FILE.console_eof */
T2 T51f12(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )console_eof((FILE *)a1);
	return R;
}

/* STRING.put */
void T16f39(T0* C, T1 a1, T4 a2)
{
	T4 t1;
	t1 = ((T4)((a2)-((T4)(geint32(1)))));
	((T15*)(((T16*)(C))->a1))->a2[t1] = (a1);
	((T16*)(C))->a11 = ((T4)(geint32(0)));
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T4 T48f29(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T4 l1 = 0;
	T0* l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T4 l5 = 0;
	T2 t1;
	T1 t2;
	T0* t3;
	T4 t4;
	T0* t5;
	l1 = (a2);
	t1 = ((l5)==(a3));
	if (!(t1)) {
		t1 = ((((T48*)(C))->a11)==(EIF_VOID));
	}
	while (!(t1)) {
		l5 = ((T4)((l5)+((T4)(geint32(1)))));
		t2 = ((T1)gevoid(((T48*)(C))->a11));
		T16f39(a1, t2, l1);
		((T48*)(C))->a11 = ((T0*)gevoid(((T48*)(C))->a11));
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = ((l5)==(a3));
		if (!(t1)) {
			t1 = ((((T48*)(C))->a11)==(EIF_VOID));
		}
	}
	t1 = ((T2)((l5)<(a3)));
	if (t1) {
		t1 = (T48f26(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (T48f30(C));
			t1 = (T68f2(t3, a1, ge372ov3979));
			if (t1) {
				t4 = ((T4)((a3)-(l5)));
				t4 = (T48f32(C, a1, l1, t4));
				l5 = ((T4)((l5)+(t4)));
			} else {
				t3 = (T48f30(C));
				t5 = (T48f33(C));
				t1 = (T68f2(t3, a1, t5));
				if (t1) {
					t4 = ((T4)((a3)-(l5)));
					t4 = (T48f32(C, a1, l1, t4));
					l5 = ((T4)((l5)+(t4)));
				} else {
					l4 = ((T4)((a3)-(l5)));
					l2 = T16c25(l4);
					T16f30(l2, l4);
					l4 = (T48f32(C, l2, (T4)(geint32(1)), l4));
					l3 = ((T4)(geint32(1)));
					t1 = (T4f1(&l3, l4));
					while (!(t1)) {
						t2 = (T16f14(l2, l3));
						T16f39(a1, t2, l1);
						l1 = ((T4)((l1)+((T4)(geint32(1)))));
						l3 = ((T4)((l3)+((T4)(geint32(1)))));
						t1 = (T4f1(&l3, l4));
					}
					l5 = ((T4)((l5)+(l4)));
				}
			}
		}
		((T48*)(C))->a12 = (T48f26(C));
	}
	R = (l5);
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge372os3980 = '\0';
T0* ge372ov3980;
T0* T48f33(T0* C)
{
	T0* R = 0;
	if (ge372os3980) {
		return ge372ov3980;
	} else {
		ge372os3980 = '\1';
	}
	R = T252c8((T4)(geint32(0)));
	ge372ov3980 = R;
	return R;
}

/* KL_CHARACTER_BUFFER.make */
T0* T252c8(T4 a1)
{
	T0* t1;
	T2 t2;
	T4 t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T252));
	((T252*)(C))->id = 252;
	t1 = (T252f7(C));
	t2 = (T272f1(t1));
	t2 = ((T2)(!(t2)));
	if (t2) {
		t3 = ((T4)((a1)+((T4)(geint32(1)))));
		((T252*)(C))->a6 = T16c25(t3);
		t3 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f30(((T252*)(C))->a6, t3);
		((T252*)(C))->a3 = (((T16*)(((T252*)(C))->a6))->a1);
	} else {
		((T252*)(C))->a6 = T16c25(a1);
		T16f30(((T252*)(C))->a6, a1);
	}
	return C;
}

/* KL_OPERATING_SYSTEM.is_dotnet */
unsigned char ge378os2363 = '\0';
T2 ge378ov2363;
T2 T272f1(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	if (ge378os2363) {
		return ge378ov2363;
	} else {
		ge378os2363 = '\1';
	}
	l1 = T285c2();
	R = (EIF_FALSE);
	ge378ov2363 = R;
	return R;
}

/* PLATFORM.default_create */
T0* T285c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T285));
	((T285*)(C))->id = 285;
	return C;
}

/* KL_CHARACTER_BUFFER.operating_system */
unsigned char ge308os1496 = '\0';
T0* ge308ov1496;
T0* T252f7(T0* C)
{
	T0* R = 0;
	if (ge308os1496) {
		return ge308ov1496;
	} else {
		ge308os1496 = '\1';
	}
	R = T272c2();
	ge308ov1496 = R;
	return R;
}

/* KL_OPERATING_SYSTEM.default_create */
T0* T272c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T272));
	((T272*)(C))->id = 272;
	return C;
}

/* KL_TEXT_INPUT_FILE.old_read_to_string */
T4 T48f32(T0* C, T0* a1, T4 a2, T4 a3)
{
	T4 R = 0;
	T0* t1;
	T4 t2;
	T14 t3;
	t1 = (((T16*)(a1))->a1);
	t2 = ((T4)((a2)-((T4)(geint32(1)))));
	t3 = (T15f5(t1, t2));
	R = (T48f34(C, ((T48*)(C))->a17, t3, a3));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_gss */
T4 T48f34(T0* C, T14 a1, T14 a2, T4 a3)
{
	T4 R = 0;
	R = (T4)( EIF_INTEGER )file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T48f30(T0* C)
{
	T0* R = 0;
	if (ge250os1337) {
		return ge250ov1337;
	} else {
		ge250os1337 = '\1';
	}
	R = T68c3();
	ge250ov1337 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.old_end_of_file */
T2 T48f26(T0* C)
{
	T2 R = 0;
	R = (T48f28(C, ((T48*)(C))->a17));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_feof */
T2 T48f28(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_feof((FILE *)a1);
	return R;
}

/* KL_CHARACTER_BUFFER.put */
void T252f9(T0* C, T1 a1, T4 a2)
{
	T2 t1;
	t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		((T15*)(((T252*)(C))->a3))->a2[a2] = (a1);
	} else {
		T16f39(((T252*)(C))->a6, a1, a2);
	}
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T2 T48f24(T0* C)
{
	T2 R = 0;
	R = (((T48*)(C))->a12);
	return R;
}

/* KL_STDIN_FILE.read_character */
void T51f22(T0* C)
{
	T2 t1;
	t1 = ((((T51*)(C))->a9)!=(EIF_VOID));
	if (t1) {
		((T51*)(C))->a8 = ((T1)gevoid(((T51*)(C))->a9));
		((T51*)(C))->a9 = ((T0*)gevoid(((T51*)(C))->a9));
	} else {
		t1 = (T51f10(C));
		if (t1) {
			((T51*)(C))->a1 = (EIF_TRUE);
		} else {
			T51f23(C);
			((T51*)(C))->a1 = (T51f10(C));
		}
	}
}

/* KL_STDIN_FILE.old_read_character */
void T51f23(T0* C)
{
	((T51*)(C))->a8 = (T51f11(C, ((T51*)(C))->a2));
}

/* KL_STDIN_FILE.console_readchar */
T1 T51f11(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)( EIF_CHARACTER )console_readchar((FILE *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.read_character */
void T48f43(T0* C)
{
	T2 t1;
	t1 = ((((T48*)(C))->a11)!=(EIF_VOID));
	if (t1) {
		((T48*)(C))->a25 = ((T1)gevoid(((T48*)(C))->a11));
		((T48*)(C))->a11 = ((T0*)gevoid(((T48*)(C))->a11));
	} else {
		t1 = (T48f26(C));
		if (t1) {
			((T48*)(C))->a12 = (EIF_TRUE);
		} else {
			T48f44(C);
			((T48*)(C))->a12 = (T48f26(C));
		}
	}
}

/* KL_TEXT_INPUT_FILE.old_read_character */
void T48f44(T0* C)
{
	((T48*)(C))->a25 = (T48f27(C, ((T48*)(C))->a17));
}

/* KL_TEXT_INPUT_FILE.file_gc */
T1 T48f27(T0* C, T14 a1)
{
	T1 R = 0;
	R = (T1)( EIF_CHARACTER )file_gc((FILE *)a1);
	return R;
}

/* YY_FILE_BUFFER.compact_left */
void T127f21(T0* C)
{
	T4 l1 = 0;
	T4 t1;
	T2 t2;
	t1 = ((T4)((((T127*)(C))->a7)-(((T127*)(C))->a2)));
	l1 = ((T4)((t1)+((T4)(geint32(1)))));
	t2 = (T4f4(&l1, ((T127*)(C))->a12));
	if (t2) {
		T127f23(C);
	}
	t2 = ((((T127*)(C))->a2)!=((T4)(geint32(1))));
	if (t2) {
		t1 = ((T4)((l1)+((T4)(geint32(2)))));
		T252f10(((T127*)(C))->a1, ((T127*)(C))->a2, (T4)(geint32(1)), t1);
		((T127*)(C))->a2 = ((T4)(geint32(1)));
		((T127*)(C))->a7 = (l1);
	}
}

/* KL_CHARACTER_BUFFER.move_left */
void T252f10(T0* C, T4 a1, T4 a2, T4 a3)
{
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	t1 = (T4f1(&a3, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a1)+((T4)(geint32(1)))));
			t3 = ((T4)((a1)+(a3)));
			t4 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f40(((T252*)(C))->a6, ((T252*)(C))->a6, t2, t3, t4);
		} else {
			t2 = ((T4)((a1)+(a3)));
			t2 = ((T4)((t2)-((T4)(geint32(1)))));
			T16f40(((T252*)(C))->a6, ((T252*)(C))->a6, a1, t2, a2);
		}
	}
}

/* STRING.subcopy */
void T16f40(T0* C, T0* a1, T4 a2, T4 a3, T4 a4)
{
	T0* l1 = 0;
	T0* l2 = 0;
	T2 t1;
	T4 t2;
	T4 t3;
	T4 t4;
	l1 = (((T16*)(a1))->a1);
	l2 = (((T16*)(C))->a1);
	t1 = (T4f4(&a3, a2));
	if (t1) {
		t1 = ((l2)!=(l1));
		if (t1) {
			t2 = ((T4)((a2)-((T4)(geint32(1)))));
			t3 = ((T4)((a4)-((T4)(geint32(1)))));
			t4 = ((T4)((a3)-(a2)));
			t4 = ((T4)((t4)+((T4)(geint32(1)))));
			T15f8(l2, l1, t2, t3, t4);
		} else {
			t2 = ((T4)((a2)-((T4)(geint32(1)))));
			t3 = ((T4)((a4)-((T4)(geint32(1)))));
			t4 = ((T4)((a3)-(a2)));
			t4 = ((T4)((t4)+((T4)(geint32(1)))));
			T15f14(l2, t2, t3, t4);
		}
		((T16*)(C))->a11 = ((T4)(geint32(0)));
	}
}

/* YY_FILE_BUFFER.resize */
void T127f23(T0* C)
{
	T2 t1;
	T4 t2;
	T4 t3;
	t1 = ((((T127*)(C))->a12)==((T4)(geint32(0))));
	if (t1) {
		((T127*)(C))->a12 = (T127f10(C));
	} else {
		((T127*)(C))->a12 = ((T4)((((T127*)(C))->a12)*((T4)(geint32(2)))));
	}
	t2 = ((T4)((((T127*)(C))->a12)+((T4)(geint32(2)))));
	t3 = (T252f4(((T127*)(C))->a1));
	t1 = (T4f1(&t2, t3));
	if (t1) {
		t2 = ((T4)((((T127*)(C))->a12)+((T4)(geint32(2)))));
		T252f11(((T127*)(C))->a1, t2);
	}
}

/* KL_CHARACTER_BUFFER.resize */
void T252f11(T0* C, T4 a1)
{
	T2 t1;
	T4 t2;
	t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f36(((T252*)(C))->a6, t2);
		t2 = ((T4)((a1)+((T4)(geint32(1)))));
		T16f30(((T252*)(C))->a6, t2);
		((T252*)(C))->a3 = (((T16*)(((T252*)(C))->a6))->a1);
	} else {
		T16f36(((T252*)(C))->a6, a1);
		T16f30(((T252*)(C))->a6, a1);
	}
}

/* YY_FILE_BUFFER.default_capacity */
unsigned char ge132os5017 = '\0';
T4 ge132ov5017;
T4 T127f10(T0* C)
{
	T4 R = 0;
	if (ge132os5017) {
		return ge132ov5017;
	} else {
		ge132os5017 = '\1';
	}
	R = ((T4)(geint32(16384)));
	ge132ov5017 = R;
	return R;
}

/* YY_BUFFER.set_index */
void T128f13(T0* C, T4 a1)
{
	((T128*)(C))->a2 = (a1);
}

/* YY_FILE_BUFFER.set_index */
void T127f17(T0* C, T4 a1)
{
	((T127*)(C))->a2 = (a1);
}

/* PR_YACC_PARSER.yy_null_trans_state */
T4 T47f122(T0* C, T4 a1)
{
	T4 R = 0;
	T4 l1 = 0;
	T2 l2 = 0;
	T2 t1;
	T4 t2;
	t1 = EIF_FALSE;
	t1 = ((T2)(!(t1)));
	if (t1) {
		t2 = (((T98*)(((T47*)(C))->a100))->a2[a1]);
		t1 = ((t2)!=((T4)(geint32(0))));
		if (t1) {
			((T47*)(C))->a101 = (a1);
			((T47*)(C))->a102 = (((T47*)(C))->a21);
		}
	}
	R = (a1);
	l1 = ((T4)(geint32(1)));
	t2 = (((T98*)(((T47*)(C))->a104))->a2[R]);
	t2 = ((T4)((t2)+(l1)));
	t2 = (((T98*)(((T47*)(C))->a103))->a2[t2]);
	t1 = ((t2)==(R));
	while (!(t1)) {
		R = (((T98*)(((T47*)(C))->a105))->a2[R]);
		t1 = ((((T47*)(C))->a106)!=(EIF_VOID));
		if (t1) {
			t1 = (T4f4(&R, (T4)(geint32(202))));
		}
		if (t1) {
			l1 = (((T98*)(((T47*)(C))->a106))->a2[l1]);
		}
		t2 = (((T98*)(((T47*)(C))->a104))->a2[R]);
		t2 = ((T4)((t2)+(l1)));
		t2 = (((T98*)(((T47*)(C))->a103))->a2[t2]);
		t1 = ((t2)==(R));
	}
	t2 = (((T98*)(((T47*)(C))->a104))->a2[R]);
	t2 = ((T4)((t2)+(l1)));
	R = (((T98*)(((T47*)(C))->a108))->a2[t2]);
	if (EIF_FALSE) {
		((T98*)(((T47*)(C))->a95))->a2[((T47*)(C))->a96] = (R);
		((T47*)(C))->a96 = ((T4)((((T47*)(C))->a96)+((T4)(geint32(1)))));
	}
	l2 = ((R)==((T4)(geint32(201))));
	if (l2) {
		R = ((T4)(geint32(0)));
	}
	return R;
}

/* PR_YACC_PARSER.yy_previous_state */
T4 T47f121(T0* C)
{
	T4 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T2 t1;
	T1 t2;
	T4 t3;
	t1 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a6:((T128*)(((T47*)(C))->a20))->a6));
	if (t1) {
		R = ((T4)((((T47*)(C))->a93)+((T4)(geint32(1)))));
	} else {
		R = (((T47*)(C))->a93);
	}
	if (EIF_FALSE) {
		((T98*)(((T47*)(C))->a95))->a2[(T4)(geint32(0))] = (R);
		((T47*)(C))->a96 = ((T4)(geint32(1)));
	}
	l1 = ((T4)((((T47*)(C))->a75)+(((T47*)(C))->a89)));
	l2 = (((T47*)(C))->a21);
	t1 = (T4f4(&l1, l2));
	while (!(t1)) {
		t1 = ((((T47*)(C))->a98)!=(EIF_VOID));
		if (t1) {
			t2 = (((T15*)(((T47*)(C))->a98))->a2[l1]);
			l3 = ((T4)(t2));
		} else {
			t2 = (T252f1(((T47*)(C))->a99, l1));
			l3 = ((T4)(t2));
		}
		t1 = ((l3)==((T4)(geint32(0))));
		if (t1) {
			l3 = ((T4)(geint32(1)));
		} else {
			t1 = ((((T47*)(C))->a97)!=(EIF_VOID));
			if (t1) {
				l3 = (((T98*)(((T47*)(C))->a97))->a2[l3]);
			}
		}
		t1 = EIF_FALSE;
		t1 = ((T2)(!(t1)));
		if (t1) {
			t3 = (((T98*)(((T47*)(C))->a100))->a2[R]);
			t1 = ((t3)!=((T4)(geint32(0))));
			if (t1) {
				((T47*)(C))->a101 = (R);
				((T47*)(C))->a102 = (l1);
			}
		}
		t3 = (((T98*)(((T47*)(C))->a104))->a2[R]);
		t3 = ((T4)((t3)+(l3)));
		t3 = (((T98*)(((T47*)(C))->a103))->a2[t3]);
		t1 = ((t3)==(R));
		while (!(t1)) {
			R = (((T98*)(((T47*)(C))->a105))->a2[R]);
			t1 = ((((T47*)(C))->a106)!=(EIF_VOID));
			if (t1) {
				t1 = (T4f4(&R, (T4)(geint32(202))));
			}
			if (t1) {
				l3 = (((T98*)(((T47*)(C))->a106))->a2[l3]);
			}
			t3 = (((T98*)(((T47*)(C))->a104))->a2[R]);
			t3 = ((T4)((t3)+(l3)));
			t3 = (((T98*)(((T47*)(C))->a103))->a2[t3]);
			t1 = ((t3)==(R));
		}
		t3 = (((T98*)(((T47*)(C))->a104))->a2[R]);
		t3 = ((T4)((t3)+(l3)));
		R = (((T98*)(((T47*)(C))->a108))->a2[t3]);
		if (EIF_FALSE) {
			((T98*)(((T47*)(C))->a95))->a2[((T47*)(C))->a96] = (R);
			((T47*)(C))->a96 = ((T4)((((T47*)(C))->a96)+((T4)(geint32(1)))));
		}
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t1 = (T4f4(&l1, l2));
	}
	return R;
}

/* PR_YACC_PARSER.fatal_error */
void T47f278(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T47f178(C));
	t1 = (T32f3(t1));
	T122f11(t1, a1);
	t1 = (T47f178(C));
	t1 = (T32f3(t1));
	T122f12(t1, (T1)('\n'));
}

/* KL_STDERR_FILE.put_character */
void T122f12(T0* C, T1 a1)
{
	T122f16(C, a1);
}

/* KL_STDERR_FILE.old_put_character */
void T122f16(T0* C, T1 a1)
{
	T122f20(C, ((T122*)(C))->a2, a1);
}

/* KL_STDERR_FILE.console_pc */
void T122f20(T0* C, T14 a1, T1 a2)
{
	console_pc((FILE *)a1,( EIF_CHARACTER)a2);
}

/* KL_STANDARD_FILES.error */
unsigned char ge290os2354 = '\0';
T0* ge290ov2354;
T0* T32f3(T0* C)
{
	T0* R = 0;
	if (ge290os2354) {
		return ge290ov2354;
	} else {
		ge290os2354 = '\1';
	}
	R = T122c9();
	ge290ov2354 = R;
	return R;
}

/* KL_STDERR_FILE.make */
T0* T122c9()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T122));
	((T122*)(C))->id = 122;
	T122f13(C, gems("stderr", 6));
	return C;
}

/* KL_STDERR_FILE.make_open_stderr */
void T122f13(T0* C, T0* a1)
{
	T122f17(C, a1);
	((T122*)(C))->a2 = (T122f3(C, (T4)(geint32(2))));
	T122f18(C);
}

/* KL_STDERR_FILE.set_write_mode */
void T122f18(T0* C)
{
	((T122*)(C))->a6 = ((T4)(geint32(2)));
}

/* KL_STDERR_FILE.console_def */
T14 T122f3(T0* C, T4 a1)
{
	T14 R = 0;
	R = (T14)console_def(a1);
	return R;
}

/* KL_STDERR_FILE.old_make */
void T122f17(T0* C, T0* a1)
{
	((T122*)(C))->a5 = (a1);
	((T122*)(C))->a6 = ((T4)(geint32(0)));
}

/* PR_YACC_PARSER.std */
T0* T47f178(T0* C)
{
	T0* R = 0;
	if (ge288os1312) {
		return ge288ov1312;
	} else {
		ge288os1312 = '\1';
	}
	R = T32c4();
	ge288ov1312 = R;
	return R;
}

/* KL_CHARACTER_BUFFER.item */
T1 T252f1(T0* C, T4 a1)
{
	T1 R = 0;
	T2 t1;
	t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
	if (t1) {
		R = (((T15*)(((T252*)(C))->a3))->a2[a1]);
	} else {
		R = (T16f14(((T252*)(C))->a6, a1));
	}
	return R;
}

/* PR_YACC_PARSER.special_integer_ */
T0* T47f18(T0* C)
{
	T0* R = 0;
	if (ge256os3449) {
		return ge256ov3449;
	} else {
		ge256os3449 = '\1';
	}
	R = T129c4();
	ge256ov3449 = R;
	return R;
}

/* PR_YACC_PARSER.yy_init_value_stacks */
void T47f266(T0* C)
{
	((T47*)(C))->a76 = ((T4)(geint32(-1)));
	((T47*)(C))->a77 = ((T4)(geint32(-1)));
	((T47*)(C))->a78 = ((T4)(geint32(-1)));
	((T47*)(C))->a79 = ((T4)(geint32(-1)));
	((T47*)(C))->a80 = ((T4)(geint32(-1)));
	((T47*)(C))->a81 = ((T4)(geint32(-1)));
}

/* PR_YACC_PARSER.set_input_buffer */
void T47f260(T0* C, T0* a1)
{
	T2 t1;
	t1 = ((a1)!=(((T47*)(C))->a20));
	if (t1) {
		if ((((T47*)(C))->a20)->id==127) {
			T127f17(((T47*)(C))->a20, ((T47*)(C))->a21);
		} else {
			T128f13(((T47*)(C))->a20, ((T47*)(C))->a21);
		}
		if ((((T47*)(C))->a20)->id==127) {
			T127f18(((T47*)(C))->a20, ((T47*)(C))->a22, ((T47*)(C))->a23, ((T47*)(C))->a24);
		} else {
			T128f14(((T47*)(C))->a20, ((T47*)(C))->a22, ((T47*)(C))->a23, ((T47*)(C))->a24);
		}
		((T47*)(C))->a20 = (a1);
		T47f265(C);
	}
}

/* PR_YACC_PARSER.yy_load_input_buffer */
void T47f265(T0* C)
{
	T0* t1;
	t1 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a1:((T128*)(((T47*)(C))->a20))->a1));
	T47f277(C, t1);
	((T47*)(C))->a21 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a2:((T128*)(((T47*)(C))->a20))->a2));
	((T47*)(C))->a75 = (((T47*)(C))->a21);
	((T47*)(C))->a23 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a3:((T128*)(((T47*)(C))->a20))->a3));
	((T47*)(C))->a24 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a4:((T128*)(((T47*)(C))->a20))->a4));
	((T47*)(C))->a22 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a5:((T128*)(((T47*)(C))->a20))->a5));
}

/* YY_BUFFER.set_position */
void T128f14(T0* C, T4 a1, T4 a2, T4 a3)
{
	((T128*)(C))->a5 = (a1);
	((T128*)(C))->a3 = (a2);
	((T128*)(C))->a4 = (a3);
}

/* YY_FILE_BUFFER.set_position */
void T127f18(T0* C, T4 a1, T4 a2, T4 a3)
{
	((T127*)(C))->a5 = (a1);
	((T127*)(C))->a3 = (a2);
	((T127*)(C))->a4 = (a3);
}

/* PR_YACC_PARSER.new_file_buffer */
T0* T47f11(T0* C, T0* a1)
{
	T0* R = 0;
	R = T127c16(a1);
	return R;
}

/* YY_FILE_BUFFER.make */
T0* T127c16(T0* a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T127));
	((T127*)(C))->id = 127;
	t1 = (T127f10(C));
	T127f20(C, a1, t1);
	return C;
}

/* YY_FILE_BUFFER.make_with_size */
void T127f20(T0* C, T0* a1, T4 a2)
{
	T4 t1;
	((T127*)(C))->a12 = (a2);
	t1 = ((T4)((a2)+((T4)(geint32(2)))));
	((T127*)(C))->a1 = (T127f15(C, t1));
	T127f22(C, a1);
}

/* YY_FILE_BUFFER.set_file */
void T127f22(T0* C, T0* a1)
{
	((T127*)(C))->a11 = ((((a1)->id==48)?T48f24(a1):((T51*)(a1))->a1));
	T127f24(C);
	((T127*)(C))->a9 = (a1);
}

/* YY_FILE_BUFFER.flush */
void T127f24(T0* C)
{
	T252f9(((T127*)(C))->a1, (T1)('\000'), (T4)(geint32(1)));
	T252f9(((T127*)(C))->a1, (T1)('\000'), (T4)(geint32(2)));
	((T127*)(C))->a7 = ((T4)(geint32(0)));
	((T127*)(C))->a2 = ((T4)(geint32(1)));
	((T127*)(C))->a3 = ((T4)(geint32(1)));
	((T127*)(C))->a4 = ((T4)(geint32(1)));
	((T127*)(C))->a5 = ((T4)(geint32(1)));
	((T127*)(C))->a6 = (EIF_TRUE);
	((T127*)(C))->a8 = (EIF_TRUE);
}

/* YY_FILE_BUFFER.new_default_buffer */
T0* T127f15(T0* C, T4 a1)
{
	T0* R = 0;
	R = T252c8(a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.is_open_read */
T2 T48f1(T0* C)
{
	T2 R = 0;
	R = (T48f2(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_open_read */
T2 T48f2(T0* C)
{
	T2 R = 0;
	T2 t1;
	t1 = ((((T48*)(C))->a3)==((T4)(geint32(1))));
	if (!(t1)) {
		t1 = ((((T48*)(C))->a3)==((T4)(geint32(4))));
	}
	if (!(t1)) {
		R = ((((T48*)(C))->a3)==((T4)(geint32(5))));
	} else {
		R = EIF_TRUE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T48f36(T0* C)
{
	T2 l1 = 0;
	T2 t1;
	t1 = ((T2)(!(l1)));
	if (t1) {
		t1 = ((((T48*)(C))->a10)!=(ge361ov1477));
		if (t1) {
			((T48*)(C))->a11 = (EIF_VOID);
			((T48*)(C))->a12 = (EIF_FALSE);
			t1 = (T48f13(C));
			if (t1) {
				t1 = (T48f14(C));
			}
			if (t1) {
				T48f39(C);
			}
		}
	} else {
		t1 = (T48f15(C));
		t1 = ((T2)(!(t1)));
		if (t1) {
			T48f37(C);
		}
	}
}

/* KL_TEXT_INPUT_FILE.is_closed */
T2 T48f15(T0* C)
{
	T2 R = 0;
	R = (T48f23(C));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_closed */
T2 T48f23(T0* C)
{
	T2 R = 0;
	R = ((((T48*)(C))->a3)==((T4)(geint32(0))));
	return R;
}

/* KL_TEXT_INPUT_FILE.old_open_read */
void T48f39(T0* C)
{
	T14 t1;
	T2 t2;
	T48f39p1(C);
	t1 = (T48f18(C));
	t2 = ((((T48*)(C))->a17)==(t1));
	if (t2) {
		((T48*)(C))->a3 = ((T4)(geint32(0)));
		((T48*)(C))->a19 = (EIF_FALSE);
	}
}

/* KL_TEXT_INPUT_FILE.default_pointer */
T14 T48f18(T0* C)
{
	T14 R = 0;
	return R;
}

/* KL_TEXT_INPUT_FILE.open_read */
void T48f39p1(T0* C)
{
	T0* l1 = 0;
	T119 t1;
	T14 t2;
	l1 = (T16f3(((T48*)(C))->a10));
	t1.id = 119;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T119f2(&t1));
	((T48*)(C))->a17 = (T48f20(C, t2, (T4)(geint32(0))));
	((T48*)(C))->a3 = ((T4)(geint32(1)));
}

/* KL_TEXT_INPUT_FILE.file_open */
T14 T48f20(T0* C, T14 a1, T4 a2)
{
	T14 R = 0;
	R = (T14)( EIF_POINTER )file_open((char *)a1,( int)a2);
	return R;
}

/* KL_TEXT_INPUT_FILE.old_is_readable */
T2 T48f14(T0* C)
{
	T2 R = 0;
	T0* t1;
	T48f42(C);
	t1 = (T48f22(C));
	R = (T178f1(t1));
	return R;
}

/* UNIX_FILE_INFO.is_readable */
T2 T178f1(T0* C)
{
	T2 R = 0;
	T256 t1;
	T14 t2;
	t1.id = 256;
	t1.a1 = ((((T178*)(C))->a5?(T14)(getypes[(((T178*)(C))->a5)->id].is_special?(T14)((T15*)(((T178*)(C))->a5))->a2:(T14)((T178*)(C))->a5):(T14)0));
	t2 = (T256f2(&t1));
	R = (T178f2(C, t2, (T4)(geint32(0))));
	return R;
}

/* UNIX_FILE_INFO.file_eaccess */
T2 T178f2(T0* C, T14 a1, T4 a2)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_eaccess((struct stat *)a1,( int)a2);
	return R;
}

/* KL_TEXT_INPUT_FILE.buffered_file_info */
unsigned char ge504os1689 = '\0';
T0* ge504ov1689;
T0* T48f22(T0* C)
{
	T0* R = 0;
	if (ge504os1689) {
		return ge504ov1689;
	} else {
		ge504os1689 = '\1';
	}
	R = T178c6();
	ge504ov1689 = R;
	return R;
}

/* UNIX_FILE_INFO.make */
T0* T178c6()
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T178));
	((T178*)(C))->id = 178;
	t1 = (T178f3(C));
	T178f8(C, t1);
	return C;
}

/* UNIX_FILE_INFO.make_buffered_file_info */
void T178f8(T0* C, T4 a1)
{
	((T178*)(C))->a5 = T15c9(a1);
}

/* UNIX_FILE_INFO.stat_size */
T4 T178f3(T0* C)
{
	T4 R = 0;
	R = (T4)stat_size();
	return R;
}

/* KL_TEXT_INPUT_FILE.set_buffer */
void T48f42(T0* C)
{
	T0* t1;
	t1 = (T48f22(C));
	T178f7(t1, ((T48*)(C))->a10);
}

/* UNIX_FILE_INFO.update */
void T178f7(T0* C, T0* a1)
{
	T0* l1 = 0;
	T119 t1;
	T14 t2;
	T256 t3;
	T14 t4;
	l1 = (T16f3(a1));
	t1.id = 119;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T119f2(&t1));
	t3.id = 256;
	t3.a1 = ((((T178*)(C))->a5?(T14)(getypes[(((T178*)(C))->a5)->id].is_special?(T14)((T15*)(((T178*)(C))->a5))->a2:(T14)((T178*)(C))->a5):(T14)0));
	t4 = (T256f2(&t3));
	T178f9(C, t2, t4);
	((T178*)(C))->a4 = (a1);
}

/* UNIX_FILE_INFO.file_stat */
void T178f9(T0* C, T14 a1, T14 a2)
{
	file_stat((char *)a1,( struct stat *)a2);
}

/* KL_TEXT_INPUT_FILE.old_exists */
T2 T48f13(T0* C)
{
	T2 R = 0;
	T0* l1 = 0;
	T119 t1;
	T14 t2;
	l1 = (T16f3(((T48*)(C))->a10));
	t1.id = 119;
	t1.a1 = ((l1?(T14)(getypes[l1->id].is_special?(T14)((T15*)(l1))->a2:(T14)l1):(T14)0));
	t2 = (T119f2(&t1));
	R = (T48f21(C, t2));
	return R;
}

/* KL_TEXT_INPUT_FILE.file_exists */
T2 T48f21(T0* C, T14 a1)
{
	T2 R = 0;
	R = (T2)( EIF_BOOLEAN )file_exists((char *)a1);
	return R;
}

/* KL_TEXT_INPUT_FILE.make */
T0* T48c35(T0* a1)
{
	T4 t1;
	T2 t2;
	T0* t3;
	T0* C;
	C = (T0*)gealloc(sizeof(T48));
	((T48*)(C))->id = 48;
	((T48*)(C))->a7 = (a1);
	t1 = (((T16*)(a1))->a2);
	t2 = (T4f1(&t1, (T4)(geint32(0))));
	if (t2) {
		t3 = (T48f8(C));
		t3 = (T116f1(t3, a1));
		T48f38(C, t3);
	} else {
		T48f38(C, ge361ov1477);
	}
	return C;
}

/* KL_TEXT_INPUT_FILE.old_make */
void T48f38(T0* C, T0* a1)
{
	((T48*)(C))->a10 = (a1);
	((T48*)(C))->a3 = ((T4)(geint32(0)));
}

/* KL_TEXT_INPUT_FILE.string_ */
T0* T48f8(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_YACC_PARSER.set_old_typing */
void T47f256(T0* C, T2 a1)
{
	((T47*)(C))->a10 = (a1);
}

/* PR_YACC_PARSER.make */
T0* T47c255(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T47));
	((T47*)(C))->id = 47;
	T47f258(C, a1);
	T47f259(C);
	((T47*)(C))->a3 = T123c2();
	((T47*)(C))->a2 = T26c19();
	((T47*)(C))->a4 = T124c34((T4)(geint32(100)));
	((T47*)(C))->a6 = T125c34((T4)(geint32(300)));
	((T47*)(C))->a8 = T126c34((T4)(geint32(300)));
	return C;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make */
T0* T126c34(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T126));
	((T126*)(C))->id = 126;
	((T126*)(C))->a7 = T39c2();
	T126f37(C, a1, EIF_VOID, ((T126*)(C))->a7);
	return C;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make_with_equality_testers */
void T126f37(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T126*)(C))->a21 = (a2);
	((T126*)(C))->a7 = (a3);
	T126f44(C, a1);
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make_sparse_container */
void T126f44(T0* C, T4 a1)
{
	T4 t1;
	((T126*)(C))->a9 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T126f49(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T126f50(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T126f51(C, t1);
	((T126*)(C))->a18 = (T126f23(C, a1));
	t1 = ((T4)((((T126*)(C))->a18)+((T4)(geint32(1)))));
	T126f52(C, t1);
	((T126*)(C))->a14 = ((T4)(geint32(0)));
	((T126*)(C))->a13 = ((T4)(geint32(0)));
	((T126*)(C))->a3 = ((T4)(geint32(0)));
	T126f38(C);
	((T126*)(C))->a28 = (T126f29(C));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].new_cursor */
T0* T126f29(T0* C)
{
	T0* R = 0;
	R = T232c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [PR_TYPE, STRING].make */
T0* T232c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T232));
	((T232*)(C))->id = 232;
	((T232*)(C))->a1 = (a1);
	((T232*)(C))->a2 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make_slots */
void T126f52(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T126f30(C));
	((T126*)(C))->a26 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make_clashes */
void T126f51(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T126f30(C));
	((T126*)(C))->a25 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make_keys */
void T126f50(T0* C, T4 a1)
{
	((T126*)(C))->a32 = T133c3();
	((T126*)(C))->a27 = (T133f1(((T126*)(C))->a32, a1));
}

/* DS_HASH_TABLE [PR_TYPE, STRING].make_items */
void T126f49(T0* C, T4 a1)
{
	((T126*)(C))->a31 = T136c3();
	((T126*)(C))->a6 = (T136f1(((T126*)(C))->a31, a1));
}

/* KL_EQUALITY_TESTER [STRING].default_create */
T0* T39c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T39));
	((T39*)(C))->id = 39;
	return C;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make */
T0* T125c34(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T125));
	((T125*)(C))->id = 125;
	((T125*)(C))->a8 = T39c2();
	T125f37(C, a1, EIF_VOID, ((T125*)(C))->a8);
	return C;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_with_equality_testers */
void T125f37(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T125*)(C))->a21 = (a2);
	((T125*)(C))->a8 = (a3);
	T125f44(C, a1);
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_sparse_container */
void T125f44(T0* C, T4 a1)
{
	T4 t1;
	((T125*)(C))->a9 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T125f49(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T125f50(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T125f51(C, t1);
	((T125*)(C))->a18 = (T125f23(C, a1));
	t1 = ((T4)((((T125*)(C))->a18)+((T4)(geint32(1)))));
	T125f52(C, t1);
	((T125*)(C))->a14 = ((T4)(geint32(0)));
	((T125*)(C))->a13 = ((T4)(geint32(0)));
	((T125*)(C))->a4 = ((T4)(geint32(0)));
	T125f38(C);
	((T125*)(C))->a28 = (T125f29(C));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].new_cursor */
T0* T125f29(T0* C)
{
	T0* R = 0;
	R = T231c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [PR_VARIABLE, STRING].make */
T0* T231c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T231));
	((T231*)(C))->id = 231;
	((T231*)(C))->a1 = (a1);
	((T231*)(C))->a2 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_slots */
void T125f52(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T125f30(C));
	((T125*)(C))->a26 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_clashes */
void T125f51(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T125f30(C));
	((T125*)(C))->a25 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_keys */
void T125f50(T0* C, T4 a1)
{
	((T125*)(C))->a32 = T133c3();
	((T125*)(C))->a27 = (T133f1(((T125*)(C))->a32, a1));
}

/* DS_HASH_TABLE [PR_VARIABLE, STRING].make_items */
void T125f49(T0* C, T4 a1)
{
	((T125*)(C))->a31 = T209c3();
	((T125*)(C))->a7 = (T209f1(((T125*)(C))->a31, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make */
T0* T124c34(T4 a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T124));
	((T124*)(C))->id = 124;
	((T124*)(C))->a7 = T39c2();
	T124f37(C, a1, EIF_VOID, ((T124*)(C))->a7);
	return C;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make_with_equality_testers */
void T124f37(T0* C, T4 a1, T0* a2, T0* a3)
{
	((T124*)(C))->a21 = (a2);
	((T124*)(C))->a7 = (a3);
	T124f44(C, a1);
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make_sparse_container */
void T124f44(T0* C, T4 a1)
{
	T4 t1;
	((T124*)(C))->a9 = (a1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T124f49(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T124f50(C, t1);
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	T124f51(C, t1);
	((T124*)(C))->a18 = (T124f23(C, a1));
	t1 = ((T4)((((T124*)(C))->a18)+((T4)(geint32(1)))));
	T124f52(C, t1);
	((T124*)(C))->a14 = ((T4)(geint32(0)));
	((T124*)(C))->a13 = ((T4)(geint32(0)));
	((T124*)(C))->a3 = ((T4)(geint32(0)));
	T124f38(C);
	((T124*)(C))->a28 = (T124f29(C));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].new_cursor */
T0* T124f29(T0* C)
{
	T0* R = 0;
	R = T230c3(C);
	return R;
}

/* DS_HASH_TABLE_CURSOR [PR_TOKEN, STRING].make */
T0* T230c3(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T230));
	((T230*)(C))->id = 230;
	((T230*)(C))->a1 = (a1);
	((T230*)(C))->a2 = ((T4)(geint32(-1)));
	return C;
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make_slots */
void T124f52(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T124f30(C));
	((T124*)(C))->a26 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make_clashes */
void T124f51(T0* C, T4 a1)
{
	T0* t1;
	t1 = (T124f30(C));
	((T124*)(C))->a25 = (T129f1(t1, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make_keys */
void T124f50(T0* C, T4 a1)
{
	((T124*)(C))->a32 = T133c3();
	((T124*)(C))->a27 = (T133f1(((T124*)(C))->a32, a1));
}

/* DS_HASH_TABLE [PR_TOKEN, STRING].make_items */
void T124f49(T0* C, T4 a1)
{
	((T124*)(C))->a31 = T140c3();
	((T124*)(C))->a6 = (T140f1(((T124*)(C))->a31, a1));
}

/* PR_GRAMMAR.make */
T0* T26c19()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T26));
	((T26*)(C))->id = 26;
	((T26*)(C))->a6 = T95c19((T4)(geint32(100)));
	((T26*)(C))->a5 = T88c20((T4)(geint32(300)));
	((T26*)(C))->a8 = T109c13((T4)(geint32(300)));
	((T26*)(C))->a1 = T67c21((T4)(geint32(500)));
	((T26*)(C))->a7 = T108c10((T4)(geint32(1)));
	return C;
}

/* DS_ARRAYED_LIST [STRING].make */
T0* T108c10(T4 a1)
{
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T108));
	((T108*)(C))->id = 108;
	((T108*)(C))->a4 = T133c3();
	t1 = ((T4)((a1)+((T4)(geint32(1)))));
	((T108*)(C))->a3 = (T133f1(((T108*)(C))->a4, t1));
	((T108*)(C))->a5 = (a1);
	((T108*)(C))->a6 = (T108f7(C));
	return C;
}

/* DS_ARRAYED_LIST [STRING].new_cursor */
T0* T108f7(T0* C)
{
	T0* R = 0;
	R = T227c2(C);
	return R;
}

/* DS_ARRAYED_LIST_CURSOR [STRING].make */
T0* T227c2(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T227));
	((T227*)(C))->id = 227;
	((T227*)(C))->a1 = (a1);
	return C;
}

/* PR_ACTION_FACTORY.make */
T0* T123c2()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T123));
	((T123*)(C))->id = 123;
	return C;
}

/* PR_YACC_PARSER.make_parser_skeleton */
void T47f259(T0* C)
{
	T0* t1;
	t1 = (T47f18(C));
	((T47*)(C))->a17 = (T129f1(t1, (T4)(geint32(200))));
	T47f263(C);
	T47f264(C);
}

/* PR_YACC_PARSER.yy_build_parser_tables */
void T47f264(T0* C)
{
	((T47*)(C))->a50 = (T47f63(C));
	((T47*)(C))->a58 = (T47f64(C));
	((T47*)(C))->a65 = (T47f66(C));
	((T47*)(C))->a67 = (T47f68(C));
	((T47*)(C))->a56 = (T47f69(C));
	((T47*)(C))->a61 = (T47f70(C));
	((T47*)(C))->a45 = (T47f71(C));
	((T47*)(C))->a60 = (T47f72(C));
	((T47*)(C))->a54 = (T47f73(C));
	((T47*)(C))->a53 = (T47f74(C));
}

/* PR_YACC_PARSER.yycheck_template */
unsigned char ge200os3246 = '\0';
T0* ge200ov3246;
T0* T47f74(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3246) {
		return ge200ov3246;
	} else {
		ge200os3246 = '\1';
	}
	t1 = (gema99((T4)239,
(T4)(geint32(6)),
(T4)(geint32(66)),
(T4)(geint32(14)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(17)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(0)),
(T4)(geint32(37)),
(T4)(geint32(15)),
(T4)(geint32(26)),
(T4)(geint32(18)),
(T4)(geint32(27)),
(T4)(geint32(18)),
(T4)(geint32(18)),
(T4)(geint32(34)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(26)),
(T4)(geint32(14)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(17)),
(T4)(geint32(36)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(18)),
(T4)(geint32(18)),
(T4)(geint32(47)),
(T4)(geint32(48)),
(T4)(geint32(108)),
(T4)(geint32(28)),
(T4)(geint32(18)),
(T4)(geint32(52)),
(T4)(geint32(34)),
(T4)(geint32(26)),
(T4)(geint32(18)),
(T4)(geint32(56)),
(T4)(geint32(35)),
(T4)(geint32(18)),
(T4)(geint32(14)),
(T4)(geint32(60)),
(T4)(geint32(31)),
(T4)(geint32(16)),
(T4)(geint32(32)),
(T4)(geint32(64)),
(T4)(geint32(14)),
(T4)(geint32(30)),
(T4)(geint32(29)),
(T4)(geint32(17)),
(T4)(geint32(69)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(87)),
(T4)(geint32(26)),
(T4)(geint32(22)),
(T4)(geint32(69)),
(T4)(geint32(81)),
(T4)(geint32(11)),
(T4)(geint32(48)),
(T4)(geint32(52)),
(T4)(geint32(34)),
(T4)(geint32(81)),
(T4)(geint32(-1)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(56)),
(T4)(geint32(17)),
(T4)(geint32(92)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(34)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(8)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(34)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(11)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(17)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(17)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(17)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(17)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(17)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(14)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(-1)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(-1)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(-1)),
(T4)(geint32(13)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3246 = R;
	return R;
}

/* PR_YACC_PARSER.yyfixed_array */
T0* T47f241(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T47f18(C));
	R = (T129f3(t1, a1));
	return R;
}

/* KL_SPECIAL_ROUTINES [INTEGER].to_special */
T0* T129f3(T0* C, T0* a1)
{
	T0* R = 0;
	R = (((T99*)(a1))->a1);
	return R;
}

/* PR_YACC_PARSER.yytable_template */
unsigned char ge200os3245 = '\0';
T0* ge200ov3245;
T0* T47f73(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3245) {
		return ge200ov3245;
	} else {
		ge200os3245 = '\1';
	}
	t1 = (gema99((T4)239,
(T4)(geint32(27)),
(T4)(geint32(94)),
(T4)(geint32(20)),
(T4)(geint32(109)),
(T4)(geint32(108)),
(T4)(geint32(82)),
(T4)(geint32(117)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(116)),
(T4)(geint32(113)),
(T4)(geint32(114)),
(T4)(geint32(111)),
(T4)(geint32(102)),
(T4)(geint32(88)),
(T4)(geint32(80)),
(T4)(geint32(77)),
(T4)(geint32(81)),
(T4)(geint32(50)),
(T4)(geint32(54)),
(T4)(geint32(58)),
(T4)(geint32(101)),
(T4)(geint32(20)),
(T4)(geint32(79)),
(T4)(geint32(76)),
(T4)(geint32(57)),
(T4)(geint32(104)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(110)),
(T4)(geint32(74)),
(T4)(geint32(70)),
(T4)(geint32(50)),
(T4)(geint32(112)),
(T4)(geint32(86)),
(T4)(geint32(99)),
(T4)(geint32(54)),
(T4)(geint32(56)),
(T4)(geint32(73)),
(T4)(geint32(98)),
(T4)(geint32(58)),
(T4)(geint32(85)),
(T4)(geint32(97)),
(T4)(geint32(65)),
(T4)(geint32(83)),
(T4)(geint32(68)),
(T4)(geint32(61)),
(T4)(geint32(66)),
(T4)(geint32(93)),
(T4)(geint32(20)),
(T4)(geint32(25)),
(T4)(geint32(36)),
(T4)(geint32(53)),
(T4)(geint32(70)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(103)),
(T4)(geint32(28)),
(T4)(geint32(35)),
(T4)(geint32(96)),
(T4)(geint32(83)),
(T4)(geint32(32)),
(T4)(geint32(72)),
(T4)(geint32(75)),
(T4)(geint32(52)),
(T4)(geint32(100)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(78)),
(T4)(geint32(49)),
(T4)(geint32(106)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(48)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(92)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(91)),
(T4)(geint32(69)),
(T4)(geint32(90)),
(T4)(geint32(89)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(33)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(105)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(82)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(57)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(53)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(49)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(45)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(44)),
(T4)(geint32(43)),
(T4)(geint32(42)),
(T4)(geint32(41)),
(T4)(geint32(40)),
(T4)(geint32(39)),
(T4)(geint32(38)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(14)),
(T4)(geint32(13)),
(T4)(geint32(11)),
(T4)(geint32(10)),
(T4)(geint32(9)),
(T4)(geint32(8)),
(T4)(geint32(7)),
(T4)(geint32(0)),
(T4)(geint32(6)),
(T4)(geint32(5)),
(T4)(geint32(4)),
(T4)(geint32(0)),
(T4)(geint32(3)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3245 = R;
	return R;
}

/* PR_YACC_PARSER.yypgoto_template */
unsigned char ge200os3244 = '\0';
T0* ge200ov3244;
T0* T47f72(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3244) {
		return ge200ov3244;
	} else {
		ge200os3244 = '\1';
	}
	t1 = (gema99((T4)30,
(T4)(geint32(-6)),
(T4)(geint32(-32768)),
(T4)(geint32(-1)),
(T4)(geint32(28)),
(T4)(geint32(26)),
(T4)(geint32(29)),
(T4)(geint32(-65)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(65)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(5)),
(T4)(geint32(51)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-16)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3244 = R;
	return R;
}

/* PR_YACC_PARSER.yypact_template */
unsigned char ge200os3243 = '\0';
T0* ge200ov3243;
T0* T47f71(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3243) {
		return ge200ov3243;
	} else {
		ge200os3243 = '\1';
	}
	t1 = (gema99((T4)119,
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(224)),
(T4)(geint32(-32768)),
(T4)(geint32(201)),
(T4)(geint32(30)),
(T4)(geint32(201)),
(T4)(geint32(46)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(30)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(117)),
(T4)(geint32(-32768)),
(T4)(geint32(32)),
(T4)(geint32(189)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(68)),
(T4)(geint32(45)),
(T4)(geint32(13)),
(T4)(geint32(-32768)),
(T4)(geint32(40)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(39)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(25)),
(T4)(geint32(24)),
(T4)(geint32(84)),
(T4)(geint32(177)),
(T4)(geint32(-32768)),
(T4)(geint32(22)),
(T4)(geint32(-32768)),
(T4)(geint32(165)),
(T4)(geint32(-32768)),
(T4)(geint32(3)),
(T4)(geint32(-32768)),
(T4)(geint32(153)),
(T4)(geint32(-32768)),
(T4)(geint32(2)),
(T4)(geint32(-32768)),
(T4)(geint32(-12)),
(T4)(geint32(-32768)),
(T4)(geint32(16)),
(T4)(geint32(-8)),
(T4)(geint32(102)),
(T4)(geint32(-32768)),
(T4)(geint32(189)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(201)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(34)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(31)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(27)),
(T4)(geint32(-32768)),
(T4)(geint32(141)),
(T4)(geint32(-32768)),
(T4)(geint32(0)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-5)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(129)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-30)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(21)),
(T4)(geint32(-32768)),
(T4)(geint32(-8)),
(T4)(geint32(-9)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(189)),
(T4)(geint32(-32768)),
(T4)(geint32(-32768)),
(T4)(geint32(-22)),
(T4)(geint32(-32768)),
(T4)(geint32(1)),
(T4)(geint32(-32768)),
(T4)(geint32(14)),
(T4)(geint32(6)),
(T4)(geint32(-32768)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3243 = R;
	return R;
}

/* PR_YACC_PARSER.yydefgoto_template */
unsigned char ge200os3242 = '\0';
T0* ge200ov3242;
T0* T47f70(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3242) {
		return ge200ov3242;
	} else {
		ge200os3242 = '\1';
	}
	t1 = (gema99((T4)30,
(T4)(geint32(21)),
(T4)(geint32(107)),
(T4)(geint32(84)),
(T4)(geint32(59)),
(T4)(geint32(55)),
(T4)(geint32(51)),
(T4)(geint32(46)),
(T4)(geint32(95)),
(T4)(geint32(67)),
(T4)(geint32(115)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(22)),
(T4)(geint32(34)),
(T4)(geint32(12)),
(T4)(geint32(26)),
(T4)(geint32(60)),
(T4)(geint32(47)),
(T4)(geint32(31)),
(T4)(geint32(30)),
(T4)(geint32(29)),
(T4)(geint32(71)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(37)),
(T4)(geint32(62)),
(T4)(geint32(63)),
(T4)(geint32(87)),
(T4)(geint32(64)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3242 = R;
	return R;
}

/* PR_YACC_PARSER.yydefact_template */
unsigned char ge200os3241 = '\0';
T0* ge200ov3241;
T0* T47f69(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3241) {
		return ge200ov3241;
	} else {
		ge200os3241 = '\1';
	}
	t1 = (gema99((T4)119,
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(0)),
(T4)(geint32(5)),
(T4)(geint32(64)),
(T4)(geint32(13)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(52)),
(T4)(geint32(44)),
(T4)(geint32(36)),
(T4)(geint32(13)),
(T4)(geint32(4)),
(T4)(geint32(93)),
(T4)(geint32(92)),
(T4)(geint32(91)),
(T4)(geint32(90)),
(T4)(geint32(89)),
(T4)(geint32(88)),
(T4)(geint32(87)),
(T4)(geint32(86)),
(T4)(geint32(68)),
(T4)(geint32(83)),
(T4)(geint32(65)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(60)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(10)),
(T4)(geint32(9)),
(T4)(geint32(8)),
(T4)(geint32(28)),
(T4)(geint32(84)),
(T4)(geint32(1)),
(T4)(geint32(66)),
(T4)(geint32(69)),
(T4)(geint32(74)),
(T4)(geint32(0)),
(T4)(geint32(21)),
(T4)(geint32(20)),
(T4)(geint32(19)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(16)),
(T4)(geint32(15)),
(T4)(geint32(0)),
(T4)(geint32(7)),
(T4)(geint32(0)),
(T4)(geint32(59)),
(T4)(geint32(55)),
(T4)(geint32(53)),
(T4)(geint32(0)),
(T4)(geint32(51)),
(T4)(geint32(47)),
(T4)(geint32(45)),
(T4)(geint32(0)),
(T4)(geint32(43)),
(T4)(geint32(39)),
(T4)(geint32(37)),
(T4)(geint32(6)),
(T4)(geint32(85)),
(T4)(geint32(0)),
(T4)(geint32(70)),
(T4)(geint32(72)),
(T4)(geint32(23)),
(T4)(geint32(25)),
(T4)(geint32(22)),
(T4)(geint32(14)),
(T4)(geint32(0)),
(T4)(geint32(63)),
(T4)(geint32(61)),
(T4)(geint32(54)),
(T4)(geint32(56)),
(T4)(geint32(57)),
(T4)(geint32(46)),
(T4)(geint32(48)),
(T4)(geint32(49)),
(T4)(geint32(38)),
(T4)(geint32(40)),
(T4)(geint32(41)),
(T4)(geint32(0)),
(T4)(geint32(35)),
(T4)(geint32(31)),
(T4)(geint32(29)),
(T4)(geint32(67)),
(T4)(geint32(82)),
(T4)(geint32(74)),
(T4)(geint32(0)),
(T4)(geint32(77)),
(T4)(geint32(76)),
(T4)(geint32(78)),
(T4)(geint32(0)),
(T4)(geint32(75)),
(T4)(geint32(26)),
(T4)(geint32(0)),
(T4)(geint32(62)),
(T4)(geint32(58)),
(T4)(geint32(50)),
(T4)(geint32(42)),
(T4)(geint32(30)),
(T4)(geint32(32)),
(T4)(geint32(33)),
(T4)(geint32(71)),
(T4)(geint32(0)),
(T4)(geint32(81)),
(T4)(geint32(80)),
(T4)(geint32(79)),
(T4)(geint32(0)),
(T4)(geint32(24)),
(T4)(geint32(34)),
(T4)(geint32(0)),
(T4)(geint32(27)),
(T4)(geint32(0)),
(T4)(geint32(73)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3241 = R;
	return R;
}

/* PR_YACC_PARSER.yytypes2_template */
unsigned char ge200os3240 = '\0';
T0* ge200ov3240;
T0* T47f68(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3240) {
		return ge200ov3240;
	} else {
		ge200os3240 = '\1';
	}
	t1 = (gema99((T4)39,
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3240 = R;
	return R;
}

/* PR_YACC_PARSER.yytypes1_template */
unsigned char ge200os3239 = '\0';
T0* ge200ov3239;
T0* T47f66(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3239) {
		return ge200ov3239;
	} else {
		ge200os3239 = '\1';
	}
	t1 = (gema99((T4)119,
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(6)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(3)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3239 = R;
	return R;
}

/* PR_YACC_PARSER.yyr1_template */
unsigned char ge200os3238 = '\0';
T0* ge200ov3238;
T0* T47f64(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3238) {
		return ge200ov3238;
	} else {
		ge200os3238 = '\1';
	}
	t1 = (gema99((T4)95,
(T4)(geint32(0)),
(T4)(geint32(47)),
(T4)(geint32(49)),
(T4)(geint32(48)),
(T4)(geint32(48)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(44)),
(T4)(geint32(46)),
(T4)(geint32(45)),
(T4)(geint32(45)),
(T4)(geint32(45)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(56)),
(T4)(geint32(56)),
(T4)(geint32(56)),
(T4)(geint32(41)),
(T4)(geint32(41)),
(T4)(geint32(41)),
(T4)(geint32(41)),
(T4)(geint32(41)),
(T4)(geint32(57)),
(T4)(geint32(57)),
(T4)(geint32(57)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(58)),
(T4)(geint32(58)),
(T4)(geint32(58)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(55)),
(T4)(geint32(55)),
(T4)(geint32(55)),
(T4)(geint32(59)),
(T4)(geint32(50)),
(T4)(geint32(50)),
(T4)(geint32(50)),
(T4)(geint32(60)),
(T4)(geint32(61)),
(T4)(geint32(62)),
(T4)(geint32(63)),
(T4)(geint32(63)),
(T4)(geint32(64)),
(T4)(geint32(64)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(66)),
(T4)(geint32(39)),
(T4)(geint32(39)),
(T4)(geint32(65)),
(T4)(geint32(51)),
(T4)(geint32(51)),
(T4)(geint32(51)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(38)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3238 = R;
	return R;
}

/* PR_YACC_PARSER.yytranslate_template */
unsigned char ge200os3237 = '\0';
T0* ge200ov3237;
T0* T47f63(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge200os3237) {
		return ge200ov3237;
	} else {
		ge200os3237 = '\1';
	}
	t1 = (gema99((T4)284,
(T4)(geint32(0)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(34)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(29)),
(T4)(geint32(35)),
(T4)(geint32(30)),
(T4)(geint32(2)),
(T4)(geint32(31)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(32)),
(T4)(geint32(2)),
(T4)(geint32(33)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(28)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(16)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(19)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(2147483647))));
	R = (T47f241(C, t1));
	ge200ov3237 = R;
	return R;
}

/* PR_YACC_PARSER.yy_create_value_stacks */
void T47f263(T0* C)
{
}

/* PR_YACC_PARSER.make_yacc_scanner */
void T47f258(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T47f12(C));
	T47f262(C, t1);
	((T47*)(C))->a13 = (a1);
	((T47*)(C))->a14 = T16c25((T4)(geint32(256)));
	((T47*)(C))->a1 = (EIF_TRUE);
	((T47*)(C))->a16 = ((T4)(geint32(1)));
}

/* PR_YACC_PARSER.make_with_buffer */
void T47f262(T0* C, T0* a1)
{
	((T47*)(C))->a20 = (a1);
	T47f276(C);
	T47f265(C);
}

/* PR_YACC_PARSER.yy_initialize */
void T47f276(T0* C)
{
	T0* t1;
	T0* t2;
	T4 t3;
	T47f302(C);
	((T47*)(C))->a93 = ((T4)(geint32(1)));
	((T47*)(C))->a23 = ((T4)(geint32(1)));
	((T47*)(C))->a24 = ((T4)(geint32(1)));
	((T47*)(C))->a22 = ((T4)(geint32(1)));
	((T47*)(C))->a90 = ((T4)(geint32(1)));
	((T47*)(C))->a91 = ((T4)(geint32(1)));
	((T47*)(C))->a92 = ((T4)(geint32(1)));
	if (EIF_FALSE) {
		t1 = (T47f18(C));
		t2 = ((((((T47*)(C))->a20)->id==127)?((T127*)(((T47*)(C))->a20))->a1:((T128*)(((T47*)(C))->a20))->a1));
		t3 = (T252f4(t2));
		t3 = ((T4)((t3)+((T4)(geint32(1)))));
		((T47*)(C))->a95 = (T129f1(t1, t3));
	}
}

/* PR_YACC_PARSER.yy_build_tables */
void T47f302(T0* C)
{
	((T47*)(C))->a108 = (T47f232(C));
	((T47*)(C))->a103 = (T47f233(C));
	((T47*)(C))->a104 = (T47f234(C));
	((T47*)(C))->a105 = (T47f235(C));
	((T47*)(C))->a97 = (T47f236(C));
	((T47*)(C))->a106 = (T47f237(C));
	((T47*)(C))->a100 = (T47f238(C));
}

/* PR_YACC_PARSER.yy_accept_template */
unsigned char ge202os3754 = '\0';
T0* ge202ov3754;
T0* T47f238(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3754) {
		return ge202ov3754;
	} else {
		ge202os3754 = '\1';
	}
	t1 = (gema99((T4)203,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(46)),
(T4)(geint32(46)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(53)),
(T4)(geint32(53)),
(T4)(geint32(66)),
(T4)(geint32(64)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(64)),
(T4)(geint32(16)),
(T4)(geint32(64)),
(T4)(geint32(8)),
(T4)(geint32(64)),
(T4)(geint32(27)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(64)),
(T4)(geint32(32)),
(T4)(geint32(34)),
(T4)(geint32(36)),
(T4)(geint32(33)),
(T4)(geint32(38)),
(T4)(geint32(46)),
(T4)(geint32(51)),
(T4)(geint32(50)),
(T4)(geint32(50)),
(T4)(geint32(50)),
(T4)(geint32(50)),
(T4)(geint32(53)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(57)),
(T4)(geint32(57)),
(T4)(geint32(57)),
(T4)(geint32(62)),
(T4)(geint32(63)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(41)),
(T4)(geint32(42)),
(T4)(geint32(64)),
(T4)(geint32(43)),
(T4)(geint32(45)),
(T4)(geint32(17)),
(T4)(geint32(0)),
(T4)(geint32(29)),
(T4)(geint32(15)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(17)),
(T4)(geint32(27)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(37)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(36)),
(T4)(geint32(35)),
(T4)(geint32(38)),
(T4)(geint32(46)),
(T4)(geint32(0)),
(T4)(geint32(47)),
(T4)(geint32(47)),
(T4)(geint32(52)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(49)),
(T4)(geint32(53)),
(T4)(geint32(58)),
(T4)(geint32(0)),
(T4)(geint32(54)),
(T4)(geint32(54)),
(T4)(geint32(59)),
(T4)(geint32(0)),
(T4)(geint32(60)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(56)),
(T4)(geint32(39)),
(T4)(geint32(39)),
(T4)(geint32(43)),
(T4)(geint32(45)),
(T4)(geint32(44)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(13)),
(T4)(geint32(28)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(48)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(61)),
(T4)(geint32(55)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(21)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(2)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(5)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(0)),
(T4)(geint32(30)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(3)),
(T4)(geint32(6)),
(T4)(geint32(1)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(22)),
(T4)(geint32(26)),
(T4)(geint32(26)),
(T4)(geint32(31)),
(T4)(geint32(7)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(26)),
(T4)(geint32(19)),
(T4)(geint32(24)),
(T4)(geint32(0)),
(T4)(geint32(26)),
(T4)(geint32(4)),
(T4)(geint32(23)),
(T4)(geint32(0)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3754 = R;
	return R;
}

/* PR_YACC_PARSER.yy_fixed_array */
T0* T47f254(T0* C, T0* a1)
{
	T0* R = 0;
	T0* t1;
	t1 = (T47f18(C));
	R = (T129f3(t1, a1));
	return R;
}

/* PR_YACC_PARSER.yy_meta_template */
unsigned char ge202os3753 = '\0';
T0* ge202ov3753;
T0* T47f237(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3753) {
		return ge202ov3753;
	} else {
		ge202os3753 = '\1';
	}
	t1 = (gema99((T4)49,
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(4)),
(T4)(geint32(5)),
(T4)(geint32(6)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(16)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(1)),
(T4)(geint32(4)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3753 = R;
	return R;
}

/* PR_YACC_PARSER.yy_ec_template */
unsigned char ge202os3752 = '\0';
T0* ge202ov3752;
T0* T47f236(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3752) {
		return ge202ov3752;
	} else {
		ge202os3752 = '\1';
	}
	t1 = (gema99((T4)258,
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(3)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(4)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2)),
(T4)(geint32(1)),
(T4)(geint32(5)),
(T4)(geint32(1)),
(T4)(geint32(6)),
(T4)(geint32(7)),
(T4)(geint32(1)),
(T4)(geint32(8)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(1)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(15)),
(T4)(geint32(15)),
(T4)(geint32(16)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(1)),
(T4)(geint32(19)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(29)),
(T4)(geint32(32)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(29)),
(T4)(geint32(35)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(38)),
(T4)(geint32(29)),
(T4)(geint32(29)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(29)),
(T4)(geint32(41)),
(T4)(geint32(42)),
(T4)(geint32(43)),
(T4)(geint32(1)),
(T4)(geint32(44)),
(T4)(geint32(1)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(24)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(31)),
(T4)(geint32(29)),
(T4)(geint32(32)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(29)),
(T4)(geint32(35)),
(T4)(geint32(36)),
(T4)(geint32(37)),
(T4)(geint32(38)),
(T4)(geint32(29)),
(T4)(geint32(29)),
(T4)(geint32(39)),
(T4)(geint32(40)),
(T4)(geint32(29)),
(T4)(geint32(45)),
(T4)(geint32(46)),
(T4)(geint32(47)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3752 = R;
	return R;
}

/* PR_YACC_PARSER.yy_def_template */
unsigned char ge202os3751 = '\0';
T0* ge202ov3751;
T0* T47f235(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3751) {
		return ge202ov3751;
	} else {
		ge202os3751 = '\1';
	}
	t1 = (gema99((T4)223,
(T4)(geint32(0)),
(T4)(geint32(201)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(206)),
(T4)(geint32(201)),
(T4)(geint32(207)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(209)),
(T4)(geint32(210)),
(T4)(geint32(201)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(212)),
(T4)(geint32(201)),
(T4)(geint32(213)),
(T4)(geint32(201)),
(T4)(geint32(214)),
(T4)(geint32(201)),
(T4)(geint32(215)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(206)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(207)),
(T4)(geint32(216)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(209)),
(T4)(geint32(210)),
(T4)(geint32(211)),
(T4)(geint32(201)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(201)),
(T4)(geint32(212)),
(T4)(geint32(217)),
(T4)(geint32(213)),
(T4)(geint32(201)),
(T4)(geint32(214)),
(T4)(geint32(201)),
(T4)(geint32(214)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(215)),
(T4)(geint32(218)),
(T4)(geint32(201)),
(T4)(geint32(219)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(220)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(221)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(201)),
(T4)(geint32(208)),
(T4)(geint32(0)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3751 = R;
	return R;
}

/* PR_YACC_PARSER.yy_base_template */
unsigned char ge202os3750 = '\0';
T0* ge202ov3750;
T0* T47f234(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3750) {
		return ge202ov3750;
	} else {
		ge202os3750 = '\1';
	}
	t1 = (gema99((T4)223,
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(41)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(58)),
(T4)(geint32(64)),
(T4)(geint32(85)),
(T4)(geint32(130)),
(T4)(geint32(176)),
(T4)(geint32(220)),
(T4)(geint32(263)),
(T4)(geint32(308)),
(T4)(geint32(296)),
(T4)(geint32(710)),
(T4)(geint32(47)),
(T4)(geint32(710)),
(T4)(geint32(290)),
(T4)(geint32(349)),
(T4)(geint32(252)),
(T4)(geint32(710)),
(T4)(geint32(281)),
(T4)(geint32(39)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(0)),
(T4)(geint32(259)),
(T4)(geint32(264)),
(T4)(geint32(257)),
(T4)(geint32(257)),
(T4)(geint32(260)),
(T4)(geint32(254)),
(T4)(geint32(262)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(49)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(75)),
(T4)(geint32(710)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(710)),
(T4)(geint32(57)),
(T4)(geint32(93)),
(T4)(geint32(278)),
(T4)(geint32(272)),
(T4)(geint32(0)),
(T4)(geint32(280)),
(T4)(geint32(89)),
(T4)(geint32(89)),
(T4)(geint32(275)),
(T4)(geint32(269)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(103)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(268)),
(T4)(geint32(60)),
(T4)(geint32(106)),
(T4)(geint32(109)),
(T4)(geint32(274)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(239)),
(T4)(geint32(253)),
(T4)(geint32(243)),
(T4)(geint32(246)),
(T4)(geint32(236)),
(T4)(geint32(66)),
(T4)(geint32(112)),
(T4)(geint32(264)),
(T4)(geint32(104)),
(T4)(geint32(0)),
(T4)(geint32(66)),
(T4)(geint32(0)),
(T4)(geint32(234)),
(T4)(geint32(244)),
(T4)(geint32(225)),
(T4)(geint32(225)),
(T4)(geint32(231)),
(T4)(geint32(232)),
(T4)(geint32(239)),
(T4)(geint32(710)),
(T4)(geint32(223)),
(T4)(geint32(222)),
(T4)(geint32(117)),
(T4)(geint32(710)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(117)),
(T4)(geint32(710)),
(T4)(geint32(113)),
(T4)(geint32(118)),
(T4)(geint32(248)),
(T4)(geint32(42)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(252)),
(T4)(geint32(122)),
(T4)(geint32(710)),
(T4)(geint32(135)),
(T4)(geint32(710)),
(T4)(geint32(130)),
(T4)(geint32(132)),
(T4)(geint32(246)),
(T4)(geint32(141)),
(T4)(geint32(0)),
(T4)(geint32(148)),
(T4)(geint32(0)),
(T4)(geint32(141)),
(T4)(geint32(155)),
(T4)(geint32(710)),
(T4)(geint32(219)),
(T4)(geint32(227)),
(T4)(geint32(219)),
(T4)(geint32(224)),
(T4)(geint32(229)),
(T4)(geint32(218)),
(T4)(geint32(213)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(120)),
(T4)(geint32(238)),
(T4)(geint32(214)),
(T4)(geint32(209)),
(T4)(geint32(222)),
(T4)(geint32(218)),
(T4)(geint32(217)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(203)),
(T4)(geint32(213)),
(T4)(geint32(146)),
(T4)(geint32(710)),
(T4)(geint32(148)),
(T4)(geint32(150)),
(T4)(geint32(152)),
(T4)(geint32(710)),
(T4)(geint32(154)),
(T4)(geint32(212)),
(T4)(geint32(196)),
(T4)(geint32(211)),
(T4)(geint32(201)),
(T4)(geint32(192)),
(T4)(geint32(202)),
(T4)(geint32(201)),
(T4)(geint32(162)),
(T4)(geint32(212)),
(T4)(geint32(195)),
(T4)(geint32(198)),
(T4)(geint32(186)),
(T4)(geint32(190)),
(T4)(geint32(0)),
(T4)(geint32(178)),
(T4)(geint32(0)),
(T4)(geint32(181)),
(T4)(geint32(191)),
(T4)(geint32(158)),
(T4)(geint32(168)),
(T4)(geint32(179)),
(T4)(geint32(182)),
(T4)(geint32(190)),
(T4)(geint32(710)),
(T4)(geint32(175)),
(T4)(geint32(173)),
(T4)(geint32(172)),
(T4)(geint32(176)),
(T4)(geint32(710)),
(T4)(geint32(187)),
(T4)(geint32(184)),
(T4)(geint32(179)),
(T4)(geint32(175)),
(T4)(geint32(165)),
(T4)(geint32(152)),
(T4)(geint32(710)),
(T4)(geint32(147)),
(T4)(geint32(138)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(121)),
(T4)(geint32(114)),
(T4)(geint32(0)),
(T4)(geint32(106)),
(T4)(geint32(96)),
(T4)(geint32(710)),
(T4)(geint32(710)),
(T4)(geint32(69)),
(T4)(geint32(0)),
(T4)(geint32(65)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(63)),
(T4)(geint32(33)),
(T4)(geint32(710)),
(T4)(geint32(0)),
(T4)(geint32(710)),
(T4)(geint32(394)),
(T4)(geint32(412)),
(T4)(geint32(430)),
(T4)(geint32(448)),
(T4)(geint32(466)),
(T4)(geint32(484)),
(T4)(geint32(495)),
(T4)(geint32(512)),
(T4)(geint32(530)),
(T4)(geint32(548)),
(T4)(geint32(566)),
(T4)(geint32(584)),
(T4)(geint32(601)),
(T4)(geint32(619)),
(T4)(geint32(637)),
(T4)(geint32(655)),
(T4)(geint32(673)),
(T4)(geint32(691)),
(T4)(geint32(192)),
(T4)(geint32(196)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3750 = R;
	return R;
}

/* PR_YACC_PARSER.yy_chk_template */
unsigned char ge202os3749 = '\0';
T0* ge202ov3749;
T0* T47f233(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3749) {
		return ge202ov3749;
	} else {
		ge202os3749 = '\1';
	}
	t1 = (gema99((T4)759,
(T4)(geint32(0)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(1)),
(T4)(geint32(3)),
(T4)(geint32(17)),
(T4)(geint32(99)),
(T4)(geint32(17)),
(T4)(geint32(3)),
(T4)(geint32(24)),
(T4)(geint32(24)),
(T4)(geint32(99)),
(T4)(geint32(37)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(7)),
(T4)(geint32(45)),
(T4)(geint32(7)),
(T4)(geint32(45)),
(T4)(geint32(7)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(198)),
(T4)(geint32(8)),
(T4)(geint32(7)),
(T4)(geint32(8)),
(T4)(geint32(8)),
(T4)(geint32(37)),
(T4)(geint32(62)),
(T4)(geint32(62)),
(T4)(geint32(8)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(40)),
(T4)(geint32(78)),
(T4)(geint32(78)),
(T4)(geint32(3)),
(T4)(geint32(37)),
(T4)(geint32(3)),
(T4)(geint32(197)),
(T4)(geint32(3)),
(T4)(geint32(3)),
(T4)(geint32(9)),
(T4)(geint32(194)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(9)),
(T4)(geint32(51)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(9)),
(T4)(geint32(46)),
(T4)(geint32(73)),
(T4)(geint32(46)),
(T4)(geint32(52)),
(T4)(geint32(192)),
(T4)(geint32(52)),
(T4)(geint32(52)),
(T4)(geint32(57)),
(T4)(geint32(73)),
(T4)(geint32(57)),
(T4)(geint32(63)),
(T4)(geint32(63)),
(T4)(geint32(63)),
(T4)(geint32(64)),
(T4)(geint32(76)),
(T4)(geint32(64)),
(T4)(geint32(74)),
(T4)(geint32(74)),
(T4)(geint32(74)),
(T4)(geint32(96)),
(T4)(geint32(76)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(90)),
(T4)(geint32(94)),
(T4)(geint32(97)),
(T4)(geint32(94)),
(T4)(geint32(97)),
(T4)(geint32(96)),
(T4)(geint32(103)),
(T4)(geint32(126)),
(T4)(geint32(103)),
(T4)(geint32(9)),
(T4)(geint32(189)),
(T4)(geint32(9)),
(T4)(geint32(10)),
(T4)(geint32(126)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(10)),
(T4)(geint32(105)),
(T4)(geint32(46)),
(T4)(geint32(188)),
(T4)(geint32(10)),
(T4)(geint32(76)),
(T4)(geint32(107)),
(T4)(geint32(107)),
(T4)(geint32(108)),
(T4)(geint32(108)),
(T4)(geint32(105)),
(T4)(geint32(110)),
(T4)(geint32(112)),
(T4)(geint32(186)),
(T4)(geint32(112)),
(T4)(geint32(185)),
(T4)(geint32(110)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(115)),
(T4)(geint32(115)),
(T4)(geint32(115)),
(T4)(geint32(137)),
(T4)(geint32(137)),
(T4)(geint32(139)),
(T4)(geint32(139)),
(T4)(geint32(140)),
(T4)(geint32(140)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(143)),
(T4)(geint32(143)),
(T4)(geint32(151)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(181)),
(T4)(geint32(10)),
(T4)(geint32(151)),
(T4)(geint32(10)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(180)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(178)),
(T4)(geint32(11)),
(T4)(geint32(177)),
(T4)(geint32(11)),
(T4)(geint32(11)),
(T4)(geint32(164)),
(T4)(geint32(164)),
(T4)(geint32(164)),
(T4)(geint32(165)),
(T4)(geint32(165)),
(T4)(geint32(165)),
(T4)(geint32(220)),
(T4)(geint32(176)),
(T4)(geint32(220)),
(T4)(geint32(220)),
(T4)(geint32(221)),
(T4)(geint32(175)),
(T4)(geint32(221)),
(T4)(geint32(221)),
(T4)(geint32(174)),
(T4)(geint32(173)),
(T4)(geint32(171)),
(T4)(geint32(170)),
(T4)(geint32(169)),
(T4)(geint32(168)),
(T4)(geint32(166)),
(T4)(geint32(161)),
(T4)(geint32(160)),
(T4)(geint32(158)),
(T4)(geint32(156)),
(T4)(geint32(155)),
(T4)(geint32(154)),
(T4)(geint32(153)),
(T4)(geint32(152)),
(T4)(geint32(11)),
(T4)(geint32(12)),
(T4)(geint32(12)),
(T4)(geint32(12)),
(T4)(geint32(150)),
(T4)(geint32(149)),
(T4)(geint32(148)),
(T4)(geint32(147)),
(T4)(geint32(12)),
(T4)(geint32(12)),
(T4)(geint32(146)),
(T4)(geint32(12)),
(T4)(geint32(145)),
(T4)(geint32(12)),
(T4)(geint32(12)),
(T4)(geint32(144)),
(T4)(geint32(136)),
(T4)(geint32(135)),
(T4)(geint32(134)),
(T4)(geint32(133)),
(T4)(geint32(132)),
(T4)(geint32(131)),
(T4)(geint32(130)),
(T4)(geint32(129)),
(T4)(geint32(128)),
(T4)(geint32(127)),
(T4)(geint32(123)),
(T4)(geint32(122)),
(T4)(geint32(121)),
(T4)(geint32(120)),
(T4)(geint32(119)),
(T4)(geint32(118)),
(T4)(geint32(117)),
(T4)(geint32(109)),
(T4)(geint32(102)),
(T4)(geint32(98)),
(T4)(geint32(89)),
(T4)(geint32(88)),
(T4)(geint32(86)),
(T4)(geint32(85)),
(T4)(geint32(84)),
(T4)(geint32(83)),
(T4)(geint32(82)),
(T4)(geint32(81)),
(T4)(geint32(12)),
(T4)(geint32(13)),
(T4)(geint32(80)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(13)),
(T4)(geint32(75)),
(T4)(geint32(72)),
(T4)(geint32(71)),
(T4)(geint32(13)),
(T4)(geint32(70)),
(T4)(geint32(69)),
(T4)(geint32(68)),
(T4)(geint32(65)),
(T4)(geint32(61)),
(T4)(geint32(54)),
(T4)(geint32(53)),
(T4)(geint32(50)),
(T4)(geint32(48)),
(T4)(geint32(47)),
(T4)(geint32(34)),
(T4)(geint32(33)),
(T4)(geint32(32)),
(T4)(geint32(31)),
(T4)(geint32(30)),
(T4)(geint32(29)),
(T4)(geint32(28)),
(T4)(geint32(23)),
(T4)(geint32(21)),
(T4)(geint32(19)),
(T4)(geint32(15)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(13)),
(T4)(geint32(0)),
(T4)(geint32(13)),
(T4)(geint32(14)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(14)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(0)),
(T4)(geint32(14)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(20)),
(T4)(geint32(20)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(20)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(202)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(203)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(204)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(205)),
(T4)(geint32(206)),
(T4)(geint32(0)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(206)),
(T4)(geint32(207)),
(T4)(geint32(0)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(0)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(207)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(208)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(209)),
(T4)(geint32(210)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(210)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(210)),
(T4)(geint32(211)),
(T4)(geint32(0)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(211)),
(T4)(geint32(212)),
(T4)(geint32(0)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(0)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(212)),
(T4)(geint32(213)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(0)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(213)),
(T4)(geint32(214)),
(T4)(geint32(0)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(214)),
(T4)(geint32(215)),
(T4)(geint32(0)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(0)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(215)),
(T4)(geint32(216)),
(T4)(geint32(0)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(216)),
(T4)(geint32(217)),
(T4)(geint32(0)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(217)),
(T4)(geint32(218)),
(T4)(geint32(0)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(218)),
(T4)(geint32(219)),
(T4)(geint32(0)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(219)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3749 = R;
	return R;
}

/* PR_YACC_PARSER.yy_nxt_template */
unsigned char ge202os3748 = '\0';
T0* ge202ov3748;
T0* T47f232(T0* C)
{
	T0* R = 0;
	T0* t1;
	if (ge202os3748) {
		return ge202ov3748;
	} else {
		ge202os3748 = '\1';
	}
	t1 = (gema99((T4)759,
(T4)(geint32(0)),
(T4)(geint32(16)),
(T4)(geint32(17)),
(T4)(geint32(18)),
(T4)(geint32(17)),
(T4)(geint32(19)),
(T4)(geint32(16)),
(T4)(geint32(20)),
(T4)(geint32(21)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(22)),
(T4)(geint32(23)),
(T4)(geint32(16)),
(T4)(geint32(24)),
(T4)(geint32(24)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(25)),
(T4)(geint32(26)),
(T4)(geint32(27)),
(T4)(geint32(28)),
(T4)(geint32(29)),
(T4)(geint32(30)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(31)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(32)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(33)),
(T4)(geint32(34)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(27)),
(T4)(geint32(35)),
(T4)(geint32(16)),
(T4)(geint32(36)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(37)),
(T4)(geint32(64)),
(T4)(geint32(98)),
(T4)(geint32(64)),
(T4)(geint32(16)),
(T4)(geint32(78)),
(T4)(geint32(78)),
(T4)(geint32(139)),
(T4)(geint32(87)),
(T4)(geint32(38)),
(T4)(geint32(39)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(44)),
(T4)(geint32(95)),
(T4)(geint32(45)),
(T4)(geint32(96)),
(T4)(geint32(46)),
(T4)(geint32(47)),
(T4)(geint32(44)),
(T4)(geint32(200)),
(T4)(geint32(45)),
(T4)(geint32(48)),
(T4)(geint32(46)),
(T4)(geint32(47)),
(T4)(geint32(88)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(48)),
(T4)(geint32(90)),
(T4)(geint32(91)),
(T4)(geint32(90)),
(T4)(geint32(78)),
(T4)(geint32(78)),
(T4)(geint32(16)),
(T4)(geint32(89)),
(T4)(geint32(16)),
(T4)(geint32(199)),
(T4)(geint32(40)),
(T4)(geint32(41)),
(T4)(geint32(50)),
(T4)(geint32(198)),
(T4)(geint32(51)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(53)),
(T4)(geint32(104)),
(T4)(geint32(106)),
(T4)(geint32(105)),
(T4)(geint32(54)),
(T4)(geint32(95)),
(T4)(geint32(122)),
(T4)(geint32(96)),
(T4)(geint32(107)),
(T4)(geint32(197)),
(T4)(geint32(108)),
(T4)(geint32(108)),
(T4)(geint32(112)),
(T4)(geint32(123)),
(T4)(geint32(112)),
(T4)(geint32(115)),
(T4)(geint32(116)),
(T4)(geint32(115)),
(T4)(geint32(64)),
(T4)(geint32(75)),
(T4)(geint32(64)),
(T4)(geint32(74)),
(T4)(geint32(124)),
(T4)(geint32(74)),
(T4)(geint32(201)),
(T4)(geint32(126)),
(T4)(geint32(90)),
(T4)(geint32(91)),
(T4)(geint32(90)),
(T4)(geint32(95)),
(T4)(geint32(95)),
(T4)(geint32(96)),
(T4)(geint32(96)),
(T4)(geint32(137)),
(T4)(geint32(104)),
(T4)(geint32(125)),
(T4)(geint32(105)),
(T4)(geint32(55)),
(T4)(geint32(196)),
(T4)(geint32(56)),
(T4)(geint32(50)),
(T4)(geint32(151)),
(T4)(geint32(51)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(53)),
(T4)(geint32(201)),
(T4)(geint32(97)),
(T4)(geint32(195)),
(T4)(geint32(54)),
(T4)(geint32(127)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(108)),
(T4)(geint32(108)),
(T4)(geint32(140)),
(T4)(geint32(109)),
(T4)(geint32(112)),
(T4)(geint32(194)),
(T4)(geint32(112)),
(T4)(geint32(193)),
(T4)(geint32(143)),
(T4)(geint32(114)),
(T4)(geint32(114)),
(T4)(geint32(115)),
(T4)(geint32(116)),
(T4)(geint32(115)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(164)),
(T4)(geint32(164)),
(T4)(geint32(141)),
(T4)(geint32(141)),
(T4)(geint32(165)),
(T4)(geint32(165)),
(T4)(geint32(125)),
(T4)(geint32(94)),
(T4)(geint32(162)),
(T4)(geint32(162)),
(T4)(geint32(192)),
(T4)(geint32(55)),
(T4)(geint32(75)),
(T4)(geint32(56)),
(T4)(geint32(57)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(98)),
(T4)(geint32(163)),
(T4)(geint32(163)),
(T4)(geint32(191)),
(T4)(geint32(59)),
(T4)(geint32(60)),
(T4)(geint32(190)),
(T4)(geint32(61)),
(T4)(geint32(189)),
(T4)(geint32(62)),
(T4)(geint32(62)),
(T4)(geint32(103)),
(T4)(geint32(164)),
(T4)(geint32(164)),
(T4)(geint32(109)),
(T4)(geint32(165)),
(T4)(geint32(165)),
(T4)(geint32(152)),
(T4)(geint32(188)),
(T4)(geint32(152)),
(T4)(geint32(152)),
(T4)(geint32(75)),
(T4)(geint32(187)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(186)),
(T4)(geint32(185)),
(T4)(geint32(184)),
(T4)(geint32(183)),
(T4)(geint32(182)),
(T4)(geint32(181)),
(T4)(geint32(180)),
(T4)(geint32(179)),
(T4)(geint32(178)),
(T4)(geint32(177)),
(T4)(geint32(176)),
(T4)(geint32(175)),
(T4)(geint32(174)),
(T4)(geint32(173)),
(T4)(geint32(125)),
(T4)(geint32(63)),
(T4)(geint32(57)),
(T4)(geint32(58)),
(T4)(geint32(57)),
(T4)(geint32(172)),
(T4)(geint32(171)),
(T4)(geint32(170)),
(T4)(geint32(169)),
(T4)(geint32(59)),
(T4)(geint32(60)),
(T4)(geint32(168)),
(T4)(geint32(61)),
(T4)(geint32(167)),
(T4)(geint32(62)),
(T4)(geint32(62)),
(T4)(geint32(166)),
(T4)(geint32(161)),
(T4)(geint32(160)),
(T4)(geint32(159)),
(T4)(geint32(158)),
(T4)(geint32(157)),
(T4)(geint32(156)),
(T4)(geint32(155)),
(T4)(geint32(154)),
(T4)(geint32(153)),
(T4)(geint32(125)),
(T4)(geint32(150)),
(T4)(geint32(149)),
(T4)(geint32(148)),
(T4)(geint32(147)),
(T4)(geint32(146)),
(T4)(geint32(145)),
(T4)(geint32(144)),
(T4)(geint32(142)),
(T4)(geint32(102)),
(T4)(geint32(138)),
(T4)(geint32(136)),
(T4)(geint32(135)),
(T4)(geint32(134)),
(T4)(geint32(133)),
(T4)(geint32(132)),
(T4)(geint32(131)),
(T4)(geint32(130)),
(T4)(geint32(129)),
(T4)(geint32(63)),
(T4)(geint32(50)),
(T4)(geint32(128)),
(T4)(geint32(51)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(53)),
(T4)(geint32(125)),
(T4)(geint32(121)),
(T4)(geint32(120)),
(T4)(geint32(54)),
(T4)(geint32(119)),
(T4)(geint32(118)),
(T4)(geint32(117)),
(T4)(geint32(66)),
(T4)(geint32(113)),
(T4)(geint32(111)),
(T4)(geint32(110)),
(T4)(geint32(102)),
(T4)(geint32(100)),
(T4)(geint32(99)),
(T4)(geint32(86)),
(T4)(geint32(85)),
(T4)(geint32(84)),
(T4)(geint32(83)),
(T4)(geint32(82)),
(T4)(geint32(81)),
(T4)(geint32(80)),
(T4)(geint32(77)),
(T4)(geint32(76)),
(T4)(geint32(66)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(55)),
(T4)(geint32(201)),
(T4)(geint32(56)),
(T4)(geint32(50)),
(T4)(geint32(201)),
(T4)(geint32(51)),
(T4)(geint32(52)),
(T4)(geint32(51)),
(T4)(geint32(53)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(54)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(55)),
(T4)(geint32(201)),
(T4)(geint32(56)),
(T4)(geint32(67)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(68)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(69)),
(T4)(geint32(70)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(71)),
(T4)(geint32(72)),
(T4)(geint32(73)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(74)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(42)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(43)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(49)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(16)),
(T4)(geint32(65)),
(T4)(geint32(201)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(65)),
(T4)(geint32(75)),
(T4)(geint32(201)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(201)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(75)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(79)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(92)),
(T4)(geint32(93)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(93)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(93)),
(T4)(geint32(94)),
(T4)(geint32(201)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(94)),
(T4)(geint32(98)),
(T4)(geint32(201)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(201)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(98)),
(T4)(geint32(101)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(101)),
(T4)(geint32(103)),
(T4)(geint32(201)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(103)),
(T4)(geint32(109)),
(T4)(geint32(201)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(201)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(109)),
(T4)(geint32(77)),
(T4)(geint32(201)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(77)),
(T4)(geint32(100)),
(T4)(geint32(201)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(100)),
(T4)(geint32(111)),
(T4)(geint32(201)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(111)),
(T4)(geint32(113)),
(T4)(geint32(201)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(113)),
(T4)(geint32(15)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(201)),
(T4)(geint32(2147483647))));
	R = (T47f254(C, t1));
	ge202ov3748 = R;
	return R;
}

/* PR_YACC_PARSER.empty_buffer */
unsigned char ge137os3603 = '\0';
T0* ge137ov3603;
T0* T47f12(T0* C)
{
	T0* R = 0;
	if (ge137os3603) {
		return ge137ov3603;
	} else {
		ge137os3603 = '\1';
	}
	R = T128c12(gems("", 0));
	ge137ov3603 = R;
	return R;
}

/* YY_BUFFER.make */
T0* T128c12(T0* a1)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T4 t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T128));
	((T128*)(C))->id = 128;
	t1 = (((T16*)(a1))->a2);
	l2 = ((T4)((t1)+((T4)(geint32(2)))));
	l1 = (T128f9(C, l2));
	T252f12(l1, a1, (T4)(geint32(1)));
	t1 = ((T4)((l2)-((T4)(geint32(1)))));
	T252f9(l1, (T1)('\000'), t1);
	T252f9(l1, (T1)('\000'), l2);
	T128f16(C, l1);
	return C;
}

/* YY_BUFFER.make_from_buffer */
void T128f16(T0* C, T0* a1)
{
	T4 t1;
	t1 = (T252f4(a1));
	((T128*)(C))->a11 = ((T4)((t1)-((T4)(geint32(2)))));
	((T128*)(C))->a7 = (((T128*)(C))->a11);
	((T128*)(C))->a1 = (a1);
	((T128*)(C))->a2 = ((T4)(geint32(1)));
	((T128*)(C))->a3 = ((T4)(geint32(1)));
	((T128*)(C))->a4 = ((T4)(geint32(1)));
	((T128*)(C))->a5 = ((T4)(geint32(1)));
	((T128*)(C))->a6 = (EIF_TRUE);
}

/* KL_CHARACTER_BUFFER.fill_from_string */
void T252f12(T0* C, T0* a1, T4 a2)
{
	T4 l1 = 0;
	T2 t1;
	T4 t2;
	l1 = (((T16*)(a1))->a2);
	t1 = (T4f1(&l1, (T4)(geint32(0))));
	if (t1) {
		t1 = ((((T252*)(C))->a3)!=(EIF_VOID));
		if (t1) {
			t2 = ((T4)((a2)+((T4)(geint32(1)))));
			T16f40(((T252*)(C))->a6, a1, (T4)(geint32(1)), l1, t2);
		} else {
			T16f40(((T252*)(C))->a6, a1, (T4)(geint32(1)), l1, a2);
		}
	}
}

/* YY_BUFFER.new_default_buffer */
T0* T128f9(T0* C, T4 a1)
{
	T0* R = 0;
	R = T252c8(a1);
	return R;
}

/* GEYACC.read_command_line */
void T18f20(T0* C)
{
	T4 l1 = 0;
	T4 l2 = 0;
	T0* l3 = 0;
	T0* l4 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T2 t4;
	t1 = (T18f1(C));
	l2 = ((T4)(geargc - 1));
	l1 = ((T4)(geint32(1)));
	t2 = (T4f1(&l1, l2));
	while (!(t2)) {
		t1 = (T18f1(C));
		l3 = (T24f2(t1, l1));
		t2 = (T16f4(l3, gems("--version", 9)));
		if (!(t2)) {
			t2 = (T16f4(l3, gems("-V", 2)));
		}
		if (t2) {
			T18f22(C);
		} else {
			t2 = (T16f4(l3, gems("--help", 6)));
			if (!(t2)) {
				t2 = (T16f4(l3, gems("-h", 2)));
			}
			if (!(t2)) {
				t2 = (T16f4(l3, gems("-\?", 2)));
			}
			if (t2) {
				T18f23(C);
			} else {
				t2 = (T16f4(l3, gems("-t", 2)));
				if (!(t2)) {
					t2 = (T16f4(l3, gems("-d", 2)));
				}
				if (t2) {
					l1 = ((T4)((l1)+((T4)(geint32(1)))));
					t2 = (T4f1(&l1, l2));
					if (t2) {
						T18f24(C);
					} else {
						t1 = (T18f1(C));
						t1 = (T24f2(t1, l1));
						((T18*)(C))->a12 = (T16f6(t1));
						t2 = ((((T18*)(C))->a13)==(EIF_VOID));
						if (t2) {
							((T18*)(C))->a13 = (T16f10(((T18*)(C))->a12));
							T16f26(((T18*)(C))->a13, ge52ov1302);
						}
					}
				} else {
					t3 = (((T16*)(l3))->a2);
					t2 = (T4f1(&t3, (T4)(geint32(9))));
					if (t2) {
						t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(9))));
						t2 = (T16f4(t1, gems("--tokens=", 9)));
					}
					if (t2) {
						t3 = (((T16*)(l3))->a2);
						t1 = (T16f5(l3, (T4)(geint32(10)), t3));
						((T18*)(C))->a12 = (T16f6(t1));
						t2 = ((((T18*)(C))->a13)==(EIF_VOID));
						if (t2) {
							((T18*)(C))->a13 = (T16f10(((T18*)(C))->a12));
							T16f26(((T18*)(C))->a13, ge52ov1302);
						}
					} else {
						t3 = (((T16*)(l3))->a2);
						t2 = (T4f1(&t3, (T4)(geint32(10))));
						if (t2) {
							t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(10))));
							t2 = (T16f4(t1, gems("--defines=", 10)));
						}
						if (t2) {
							t3 = (((T16*)(l3))->a2);
							t1 = (T16f5(l3, (T4)(geint32(11)), t3));
							((T18*)(C))->a12 = (T16f6(t1));
							t2 = ((((T18*)(C))->a13)==(EIF_VOID));
							if (t2) {
								((T18*)(C))->a13 = (T16f10(((T18*)(C))->a12));
								T16f26(((T18*)(C))->a13, ge52ov1302);
							}
						} else {
							t2 = (T16f4(l3, gems("-k", 2)));
							if (t2) {
								l1 = ((T4)((l1)+((T4)(geint32(1)))));
								t2 = (T4f1(&l1, l2));
								if (t2) {
									T18f24(C);
								} else {
									t1 = (T18f1(C));
									((T18*)(C))->a13 = (T24f2(t1, l1));
								}
							} else {
								t3 = (((T16*)(l3))->a2);
								t2 = (T4f1(&t3, (T4)(geint32(14))));
								if (t2) {
									t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(14))));
									t2 = (T16f4(t1, gems("--tokens-file=", 14)));
								}
								if (t2) {
									t3 = (((T16*)(l3))->a2);
									((T18*)(C))->a13 = (T16f5(l3, (T4)(geint32(15)), t3));
								} else {
									t2 = (T16f4(l3, gems("-o", 2)));
									if (t2) {
										l1 = ((T4)((l1)+((T4)(geint32(1)))));
										t2 = (T4f1(&l1, l2));
										if (t2) {
											T18f24(C);
										} else {
											t1 = (T18f1(C));
											((T18*)(C))->a7 = (T24f2(t1, l1));
										}
									} else {
										t3 = (((T16*)(l3))->a2);
										t2 = (T4f1(&t3, (T4)(geint32(14))));
										if (t2) {
											t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(14))));
											t2 = (T16f4(t1, gems("--output-file=", 14)));
										}
										if (t2) {
											t3 = (((T16*)(l3))->a2);
											((T18*)(C))->a7 = (T16f5(l3, (T4)(geint32(15)), t3));
										} else {
											t2 = (T16f4(l3, gems("-v", 2)));
											if (t2) {
												l1 = ((T4)((l1)+((T4)(geint32(1)))));
												t2 = (T4f1(&l1, l2));
												if (t2) {
													T18f24(C);
												} else {
													t1 = (T18f1(C));
													((T18*)(C))->a10 = (T24f2(t1, l1));
												}
											} else {
												t2 = (T16f4(l3, gems("-x", 2)));
												if (t2) {
													((T18*)(C))->a15 = (EIF_TRUE);
												} else {
													t3 = (((T16*)(l3))->a2);
													t2 = (T4f1(&t3, (T4)(geint32(10))));
													if (t2) {
														t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(10))));
														t2 = (T16f4(t1, gems("--verbose=", 10)));
													}
													if (t2) {
														t3 = (((T16*)(l3))->a2);
														((T18*)(C))->a10 = (T16f5(l3, (T4)(geint32(11)), t3));
													} else {
														t2 = (T16f4(l3, gems("--old_typing", 12)));
														if (t2) {
															((T18*)(C))->a3 = (EIF_TRUE);
														} else {
															t2 = (T16f4(l3, gems("--new_typing", 12)));
															if (t2) {
																((T18*)(C))->a3 = (EIF_FALSE);
															} else {
																t3 = (((T16*)(l3))->a2);
																t2 = (T4f1(&t3, (T4)(geint32(6))));
																if (t2) {
																	t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(6))));
																	t2 = (T16f4(t1, gems("--doc=", 6)));
																}
																if (t2) {
																	t3 = (((T16*)(l3))->a2);
																	((T18*)(C))->a6 = (T16f5(l3, (T4)(geint32(7)), t3));
																	t2 = (T16f4(((T18*)(C))->a6, gems("html", 4)));
																	t2 = ((T2)(!(t2)));
																	if (t2) {
																		t4 = (T16f4(((T18*)(C))->a6, gems("xml", 3)));
																		t2 = ((T2)(!(t4)));
																	}
																	if (t2) {
																		T18f24(C);
																	}
																} else {
																	t3 = (((T16*)(l3))->a2);
																	t2 = (T4f1(&t3, (T4)(geint32(9))));
																	if (t2) {
																		t1 = (T16f5(l3, (T4)(geint32(1)), (T4)(geint32(9))));
																		t2 = (T16f4(t1, gems("--pragma=", 9)));
																	}
																	if (t2) {
																		t3 = (((T16*)(l3))->a2);
																		l4 = (T16f5(l3, (T4)(geint32(10)), t3));
																		t2 = (T16f4(l4, gems("line", 4)));
																		if (t2) {
																			((T18*)(C))->a4 = (EIF_TRUE);
																		} else {
																			t2 = (T16f4(l4, gems("noline", 6)));
																			if (t2) {
																				((T18*)(C))->a4 = (EIF_FALSE);
																			} else {
																				T18f24(C);
																			}
																		}
																	} else {
																		t2 = ((l1)==(l2));
																		if (t2) {
																			((T18*)(C))->a11 = (l3);
																		} else {
																			T18f24(C);
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
		l1 = ((T4)((l1)+((T4)(geint32(1)))));
		t2 = (T4f1(&l1, l2));
	}
	t2 = ((((T18*)(C))->a11)==(EIF_VOID));
	if (t2) {
		T18f24(C);
	}
}

/* GEYACC.report_usage_error */
void T18f24(T0* C)
{
	T0* t1;
	t1 = (T18f17(C));
	T25f7(((T18*)(C))->a2, t1);
	t1 = (T18f8(C));
	T31f2(t1, (T4)(geint32(1)));
}

/* GEYACC.usage_message */
unsigned char ge52os1306 = '\0';
T0* ge52ov1306;
T0* T18f17(T0* C)
{
	T0* R = 0;
	if (ge52os1306) {
		return ge52ov1306;
	} else {
		ge52os1306 = '\1';
	}
	R = T53c7(gems("[--version][--help][-hxV\?][--(new|old)_typing]\n\t[--pragma=[no]line][--doc=(html|xml)][-t classname]\n\t[-k filename][-v filename][-o filename] filename", 149));
	ge52ov1306 = R;
	return R;
}

/* UT_USAGE_MESSAGE.make */
T0* T53c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T53));
	((T53*)(C))->id = 53;
	((T53*)(C))->a1 = T121c6((T4)(geint32(1)), (T4)(geint32(1)));
	T121f7(((T53*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* GEYACC.report_usage_message */
void T18f23(T0* C)
{
	T0* t1;
	t1 = (T18f17(C));
	T25f8(((T18*)(C))->a2, t1);
	t1 = (T18f8(C));
	T31f2(t1, (T4)(geint32(0)));
}

/* UT_ERROR_HANDLER.report_info */
void T25f8(T0* C, T0* a1)
{
	T0* t1;
	t1 = (T25f5(C, a1));
	T25f11(C, t1);
}

/* UT_ERROR_HANDLER.report_info_message */
void T25f11(T0* C, T0* a1)
{
	T33f10(((T25*)(C))->a4, a1);
}

/* GEYACC.report_version_number */
void T18f22(T0* C)
{
	T0* l1 = 0;
	T0* t1;
	l1 = T52c7(ge301ov1308);
	T25f8(((T18*)(C))->a2, l1);
	t1 = (T18f8(C));
	T31f2(t1, (T4)(geint32(0)));
}

/* UT_VERSION_NUMBER.make */
T0* T52c7(T0* a1)
{
	T0* C;
	C = (T0*)gealloc(sizeof(T52));
	((T52*)(C))->id = 52;
	((T52*)(C))->a1 = T121c6((T4)(geint32(1)), (T4)(geint32(1)));
	T121f7(((T52*)(C))->a1, a1, (T4)(geint32(1)));
	return C;
}

/* KL_ARGUMENTS.argument */
T0* T24f2(T0* C, T4 a1)
{
	T0* R = 0;
	char* s = geargv[a1];
	R = gems(s,strlen(s));
	return R;
}

/* UT_ERROR_HANDLER.make_standard */
T0* T25c6()
{
	T0* t1;
	T0* C;
	C = (T0*)gealloc(sizeof(T25));
	((T25*)(C))->id = 25;
	t1 = (T25f2(C));
	((T25*)(C))->a1 = (T32f3(t1));
	t1 = (T25f2(C));
	((T25*)(C))->a3 = (T32f3(t1));
	t1 = (T25f2(C));
	((T25*)(C))->a4 = (T32f1(t1));
	return C;
}

/* UT_ERROR_HANDLER.std */
T0* T25f2(T0* C)
{
	T0* R = 0;
	if (ge288os1312) {
		return ge288ov1312;
	} else {
		ge288os1312 = '\1';
	}
	R = T32c4();
	ge288ov1312 = R;
	return R;
}

/* KL_ARGUMENTS.set_program_name */
void T24f5(T0* C, T0* a1)
{
	((T24*)(C))->a3 = (a1);
}

/* GEYACC.arguments */
unsigned char ge304os1311 = '\0';
T0* ge304ov1311;
T0* T18f1(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* KL_ARGUMENTS.make */
T0* T24c4()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T24));
	((T24*)(C))->id = 24;
	((T24*)(C))->a3 = (T24f2(C, (T4)(geint32(0))));
	return C;
}

/* GEYACC.resurrect_code */
void T18f19(T0* C)
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
	l1 = T34c1();
	l2 = T35c1();
	l3 = T36c1();
	l4 = T37c1();
	l5 = T38c2();
	l6 = T39c2();
	l7 = T40c1();
	l8 = T41c1();
	l9 = T42c1();
	l10 = T43c1();
	l11 = T44c1();
	l12 = T45c1();
	l13 = T46c1();
}

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_STATE]].default_create */
T0* T46c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T46));
	((T46*)(C))->id = 46;
	return C;
}

/* KL_EQUALITY_TESTER [DS_ARRAYED_LIST [PR_VARIABLE]].default_create */
T0* T45c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T45));
	((T45*)(C))->id = 45;
	return C;
}

/* KL_EQUALITY_TESTER [PR_CONFLICT].default_create */
T0* T44c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T44));
	((T44*)(C))->id = 44;
	return C;
}

/* KL_EQUALITY_TESTER [PR_PORTION].default_create */
T0* T43c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T43));
	((T43*)(C))->id = 43;
	return C;
}

/* KL_EQUALITY_TESTER [PR_STATE].default_create */
T0* T42c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T42));
	((T42*)(C))->id = 42;
	return C;
}

/* KL_EQUALITY_TESTER [PR_REDUCTION].default_create */
T0* T41c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T41));
	((T41*)(C))->id = 41;
	return C;
}

/* KL_EQUALITY_TESTER [PR_TRANSITION].default_create */
T0* T40c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T40));
	((T40*)(C))->id = 40;
	return C;
}

/* KL_EQUALITY_TESTER [PR_TYPE].default_create */
T0* T37c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T37));
	((T37*)(C))->id = 37;
	return C;
}

/* KL_EQUALITY_TESTER [PR_VARIABLE].default_create */
T0* T36c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T36));
	((T36*)(C))->id = 36;
	return C;
}

/* KL_EQUALITY_TESTER [PR_TOKEN].default_create */
T0* T35c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T35));
	((T35*)(C))->id = 35;
	return C;
}

/* KL_EQUALITY_TESTER [PR_RULE].default_create */
T0* T34c1()
{
	T0* C;
	C = (T0*)gealloc(sizeof(T34));
	((T34*)(C))->id = 34;
	return C;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.default_message */
T0* T177f1(T0* C)
{
	T0* R = 0;
	R = (T177f3(C, ge156ov2171));
	return R;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.message */
T0* T177f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T177f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T177f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T177f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T177f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T177f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T177*)(C))->a5, l3));
						if (t2) {
							t1 = (T177f4(C));
							t5 = (T121f5(((T177*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T177f4(C));
								t5 = (T177f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T177f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T177f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.arguments */
T0* T177f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* KL_STRING_ROUTINES.appended_string */
T0* T116f5(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		gevoid(l1, a2);
		R = (l1);
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			R = (T116f9(C, a1, a2));
		} else {
			T16f26(a1, a2);
			R = (a1);
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.concat */
T0* T116f9(T0* C, T0* a1, T0* a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T2 t1;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		R = ((T0*)gevoid(l1, a2));
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			R = ((T0*)gevoid(l1, a1));
		} else {
			R = (T16f18(a1, a2));
		}
	}
	return R;
}

/* STRING.infix "+" */
T0* T16f18(T0* C, T0* a1)
{
	T0* R = 0;
	T4 t1;
	t1 = (((T16*)(a1))->a2);
	t1 = ((T4)((((T16*)(C))->a2)+(t1)));
	R = (T16f8(C, t1));
	T16f35(R, C);
	T16f35(R, a1);
	return R;
}

/* ARRAY [STRING].item */
T0* T121f5(T0* C, T4 a1)
{
	T0* R = 0;
	T4 t1;
	t1 = ((T4)((a1)-(((T121*)(C))->a2)));
	R = (((T120*)(((T121*)(C))->a1))->a2[t1]);
	return R;
}

/* ARRAY [STRING].valid_index */
T2 T121f4(T0* C, T4 a1)
{
	T2 R = 0;
	T2 t1;
	t1 = (T4f12(&(((T121*)(C))->a2), a1));
	if (t1) {
		R = (T4f12(&a1, ((T121*)(C))->a3));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_STRING_ROUTINES.is_integer */
T2 T116f4(T0* C, T0* a1)
{
	T2 R = 0;
	T4 l1 = 0;
	T4 l2 = 0;
	T1 l3 = 0;
	T2 t1;
	l2 = (((T16*)(a1))->a2);
	t1 = ((l2)==((T4)(geint32(0))));
	if (t1) {
		R = (EIF_FALSE);
	} else {
		R = (EIF_TRUE);
		l1 = ((T4)(geint32(1)));
		t1 = (T4f1(&l1, l2));
		while (!(t1)) {
			l3 = (T16f14(a1, l1));
			t1 = (T1f4(&l3, (T1)('0')));
			if (!(t1)) {
				t1 = (T1f5(&l3, (T1)('9')));
			}
			if (t1) {
				R = (EIF_FALSE);
				l1 = ((T4)((l2)+((T4)(geint32(1)))));
			} else {
				l1 = ((T4)((l1)+((T4)(geint32(1)))));
			}
			t1 = (T4f1(&l1, l2));
		}
	}
	return R;
}

/* CHARACTER.infix ">" */
T2 T1f5(T1* C, T1 a1)
{
	T2 R = 0;
	R = (T1f4(&a1, *C));
	return R;
}

/* CHARACTER.infix "<" */
T2 T1f4(T1* C, T1 a1)
{
	T2 R = 0;
	T4 t1;
	T4 t2;
	t1 = ((T4)(*C));
	t2 = ((T4)(a1));
	R = ((T2)((t1)<(t2)));
	return R;
}

/* KL_STRING_ROUTINES.append_substring_to_string */
void T116f11(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T1 t2;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		gevoid(l1, a2, a3, a4);
	} else {
		l2 = (a3);
		t1 = (T4f1(&l2, a4));
		while (!(t1)) {
			t2 = (T16f14(a2, l2));
			T16f28(a1, t2);
			l2 = ((T4)((l2)+((T4)(geint32(1)))));
			t1 = (T4f1(&l2, a4));
		}
	}
}

/* KL_STRING_ROUTINES.appended_substring */
T0* T116f3(T0* C, T0* a1, T0* a2, T4 a3, T4 a4)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T2 t1;
	T4 t2;
	T1 t3;
	l1 = EIF_VOID;
	t1 = ((l1)!=(EIF_VOID));
	if (t1) {
		gevoid(l1, a2, a3, a4);
		R = (l1);
	} else {
		l1 = EIF_VOID;
		t1 = ((l1)!=(EIF_VOID));
		if (t1) {
			t2 = (((T16*)(a1))->a2);
			t2 = ((T4)((t2)+(a4)));
			t2 = ((T4)((t2)-(a3)));
			t2 = ((T4)((t2)+((T4)(geint32(1)))));
			l1 = ((T0*)gevoid(l1, t2));
			gevoid(l1, a1);
			gevoid(l1, a2, a3, a4);
			R = (l1);
		} else {
			l2 = (a3);
			t1 = (T4f1(&l2, a4));
			while (!(t1)) {
				t3 = (T16f14(a2, l2));
				T16f28(a1, t3);
				l2 = ((T4)((l2)+((T4)(geint32(1)))));
				t1 = (T4f1(&l2, a4));
			}
			R = (a1);
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.new_empty_string */
T0* T116f2(T0* C, T0* a1, T4 a2)
{
	T0* R = 0;
	T0* l1 = 0;
	T0* t1;
	T2 t2;
	t1 = (T116f6(C));
	t2 = (T68f2(t1, a1, ge388ov4904));
	if (t2) {
		R = T16c25(a2);
	} else {
		l1 = EIF_VOID;
		t2 = ((l1)!=(EIF_VOID));
		if (t2) {
			R = ((T0*)gevoid(l1, a2));
		} else {
			R = (T116f8(C, a1));
			T16f27(R);
		}
	}
	return R;
}

/* KL_STRING_ROUTINES.cloned_string */
T0* T116f8(T0* C, T0* a1)
{
	T0* R = 0;
	R = (T16f9(a1));
	return R;
}

/* PR_PRECEDENCE_DEFINED_TWICE_ERROR.string_ */
T0* T177f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.default_message */
T0* T176f1(T0* C)
{
	T0* R = 0;
	R = (T176f3(C, ge168ov2171));
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.message */
T0* T176f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T176f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T176f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T176f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T176f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T176f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T176*)(C))->a5, l3));
						if (t2) {
							t1 = (T176f4(C));
							t5 = (T121f5(((T176*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T176f4(C));
								t5 = (T176f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T176f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T176f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.arguments */
T0* T176f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_UNDEFINED_STRING_TOKEN_ERROR.string_ */
T0* T176f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.default_message */
T0* T175f1(T0* C)
{
	T0* R = 0;
	R = (T175f3(C, ge171ov2171));
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.message */
T0* T175f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T175f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T175f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T175f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T175f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T175f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T175*)(C))->a5, l3));
						if (t2) {
							t1 = (T175f4(C));
							t5 = (T121f5(((T175*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T175f4(C));
								t5 = (T175f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T175f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T175f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.arguments */
T0* T175f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_VARIABLE_DECLARED_TWICE_ERROR.string_ */
T0* T175f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.default_message */
T0* T174f1(T0* C)
{
	T0* R = 0;
	R = (T174f3(C, ge162ov2171));
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.message */
T0* T174f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T174f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T174f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T174f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T174f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T174f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T174*)(C))->a5, l3));
						if (t2) {
							t1 = (T174f4(C));
							t5 = (T121f5(((T174*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T174f4(C));
								t5 = (T174f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T174f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T174f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.arguments */
T0* T174f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_TOKEN_ERROR.string_ */
T0* T174f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.default_message */
T0* T173f1(T0* C)
{
	T0* R = 0;
	R = (T173f3(C, ge164ov2171));
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.message */
T0* T173f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T173f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T173f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T173f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T173f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T173f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T173*)(C))->a5, l3));
						if (t2) {
							t1 = (T173f4(C));
							t5 = (T121f5(((T173*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T173f4(C));
								t5 = (T173f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T173f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T173f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.arguments */
T0* T173f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_TOKEN_DECLARED_TWICE_ERROR.string_ */
T0* T173f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.default_message */
T0* T172f1(T0* C)
{
	T0* R = 0;
	R = (T172f3(C, ge163ov2171));
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.message */
T0* T172f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T172f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T172f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T172f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T172f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T172f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T172*)(C))->a5, l3));
						if (t2) {
							t1 = (T172f4(C));
							t5 = (T121f5(((T172*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T172f4(C));
								t5 = (T172f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T172f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T172f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.arguments */
T0* T172f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_SYMBOL_DECLARED_VARIABLE_ERROR.string_ */
T0* T172f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.default_message */
T0* T163f1(T0* C)
{
	T0* R = 0;
	R = (T163f3(C, ge148ov2171));
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.message */
T0* T163f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T163f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T163f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T163f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T163f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T163f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T163*)(C))->a5, l3));
						if (t2) {
							t1 = (T163f4(C));
							t5 = (T121f5(((T163*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T163f4(C));
								t5 = (T163f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T163f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T163f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.arguments */
T0* T163f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_INVALID_DOLLAR_N_ERROR.string_ */
T0* T163f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.default_message */
T0* T162f1(T0* C)
{
	T0* R = 0;
	R = (T162f3(C, ge146ov2171));
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.message */
T0* T162f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T162f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T162f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T162f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T162f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T162f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T162*)(C))->a5, l3));
						if (t2) {
							t1 = (T162f4(C));
							t5 = (T121f5(((T162*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T162f4(C));
								t5 = (T162f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T162f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T162f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.arguments */
T0* T162f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_DANGEROUS_DOLLAR_N_ERROR.string_ */
T0* T162f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.default_message */
T0* T161f1(T0* C)
{
	T0* R = 0;
	R = (T161f3(C, ge161ov2171));
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.message */
T0* T161f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T161f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T161f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T161f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T161f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T161f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T161*)(C))->a5, l3));
						if (t2) {
							t1 = (T161f4(C));
							t5 = (T121f5(((T161*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T161f4(C));
								t5 = (T161f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T161f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T161f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.arguments */
T0* T161f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_STRING_TOKEN_DEFINED_TWICE_ERROR.string_ */
T0* T161f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.default_message */
T0* T160f1(T0* C)
{
	T0* R = 0;
	R = (T160f3(C, ge166ov2171));
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.message */
T0* T160f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T160f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T160f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T160f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T160f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T160f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T160*)(C))->a5, l3));
						if (t2) {
							t1 = (T160f4(C));
							t5 = (T121f5(((T160*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T160f4(C));
								t5 = (T160f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T160f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T160f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.arguments */
T0* T160f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_TWO_STRINGS_TOKEN_ERROR.string_ */
T0* T160f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.default_message */
T0* T159f1(T0* C)
{
	T0* R = 0;
	R = (T159f3(C, ge167ov2171));
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.message */
T0* T159f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T159f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T159f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T159f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T159f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T159f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T159*)(C))->a5, l3));
						if (t2) {
							t1 = (T159f4(C));
							t5 = (T121f5(((T159*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T159f4(C));
								t5 = (T159f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T159f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T159f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.arguments */
T0* T159f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_TWO_TOKEN_IDS_TOKEN_ERROR.string_ */
T0* T159f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.default_message */
T0* T158f1(T0* C)
{
	T0* R = 0;
	R = (T158f3(C, ge169ov2171));
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.message */
T0* T158f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T158f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T158f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T158f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T158f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T158f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T158*)(C))->a5, l3));
						if (t2) {
							t1 = (T158f4(C));
							t5 = (T121f5(((T158*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T158f4(C));
								t5 = (T158f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T158f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T158f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.arguments */
T0* T158f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_UNDEFINED_SYMBOL_ERROR.string_ */
T0* T158f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.default_message */
T0* T157f1(T0* C)
{
	T0* R = 0;
	R = (T157f3(C, ge165ov2171));
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.message */
T0* T157f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T157f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T157f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T157f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T157f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T157f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T157*)(C))->a5, l3));
						if (t2) {
							t1 = (T157f4(C));
							t5 = (T121f5(((T157*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T157f4(C));
								t5 = (T157f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T157f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T157f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.arguments */
T0* T157f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_TOKEN_ID_USED_TWICE_ERROR.string_ */
T0* T157f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.default_message */
T0* T156f1(T0* C)
{
	T0* R = 0;
	R = (T156f3(C, ge170ov2171));
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.message */
T0* T156f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T156f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T156f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T156f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T156f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T156f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T156*)(C))->a5, l3));
						if (t2) {
							t1 = (T156f4(C));
							t5 = (T121f5(((T156*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T156f4(C));
								t5 = (T156f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T156f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T156f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.arguments */
T0* T156f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_UNKNOWN_START_SYMBOL_ERROR.string_ */
T0* T156f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.default_message */
T0* T155f1(T0* C)
{
	T0* R = 0;
	R = (T155f3(C, ge160ov2171));
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.message */
T0* T155f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T155f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T155f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T155f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T155f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T155f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T155*)(C))->a5, l3));
						if (t2) {
							t1 = (T155f4(C));
							t5 = (T121f5(((T155*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T155f4(C));
								t5 = (T155f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T155f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T155f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.arguments */
T0* T155f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_START_SYMBOL_TOKEN_ERROR.string_ */
T0* T155f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.default_message */
T0* T154f1(T0* C)
{
	T0* R = 0;
	R = (T154f3(C, ge147ov2171));
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.message */
T0* T154f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T154f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T154f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T154f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T154f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T154f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T154*)(C))->a5, l3));
						if (t2) {
							t1 = (T154f4(C));
							t5 = (T121f5(((T154*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T154f4(C));
								t5 = (T154f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T154f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T154f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.arguments */
T0* T154f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_INVALID_DOLLAR_DOLLAR_ERROR.string_ */
T0* T154f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.default_message */
T0* T153f1(T0* C)
{
	T0* R = 0;
	R = (T153f3(C, ge150ov2171));
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.message */
T0* T153f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T153f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T153f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T153f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T153f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T153f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T153*)(C))->a5, l3));
						if (t2) {
							t1 = (T153f4(C));
							t5 = (T121f5(((T153*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T153f4(C));
								t5 = (T153f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T153f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T153f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.arguments */
T0* T153f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_INVALID_STRING_TOKEN_ERROR.string_ */
T0* T153f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_NULL_INTEGER_ERROR.default_message */
T0* T152f1(T0* C)
{
	T0* R = 0;
	R = (T152f3(C, ge155ov2171));
	return R;
}

/* PR_NULL_INTEGER_ERROR.message */
T0* T152f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T152f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T152f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T152f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T152f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T152f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T152*)(C))->a5, l3));
						if (t2) {
							t1 = (T152f4(C));
							t5 = (T121f5(((T152*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T152f4(C));
								t5 = (T152f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T152f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T152f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_NULL_INTEGER_ERROR.arguments */
T0* T152f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_NULL_INTEGER_ERROR.string_ */
T0* T152f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.default_message */
T0* T151f1(T0* C)
{
	T0* R = 0;
	R = (T151f3(C, ge152ov2171));
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.message */
T0* T151f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T151f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T151f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T151f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T151f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T151f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T151*)(C))->a5, l3));
						if (t2) {
							t1 = (T151f4(C));
							t5 = (T121f5(((T151*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T151f4(C));
								t5 = (T151f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T151f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T151f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.arguments */
T0* T151f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_MISSING_CHARACTERS_ERROR.string_ */
T0* T151f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.default_message */
T0* T150f1(T0* C)
{
	T0* R = 0;
	R = (T150f3(C, ge157ov2171));
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.message */
T0* T150f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T150f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T150f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T150f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T150f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T150f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T150*)(C))->a5, l3));
						if (t2) {
							t1 = (T150f4(C));
							t5 = (T121f5(((T150*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T150f4(C));
								t5 = (T150f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T150f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T150f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.arguments */
T0* T150f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_PREC_NOT_TOKEN_ERROR.string_ */
T0* T150f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.default_message */
T0* T149f1(T0* C)
{
	T0* R = 0;
	R = (T149f3(C, ge158ov2171));
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.message */
T0* T149f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T149f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T149f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T149f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T149f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T149f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T149*)(C))->a5, l3));
						if (t2) {
							t1 = (T149f4(C));
							t5 = (T121f5(((T149*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T149f4(C));
								t5 = (T149f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T149f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T149f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.arguments */
T0* T149f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_PREC_SPECIFIED_TWICE_ERROR.string_ */
T0* T149f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.default_message */
T0* T148f1(T0* C)
{
	T0* R = 0;
	R = (T148f3(C, ge149ov2171));
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.message */
T0* T148f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T148f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T148f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T148f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T148f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T148f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T148*)(C))->a5, l3));
						if (t2) {
							t1 = (T148f4(C));
							t5 = (T121f5(((T148*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T148f4(C));
								t5 = (T148f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T148f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T148f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.arguments */
T0* T148f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_INVALID_ERROR_N_ERROR.string_ */
T0* T148f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.default_message */
T0* T147f1(T0* C)
{
	T0* R = 0;
	R = (T147f3(C, ge159ov2171));
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.message */
T0* T147f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T147f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T147f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T147f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T147f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T147f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T147*)(C))->a5, l3));
						if (t2) {
							t1 = (T147f4(C));
							t5 = (T121f5(((T147*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T147f4(C));
								t5 = (T147f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T147f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T147f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.arguments */
T0* T147f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_RULE_DECLARED_TWICE_ERROR.string_ */
T0* T147f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.default_message */
T0* T146f1(T0* C)
{
	T0* R = 0;
	R = (T146f3(C, ge151ov2171));
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.message */
T0* T146f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T146f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T146f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T146f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T146f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T146f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T146*)(C))->a5, l3));
						if (t2) {
							t1 = (T146f4(C));
							t5 = (T121f5(((T146*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T146f4(C));
								t5 = (T146f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T146f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T146f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.arguments */
T0* T146f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_LHS_SYMBOL_TOKEN_ERROR.string_ */
T0* T146f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_NO_RULES_ERROR.default_message */
T0* T145f1(T0* C)
{
	T0* R = 0;
	R = (T145f3(C, ge154ov2171));
	return R;
}

/* PR_NO_RULES_ERROR.message */
T0* T145f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T145f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T145f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T145f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T145f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T145f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T145*)(C))->a5, l3));
						if (t2) {
							t1 = (T145f4(C));
							t5 = (T121f5(((T145*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T145f4(C));
								t5 = (T145f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T145f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T145f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_NO_RULES_ERROR.arguments */
T0* T145f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_NO_RULES_ERROR.string_ */
T0* T145f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.default_message */
T0* T144f1(T0* C)
{
	T0* R = 0;
	R = (T144f3(C, ge153ov2171));
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.message */
T0* T144f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T144f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T144f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T144f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T144f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T144f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T144*)(C))->a5, l3));
						if (t2) {
							t1 = (T144f4(C));
							t5 = (T121f5(((T144*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T144f4(C));
								t5 = (T144f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T144f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T144f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.arguments */
T0* T144f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* PR_MULTIPLE_START_DECLARATIONS_ERROR.string_ */
T0* T144f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T142f1(T0* C)
{
	T0* R = 0;
	R = (T142f3(C, ge211ov2171));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T142f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T142f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T142f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T142f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T142f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T142f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T142*)(C))->a5, l3));
						if (t2) {
							t1 = (T142f4(C));
							t5 = (T121f5(((T142*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T142f4(C));
								t5 = (T142f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T142f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T142f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T142f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T142f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T59f1(T0* C)
{
	T0* R = 0;
	R = (T59f3(C, ge209ov2171));
	return R;
}

/* UT_MESSAGE.message */
T0* T59f3(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T59f4(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T59f4(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T59f4(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T59f4(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T59f4(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T59*)(C))->a5, l3));
						if (t2) {
							t1 = (T59f4(C));
							t5 = (T121f5(((T59*)(C))->a5, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T59f4(C));
								t5 = (T59f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T59f4(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T59f4(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_MESSAGE.arguments */
T0* T59f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T59f4(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_USAGE_MESSAGE.default_message */
T0* T53f2(T0* C)
{
	T0* R = 0;
	R = (T53f4(C, ge214ov2171));
	return R;
}

/* UT_USAGE_MESSAGE.message */
T0* T53f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T53f5(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T53f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T53f5(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T53f5(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T53f5(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T53*)(C))->a1, l3));
						if (t2) {
							t1 = (T53f5(C));
							t5 = (T121f5(((T53*)(C))->a1, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T53f5(C));
								t5 = (T53f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T53f5(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T53f5(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_USAGE_MESSAGE.arguments */
T0* T53f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* UT_USAGE_MESSAGE.string_ */
T0* T53f5(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T52f2(T0* C)
{
	T0* R = 0;
	R = (T52f4(C, ge215ov2171));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T52f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T52f5(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T52f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T52f5(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T52f5(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T52f5(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T52*)(C))->a1, l3));
						if (t2) {
							t1 = (T52f5(C));
							t5 = (T121f5(((T52*)(C))->a1, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T52f5(C));
								t5 = (T52f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T52f5(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T52f5(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T52f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T52f5(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T49f2(T0* C)
{
	T0* R = 0;
	R = (T49f4(C, ge205ov2171));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T49f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T49f5(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T49f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T49f5(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T49f5(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T49f5(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T49*)(C))->a1, l3));
						if (t2) {
							t1 = (T49f5(C));
							t5 = (T121f5(((T49*)(C))->a1, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T49f5(C));
								t5 = (T49f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T49f5(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T49f5(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.arguments */
T0* T49f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T49f5(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T22f2(T0* C)
{
	T0* R = 0;
	R = (T22f4(C, ge206ov2171));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T22f4(T0* C, T0* a1)
{
	T0* R = 0;
	T0* l1 = 0;
	T4 l2 = 0;
	T4 l3 = 0;
	T4 l4 = 0;
	T1 l5 = 0;
	T2 l6 = 0;
	T2 l7 = 0;
	T2 l8 = 0;
	T0* t1;
	T2 t2;
	T4 t3;
	T4 t4;
	T0* t5;
	l2 = ((T4)(geint32(1)));
	l4 = (((T16*)(a1))->a2);
	t1 = (T22f5(C));
	R = (T116f2(t1, a1, l4));
	t2 = (T4f1(&l2, l4));
	while (!(t2)) {
		l5 = (T16f14(a1, l2));
		l2 = ((T4)((l2)+((T4)(geint32(1)))));
		t2 = ((l5)!=((T1)('$')));
		if (t2) {
			t2 = ((l5)!=((T1)('\000')));
			if (t2) {
				T16f28(R, l5);
			} else {
				t1 = (T22f5(C));
				t3 = ((T4)((l2)-((T4)(geint32(1)))));
				t4 = ((T4)((l2)-((T4)(geint32(1)))));
				R = (T116f3(t1, R, a1, t3, t4));
			}
		} else {
			t2 = (T4f1(&l2, l4));
			if (t2) {
				T16f28(R, (T1)('$'));
			} else {
				l5 = (T16f14(a1, l2));
				t2 = ((l5)==((T1)('$')));
				if (t2) {
					T16f28(R, (T1)('$'));
					l2 = ((T4)((l2)+((T4)(geint32(1)))));
				} else {
					t1 = (T22f5(C));
					l1 = (T116f2(t1, a1, (T4)(geint32(5))));
					t2 = ((l5)==((T1)('{')));
					if (t2) {
						l7 = (EIF_TRUE);
						l8 = (EIF_FALSE);
						l2 = ((T4)((l2)+((T4)(geint32(1)))));
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l8);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							t2 = ((l5)==((T1)('}')));
							if (t2) {
								l8 = (EIF_TRUE);
							} else {
								t2 = ((l5)!=((T1)('\000')));
								if (t2) {
									T16f28(l1, l5);
								} else {
									t1 = (T22f5(C));
									T116f11(t1, l1, a1, l2, l2);
								}
							}
							l2 = ((T4)((l2)+((T4)(geint32(1)))));
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l8);
							}
						}
					} else {
						l7 = (EIF_FALSE);
						l8 = (EIF_FALSE);
						l6 = (EIF_FALSE);
						t2 = (T4f1(&l2, l4));
						if (!(t2)) {
							t2 = (l6);
						}
						while (!(t2)) {
							l5 = (T16f14(a1, l2));
							switch (l5) {
							case (T1)'0':
							case (T1)'1':
							case (T1)'2':
							case (T1)'3':
							case (T1)'4':
							case (T1)'5':
							case (T1)'6':
							case (T1)'7':
							case (T1)'8':
							case (T1)'9':
								T16f28(l1, l5);
								l2 = ((T4)((l2)+((T4)(geint32(1)))));
								break;
							default:
								l6 = (EIF_TRUE);
								break;
							}
							t2 = (T4f1(&l2, l4));
							if (!(t2)) {
								t2 = (l6);
							}
						}
					}
					t1 = (T22f5(C));
					t2 = (T116f4(t1, l1));
					if (t2) {
						l3 = (T16f15(l1));
						t2 = (T121f4(((T22*)(C))->a1, l3));
						if (t2) {
							t1 = (T22f5(C));
							t5 = (T121f5(((T22*)(C))->a1, l3));
							R = (T116f5(t1, R, t5));
						} else {
							t2 = ((l3)==((T4)(geint32(0))));
							if (t2) {
								t1 = (T22f5(C));
								t5 = (T22f6(C));
								t5 = (((T24*)(t5))->a3);
								R = (T116f5(t1, R, t5));
							} else {
								T16f28(R, (T1)('$'));
								if (l7) {
									T16f28(R, (T1)('{'));
								}
								t1 = (T22f5(C));
								R = (T116f5(t1, R, l1));
								if (l8) {
									T16f28(R, (T1)('}'));
								}
							}
						}
					} else {
						T16f28(R, (T1)('$'));
						if (l7) {
							T16f28(R, (T1)('{'));
						}
						t1 = (T22f5(C));
						R = (T116f5(t1, R, l1));
						if (l8) {
							T16f28(R, (T1)('}'));
						}
					}
				}
			}
		}
		t2 = (T4f1(&l2, l4));
	}
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.arguments */
T0* T22f6(T0* C)
{
	T0* R = 0;
	if (ge304os1311) {
		return ge304ov1311;
	} else {
		ge304os1311 = '\1';
	}
	R = T24c4();
	ge304ov1311 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T22f5(T0* C)
{
	T0* R = 0;
	if (ge258os1313) {
		return ge258ov1313;
	} else {
		ge258os1313 = '\1';
	}
	R = T116c10();
	ge258ov1313 = R;
	return R;
}

T0* gema99(T4 c, ...)
{
	T0* R;
	T0* a;
	a = (T0*)gealloc(sizeof(T98)+c*sizeof(T4));
	((T98*)(a))->id = 98;
	((T98*)(a))->a1 = c;
	if (c!=0) {
		va_list v;
		T4 n = c;
		T4 *i = ((T98*)(a))->a2;
		va_start(v, c);
		while (n--) {
			*(i++) = va_arg(v, T4);
		}
		va_end(v);
	}
	R = (T0*)gealloc(sizeof(T99));
	((T99*)(R))->id = 99;
	((T99*)(R))->a1 = a;
	((T99*)(R))->a2 = 1;
	((T99*)(R))->a3 = (T4)c;
	return R;
}

int gevoid(T0* C, ...){
	printf("Call on Void target!\n");
	exit(1);
}

int geargc;
char** geargv;

T0* ge301ov1308;
T0* ge180ov1378;
T0* ge216ov4852;
T0* ge216ov4851;
T0* ge216ov4850;
T0* ge216ov4849;
T0* ge388ov4904;
T0* ge386ov1447;
T0* ge391ov1447;
T0* ge180ov1380;
T0* ge384ov1447;
T0* ge361ov1477;
T0* ge385ov4265;
T0* ge372ov3979;
T0* ge52ov1302;
T0* ge156ov2171;
T0* ge168ov2171;
T0* ge171ov2171;
T0* ge162ov2171;
T0* ge164ov2171;
T0* ge163ov2171;
T0* ge148ov2171;
T0* ge146ov2171;
T0* ge161ov2171;
T0* ge166ov2171;
T0* ge167ov2171;
T0* ge169ov2171;
T0* ge165ov2171;
T0* ge170ov2171;
T0* ge160ov2171;
T0* ge147ov2171;
T0* ge150ov2171;
T0* ge155ov2171;
T0* ge152ov2171;
T0* ge157ov2171;
T0* ge158ov2171;
T0* ge149ov2171;
T0* ge159ov2171;
T0* ge151ov2171;
T0* ge154ov2171;
T0* ge153ov2171;
T0* ge211ov2171;
T0* ge209ov2171;
T0* ge214ov2171;
T0* ge215ov2171;
T0* ge205ov2171;
T0* ge206ov2171;

void geconst()
{
	ge301ov1308 = (gems("3.4", 3));
	ge180ov1378 = (gems("\t\t\t", 3));
	ge216ov4852 = (gems("\t\t\t", 3));
	ge216ov4851 = (gems("    ", 4));
	ge216ov4850 = (gems("   ", 3));
	ge216ov4849 = (gems("  ", 2));
	ge388ov4904 = (gems("", 0));
	ge386ov1447 = (gems("\n", 1));
	ge391ov1447 = (gems("\n", 1));
	ge180ov1380 = (gems("standard input", 14));
	ge384ov1447 = (gems("\n", 1));
	ge361ov1477 = (gems("empty_name", 10));
	ge385ov4265 = (gems("", 0));
	ge372ov3979 = (gems("", 0));
	ge52ov1302 = (gems(".e", 2));
	ge156ov2171 = (gems("\"$1\", line $2: precedence of $3 defined twice", 45));
	ge168ov2171 = (gems("\"$1\", line $2: undefined literal string token $3", 48));
	ge171ov2171 = (gems("\"$1\", line $2: nonterminal $3 declared twice", 44));
	ge162ov2171 = (gems("\"$1\", line $2: symbol $3 is already declared as a token", 55));
	ge164ov2171 = (gems("\"$1\", line $2: token $3 declared twice", 38));
	ge163ov2171 = (gems("\"$1\", line $2: symbol $3 is already declared as a nonterminal", 61));
	ge148ov2171 = (gems("\"$1\", line $2: invalid use of $$$3 in semantic action", 53));
	ge146ov2171 = (gems("Warning, \"$1\", line $2: dangerous use of $$$3 in semantic action", 64));
	ge161ov2171 = (gems("\"$1\", line $2: literal string $3 defined twice with $4 and $5", 61));
	ge166ov2171 = (gems("\"$1\", line $2: token $3 associated with two literal strings $4 and $5", 69));
	ge167ov2171 = (gems("\"$1\", line $2: token $3 has two different ids $4 and $5", 55));
	ge169ov2171 = (gems("\"$1\": undefined symbol $2", 25));
	ge165ov2171 = (gems("Warning, \"$1\": tokens $2 and $3 both assigned number $4", 55));
	ge170ov2171 = (gems("\"$1\", line $2: unknown start symbol $3", 38));
	ge160ov2171 = (gems("\"$1\", line $2: start symbol $3 is a token", 41));
	ge147ov2171 = (gems("\"$1\", line $2: invalid use of $$$$ in error action", 50));
	ge150ov2171 = (gems("\"$1\", line $2: literal string tokens must have a least two characters ($3)", 74));
	ge155ov2171 = (gems("\"$1\", line $2: integer cannot be null", 37));
	ge152ov2171 = (gems("\"$1\", line $2: missing $3", 25));
	ge157ov2171 = (gems("\"$1\", line $2: symbol $3 after \045prec is not a token", 51));
	ge158ov2171 = (gems("\"$1\", line $2: \045prec specified twice", 36));
	ge149ov2171 = (gems("\"$1\", line $2: invalid use of \045error($3) in rule", 48));
	ge159ov2171 = (gems("Warning, \"$1\", line $2: rule $3 declared twice", 46));
	ge151ov2171 = (gems("\"$1\", line $2: left-hand-side symbol $3 is a token", 50));
	ge154ov2171 = (gems("\"$1\": no rules in input grammar", 31));
	ge153ov2171 = (gems("\"$1\", line $2: multiple \045start declarations", 43));
	ge211ov2171 = (gems("Syntax error in \"$1\" at line $2", 31));
	ge209ov2171 = (gems("$1", 2));
	ge214ov2171 = (gems("usage: $0 $1", 12));
	ge215ov2171 = (gems("$0 version $1", 13));
	ge205ov2171 = (gems("$0: cannot read \'$1\'", 20));
	ge206ov2171 = (gems("$0: cannot write to \'$1\'", 24));
}

EIF_TYPE getypes[286] = {
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_FALSE},
{0, EIF_TRUE},
{0, EIF_FALSE},
{0, EIF_FALSE}
};

int main(int argc, char** argv)
{
	T0* l1;
	geargc = argc;
	geargv = argv;
	geconst();
	l1 = T18c18();
	return 0;
}

/*
	description:

		"C functions used to implement class FILE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_FILE_C
#define EIF_FILE_C

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifdef EIF_WINDOWS
#include <sys/utime.h>
#include <io.h> /* for access, chmod */
#else
#include <utime.h>
#include <unistd.h>
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

void file_mkdir(char* dirname) {
#ifdef WIN32
	mkdir(dirname);
#else
	mkdir(dirname, 0777);
#endif
}

void file_rename(char* old, char* new) {
#ifdef WIN32
	struct stat buf;

	if (stat(new, &buf) != -1) {
		remove (new);
	}
#endif
	rename(old, new);
}

void file_link(char *from, char *to) {
		/* Link file `from' into `to' */
#ifdef HAS_LINK
	link(from, to);
#endif
}

void file_unlink(char *name) {
		/* Delete file or directory `name' */
	struct stat buf;

	if (stat(name, &buf) != -1) {
		if (buf.st_mode & S_IFDIR) {
			rmdir(name);
		} else {
			remove(name);
		}
	}
}

static char* file_open_mode(int how) {
	switch (how) {
	case 0: 
		return "r";
	case 1:
		return "w";
	case 2:
		return "a";
	case 3:
		return "r+";
	case 4:
		return "w+";
	case 5:
		return "a+";
	case 10: 
		return "rb";
	case 11:
		return "wb";
	case 12:
		return "ab";
	case 13:
		return "rb+";
	case 14:
		return "wb+";
	case 15:
		return "ab+";
	default:
		return "r";
	}
}

EIF_POINTER file_open(char *name, int how) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)fopen(name, file_open_mode(how));
}

EIF_POINTER file_dopen(int fd, int how) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)fdopen(fd, file_open_mode(how));
}

EIF_POINTER file_reopen(char *name, int how, FILE *old) {
	/* TODO: raise an exception if could not open file */
	return (EIF_POINTER)freopen(name, file_open_mode(how), old);
}

void file_close(FILE *fp) {
	fclose(fp);
}

void file_flush(FILE *fp) {
	fflush(fp);
}

EIF_INTEGER file_fd(FILE *f) {
	return (EIF_INTEGER)fileno(f);
}

EIF_CHARACTER file_gc(FILE *f) {
	return (EIF_CHARACTER)getc(f);
}

EIF_INTEGER file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = '\0';
	EIF_INTEGER read;

	amount = bound - start;
	s += start;
	read = 0;
	while (amount-- > 0) {
		if ((c = getc(f)) == '\n' || c == EOF)
			break;
		*s++ = c;
		read++;
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

EIF_INTEGER file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	return (EIF_INTEGER)fread((void*)s, (size_t)1, (size_t)bound, f);
}

EIF_INTEGER file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;
	int c = 0;

	amount = bound - start;
	s += start;
	if (start == 0) {
		while ((c = getc(f)) != EOF)
			if (!isspace(c))
				break;
		if (c == EOF)
			return (EIF_INTEGER) 0;
		else
			ungetc(c, f);
	}
	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF)
			break;
		if (isspace(c)) {
			ungetc(c, f);
			break;
		}
		*s++ = c;
	}
	if (c == EOF || isspace(c))
		return bound - start - amount - 1;
	return bound - start + 1;
}

EIF_CHARACTER file_lh(FILE *f) {
	int c;

	c = getc(f);
	if (c != EOF)
		ungetc(c, f);
	return (EIF_CHARACTER)(c == EOF ? (char)0 : (char)c);
}

EIF_INTEGER eif_file_size(FILE *fp) {
	struct stat buf;

	fflush (fp);
	if (fstat(fileno(fp), &buf) == -1)
		return (EIF_INTEGER)0;
	else
		return (EIF_INTEGER)(buf.st_size);
}

void file_tnil(FILE *f) {
	int c;

	while ((c = getc(f)) != '\n' && c != EOF)
		;
}

EIF_INTEGER file_tell(FILE *f) {
	return (EIF_INTEGER)ftell(f);
}

void file_touch(char *name) {
	file_utime(name, time((time_t *) 0), 2);
}

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
	utime(name, &tp);
}

void file_stat(char *path, struct stat *buf) {
	stat(path, buf);
}

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
				break;
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
				break;
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
				break;
			}
		break;
	default:
		break;
	}
    file_chmod(name, fmode);
}

void file_chmod(char *path, int mode) {
	chmod(path, mode);
}

void file_chown(char *name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	struct stat buf;
	
	file_stat(name, &buf);
	gid = buf.st_gid;
	chown(name, uid, gid);
#endif
}

void file_chgrp(char *name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	struct stat buf;
	
	file_stat(name, &buf);
	uid = buf.st_uid;
	chown(name, uid, gid);
#endif
}

void file_tnwl(FILE *f) {
	putc('\n', f);
}

void file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	fseek(other, 0, SEEK_SET);
	fseek(f, 0, SEEK_END);
	while (l > 0) {
		amount = l;
		if (l < bufsize)
			amount = l;
		else
			amount = bufsize;
		if (amount != fread(buffer, sizeof(char), amount, other))
			break;
		l -= amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f))
			break;
	}
}

void file_ps(FILE *f, char *str, EIF_INTEGER len) {
	fwrite(str, sizeof(char) * len, 1, f);
}

void file_pc(FILE *f, char c) {
	putc(c, f);
}

void file_go(FILE *f, EIF_INTEGER pos) {
	fseek(f, pos, SEEK_SET);
	clearerr(f);
}

void file_recede(FILE *f, EIF_INTEGER pos) {
	fseek(f, -pos, SEEK_END);
	clearerr(f);
}

void file_move(FILE *f, EIF_INTEGER pos) {
	fseek(f, pos, SEEK_CUR);
	clearerr(f);
}

EIF_BOOLEAN file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

EIF_BOOLEAN file_exists(char *name) {
	struct stat buf;

	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
}

EIF_BOOLEAN file_path_exists(char *name) {
	struct stat buf;

	return ((stat(name, &buf) == -1) ? EIF_FALSE : EIF_TRUE);
}

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

static void swallow_nl(FILE *f) {
		/* Swallow next character if it is a new line */
	if (f != stdin) {
		fscanf (f, "\n");
	} else {
		int c;
		c = getc(f);
		if (c != '\n')
			ungetc(c, f);
	}
}

EIF_INTEGER file_gi(FILE *f) {
	EIF_INTEGER i;     

	fscanf(f, "%d", &i);
	swallow_nl(f);
	return i;
}

EIF_REAL_32 file_gr(FILE *f) {
	EIF_REAL_32 r;     

	fscanf(f, "%f", &r);
	swallow_nl(f);
	return r;
}

EIF_REAL_64 file_gd(FILE *f) {
	EIF_REAL_64 d;     

	fscanf(f, "%lf", &d);
	swallow_nl(f);
	return d;
}

void file_pi(FILE *f, EIF_INTEGER number) {
	fprintf(f, "%d", number);
}

void file_pr(FILE *f, EIF_REAL_32 number) {
    fprintf (f, "%g", number);
}

void file_pd(FILE *f, EIF_REAL_64 val) {
	fprintf(f, "%.17g", val);
}

EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(struct stat);
}

EIF_BOOLEAN file_eaccess(struct stat *buf, int op) {
	int mode = buf->st_mode & ST_MODE;	/* Current mode */
#ifndef WIN32
	int uid = buf->st_uid;				/* File owner */
	int gid = buf->st_gid;				/* File group */
	int euid, egid;						/* Effective user and group */
#endif

    switch (op) {
	case 0: /* Is file readable */
#ifdef WIN32
	return ((mode && S_IREAD) ? EIF_TRUE : EIF_FALSE);
#else
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IRUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
		else
#endif
			return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
	case 1: /* Is file writable */
#ifdef WIN32
	return ((mode & S_IWRITE) ? EIF_TRUE : EIF_FALSE);
#else
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IWUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
		else
#endif
			return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
	case 2: /* Is file executable */
#ifdef WIN32
	return EIF_TRUE;
#else
		euid = geteuid();
		egid = getegid();

		if (euid == 0)
			return EIF_TRUE;
		else if (uid == euid)
			return ((mode & S_IXUSR) ? EIF_TRUE : EIF_FALSE);
		else if (gid == egid)
			return ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
		else
#endif
			return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
	case 3: /* Is file setuid */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISUID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 4: /* Is file setgid */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISGID) ? EIF_TRUE : EIF_FALSE);
#endif
	case 5: /* Is file sticky */
#ifdef WIN32
		return EIF_FALSE;
#else
		return ((mode & S_ISVTX) ? EIF_TRUE : EIF_FALSE);
#endif
	case 6: /* Is file owned by effective UID */
#ifdef WIN32
		return EIF_TRUE;
#else
		return ((uid == geteuid()) ? EIF_TRUE : EIF_FALSE);
#endif
	case 7: /* Is file owned by real UID */
#ifdef WIN32
		return EIF_TRUE;
#else
		return ((uid == getuid()) ? EIF_TRUE : EIF_FALSE);
#endif
	default:
		break;
	}
	return EIF_FALSE;
}

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
		return (EIF_INTEGER)0;
	case 14: /* Is file a device */
		if (buf->st_mode & S_IFCHR)
			return (EIF_INTEGER)S_IFCHR;
		if (buf->st_mode & S_IFBLK)
			return (EIF_INTEGER)S_IFBLK;
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
		break;
    }
	return (EIF_INTEGER)0;
}

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
	return gems(str, strlen(str));
}

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
	return gems(str, strlen(str));
}

EIF_INTEGER file_gib(FILE* f) {
	EIF_INTEGER i;     

	fread (&i, sizeof(EIF_INTEGER), 1, f);
	return i;
}

EIF_REAL_32 file_grb(FILE* f) {
	EIF_REAL_32 r;     

	fread (&r, sizeof(EIF_REAL_32), 1, f);
	return r;
}

EIF_REAL_64 file_gdb(FILE* f) {
	EIF_REAL_64 d;     

	fread (&d, sizeof(EIF_REAL_64), 1, f);
	return d;
}

EIF_POINTER file_binary_open(char* name, int how) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)fopen(name, file_open_mode(how + 10));
	else
		return (EIF_POINTER)fopen(name, file_open_mode(how));
}

EIF_POINTER file_binary_dopen(int fd, int how) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)fdopen(fd, file_open_mode(how + 10));
	else
		return (EIF_POINTER)fdopen(fd, file_open_mode(how));
}

EIF_POINTER file_binary_reopen(char* name, int how, FILE* old) {
	/* TODO: raise an exception if could not open file */
	if (how < 10)
		return (EIF_POINTER)freopen(name, file_open_mode(how + 10), old);
	else
		return (EIF_POINTER)freopen(name, file_open_mode(how), old);
}

void file_pib(FILE* f, EIF_INTEGER number) {
	fwrite(&number, sizeof(EIF_INTEGER), 1, f);
}

void file_prb(FILE* f, EIF_REAL_32 number) {
    fwrite(&number, sizeof(EIF_REAL_32), 1, f);
}

void file_pdb(FILE* f, EIF_REAL_64 val) {
	fwrite (&val, sizeof(EIF_REAL_64), 1, f);
}

#endif
/*
	description:

		"C functions used to implement class CONSOLE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CONSOLE_C
#define EIF_CONSOLE_C

#include <stdio.h>

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
	return file_feof(fp);
}

EIF_CHARACTER console_separator(FILE *f) {
	return file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
	file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
	file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER c) {
	file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
	file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
	file_pi(f, number);
}

void console_tnwl(FILE* f) {
	console_pc(f,'\n');
}

EIF_CHARACTER console_readchar(FILE* f) {
	return file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
	return file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
	return file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
	return file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	return file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	return file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
	file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
	return file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
	file_close(f);
}

#endif
/*
	description:

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C

void eraise(char* name, long code) {
	/* TODO */
	printf("'eraise' in 'eif_except.h' not implemented\n");
}

void esdie(int code) {
	exit(code);
}

EIF_REFERENCE eename(long except) {
	/* TODO */
	printf("'eename' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeltag(void) {
	/* TODO */
	printf("'eeltag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelrout(void) {
	/* TODO */
	printf("'eelrout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eelclass(void) {
	/* TODO */
	printf("'eelclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eelcode(void) {
	/* TODO */
	printf("'eelcode' in 'eif_except.h' not implemented\n");
	return 0;
}

EIF_REFERENCE stack_trace_string(void) {
	/* TODO */
	printf("'stack_trace_string' in 'eif_except.h' not implemented\n");
	return EIF_VOID;
}

char* eeotag(void) {
	/* TODO */
	printf("'eeotag' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

long eeocode(void) {
	/* TODO */
	printf("'eeocode' in 'eif_except.h' not implemented\n");
	return 0;
}

char* eeorout(void) {
	/* TODO */
	printf("'eeorout' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

char* eeoclass(void) {
	/* TODO */
	printf("'eeoclass' in 'eif_except.h' not implemented\n");
	return (char *)0;
}

void eecatch(long code) {
	/* TODO */
	printf("'eecatch' in 'eif_except.h' not implemented\n");
}

void eeignore(long code) {
	/* TODO */
	printf("'eeignore' in 'eif_except.h' not implemented\n");
}

void eetrace(char b) {
	/* TODO */
	printf("'eetrace' in 'eif_except.h' not implemented\n");
}

#endif
