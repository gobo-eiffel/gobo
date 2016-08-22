#include "gec.h"

#ifdef __cplusplus
extern "C" {
#endif

/* LX_UNRECOGNIZED_RULE_ERROR.arguments */
T0* T1761f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* LX_UNRECOGNIZED_RULE_ERROR.string_ */
T0* T1761f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.default_message */
T0* T1699f12(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T1699f7(ac, C, ((T1699*)(C))->a1));
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.message */
T0* T1699f7(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1699f9(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T1699f9(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1699f9(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T1699f9(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T1699*)(C))->a2), l3));
						if (t2) {
							t1 = (T1699f9(ac, C));
							t5 = (T142f5(ac, GE_void(((T1699*)(C))->a2), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1699f9(ac, C));
								t5 = (T1699f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T1699f9(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T1699f9(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.arguments */
T0* T1699f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_DOTNET_ASSEMBLY_ERROR.string_ */
T0* T1699f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_SYNTAX_ERROR.default_message */
T0* T1555f11(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T1555f14(ac, C, ((T1555*)(C))->a1));
	return R;
}

/* ET_SYNTAX_ERROR.message */
T0* T1555f14(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1555f16(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T1555f16(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1555f16(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T1555f16(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T1555*)(C))->a2), l3));
						if (t2) {
							t1 = (T1555f16(ac, C));
							t5 = (T142f5(ac, GE_void(((T1555*)(C))->a2), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1555f16(ac, C));
								t5 = (T1555f12(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T1555f16(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T1555f16(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_SYNTAX_ERROR.arguments */
T0* T1555f12(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_SYNTAX_ERROR.string_ */
T0* T1555f16(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_CLUSTER_ERROR.default_message */
T0* T1554f12(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T1554f7(ac, C, ((T1554*)(C))->a1));
	return R;
}

/* ET_CLUSTER_ERROR.message */
T0* T1554f7(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T1554f9(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T1554f9(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1554f9(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T1554f9(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T1554*)(C))->a2), l3));
						if (t2) {
							t1 = (T1554f9(ac, C));
							t5 = (T142f5(ac, GE_void(((T1554*)(C))->a2), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1554f9(ac, C));
								t5 = (T1554f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T1554f9(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T1554f9(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_CLUSTER_ERROR.arguments */
T0* T1554f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_CLUSTER_ERROR.string_ */
T0* T1554f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.default_message */
T0* T1396f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T1396f3(ac, C, ge1138ov4876));
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.message */
T0* T1396f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T1396f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T1396f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1396f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T1396f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T1396*)(C))->a1), l3));
						if (t2) {
							t1 = (T1396f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T1396*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1396f4(ac, C));
								t5 = (T1396f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T1396f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T1396f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T1396f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_INVALID_EXPRESSION_ERROR.string_ */
T0* T1396f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.default_message */
T0* T1343f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T1343f3(ac, C, ge169ov4876));
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.message */
T0* T1343f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T1343f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T1343f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1343f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T1343f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T1343*)(C))->a1), l3));
						if (t2) {
							t1 = (T1343f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T1343*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1343f4(ac, C));
								t5 = (T1343f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T1343f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T1343f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.arguments */
T0* T1343f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* UT_TOO_MANY_INCLUDES_ERROR.string_ */
T0* T1343f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* UT_SYNTAX_ERROR.default_message */
T0* T1342f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T1342f3(ac, C, ge168ov4876));
	return R;
}

/* UT_SYNTAX_ERROR.message */
T0* T1342f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T1342f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T1342f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T1342f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T1342f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T1342*)(C))->a1), l3));
						if (t2) {
							t1 = (T1342f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T1342*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T1342f4(ac, C));
								t5 = (T1342f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T1342f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T1342f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_SYNTAX_ERROR.arguments */
T0* T1342f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* UT_SYNTAX_ERROR.string_ */
T0* T1342f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T789f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T789f3(ac, C, ge1132ov4876));
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T789f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T789f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T789f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T789f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T789f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T789*)(C))->a1), l3));
						if (t2) {
							t1 = (T789f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T789*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T789f4(ac, C));
								t5 = (T789f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T789f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T789f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T789f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T789f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.default_message */
T0* T788f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T788f3(ac, C, ge1148ov4876));
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.message */
T0* T788f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T788f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T788f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T788f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T788f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T788*)(C))->a1), l3));
						if (t2) {
							t1 = (T788f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T788*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T788f4(ac, C));
								t5 = (T788f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T788f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T788f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T788f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_UNKNOWN_OPTION_NAME_WARNING.string_ */
T0* T788f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.default_message */
T0* T787f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T787f3(ac, C, ge1145ov4876));
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.message */
T0* T787f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T787f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T787f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T787f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T787f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T787*)(C))->a1), l3));
						if (t2) {
							t1 = (T787f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T787*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T787f4(ac, C));
								t5 = (T787f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T787f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T787f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T787f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING.string_ */
T0* T787f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.default_message */
T0* T786f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T786f3(ac, C, ge1144ov4876));
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.message */
T0* T786f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T786f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T786f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T786f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T786f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T786*)(C))->a1), l3));
						if (t2) {
							t1 = (T786f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T786*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T786f4(ac, C));
								t5 = (T786f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T786f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T786f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T786f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING.string_ */
T0* T786f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.default_message */
T0* T785f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T785f3(ac, C, ge1140ov4876));
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.message */
T0* T785f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T785f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T785f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T785f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T785f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T785*)(C))->a1), l3));
						if (t2) {
							t1 = (T785f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T785*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T785f4(ac, C));
								t5 = (T785f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T785f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T785f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T785f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_MISSING_ELEMENT_ERROR.string_ */
T0* T785f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.default_message */
T0* T784f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T784f3(ac, C, ge1147ov4876));
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.message */
T0* T784f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T784f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T784f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T784f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T784f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T784*)(C))->a1), l3));
						if (t2) {
							t1 = (T784f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T784*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T784f4(ac, C));
								t5 = (T784f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T784f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T784f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T784f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_UNKNOWN_ELEMENT_ERROR.string_ */
T0* T784f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.default_message */
T0* T783f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T783f3(ac, C, ge1139ov4876));
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.message */
T0* T783f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T783f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T783f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T783f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T783f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T783*)(C))->a1), l3));
						if (t2) {
							t1 = (T783f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T783*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T783f4(ac, C));
								t5 = (T783f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T783f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T783f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T783f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_MISSING_ATTRIBUTE_ERROR.string_ */
T0* T783f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.default_message */
T0* T782f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T782f3(ac, C, ge1151ov4876));
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.message */
T0* T782f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T782f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T782f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T782f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T782f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T782*)(C))->a1), l3));
						if (t2) {
							t1 = (T782f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T782*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T782f4(ac, C));
								t5 = (T782f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T782f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T782f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T782f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_WRONG_ROOT_ELEMENT_ERROR.string_ */
T0* T782f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_VALIDITY_ERROR.default_message */
T0* T537f35(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T537f16(ac, C, ((T537*)(C))->a3));
	return R;
}

/* ET_VALIDITY_ERROR.message */
T0* T537f16(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T537f34(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T537f34(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T537f34(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T537f34(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T537*)(C))->a4), l3));
						if (t2) {
							t1 = (T537f34(ac, C));
							t5 = (T142f5(ac, GE_void(((T537*)(C))->a4), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T537f34(ac, C));
								t5 = (T537f13(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T537f34(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T537f34(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_VALIDITY_ERROR.arguments */
T0* T537f13(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_VALIDITY_ERROR.string_ */
T0* T537f34(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_INTERNAL_ERROR.default_message */
T0* T536f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T536f7(ac, C, ((T536*)(C))->a1));
	return R;
}

/* ET_INTERNAL_ERROR.message */
T0* T536f7(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T536f9(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T536f9(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T536f9(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T536f9(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T536*)(C))->a2), l3));
						if (t2) {
							t1 = (T536f9(ac, C));
							t5 = (T142f5(ac, GE_void(((T536*)(C))->a2), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T536f9(ac, C));
								t5 = (T536f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T536f9(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T536f9(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_INTERNAL_ERROR.arguments */
T0* T536f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_INTERNAL_ERROR.string_ */
T0* T536f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_SYSTEM_ERROR.default_message */
T0* T535f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T535f7(ac, C, ((T535*)(C))->a1));
	return R;
}

/* ET_SYSTEM_ERROR.message */
T0* T535f7(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T535f9(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T535f9(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T535f9(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T535f9(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T535*)(C))->a2), l3));
						if (t2) {
							t1 = (T535f9(ac, C));
							t5 = (T142f5(ac, GE_void(((T535*)(C))->a2), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T535f9(ac, C));
								t5 = (T535f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T535f9(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T535f9(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* ET_SYSTEM_ERROR.arguments */
T0* T535f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_SYSTEM_ERROR.string_ */
T0* T535f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.default_message */
T0* T433f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T433f3(ac, C, ge1135ov4876));
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.message */
T0* T433f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T433f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T433f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T433f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T433f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T433*)(C))->a1), l3));
						if (t2) {
							t1 = (T433f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T433*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T433f4(ac, C));
								t5 = (T433f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T433f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T433f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T433f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING.string_ */
T0* T433f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.default_message */
T0* T432f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T432f3(ac, C, ge1146ov4876));
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.message */
T0* T432f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T432f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T432f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T432f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T432f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T432*)(C))->a1), l3));
						if (t2) {
							t1 = (T432f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T432*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T432f4(ac, C));
								t5 = (T432f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T432f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T432f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T432f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR.string_ */
T0* T432f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.default_message */
T0* T431f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T431f3(ac, C, ge1150ov4876));
	return R;
}

/* ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR.message */
T0* T431f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T431f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T431f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T431f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T431f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T431*)(C))->a1), l3));
						if (t2) {
							t1 = (T431f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T431*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T431f4(ac, C));
								t5 = (T431f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T431f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T431f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T431f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.default_message */
T0* T430f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T430f3(ac, C, ge1142ov4876));
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.message */
T0* T430f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T430f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T430f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T430f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T430f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T430*)(C))->a1), l3));
						if (t2) {
							t1 = (T430f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T430*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T430f4(ac, C));
								t5 = (T430f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T430f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T430f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T430f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR.string_ */
T0* T430f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.default_message */
T0* T429f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T429f3(ac, C, ge1133ov4876));
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.message */
T0* T429f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T429f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T429f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T429f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T429f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T429*)(C))->a1), l3));
						if (t2) {
							t1 = (T429f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T429*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T429f4(ac, C));
								t5 = (T429f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T429f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T429f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T429f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_BOOLEAN_EXPECTED_ERROR.string_ */
T0* T429f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.default_message */
T0* T428f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T428f3(ac, C, ge1141ov4876));
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.message */
T0* T428f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T428f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T428f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T428f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T428f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T428*)(C))->a1), l3));
						if (t2) {
							t1 = (T428f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T428*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T428f4(ac, C));
								t5 = (T428f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T428f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T428f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T428f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR.string_ */
T0* T428f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.default_message */
T0* T307f3(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T307f5(ac, C, ge163ov4876));
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.message */
T0* T307f5(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T307f6(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T307f6(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T307f6(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T307f6(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T307*)(C))->a1), l3));
						if (t2) {
							t1 = (T307f6(ac, C));
							t5 = (T142f5(ac, GE_void(((T307*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T307f6(ac, C));
								t5 = (T307f7(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T307f6(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T307f6(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T307f7(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* UT_CANNOT_WRITE_TO_FILE_ERROR.string_ */
T0* T307f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* UT_MESSAGE.default_message */
T0* T168f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T168f3(ac, C, ge166ov4876));
	return R;
}

/* UT_MESSAGE.message */
T0* T168f3(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T168f4(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T168f4(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T168f4(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T168f4(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T168*)(C))->a1), l3));
						if (t2) {
							t1 = (T168f4(ac, C));
							t5 = (T142f5(ac, GE_void(((T168*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T168f4(ac, C));
								t5 = (T168f6(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T168f4(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T168f4(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T168f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* UT_MESSAGE.string_ */
T0* T168f4(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* UT_VERSION_NUMBER.default_message */
T0* T87f3(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T87f5(ac, C, ge173ov4876));
	return R;
}

/* UT_VERSION_NUMBER.message */
T0* T87f5(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T87f6(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T87f6(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T87f6(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T87f6(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T87*)(C))->a1), l3));
						if (t2) {
							t1 = (T87f6(ac, C));
							t5 = (T142f5(ac, GE_void(((T87*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T87f6(ac, C));
								t5 = (T87f7(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T87f6(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T87f6(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* UT_VERSION_NUMBER.arguments */
T0* T87f7(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* UT_VERSION_NUMBER.string_ */
T0* T87f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.default_message */
T0* T86f3(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T86f5(ac, C, ge162ov4876));
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.message */
T0* T86f5(GE_context* ac, T0* C, T0* a1)
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
	t1 = (T86f6(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, a1, l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T86f6(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, a1, l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T86f6(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T86f6(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, a1, l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T86*)(C))->a1), l3));
						if (t2) {
							t1 = (T86f6(ac, C));
							t5 = (T142f5(ac, GE_void(((T86*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T86f6(ac, C));
								t5 = (T86f7(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T86f6(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T86f6(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
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
T0* T86f7(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* UT_CANNOT_READ_FILE_ERROR.string_ */
T0* T86f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* AP_ERROR.default_message */
T0* T40f17(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T40f18(ac, C, ((T40*)(C))->a2));
	return R;
}

/* AP_ERROR.message */
T0* T40f18(GE_context* ac, T0* C, T0* a1)
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
	l4 = (((T17*)(GE_void(a1)))->a2);
	t1 = (T40f19(ac, C));
	R = (T34f7(ac, GE_void(t1), a1, l4));
	while (1) {
		t2 = (T6f6(ac, (&l2), l4));
		if (t2) {
			break;
		}
		l5 = (T17f10(ac, GE_void(a1), l2));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
		t2 = (((((l5) != ((T2)('$'))))));
		if (t2) {
			t2 = (((((l5) != ((T2)('\000'))))));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, l5);
				} else {
					T854f68(ac, R, l5);
				}
			} else {
				t1 = (T40f19(ac, C));
				t3 = ((T6)((l2)-((T6)(GE_int32(1)))));
				t4 = ((T6)((l2)-((T6)(GE_int32(1)))));
				R = (T34f5(ac, GE_void(t1), R, a1, t3, t4));
			}
		} else {
			t2 = (T6f6(ac, (&l2), l4));
			if (t2) {
				if (((T0*)(GE_void(R)))->id==17) {
					T17f46(ac, R, (T2)('$'));
				} else {
					T854f68(ac, R, (T2)('$'));
				}
			} else {
				l5 = (T17f10(ac, GE_void(a1), l2));
				t2 = (((((l5) == ((T2)('$'))))));
				if (t2) {
					if (((T0*)(GE_void(R)))->id==17) {
						T17f46(ac, R, (T2)('$'));
					} else {
						T854f68(ac, R, (T2)('$'));
					}
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
				} else {
					t1 = (T40f19(ac, C));
					l1 = (T34f7(ac, GE_void(t1), a1, (T6)(GE_int32(5))));
					t2 = (((((l5) == ((T2)('{'))))));
					if (t2) {
						l7 = EIF_TRUE;
						l8 = EIF_FALSE;
						l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l8);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
							t2 = (((((l5) == ((T2)('}'))))));
							if (t2) {
								l8 = EIF_TRUE;
							} else {
								t2 = (((((l5) != ((T2)('\000'))))));
								if (t2) {
									if (((T0*)(GE_void(l1)))->id==17) {
										T17f46(ac, l1, l5);
									} else {
										T854f68(ac, l1, l5);
									}
								} else {
									t1 = (T40f19(ac, C));
									T34f21(ac, GE_void(t1), l1, a1, l2, l2);
								}
							}
							l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
						}
					} else {
						l7 = EIF_FALSE;
						l8 = EIF_FALSE;
						l6 = EIF_FALSE;
						while (1) {
							t2 = (T6f6(ac, (&l2), l4));
							if (!(t2)) {
								t2 = (l6);
							}
							if (t2) {
								break;
							}
							l5 = (T17f10(ac, GE_void(a1), l2));
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
									T17f46(ac, l1, l5);
								} else {
									T854f68(ac, l1, l5);
								}
								l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
								break;
							default:
								l6 = EIF_TRUE;
								break;
							}
						}
					}
					t2 = (((((T0*)(GE_void(l1)))->id==17)?T17f35(ac, l1):T854f28(ac, l1)));
					if (t2) {
						l3 = (((((T0*)(GE_void(l1)))->id==17)?T17f23(ac, l1):T854f29(ac, l1)));
						t2 = (T142f4(ac, GE_void(((T40*)(C))->a1), l3));
						if (t2) {
							t1 = (T40f19(ac, C));
							t5 = (T142f5(ac, GE_void(((T40*)(C))->a1), l3));
							R = (T34f8(ac, GE_void(t1), R, t5));
						} else {
							t2 = (((((l3) == ((T6)(GE_int32(0)))))));
							if (t2) {
								t1 = (T40f19(ac, C));
								t5 = (T40f20(ac, C));
								t5 = (((T30*)(GE_void(t5)))->a1);
								R = (T34f8(ac, GE_void(t1), R, t5));
							} else {
								if (((T0*)(GE_void(R)))->id==17) {
									T17f46(ac, R, (T2)('$'));
								} else {
									T854f68(ac, R, (T2)('$'));
								}
								if (l7) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('{'));
									} else {
										T854f68(ac, R, (T2)('{'));
									}
								}
								t1 = (T40f19(ac, C));
								R = (T34f8(ac, GE_void(t1), R, l1));
								if (l8) {
									if (((T0*)(GE_void(R)))->id==17) {
										T17f46(ac, R, (T2)('}'));
									} else {
										T854f68(ac, R, (T2)('}'));
									}
								}
							}
						}
					} else {
						if (((T0*)(GE_void(R)))->id==17) {
							T17f46(ac, R, (T2)('$'));
						} else {
							T854f68(ac, R, (T2)('$'));
						}
						if (l7) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('{'));
							} else {
								T854f68(ac, R, (T2)('{'));
							}
						}
						t1 = (T40f19(ac, C));
						R = (T34f8(ac, GE_void(t1), R, l1));
						if (l8) {
							if (((T0*)(GE_void(R)))->id==17) {
								T17f46(ac, R, (T2)('}'));
							} else {
								T854f68(ac, R, (T2)('}'));
							}
						}
					}
				}
			}
		}
	}
	return R;
}

/* AP_ERROR.arguments */
T0* T40f20(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge293os1977) {
		return ge293ov1977;
	} else {
		ge293os1977 = '\1';
		ge293ov1977 = R;
	}
	R = T30c5(ac);
	ge293ov1977 = R;
	return R;
}

/* AP_ERROR.string_ */
T0* T40f19(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge219os1985) {
		return ge219ov1985;
	} else {
		ge219os1985 = '\1';
		ge219ov1985 = R;
	}
	R = T34c19(ac);
	ge219ov1985 = R;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.was_found */
T1 T50f24(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T6f6(ac, &(((T50*)(C))->a5), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.was_found */
T1 T46f15(GE_context* ac, T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T46f14(ac, C));
	R = (T6f6(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_INTEGER_OPTION.was_found */
T1 T45f18(GE_context* ac, T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T45f17(ac, C));
	R = (T6f6(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_BOOLEAN_OPTION.was_found */
T1 T44f15(GE_context* ac, T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T44f14(ac, C));
	R = (T6f6(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_ENUMERATION_OPTION.was_found */
T1 T43f17(GE_context* ac, T0* C)
{
	T6 t1;
	T1 R = 0;
	t1 = (T43f16(ac, C));
	R = (T6f6(ac, &t1, (T6)(GE_int32(0))));
	return R;
}

/* AP_FLAG.was_found */
T1 T41f9(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T6f6(ac, &(((T41*)(C))->a1), (T6)(GE_int32(0))));
	return R;
}

/* AP_STRING_OPTION.occurrences */
T6 T46f14(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T136*)(GE_void(((T46*)(C))->a1)))->a1);
	return R;
}

/* AP_INTEGER_OPTION.occurrences */
T6 T45f17(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T150*)(GE_void(((T45*)(C))->a1)))->a1);
	return R;
}

/* AP_BOOLEAN_OPTION.occurrences */
T6 T44f14(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T147*)(GE_void(((T44*)(C))->a1)))->a1);
	return R;
}

/* AP_ENUMERATION_OPTION.occurrences */
T6 T43f16(GE_context* ac, T0* C)
{
	T6 R = 0;
	R = (((T136*)(GE_void(((T43*)(C))->a1)))->a1);
	return R;
}

/* AP_DISPLAY_HELP_FLAG.allows_parameter */
T1 T50f20(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_STRING_OPTION.allows_parameter */
T1 T46f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_INTEGER_OPTION.allows_parameter */
T1 T45f16(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_BOOLEAN_OPTION.allows_parameter */
T1 T44f13(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_ENUMERATION_OPTION.allows_parameter */
T1 T43f15(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_TRUE;
	return R;
}

/* AP_FLAG.allows_parameter */
T1 T41f11(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.needs_parameter */
T1 T50f18(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_FLAG.needs_parameter */
T1 T41f10(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* AP_DISPLAY_HELP_FLAG.name */
T0* T50f19(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T50*)(C))->a4?((m1 = ((T50*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f3(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t4 = (T2f3(ac, &(((T50*)(C))->a2)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_STRING_OPTION.name */
T0* T46f16(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T46*)(C))->a6?((m1 = ((T46*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f3(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t4 = (T2f3(ac, &(((T46*)(C))->a10)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_INTEGER_OPTION.name */
T0* T45f13(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T45*)(C))->a3?((m1 = ((T45*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f3(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t4 = (T2f3(ac, &(((T45*)(C))->a4)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.name */
T0* T44f16(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T44*)(C))->a6?((m1 = ((T44*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f3(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t4 = (T2f3(ac, &(((T44*)(C))->a10)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.name */
T0* T43f13(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T43*)(C))->a7?((m1 = ((T43*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f3(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t4 = (T2f3(ac, &(((T43*)(C))->a11)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_FLAG.name */
T0* T41f12(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 t2;
	T0* t3;
	T0* t4;
	T0* R = 0;
	t1 = (((T41*)(C))->a3?((m1 = ((T41*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t2 = (T2)('-');
		t4 = (T2f3(ac, &t2));
		t3 = (T17f9(ac, GE_void(t3), t4));
		R = (T17f9(ac, GE_void(t3), m1));
	} else {
		t2 = (T2)('-');
		t3 = (T2f3(ac, &t2));
		t4 = (T2f3(ac, &(((T41*)(C))->a4)));
		R = (T17f9(ac, GE_void(t3), t4));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.example */
T0* T50f22(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T50*)(C))->a7)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)('['));
	}
	T17f46(ac, GE_void(R), (T2)('-'));
	if (((T50*)(C))->a3) {
		t2 = (T2f3(ac, &(((T50*)(C))->a2)));
		T17f49(ac, GE_void(R), t2);
	} else {
		l1 = ((T50*)(C))->a4;
		T17f46(ac, GE_void(R), (T2)('-'));
		T17f49(ac, GE_void(R), l1);
	}
	t1 = ((T1)(!(((T50*)(C))->a7)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_STRING_OPTION.example */
T0* T46f17(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T46*)(C))->a7)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)('['));
	}
	T17f46(ac, GE_void(R), (T2)('-'));
	if (((T46*)(C))->a9) {
		T17f46(ac, GE_void(R), ((T46*)(C))->a10);
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T46*)(C))->a4);
	} else {
		T17f46(ac, GE_void(R), (T2)('-'));
		l1 = ((T46*)(C))->a6;
		T17f49(ac, GE_void(R), l1);
		t1 = ((T1)(!(((T46*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		T17f46(ac, GE_void(R), (T2)('='));
		T17f49(ac, GE_void(R), ((T46*)(C))->a4);
		t1 = ((T1)(!(((T46*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T46*)(C))->a7)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_INTEGER_OPTION.example */
T0* T45f19(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T45*)(C))->a8)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)('['));
	}
	T17f46(ac, GE_void(R), (T2)('-'));
	if (((T45*)(C))->a10) {
		T17f46(ac, GE_void(R), ((T45*)(C))->a4);
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T45*)(C))->a6);
	} else {
		T17f46(ac, GE_void(R), (T2)('-'));
		l1 = ((T45*)(C))->a3;
		T17f49(ac, GE_void(R), l1);
		t1 = ((T1)(!(((T45*)(C))->a7)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		T17f46(ac, GE_void(R), (T2)('='));
		T17f49(ac, GE_void(R), ((T45*)(C))->a6);
		t1 = ((T1)(!(((T45*)(C))->a7)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T45*)(C))->a8)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_BOOLEAN_OPTION.example */
T0* T44f17(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T44*)(C))->a7)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)('['));
	}
	T17f46(ac, GE_void(R), (T2)('-'));
	if (((T44*)(C))->a9) {
		T17f46(ac, GE_void(R), ((T44*)(C))->a10);
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T44*)(C))->a4);
	} else {
		T17f46(ac, GE_void(R), (T2)('-'));
		l1 = ((T44*)(C))->a6;
		T17f49(ac, GE_void(R), l1);
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		T17f46(ac, GE_void(R), (T2)('='));
		T17f49(ac, GE_void(R), ((T44*)(C))->a4);
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T44*)(C))->a7)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_ENUMERATION_OPTION.example */
T0* T43f19(GE_context* ac, T0* C)
{
	T1 t1;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T43*)(C))->a8)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)('['));
	}
	T17f46(ac, GE_void(R), (T2)('-'));
	if (((T43*)(C))->a10) {
		T17f46(ac, GE_void(R), ((T43*)(C))->a11);
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T43*)(C))->a5);
	} else {
		T17f46(ac, GE_void(R), (T2)('-'));
		l1 = ((T43*)(C))->a7;
		T17f49(ac, GE_void(R), l1);
		t1 = ((T1)(!(((T43*)(C))->a6)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		T17f46(ac, GE_void(R), (T2)('='));
		T17f49(ac, GE_void(R), ((T43*)(C))->a5);
		t1 = ((T1)(!(((T43*)(C))->a6)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	}
	t1 = ((T1)(!(((T43*)(C))->a8)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_FLAG.example */
T0* T41f13(GE_context* ac, T0* C)
{
	T1 t1;
	T0* t2;
	T0* R = 0;
	T0* l1 = 0;
	R = T17c44(ac, (T6)(GE_int32(20)));
	t1 = ((T1)(!(((T41*)(C))->a6)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)('['));
	}
	T17f46(ac, GE_void(R), (T2)('-'));
	if (((T41*)(C))->a5) {
		t2 = (T2f3(ac, &(((T41*)(C))->a4)));
		T17f49(ac, GE_void(R), t2);
	} else {
		l1 = ((T41*)(C))->a3;
		T17f46(ac, GE_void(R), (T2)('-'));
		T17f49(ac, GE_void(R), l1);
	}
	t1 = ((T1)(!(((T41*)(C))->a6)));
	if (t1) {
		T17f46(ac, GE_void(R), (T2)(']'));
	}
	return R;
}

/* AP_DISPLAY_HELP_FLAG.names */
T0* T50f33(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T50*)(C))->a3) {
		t1 = (T2)('-');
		l1 = (T2f3(ac, &t1));
		T17f46(ac, GE_void(l1), ((T50*)(C))->a2);
	}
	t2 = (((T50*)(C))->a4?((m1 = ((T50*)(C))->a4, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f49(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_STRING_OPTION.names */
T0* T46f21(GE_context* ac, T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T46f21p1(ac, C));
	t1 = (T46f22(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T46*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f3(ac, &t2));
		T17f49(ac, GE_void(R), t3);
		T17f49(ac, GE_void(R), ((T46*)(C))->a4);
		t1 = ((T1)(!(((T46*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T46*)(C))->a4);
	}
	return R;
}

/* AP_STRING_OPTION.has_long_form */
T1 T46f22(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T46*)(C))->a6)!=(EIF_VOID));
	return R;
}

/* AP_STRING_OPTION.names */
T0* T46f21p1(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T46*)(C))->a9) {
		t1 = (T2)('-');
		l1 = (T2f3(ac, &t1));
		T17f46(ac, GE_void(l1), ((T46*)(C))->a10);
	}
	t2 = (((T46*)(C))->a6?((m1 = ((T46*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f49(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T45f21(GE_context* ac, T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T45f21p1(ac, C));
	t1 = (T45f22(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T45*)(C))->a7)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f3(ac, &t2));
		T17f49(ac, GE_void(R), t3);
		T17f49(ac, GE_void(R), ((T45*)(C))->a6);
		t1 = ((T1)(!(((T45*)(C))->a7)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T45*)(C))->a6);
	}
	return R;
}

/* AP_INTEGER_OPTION.has_long_form */
T1 T45f22(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T45*)(C))->a3)!=(EIF_VOID));
	return R;
}

/* AP_INTEGER_OPTION.names */
T0* T45f21p1(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T45*)(C))->a10) {
		t1 = (T2)('-');
		l1 = (T2f3(ac, &t1));
		T17f46(ac, GE_void(l1), ((T45*)(C))->a4);
	}
	t2 = (((T45*)(C))->a3?((m1 = ((T45*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f49(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T44f24(GE_context* ac, T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T44f24p1(ac, C));
	t1 = (T44f25(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f3(ac, &t2));
		T17f49(ac, GE_void(R), t3);
		T17f49(ac, GE_void(R), ((T44*)(C))->a4);
		t1 = ((T1)(!(((T44*)(C))->a5)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T44*)(C))->a4);
	}
	return R;
}

/* AP_BOOLEAN_OPTION.has_long_form */
T1 T44f25(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T44*)(C))->a6)!=(EIF_VOID));
	return R;
}

/* AP_BOOLEAN_OPTION.names */
T0* T44f24p1(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T44*)(C))->a9) {
		t1 = (T2)('-');
		l1 = (T2f3(ac, &t1));
		T17f46(ac, GE_void(l1), ((T44*)(C))->a10);
	}
	t2 = (((T44*)(C))->a6?((m1 = ((T44*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f49(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T43f23(GE_context* ac, T0* C)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T0* R = 0;
	R = (T43f23p1(ac, C));
	t1 = (T43f24(ac, C));
	if (t1) {
		t1 = ((T1)(!(((T43*)(C))->a6)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)('['));
		}
		t2 = (T2)('=');
		t3 = (T2f3(ac, &t2));
		T17f49(ac, GE_void(R), t3);
		T17f49(ac, GE_void(R), ((T43*)(C))->a5);
		t1 = ((T1)(!(((T43*)(C))->a6)));
		if (t1) {
			T17f46(ac, GE_void(R), (T2)(']'));
		}
	} else {
		T17f46(ac, GE_void(R), (T2)(' '));
		T17f49(ac, GE_void(R), ((T43*)(C))->a5);
	}
	return R;
}

/* AP_ENUMERATION_OPTION.has_long_form */
T1 T43f24(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T43*)(C))->a7)!=(EIF_VOID));
	return R;
}

/* AP_ENUMERATION_OPTION.names */
T0* T43f23p1(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T43*)(C))->a10) {
		t1 = (T2)('-');
		l1 = (T2f3(ac, &t1));
		T17f46(ac, GE_void(l1), ((T43*)(C))->a11);
	}
	t2 = (((T43*)(C))->a7?((m1 = ((T43*)(C))->a7, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f49(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* AP_FLAG.names */
T0* T41f16(GE_context* ac, T0* C)
{
	T2 t1;
	T1 t2;
	T0* m1 = 0;
	T0* R = 0;
	T0* l1 = 0;
	if (((T41*)(C))->a5) {
		t1 = (T2)('-');
		l1 = (T2f3(ac, &t1));
		T17f46(ac, GE_void(l1), ((T41*)(C))->a4);
	}
	t2 = (((T41*)(C))->a3?((m1 = ((T41*)(C))->a3, EIF_TRUE)):EIF_FALSE);
	if (t2) {
		t2 = ((l1)==(EIF_VOID));
		if (t2) {
			l1 = GE_ms8("    ", 4);
		} else {
			T17f49(ac, GE_void(l1), GE_ms8(", ", 2));
		}
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f46(ac, GE_void(l1), (T2)('-'));
		T17f49(ac, GE_void(l1), m1);
	}
	{
		t2 = ((l1)!=(EIF_VOID));
		if (!(t2)) {
			GE_raise(GE_EX_CHECK);
		}		R = l1;
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.last_character */
T2 T855f6(GE_context* ac, T0* C)
{
	T6 t1;
	T1 t2;
	T2 R = 0;
	t1 = (((T1465*)(GE_void(((T855*)(C))->a3)))->a1);
	t2 = (T6f6(ac, &t1, (T6)(GE_int32(0))));
	if (t2) {
		R = (T1465f4(ac, GE_void(((T855*)(C))->a3)));
	} else {
		R = (((((T0*)(GE_void(((T855*)(C))->a4)))->id==29)?((T29*)(((T855*)(C))->a4))->a6:((T908*)(((T855*)(C))->a4))->a2));
	}
	return R;
}

/* DS_LINKED_QUEUE [CHARACTER_8].item */
T2 T1465f4(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T2 R = 0;
	{
		t1 = (((T1465*)(C))->a2?((m1 = ((T1465*)(C))->a2, EIF_TRUE)):EIF_FALSE);
		if (!(t1)) {
			GE_raise(GE_EX_CHECK);
		}		R = (((T1646*)(m1))->a1);
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.end_of_input */
T1 T855f21(GE_context* ac, T0* C)
{
	T6 t1;
	T1 t2;
	T1 R = 0;
	t1 = (((T1465*)(GE_void(((T855*)(C))->a3)))->a1);
	t2 = (((((t1) == ((T6)(GE_int32(0)))))));
	if (t2) {
		R = (((((T0*)(GE_void(((T855*)(C))->a4)))->id==29)?T29f33(ac, ((T855*)(C))->a4):((T908*)(((T855*)(C))->a4))->a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* KL_TEXT_INPUT_FILE.end_of_input */
T1 T29f33(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((T29*)(C))->a1;
	return R;
}

/* KL_STRING_INPUT_STREAM.is_closable */
T1 T908f7(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_STDIN_FILE.is_closable */
T1 T897f12(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.is_closable */
T1 T855f7(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = EIF_FALSE;
	return R;
}

/* KL_TEXT_INPUT_FILE.is_closable */
T1 T29f38(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (T29f14(ac, C));
	return R;
}

/* KL_STRING_INPUT_STREAM.read_to_string */
T6 T908f8(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T1 t2;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	while (1) {
		t2 = (T6f6(ac, (&l1), l2));
		if (t2) {
			break;
		}
		T908f10(ac, C);
		t2 = ((T1)(!(((T908*)(C))->a1)));
		if (t2) {
			T17f71(ac, GE_void(a1), ((T908*)(C))->a2, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_STDIN_FILE.read_to_string */
T6 T897f18(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T0* l5 = 0;
	T0* l6 = 0;
	l2 = a2;
	l6 = ((T897*)(C))->a4;
	while (1) {
		t1 = (((((l1) == (a3)))));
		if (!(t1)) {
			t1 = (EIF_TRUE);
		}
		if (t1) {
			break;
		}
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		t2 = ((GE_void(l6), (T2)0));
		T17f71(ac, GE_void(a1), t2, l2);
		l6 = ((GE_void(l6), (T0*)0));
		l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
	}
	((T897*)(C))->a4 = l6;
	t1 = ((T1)((l1)<(a3)));
	if (t1) {
		t1 = (T897f22(ac, C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T897f9(ac, C));
			t1 = (T134f1(ac, GE_void(t3), a1, ge261ov32466));
			if (t1) {
				t4 = ((T6)((a3)-(l1)));
				t4 = (T897f11(ac, C, a1, l2, t4));
				R = ((T6)((l1)+(t4)));
				T17f69(ac, GE_void(a1), (T6)(GE_int32(0)));
			} else {
				l4 = ((T6)((a3)-(l1)));
				l5 = T17c44(ac, l4);
				T17f61(ac, GE_void(l5), l4);
				l4 = (T897f11(ac, C, l5, (T6)(GE_int32(1)), l4));
				T17f69(ac, GE_void(l5), (T6)(GE_int32(0)));
				l3 = (T6)(GE_int32(1));
				while (1) {
					t1 = (T6f6(ac, (&l3), l4));
					if (t1) {
						break;
					}
					t2 = (T17f10(ac, GE_void(l5), l3));
					T17f71(ac, GE_void(a1), t2, l2);
					l2 = ((T6)((l2)+((T6)(GE_int32(1)))));
					l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
				}
				R = ((T6)((l1)+(l4)));
			}
		} else {
			R = l1;
		}
		((T897*)(C))->a1 = (T897f22(ac, C));
	} else {
		R = l1;
	}
	return R;
}

/* KL_STDIN_FILE.old_read_to_string */
T6 T897f11(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T0* t1;
	T6 t2;
	T14 t3;
	T6 R = 0;
	t1 = (((T17*)(GE_void(a1)))->a1);
	t2 = ((T6)((a2)-((T6)(GE_int32(1)))));
	t3 = (T15f9(ac, GE_void(t1), t2));
	R = (T897f14(ac, C, ((T897*)(C))->a5, t3, a3));
	T17f69(ac, GE_void(a1), (T6)(GE_int32(0)));
	return R;
}

/* KL_STDIN_FILE.file_gss */
T6 T897f14(GE_context* ac, T0* C, T14 a1, T14 a2, T6 a3)
{
	T6 R = 0;
	{
	R = (T6)eif_file_gss((FILE *)a1,( char *)a2,( EIF_INTEGER)a3);
	}
	return R;
}

/* KL_STDIN_FILE.any_ */
T0* T897f9(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge212os2414) {
		return ge212ov2414;
	} else {
		ge212os2414 = '\1';
		ge212ov2414 = R;
	}
	R = T134c3(ac);
	ge212ov2414 = R;
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T855f28(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T6 t2;
	T2 t3;
	T6 R = 0;
	t1 = (((((((T855*)(C))->a2) == ((T6)(GE_int32(6)))))));
	if (!(t1)) {
		t1 = (((((((T855*)(C))->a2) == ((T6)(GE_int32(2)))))));
	}
	if (!(t1)) {
		t2 = (((T1465*)(GE_void(((T855*)(C))->a3)))->a1);
		t1 = (T6f6(ac, &t2, (T6)(GE_int32(0))));
	}
	if (t1) {
		T855f32(ac, C);
		t1 = (T855f21(ac, C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T855f6(ac, C));
			T17f71(ac, GE_void(a1), t3, a2);
			R = (T6)(GE_int32(1));
		} else {
			R = (T6)(GE_int32(0));
		}
	} else {
		t1 = (((((((T855*)(C))->a2) == ((T6)(GE_int32(1)))))));
		if (t1) {
			R = (((((T0*)(GE_void(((T855*)(C))->a4)))->id==29)?T29f37(ac, ((T855*)(C))->a4, a1, a2, a3):T908f8(ac, ((T855*)(C))->a4, a1, a2, a3)));
		} else {
			R = (T855f28p1(ac, C, a1, a2, a3));
		}
	}
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.read_to_string */
T6 T855f28p1(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T6 t1;
	T1 t2;
	T2 t3;
	T6 R = 0;
	T6 l1 = 0;
	T6 l2 = 0;
	t1 = ((T6)((a2)+(a3)));
	l2 = ((T6)((t1)-((T6)(GE_int32(1)))));
	l1 = a2;
	while (1) {
		t2 = (T6f6(ac, (&l1), l2));
		if (t2) {
			break;
		}
		T855f32(ac, C);
		t2 = (T855f21(ac, C));
		t2 = ((T1)(!(t2)));
		if (t2) {
			t3 = (T855f6(ac, C));
			T17f71(ac, GE_void(a1), t3, l1);
			l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
		} else {
			t1 = ((T6)((l1)-(a2)));
			R = ((T6)((t1)-(a3)));
			l1 = ((T6)((l2)+((T6)(GE_int32(1)))));
		}
	}
	t1 = ((T6)((R)+(l1)));
	R = ((T6)((t1)-(a2)));
	return R;
}

/* KL_TEXT_INPUT_FILE.read_to_string */
T6 T29f37(GE_context* ac, T0* C, T0* a1, T6 a2, T6 a3)
{
	T1 t1;
	T2 t2;
	T0* t3;
	T6 t4;
	T0* t5;
	T6 R = 0;
	T6 l1 = 0;
	T0* l2 = 0;
	T6 l3 = 0;
	T6 l4 = 0;
	T6 l5 = 0;
	T0* l6 = 0;
	l1 = a2;
	l6 = ((T29*)(C))->a5;
	while (1) {
		t1 = (((((l5) == (a3)))));
		if (!(t1)) {
			t1 = ((l6)==(EIF_VOID));
		}
		if (t1) {
			break;
		}
		l5 = ((T6)((l5)+((T6)(GE_int32(1)))));
		t2 = (((T126*)(GE_void(l6)))->a1);
		T17f71(ac, GE_void(a1), t2, l1);
		l6 = (((T126*)(GE_void(l6)))->a2);
		l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
	}
	((T29*)(C))->a5 = l6;
	t1 = ((T1)((l5)<(a3)));
	if (t1) {
		t1 = (T29f25(ac, C));
		t1 = ((T1)(!(t1)));
		if (t1) {
			t3 = (T29f45(ac, C));
			t1 = (T134f1(ac, GE_void(t3), a1, ge248ov2434));
			if (t1) {
				t4 = ((T6)((a3)-(l5)));
				t4 = (T29f36(ac, C, a1, l1, t4));
				l5 = ((T6)((l5)+(t4)));
				T17f69(ac, GE_void(a1), (T6)(GE_int32(0)));
			} else {
				t3 = (T29f45(ac, C));
				t5 = (T29f47(ac, C));
				t1 = (T134f1(ac, GE_void(t3), a1, t5));
				if (t1) {
					t4 = ((T6)((a3)-(l5)));
					t4 = (T29f36(ac, C, a1, l1, t4));
					l5 = ((T6)((l5)+(t4)));
					T17f69(ac, GE_void(a1), (T6)(GE_int32(0)));
				} else {
					l4 = ((T6)((a3)-(l5)));
					l2 = T17c44(ac, l4);
					T17f61(ac, GE_void(l2), l4);
					l4 = (T29f36(ac, C, l2, (T6)(GE_int32(1)), l4));
					T17f69(ac, GE_void(l2), (T6)(GE_int32(0)));
					l3 = (T6)(GE_int32(1));
					while (1) {
						t1 = (T6f6(ac, (&l3), l4));
						if (t1) {
							break;
						}
						t2 = (T17f10(ac, GE_void(l2), l3));
						T17f71(ac, GE_void(a1), t2, l1);
						l1 = ((T6)((l1)+((T6)(GE_int32(1)))));
						l3 = ((T6)((l3)+((T6)(GE_int32(1)))));
					}
					l5 = ((T6)((l5)+(l4)));
				}
			}
		}
		((T29*)(C))->a1 = (T29f25(ac, C));
	}
	R = l5;
	return R;
}

/* KL_TEXT_INPUT_FILE.dummy_kl_character_buffer */
unsigned char ge248os2435 = '\0';
T0* ge248ov2435;
T0* T29f47(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge248os2435) {
		return ge248ov2435;
	} else {
		ge248os2435 = '\1';
		ge248ov2435 = R;
	}
	R = T862c9(ac, (T6)(GE_int32(0)));
	ge248ov2435 = R;
	return R;
}

/* KL_TEXT_INPUT_FILE.any_ */
T0* T29f45(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge212os2414) {
		return ge212ov2414;
	} else {
		ge212os2414 = '\1';
		ge212ov2414 = R;
	}
	R = T134c3(ac);
	ge212ov2414 = R;
	return R;
}

/* KL_STRING_INPUT_STREAM.name */
unsigned char ge263os2410 = '\0';
T0* ge263ov2410;
T0* T908f6(GE_context* ac, T0* C)
{
	T0* R = 0;
	if (ge263os2410) {
		return ge263ov2410;
	} else {
		ge263os2410 = '\1';
		ge263ov2410 = R;
	}
	R = GE_ms8("STRING", 6);
	ge263ov2410 = R;
	return R;
}

/* KL_STDIN_FILE.name */
T0* T897f15(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (T17f20(ac, GE_void(((T897*)(C))->a3)));
	return R;
}

/* XM_EIFFEL_INPUT_STREAM.name */
T0* T855f5(GE_context* ac, T0* C)
{
	T0* R = 0;
	R = (((((T0*)(GE_void(((T855*)(C))->a4)))->id==29)?((T29*)(((T855*)(C))->a4))->a4:T908f6(ac, ((T855*)(C))->a4)));
	return R;
}

/* ET_LACE_SYSTEM.stop_requested */
T1 T70f163(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T70*)(C))->a6?((m1 = ((T70*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, GE_mt192(), (T1)0));
	}
	return R;
}

/* ET_ECF_SYSTEM.stop_requested */
T1 T64f186(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T64*)(C))->a11?((m1 = ((T64*)(C))->a11, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, GE_mt192(), (T1)0));
	}
	return R;
}

/* ET_XACE_SYSTEM.stop_requested */
T1 T61f167(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T61*)(C))->a6?((m1 = ((T61*)(C))->a6, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, GE_mt192(), (T1)0));
	}
	return R;
}

/* ET_LACE_SYSTEM.dotnet_assembly_consumer */
T0* T70f177(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T70*)(C))->a142?((m1 = ((T70*)(C))->a142, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T796c3(ac, C);
		((T70*)(C))->a142 = R;
	}
	return R;
}

/* ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER.make */
T0* T796c3(GE_context* ac, T0* a1)
{
	T0* C;
	C = GE_new796(EIF_TRUE);
	((T796*)(C))->a1 = a1;
	return C;
}

/* ET_ECF_SYSTEM.dotnet_assembly_consumer */
T0* T64f166(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T64*)(C))->a149?((m1 = ((T64*)(C))->a149, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T796c3(ac, C);
		((T64*)(C))->a149 = R;
	}
	return R;
}

/* ET_XACE_SYSTEM.dotnet_assembly_consumer */
T0* T61f159(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T61*)(C))->a143?((m1 = ((T61*)(C))->a143, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T796c3(ac, C);
		((T61*)(C))->a143 = R;
	}
	return R;
}

/* ET_SYSTEM.dotnet_assembly_consumer */
T0* T33f152(GE_context* ac, T0* C)
{
	T1 t1;
	T0* m1 = 0;
	T0* R = 0;
	t1 = (((T33*)(C))->a127?((m1 = ((T33*)(C))->a127, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = m1;
	} else {
		R = T796c3(ac, C);
		((T33*)(C))->a127 = R;
	}
	return R;
}

/* ET_LACE_SYSTEM.older_or_same_ise_version */
T1 T70f181(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T70*)(C))->a30?((m1 = ((T70*)(C))->a30, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T78f15(ac, m1, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_ECF_SYSTEM.older_or_same_ise_version */
T1 T64f188(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T64*)(C))->a35?((m1 = ((T64*)(C))->a35, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T78f15(ac, m1, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_XACE_SYSTEM.older_or_same_ise_version */
T1 T61f185(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T61*)(C))->a30?((m1 = ((T61*)(C))->a30, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = (T78f15(ac, m1, a1));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_SYSTEM.older_or_same_ise_version */
T1 T33f158(GE_context* ac, T0* C, T0* a1)
{
	T1 t1;
	T0* m1 = 0;
	T1 R = 0;
	t1 = (((T33*)(C))->a120?((m1 = ((T33*)(C))->a120, EIF_TRUE)):EIF_FALSE);
	if (t1) {
		R = ((m1, a1, (T1)0));
	} else {
		R = EIF_FALSE;
	}
	return R;
}

/* ET_LACE_SYSTEM.is_ise */
T1 T70f172(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T70*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_ECF_SYSTEM.is_ise */
T1 T64f172(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T64*)(C))->a35)!=(EIF_VOID));
	return R;
}

/* ET_XACE_SYSTEM.is_ise */
T1 T61f168(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = ((((T61*)(C))->a30)!=(EIF_VOID));
	return R;
}

/* ET_SYSTEM.is_ise */
T1 T33f155(GE_context* ac, T0* C)
{
	T1 R = 0;
	R = (EIF_FALSE);
	return R;
}

/* Call to TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, INTEGER_32].type (label on item #2) */
T0* T1739xt2(GE_context* ac, T0* C)
{
	EIF_TYPE_INDEX t1 = ((T0*)(C))->id;
if (t1<=1740) {
if (t1<=1739) {
if (t1==1738) {
	return (((T1738*)(C))->z2);
} else {
	return (((T1739*)(C))->z2);
}
} else {
	return (((T1740*)(C))->z2);
}
} else {
if (t1==1741) {
	return (((T1741*)(C))->z2);
} else {
	return (((T1742*)(C))->z2);
}
}
}

/* Call to TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, INTEGER_32].arguments (label on item #1) */
T0* T1739xt1(GE_context* ac, T0* C)
{
	EIF_TYPE_INDEX t1 = ((T0*)(C))->id;
if (t1<=1740) {
if (t1<=1739) {
if (t1==1738) {
	return (((T1738*)(C))->z1);
} else {
	return (((T1739*)(C))->z1);
}
} else {
	return (((T1740*)(C))->z1);
}
} else {
if (t1==1741) {
	return (((T1741*)(C))->z1);
} else {
	return (((T1742*)(C))->z1);
}
}
}

/* Call to TUPLE [detachable ARRAY [ET_TYPE], detachable ET_TYPE, INTEGER_32].builtin_code (label on item #3) */
T6 T1739xt3(GE_context* ac, T0* C)
{
	EIF_TYPE_INDEX t1 = ((T0*)(C))->id;
if (t1<=1740) {
if (t1<=1739) {
if (t1==1738) {
	return (((T1738*)(C))->z3);
} else {
	return (((T1739*)(C))->z3);
}
} else {
	return (((T1740*)(C))->z3);
}
} else {
if (t1==1741) {
	return (((T1741*)(C))->z3);
} else {
	return (((T1742*)(C))->z3);
}
}
}

T0* GE_ma724(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new723(c, EIF_FALSE);
	*(T723*)t1 = GE_default723;
	((T723*)(t1))->a2 = c;
	((T723*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T723*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new724(EIF_TRUE);
	((T724*)(R))->a1 = t1;
	((T724*)(R))->a2 = 1;
	((T724*)(R))->a3 = c;
	return R;
}

T0* GE_ma142(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new141(c, EIF_FALSE);
	*(T141*)t1 = GE_default141;
	((T141*)(t1))->a2 = c;
	((T141*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T141*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new142(EIF_TRUE);
	((T142*)(R))->a1 = t1;
	((T142*)(R))->a2 = 1;
	((T142*)(R))->a3 = c;
	return R;
}

T0* GE_ma527(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new123(c, EIF_FALSE);
	*(T123*)t1 = GE_default123;
	((T123*)(t1))->a2 = c;
	((T123*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T6 *i = ((T123*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T6);
		}
		va_end(v);
	}
	R = GE_new527(EIF_TRUE);
	((T527*)(R))->a1 = t1;
	((T527*)(R))->a2 = 1;
	((T527*)(R))->a3 = c;
	return R;
}

T0* GE_ma263(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new262(c, EIF_FALSE);
	*(T262*)t1 = GE_default262;
	((T262*)(t1))->a2 = c;
	((T262*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T262*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new263(EIF_TRUE);
	((T263*)(R))->a1 = t1;
	((T263*)(R))->a2 = 1;
	((T263*)(R))->a3 = c;
	return R;
}

T0* GE_ma564(T6 c, T6 n, ...)
{
	T0* R;
	T0* t1;
	t1 = GE_new563(c, EIF_FALSE);
	*(T563*)t1 = GE_default563;
	((T563*)(t1))->a2 = c;
	((T563*)(t1))->a1 = c;
	if (n!=0) {
		va_list v;
		T6 j = n;
		T0* *i = ((T563*)(t1))->z2;
		va_start(v, n);
		while (j--) {
			*(i++) = va_arg(v, T0*);
		}
		va_end(v);
	}
	R = GE_new564(EIF_TRUE);
	((T564*)(R))->a1 = t1;
	((T564*)(R))->a2 = 1;
	((T564*)(R))->a3 = c;
	return R;
}

T0* GE_mt27(T6 a1, T6 a2, T6 a3, T0* a4, T0* a5, T0* a6, T0* a7, T0* a8, T0* a9, T6 a10, T1 a11)
{
	T0* R;
	R = GE_new27(EIF_TRUE);
	((T27*)(R))->z1 = a1;
	((T27*)(R))->z2 = a2;
	((T27*)(R))->z3 = a3;
	((T27*)(R))->z4 = a4;
	((T27*)(R))->z5 = a5;
	((T27*)(R))->z6 = a6;
	((T27*)(R))->z7 = a7;
	((T27*)(R))->z8 = a8;
	((T27*)(R))->z9 = a9;
	((T27*)(R))->z10 = a10;
	((T27*)(R))->z11 = a11;
	return R;
}

T0* GE_mt192()
{
	T0* R;
	R = GE_new192(EIF_TRUE);
	return R;
}

T0* GE_mt1739(T0* a1, T0* a2, T6 a3)
{
	T0* R;
	R = GE_new1739(EIF_TRUE);
	((T1739*)(R))->z1 = a1;
	((T1739*)(R))->z2 = a2;
	((T1739*)(R))->z3 = a3;
	return R;
}

T0* GE_mt1738(T0* a1, T0* a2, T6 a3)
{
	T0* R;
	R = GE_new1738(EIF_TRUE);
	((T1738*)(R))->z1 = a1;
	((T1738*)(R))->z2 = a2;
	((T1738*)(R))->z3 = a3;
	return R;
}

T0* GE_mt1740(T0* a1, T0* a2, T6 a3)
{
	T0* R;
	R = GE_new1740(EIF_TRUE);
	((T1740*)(R))->z1 = a1;
	((T1740*)(R))->z2 = a2;
	((T1740*)(R))->z3 = a3;
	return R;
}

T0* GE_mt1741(T0* a1, T0* a2, T6 a3)
{
	T0* R;
	R = GE_new1741(EIF_TRUE);
	((T1741*)(R))->z1 = a1;
	((T1741*)(R))->z2 = a2;
	((T1741*)(R))->z3 = a3;
	return R;
}

T0* GE_mt1742(T0* a1, T0* a2, T6 a3)
{
	T0* R;
	R = GE_new1742(EIF_TRUE);
	((T1742*)(R))->z1 = a1;
	((T1742*)(R))->z2 = a2;
	((T1742*)(R))->z3 = a3;
	return R;
}

T0* GE_mt484(T0* a1)
{
	T0* R;
	R = GE_new484(EIF_TRUE);
	((T484*)(R))->z1 = a1;
	return R;
}

T0* ge260ov13431;
T0* ge224ov3803;
T0* ge164ov4878;
T0* ge324ov32283;
T0* ge314ov15192;
T0* ge262ov13431;
T0* ge1020ov8802;
T0* ge1020ov8809;
T0* ge1020ov8808;
T0* ge1020ov8807;
T0* ge246ov2455;
T0* ge247ov13488;
T0* ge1020ov8803;
T0* ge1020ov8805;
T0* ge1020ov8762;
T0* ge245ov21036;
T0* ge245ov21037;
T0* ge1722ov20031;
T0* ge1722ov20016;
T0* ge1722ov20009;
T0* ge1722ov19994;
T0* ge1722ov20019;
T0* ge1722ov20012;
T0* ge1722ov20020;
T0* ge1722ov20029;
T0* ge1722ov20022;
T0* ge1722ov20018;
T0* ge1722ov20006;
T0* ge1722ov20007;
T0* ge1722ov20021;
T0* ge1722ov20008;
T0* ge1722ov19995;
T0* ge1722ov19996;
T0* ge1722ov19997;
T0* ge1722ov20003;
T0* ge1722ov20005;
T0* ge1722ov20000;
T0* ge1722ov20025;
T0* ge1722ov20024;
T0* ge1722ov20001;
T0* ge1722ov20002;
T0* ge1722ov19999;
T0* ge1722ov19998;
T0* ge1718ov19786;
T0* ge1020ov8804;
T0* ge1020ov8806;
T0* ge1020ov8492;
T0* ge1020ov8528;
T0* ge1020ov8501;
T0* ge1020ov8496;
T0* ge1020ov8527;
T0* ge1020ov8745;
T0* ge1020ov8749;
T0* ge1020ov8746;
T0* ge1020ov8748;
T0* ge1020ov8747;
T0* ge1020ov8750;
T0* ge1020ov8752;
T0* ge1020ov8751;
T0* ge1020ov8753;
T0* ge1013ov28998;
T0* ge1013ov28997;
T0* ge1013ov28996;
T0* ge807ov12698;
T0* ge807ov12572;
T0* ge807ov12874;
T0* ge265ov13532;
T0* ge265ov13533;
T0* ge253ov13874;
T0* ge253ov13873;
T0* ge268ov13532;
T0* ge268ov13533;
T0* ge246ov2457;
T0* ge1020ov8574;
T0* ge1020ov8789;
T0* ge1020ov8580;
T0* ge1020ov8482;
T0* ge1020ov8790;
T0* ge1020ov8649;
T0* ge1020ov8648;
T0* ge1020ov8603;
T0* ge1020ov8696;
T0* ge1020ov8758;
T0* ge1020ov8536;
T0* ge1020ov8784;
T0* ge1020ov8582;
T0* ge1020ov8559;
T0* ge1020ov8484;
T0* ge1020ov8754;
T0* ge1020ov8557;
T0* ge807ov12845;
T0* ge807ov12865;
T0* ge1020ov8534;
T0* ge1020ov8721;
T0* ge1020ov8530;
T0* ge1020ov8742;
T0* ge1020ov8502;
T0* ge1020ov8529;
T0* ge1020ov8779;
T0* ge1020ov8741;
T0* ge1020ov8739;
T0* ge1020ov8740;
T0* ge1020ov8735;
T0* ge1020ov8723;
T0* ge1020ov8724;
T0* ge1020ov8725;
T0* ge1020ov8727;
T0* ge1020ov8728;
T0* ge1020ov8729;
T0* ge1020ov8730;
T0* ge1020ov8731;
T0* ge1020ov8732;
T0* ge1020ov8733;
T0* ge1020ov8734;
T0* ge1020ov8736;
T0* ge1020ov8737;
T0* ge1020ov8738;
T0* ge1020ov8726;
T0* ge1020ov8785;
T0* ge1020ov8541;
T0* ge1020ov8531;
T0* ge1020ov8798;
T0* ge1020ov8602;
T0* ge1020ov8578;
T0* ge1020ov8577;
T0* ge1020ov8788;
T0* ge1020ov8489;
T0* ge1020ov8579;
T0* ge1020ov8757;
T0* ge1020ov8535;
T0* ge1020ov8756;
T0* ge1020ov8772;
T0* ge1020ov8759;
T0* ge1020ov8549;
T0* ge1020ov8550;
T0* ge1020ov8773;
T0* ge1020ov8545;
T0* ge807ov12848;
T0* ge1020ov8635;
T0* ge1020ov8554;
T0* ge1020ov8631;
T0* ge1020ov8486;
T0* ge1020ov8491;
T0* ge1020ov8513;
T0* ge1020ov8744;
T0* ge1020ov8743;
T0* ge1020ov8720;
T0* ge1020ov8719;
T0* ge1020ov8718;
T0* ge1020ov8717;
T0* ge1020ov8716;
T0* ge1020ov8715;
T0* ge1020ov8714;
T0* ge1020ov8713;
T0* ge1020ov8712;
T0* ge1020ov8711;
T0* ge1020ov8710;
T0* ge1020ov8709;
T0* ge1020ov8708;
T0* ge1020ov8707;
T0* ge1020ov8706;
T0* ge1020ov8705;
T0* ge1020ov8704;
T0* ge1020ov8703;
T0* ge1020ov8702;
T0* ge1020ov8701;
T0* ge1020ov8700;
T0* ge1020ov8699;
T0* ge1020ov8698;
T0* ge1020ov8697;
T0* ge1020ov8695;
T0* ge1020ov8694;
T0* ge1020ov8693;
T0* ge1020ov8692;
T0* ge1020ov8691;
T0* ge1020ov8690;
T0* ge1020ov8632;
T0* ge1020ov8630;
T0* ge1020ov8581;
T0* ge1020ov8659;
T0* ge1020ov8565;
T0* ge1020ov8546;
T0* ge1020ov8786;
T0* ge1020ov8634;
T0* ge1020ov8633;
T0* ge1020ov8792;
T0* ge1020ov8665;
T0* ge1020ov8588;
T0* ge1020ov8532;
T0* ge1020ov8585;
T0* ge1020ov8664;
T0* ge1020ov8493;
T0* ge1020ov8676;
T0* ge1020ov8684;
T0* ge1020ov8675;
T0* ge1020ov8683;
T0* ge1020ov8674;
T0* ge1020ov8682;
T0* ge1020ov8673;
T0* ge1020ov8681;
T0* ge1020ov8672;
T0* ge1020ov8680;
T0* ge1020ov8671;
T0* ge1020ov8679;
T0* ge1020ov8596;
T0* ge1020ov8567;
T0* ge1020ov8490;
T0* ge1020ov8499;
T0* ge1020ov8523;
T0* ge1020ov8521;
T0* ge1020ov8512;
T0* ge1020ov8511;
T0* ge1020ov8510;
T0* ge1020ov8509;
T0* ge1020ov8508;
T0* ge1020ov8506;
T0* ge1020ov8524;
T0* ge1020ov8498;
T0* ge1020ov8495;
T0* ge1020ov8542;
T0* ge1020ov8584;
T0* ge1020ov8583;
T0* ge1020ov8722;
T0* ge1020ov8655;
T0* ge1020ov8686;
T0* ge1020ov8685;
T0* ge1020ov8678;
T0* ge1020ov8677;
T0* ge1020ov8670;
T0* ge1020ov8669;
T0* ge1020ov8666;
T0* ge1020ov8667;
T0* ge1020ov8663;
T0* ge1020ov8662;
T0* ge1020ov8661;
T0* ge1020ov8780;
T0* ge1020ov8660;
T0* ge1020ov8653;
T0* ge1020ov8652;
T0* ge1020ov8651;
T0* ge1020ov8650;
T0* ge1020ov8647;
T0* ge1020ov8646;
T0* ge1020ov8645;
T0* ge1020ov8644;
T0* ge1020ov8643;
T0* ge1020ov8642;
T0* ge1020ov8641;
T0* ge1020ov8640;
T0* ge1020ov8628;
T0* ge1020ov8629;
T0* ge1020ov8625;
T0* ge1020ov8627;
T0* ge1020ov8626;
T0* ge1020ov8624;
T0* ge1020ov8622;
T0* ge1020ov8623;
T0* ge1020ov8621;
T0* ge1020ov8620;
T0* ge1020ov8619;
T0* ge1020ov8618;
T0* ge1020ov8617;
T0* ge1020ov8616;
T0* ge1020ov8615;
T0* ge1020ov8614;
T0* ge1020ov8613;
T0* ge1020ov8612;
T0* ge1020ov8611;
T0* ge1020ov8610;
T0* ge1020ov8609;
T0* ge1020ov8608;
T0* ge1020ov8600;
T0* ge1020ov8598;
T0* ge1020ov8597;
T0* ge1020ov8595;
T0* ge1020ov8594;
T0* ge1020ov8593;
T0* ge1020ov8592;
T0* ge1020ov8591;
T0* ge1020ov8599;
T0* ge1020ov8657;
T0* ge1020ov8656;
T0* ge1020ov8654;
T0* ge1020ov8573;
T0* ge1020ov8572;
T0* ge1020ov8571;
T0* ge1020ov8570;
T0* ge1020ov8569;
T0* ge1020ov8568;
T0* ge1020ov8556;
T0* ge1020ov8555;
T0* ge1020ov8553;
T0* ge1020ov8658;
T0* ge1020ov8601;
T0* ge1020ov8561;
T0* ge1020ov8560;
T0* ge1020ov8564;
T0* ge1020ov8563;
T0* ge1020ov8562;
T0* ge1020ov8566;
T0* ge1020ov8552;
T0* ge1020ov8551;
T0* ge1020ov8771;
T0* ge1020ov8781;
T0* ge1020ov8774;
T0* ge1020ov8775;
T0* ge1020ov8483;
T0* ge1020ov8776;
T0* ge1020ov8537;
T0* ge1020ov8558;
T0* ge807ov12507;
T0* ge807ov12530;
T0* ge1020ov8487;
T0* ge1020ov8488;
T0* ge807ov12541;
T0* ge1020ov8763;
T0* ge1020ov8547;
T0* ge1020ov8548;
T0* ge1020ov8668;
T0* ge1020ov8494;
T0* ge1020ov8787;
T0* ge1020ov8794;
T0* ge1020ov8543;
T0* ge1020ov8793;
T0* ge1020ov8519;
T0* ge1020ov8518;
T0* ge1020ov8517;
T0* ge1020ov8516;
T0* ge1020ov8507;
T0* ge1020ov8505;
T0* ge1020ov8504;
T0* ge1020ov8500;
T0* ge807ov12503;
T0* ge1020ov8522;
T0* ge807ov12531;
T0* ge1020ov8515;
T0* ge807ov12521;
T0* ge1020ov8503;
T0* ge807ov12509;
T0* ge1020ov8533;
T0* ge807ov12544;
T0* ge1020ov8497;
T0* ge807ov12498;
T0* ge807ov12518;
T0* ge807ov12517;
T0* ge807ov12502;
T0* ge807ov12539;
T0* ge807ov12494;
T0* ge807ov12496;
T0* ge807ov12543;
T0* ge807ov12542;
T0* ge807ov12535;
T0* ge807ov12534;
T0* ge807ov12529;
T0* ge807ov12528;
T0* ge807ov12533;
T0* ge807ov12532;
T0* ge807ov12525;
T0* ge807ov12524;
T0* ge807ov12523;
T0* ge807ov12522;
T0* ge807ov12513;
T0* ge807ov12512;
T0* ge807ov12511;
T0* ge807ov12510;
T0* ge807ov12500;
T0* ge807ov12499;
T0* ge807ov12497;
T0* ge807ov12863;
T0* ge807ov12545;
T0* ge1019ov29975;
T0* ge1019ov29703;
T0* ge1019ov29534;
T0* ge1017ov28986;
T0* ge1017ov28980;
T0* ge1017ov28974;
T0* ge1017ov28982;
T0* ge1017ov28976;
T0* ge1017ov28970;
T0* ge1017ov28985;
T0* ge1017ov28979;
T0* ge1017ov28973;
T0* ge1017ov28987;
T0* ge1017ov28981;
T0* ge1017ov28975;
T0* ge807ov12601;
T0* ge1017ov28984;
T0* ge1017ov28978;
T0* ge1017ov28972;
T0* ge1019ov29997;
T0* ge1019ov29721;
T0* ge1019ov29556;
T0* ge807ov12788;
T0* ge1019ov29995;
T0* ge1019ov29719;
T0* ge1019ov29554;
T0* ge807ov12648;
T0* ge807ov12690;
T0* ge807ov12589;
T0* ge807ov12828;
T0* ge807ov12743;
T0* ge807ov12843;
T0* ge807ov12703;
T0* ge807ov12548;
T0* ge807ov12573;
T0* ge1019ov29994;
T0* ge1019ov29718;
T0* ge1019ov29553;
T0* ge1019ov29992;
T0* ge1019ov29716;
T0* ge1019ov29551;
T0* ge1019ov29993;
T0* ge1019ov29717;
T0* ge1019ov29552;
T0* ge807ov12596;
T0* ge1017ov28983;
T0* ge1017ov28977;
T0* ge1017ov28971;
T0* ge807ov12869;
T0* ge807ov12991;
T0* ge807ov12975;
T0* ge807ov12536;
T0* ge807ov12537;
T0* ge807ov12988;
T0* ge807ov12989;
T0* ge807ov12982;
T0* ge807ov12985;
T0* ge807ov12977;
T0* ge807ov12980;
T0* ge807ov12976;
T0* ge807ov12990;
T0* ge807ov12973;
T0* ge807ov12974;
T0* ge807ov12891;
T0* ge807ov12870;
T0* ge807ov12540;
T0* ge807ov12887;
T0* ge807ov12538;
T0* ge807ov12526;
T0* ge807ov12515;
T0* ge807ov12505;
T0* ge807ov12504;
T0* ge807ov12911;
T0* ge1111ov6044;
T0* ge1108ov17045;
T0* ge1108ov16957;
T0* ge1108ov17095;
T0* ge1108ov17007;
T0* ge1111ov6052;
T0* ge1111ov6023;
T0* ge1111ov6024;
T0* ge1111ov6046;
T0* ge1100ov6298;
T0* ge1100ov6299;
T0* ge1100ov6300;
T0* ge1108ov17094;
T0* ge1108ov17006;
T0* ge1111ov6048;
T0* ge1111ov6031;
T0* ge1111ov6045;
T0* ge1111ov6026;
T0* ge1108ov17088;
T0* ge1108ov17000;
T0* ge1108ov17087;
T0* ge1108ov16999;
T0* ge1108ov17096;
T0* ge1108ov17008;
T0* ge1111ov6008;
T0* ge1111ov6036;
T0* ge1111ov6025;
T0* ge1111ov6005;
T0* ge1111ov6021;
T0* ge1111ov6017;
T0* ge1111ov6018;
T0* ge1111ov6019;
T0* ge1111ov6042;
T0* ge1111ov6050;
T0* ge1111ov6043;
T0* ge1111ov6035;
T0* ge1111ov6049;
T0* ge1108ov17132;
T0* ge1108ov17044;
T0* ge1108ov17131;
T0* ge1108ov17043;
T0* ge1108ov17130;
T0* ge1108ov17042;
T0* ge1108ov17129;
T0* ge1108ov17041;
T0* ge1108ov17092;
T0* ge1108ov17004;
T0* ge1108ov17091;
T0* ge1108ov17003;
T0* ge1108ov17090;
T0* ge1108ov17002;
T0* ge1108ov17089;
T0* ge1108ov17001;
T0* ge1111ov6004;
T0* ge1111ov6007;
T0* ge1111ov6020;
T0* ge1108ov17100;
T0* ge1108ov17012;
T0* ge1108ov17099;
T0* ge1108ov17011;
T0* ge1108ov17098;
T0* ge1108ov17010;
T0* ge1108ov17097;
T0* ge1108ov17009;
T0* ge1114ov6003;
T0* ge1114ov6002;
T0* ge1111ov6033;
T0* ge1111ov6011;
T0* ge1111ov6037;
T0* ge1111ov6006;
T0* ge1111ov6030;
T0* ge1111ov6010;
T0* ge1111ov6013;
T0* ge1111ov6014;
T0* ge1111ov6012;
T0* ge1111ov6051;
T0* ge1111ov6027;
T0* ge1111ov6028;
T0* ge1111ov6047;
T0* ge1111ov6009;
T0* ge1111ov6029;
T0* ge1108ov17081;
T0* ge1108ov16993;
T0* ge1108ov17080;
T0* ge1108ov16992;
T0* ge1108ov17079;
T0* ge1108ov16991;
T0* ge1108ov17078;
T0* ge1108ov16990;
T0* ge1108ov17077;
T0* ge1108ov16989;
T0* ge1111ov6016;
T0* ge1108ov17063;
T0* ge1108ov16975;
T0* ge1108ov17064;
T0* ge1108ov16976;
T0* ge1108ov17062;
T0* ge1108ov16974;
T0* ge1108ov17061;
T0* ge1108ov16973;
T0* ge1108ov17060;
T0* ge1108ov16972;
T0* ge1108ov17059;
T0* ge1108ov16971;
T0* ge1108ov17068;
T0* ge1108ov16980;
T0* ge1108ov17067;
T0* ge1108ov16979;
T0* ge1108ov17066;
T0* ge1108ov16978;
T0* ge1108ov17065;
T0* ge1108ov16977;
T0* ge1108ov17128;
T0* ge1108ov17040;
T0* ge1108ov17127;
T0* ge1108ov17039;
T0* ge1108ov17126;
T0* ge1108ov17038;
T0* ge1108ov17125;
T0* ge1108ov17037;
T0* ge1108ov17070;
T0* ge1108ov16982;
T0* ge1108ov17069;
T0* ge1108ov16981;
T0* ge1108ov17052;
T0* ge1108ov16964;
T0* ge1108ov17053;
T0* ge1108ov16965;
T0* ge1108ov17051;
T0* ge1108ov16963;
T0* ge1108ov17050;
T0* ge1108ov16962;
T0* ge1108ov17073;
T0* ge1108ov16985;
T0* ge1108ov17074;
T0* ge1108ov16986;
T0* ge1108ov17072;
T0* ge1108ov16984;
T0* ge1108ov17071;
T0* ge1108ov16983;
T0* ge1108ov17111;
T0* ge1108ov17023;
T0* ge1108ov17110;
T0* ge1108ov17022;
T0* ge1108ov17109;
T0* ge1108ov17021;
T0* ge1108ov17108;
T0* ge1108ov17020;
T0* ge1108ov17107;
T0* ge1108ov17019;
T0* ge1108ov17106;
T0* ge1108ov17018;
T0* ge1111ov6015;
T0* ge1111ov6022;
T0* ge1111ov6039;
T0* ge1111ov6038;
T0* ge1111ov6041;
T0* ge1111ov6034;
T0* ge1111ov6032;
T0* ge1108ov17116;
T0* ge1108ov17028;
T0* ge1108ov17115;
T0* ge1108ov17027;
T0* ge1108ov17114;
T0* ge1108ov17026;
T0* ge1108ov17113;
T0* ge1108ov17025;
T0* ge1108ov17112;
T0* ge1108ov17024;
T0* ge1108ov17120;
T0* ge1108ov17032;
T0* ge1108ov17124;
T0* ge1108ov17036;
T0* ge1108ov17123;
T0* ge1108ov17035;
T0* ge1108ov17122;
T0* ge1108ov17034;
T0* ge1108ov17121;
T0* ge1108ov17033;
T0* ge1108ov17119;
T0* ge1108ov17031;
T0* ge1108ov17049;
T0* ge1108ov16961;
T0* ge1108ov17048;
T0* ge1108ov16960;
T0* ge1108ov17047;
T0* ge1108ov16959;
T0* ge1108ov17046;
T0* ge1108ov16958;
T0* ge1111ov6040;
T0* ge1108ov17118;
T0* ge1108ov17030;
T0* ge1108ov17105;
T0* ge1108ov17017;
T0* ge1108ov17104;
T0* ge1108ov17016;
T0* ge1108ov17102;
T0* ge1108ov17014;
T0* ge1108ov17103;
T0* ge1108ov17015;
T0* ge1108ov17101;
T0* ge1108ov17013;
T0* ge1108ov17117;
T0* ge1108ov17029;
T0* ge1108ov17058;
T0* ge1108ov16970;
T0* ge1108ov17057;
T0* ge1108ov16969;
T0* ge1108ov17055;
T0* ge1108ov16967;
T0* ge1108ov17056;
T0* ge1108ov16968;
T0* ge1108ov17054;
T0* ge1108ov16966;
T0* ge1108ov17076;
T0* ge1108ov16988;
T0* ge1108ov17075;
T0* ge1108ov16987;
T0* ge1108ov17085;
T0* ge1108ov16997;
T0* ge1108ov17084;
T0* ge1108ov16996;
T0* ge1108ov17086;
T0* ge1108ov16998;
T0* ge1108ov17093;
T0* ge1108ov17005;
T0* ge1100ov6304;
T0* ge1100ov6303;
T0* ge1108ov17083;
T0* ge1108ov16995;
T0* ge1108ov17082;
T0* ge1108ov16994;
T0* ge1289ov16084;
T0* ge1289ov16046;
T0* ge1289ov16044;
T0* ge1289ov16085;
T0* ge1289ov16057;
T0* ge1289ov16056;
T0* ge1289ov16067;
T0* ge1289ov16061;
T0* ge1289ov16060;
T0* ge1289ov16059;
T0* ge1289ov16065;
T0* ge1289ov16064;
T0* ge1289ov16066;
T0* ge1289ov16043;
T0* ge1289ov16069;
T0* ge1289ov16078;
T0* ge1292ov15898;
T0* ge1292ov15896;
T0* ge1292ov15897;
T0* ge1289ov16079;
T0* ge1289ov16080;
T0* ge1289ov16083;
T0* ge1289ov16081;
T0* ge1289ov16082;
T0* ge1289ov16076;
T0* ge1285ov30825;
T0* ge1285ov30826;
T0* ge1289ov16049;
T0* ge1289ov16072;
T0* ge1282ov15511;
T0* ge1282ov15510;
T0* ge1289ov16092;
T0* ge1289ov16093;
T0* ge1289ov16094;
T0* ge1289ov16087;
T0* ge1289ov16070;
T0* ge1289ov16071;
T0* ge1289ov16073;
T0* ge1289ov16077;
T0* ge1239ov15354;
T0* ge1129ov5023;
T0* ge1129ov5024;
T0* ge1129ov5025;
T0* ge1129ov5026;
T0* ge1129ov5027;
T0* ge1129ov5028;
T0* ge1129ov5029;
T0* ge1129ov5030;
T0* ge1129ov5031;
T0* ge1129ov5032;
T0* ge1129ov5033;
T0* ge1129ov5034;
T0* ge1129ov5035;
T0* ge1129ov5036;
T0* ge1129ov5037;
T0* ge1129ov5038;
T0* ge1129ov5039;
T0* ge1129ov5040;
T0* ge1129ov5041;
T0* ge1129ov5042;
T0* ge1129ov5043;
T0* ge1129ov5044;
T0* ge1129ov5045;
T0* ge1129ov5046;
T0* ge1129ov5047;
T0* ge1129ov5048;
T0* ge1129ov5049;
T0* ge1129ov5050;
T0* ge1129ov5051;
T0* ge1129ov5052;
T0* ge1129ov5053;
T0* ge1129ov5054;
T0* ge1129ov5055;
T0* ge1129ov5056;
T0* ge1129ov5057;
T0* ge1129ov5058;
T0* ge1129ov5059;
T0* ge1129ov5060;
T0* ge1129ov5061;
T0* ge1129ov5062;
T0* ge1129ov5063;
T0* ge1129ov5064;
T0* ge1129ov5065;
T0* ge1129ov5066;
T0* ge1129ov5067;
T0* ge1129ov5068;
T0* ge1129ov5069;
T0* ge1129ov5070;
T0* ge1129ov5071;
T0* ge1129ov5072;
T0* ge1129ov5073;
T0* ge1129ov5074;
T0* ge1129ov5075;
T0* ge1129ov5076;
T0* ge1129ov5077;
T0* ge1129ov5078;
T0* ge1129ov5079;
T0* ge1129ov5080;
T0* ge1129ov5081;
T0* ge1129ov5082;
T0* ge1129ov5083;
T0* ge1129ov5084;
T0* ge1129ov5085;
T0* ge1129ov5086;
T0* ge1129ov5087;
T0* ge1129ov5088;
T0* ge1129ov5089;
T0* ge1129ov5090;
T0* ge1129ov5091;
T0* ge1129ov5092;
T0* ge1129ov5093;
T0* ge1129ov5094;
T0* ge1129ov5095;
T0* ge1129ov5096;
T0* ge1129ov5097;
T0* ge1129ov5098;
T0* ge1129ov5099;
T0* ge1129ov5100;
T0* ge1129ov5101;
T0* ge1129ov5102;
T0* ge1129ov5103;
T0* ge1129ov5104;
T0* ge1129ov5105;
T0* ge1129ov5106;
T0* ge1129ov5107;
T0* ge1129ov5108;
T0* ge1129ov5109;
T0* ge1129ov5110;
T0* ge1129ov5111;
T0* ge1129ov5112;
T0* ge1129ov5113;
T0* ge1129ov5114;
T0* ge1129ov5115;
T0* ge1129ov5116;
T0* ge1129ov5117;
T0* ge1129ov5118;
T0* ge1129ov5219;
T0* ge1129ov5231;
T0* ge1160ov4990;
T0* ge1129ov5242;
T0* ge1129ov5227;
T0* ge1129ov5232;
T0* ge1129ov5233;
T0* ge1129ov5234;
T0* ge1129ov5220;
T0* ge1129ov5238;
T0* ge1129ov5245;
T0* ge1129ov5225;
T0* ge1129ov5216;
T0* ge1129ov5241;
T0* ge1129ov5223;
T0* ge1129ov5228;
T0* ge1129ov5226;
T0* ge1129ov5222;
T0* ge1129ov5237;
T0* ge1129ov5239;
T0* ge1129ov5247;
T0* ge1129ov5244;
T0* ge1129ov5236;
T0* ge1129ov5218;
T0* ge1129ov5243;
T0* ge1129ov5217;
T0* ge1129ov5224;
T0* ge1129ov5240;
T0* ge1129ov5235;
T0* ge1129ov5229;
T0* ge1129ov5221;
T0* ge1129ov5249;
T0* ge1129ov5230;
T0* ge1129ov5246;
T0* ge1160ov4989;
T0* ge1160ov4988;
T0* ge1119ov23794;
T0* ge1125ov15761;
T0* ge1325ov5873;
T0* ge9ov4860;
T0* ge9ov4867;
T0* ge7ov4924;
T0* ge284ov1975;
T0* ge6ov4496;
T0* ge9ov4863;
T0* ge9ov4870;
T0* ge9ov4861;
T0* ge9ov4868;
T0* ge9ov4862;
T0* ge9ov4869;
T0* ge9ov4864;
T0* ge9ov4871;
T0* ge9ov4865;
T0* ge9ov4872;
T0* ge6ov4491;
T0* ge6ov4490;
T0* ge6ov4498;
T0* ge6ov4497;
T0* ge1168ov3256;
T0* ge1168ov3254;
T0* ge1296ov30395;
T0* ge1296ov30396;
T0* ge1287ov32291;
T0* ge1287ov32293;
T0* ge807ov12520;
T0* ge1009ov39783;
T0* ge1009ov39781;
T0* ge1009ov39779;
T0* ge807ov12860;
T0* ge900ov19235;
T0* ge893ov28775;
T0* ge889ov28767;
T0* ge1019ov29948;
T0* ge1019ov29689;
T0* ge1019ov29507;
T0* ge1019ov29949;
T0* ge1019ov29508;
T0* ge1019ov29855;
T0* ge1019ov29638;
T0* ge1019ov29414;
T0* ge1019ov29769;
T0* ge1019ov29600;
T0* ge1019ov29328;
T0* ge1019ov29770;
T0* ge1019ov29329;
T0* ge1019ov29753;
T0* ge1019ov29593;
T0* ge1019ov29312;
T0* ge1019ov29752;
T0* ge1019ov29311;
T0* ge1019ov29754;
T0* ge1019ov29313;
T0* ge1019ov29778;
T0* ge1019ov29604;
T0* ge1019ov29337;
T0* ge1019ov29767;
T0* ge1019ov29326;
T0* ge1019ov29768;
T0* ge1019ov29327;
T0* ge1019ov29885;
T0* ge1019ov29655;
T0* ge1019ov29444;
T0* ge1019ov29884;
T0* ge1019ov29443;
T0* ge1019ov29886;
T0* ge1019ov29656;
T0* ge1019ov29445;
T0* ge1019ov29782;
T0* ge1019ov29606;
T0* ge1019ov29341;
T0* ge1019ov29788;
T0* ge1019ov29610;
T0* ge1019ov29347;
T0* ge1019ov29877;
T0* ge1019ov29651;
T0* ge1019ov29436;
T0* ge1019ov29860;
T0* ge1019ov29641;
T0* ge1019ov29419;
T0* ge1019ov29887;
T0* ge1019ov29657;
T0* ge1019ov29446;
T0* ge1019ov29785;
T0* ge1019ov29608;
T0* ge1019ov29344;
T0* ge1019ov29792;
T0* ge1019ov29613;
T0* ge1019ov29351;
T0* ge1019ov29878;
T0* ge1019ov29652;
T0* ge1019ov29437;
T0* ge1019ov29876;
T0* ge1019ov29650;
T0* ge1019ov29435;
T0* ge1019ov29861;
T0* ge1019ov29642;
T0* ge1019ov29420;
T0* ge1019ov29879;
T0* ge1019ov29653;
T0* ge1019ov29438;
T0* ge807ov12858;
T0* ge807ov12632;
T0* ge807ov12546;
T0* ge807ov12726;
T0* ge807ov12607;
T0* ge1019ov29996;
T0* ge1019ov29720;
T0* ge1019ov29555;
T0* ge807ov12670;
T0* ge807ov12595;
T0* ge1019ov29851;
T0* ge1019ov29637;
T0* ge1019ov29410;
T0* ge1019ov29852;
T0* ge1019ov29411;
T0* ge1019ov29843;
T0* ge1019ov29634;
T0* ge1019ov29402;
T0* ge1019ov29854;
T0* ge1019ov29413;
T0* ge1019ov29853;
T0* ge1019ov29412;
T0* ge1019ov29850;
T0* ge1019ov29636;
T0* ge1019ov29409;
T0* ge1019ov29815;
T0* ge1019ov29622;
T0* ge1019ov29374;
T0* ge1019ov29814;
T0* ge1019ov29621;
T0* ge1019ov29373;
T0* ge1019ov29813;
T0* ge1019ov29620;
T0* ge1019ov29372;
T0* ge1019ov29812;
T0* ge1019ov29619;
T0* ge1019ov29371;
T0* ge1019ov29811;
T0* ge1019ov29370;
T0* ge1019ov29743;
T0* ge1019ov29589;
T0* ge1019ov29302;
T0* ge1019ov29741;
T0* ge1019ov29588;
T0* ge1019ov29300;
T0* ge1019ov29821;
T0* ge1019ov29623;
T0* ge1019ov29380;
T0* ge1019ov29818;
T0* ge1019ov29377;
T0* ge1019ov29829;
T0* ge1019ov29625;
T0* ge1019ov29388;
T0* ge1019ov29825;
T0* ge1019ov29624;
T0* ge1019ov29384;
T0* ge1019ov29822;
T0* ge1019ov29381;
T0* ge1019ov29819;
T0* ge1019ov29378;
T0* ge1019ov29830;
T0* ge1019ov29389;
T0* ge1019ov29826;
T0* ge1019ov29385;
T0* ge1019ov29823;
T0* ge1019ov29382;
T0* ge1019ov29820;
T0* ge1019ov29379;
T0* ge1019ov29831;
T0* ge1019ov29390;
T0* ge1019ov29827;
T0* ge1019ov29386;
T0* ge1019ov29941;
T0* ge1019ov29685;
T0* ge1019ov29500;
T0* ge1019ov29837;
T0* ge1019ov29629;
T0* ge1019ov29396;
T0* ge1019ov29836;
T0* ge1019ov29395;
T0* ge1019ov29817;
T0* ge1019ov29376;
T0* ge1019ov29816;
T0* ge1019ov29375;
T0* ge1019ov29828;
T0* ge1019ov29387;
T0* ge1019ov29824;
T0* ge1019ov29383;
T0* ge1019ov29835;
T0* ge1019ov29628;
T0* ge1019ov29394;
T0* ge1019ov29834;
T0* ge1019ov29627;
T0* ge1019ov29393;
T0* ge1019ov29833;
T0* ge1019ov29626;
T0* ge1019ov29392;
T0* ge1019ov29930;
T0* ge1019ov29679;
T0* ge1019ov29489;
T0* ge1019ov29928;
T0* ge1019ov29678;
T0* ge1019ov29487;
T0* ge1019ov29756;
T0* ge1019ov29594;
T0* ge1019ov29315;
T0* ge1019ov29883;
T0* ge1019ov29654;
T0* ge1019ov29442;
T0* ge1019ov29755;
T0* ge1019ov29314;
T0* ge1019ov29882;
T0* ge1019ov29441;
T0* ge1019ov29881;
T0* ge1019ov29440;
T0* ge1019ov29786;
T0* ge1019ov29609;
T0* ge1019ov29345;
T0* ge1019ov29784;
T0* ge1019ov29607;
T0* ge1019ov29343;
T0* ge1019ov29783;
T0* ge1019ov29342;
T0* ge1019ov29790;
T0* ge1019ov29611;
T0* ge1019ov29349;
T0* ge1019ov29789;
T0* ge1019ov29348;
T0* ge1019ov29791;
T0* ge1019ov29612;
T0* ge1019ov29350;
T0* ge1019ov29865;
T0* ge1019ov29643;
T0* ge1019ov29424;
T0* ge1019ov29864;
T0* ge1019ov29423;
T0* ge1019ov29832;
T0* ge1019ov29391;
T0* ge1019ov29863;
T0* ge1019ov29422;
T0* ge1019ov29862;
T0* ge1019ov29421;
T0* ge1019ov29866;
T0* ge1019ov29644;
T0* ge1019ov29425;
T0* ge1019ov29772;
T0* ge1019ov29601;
T0* ge1019ov29331;
T0* ge1019ov29771;
T0* ge1019ov29330;
T0* ge1019ov29777;
T0* ge1019ov29336;
T0* ge1019ov29774;
T0* ge1019ov29602;
T0* ge1019ov29333;
T0* ge1019ov29775;
T0* ge1019ov29334;
T0* ge1019ov29880;
T0* ge1019ov29439;
T0* ge1019ov29773;
T0* ge1019ov29332;
T0* ge1019ov29787;
T0* ge1019ov29346;
T0* ge1019ov29776;
T0* ge1019ov29603;
T0* ge1019ov29335;
T0* ge1019ov29781;
T0* ge1019ov29605;
T0* ge1019ov29340;
T0* ge1019ov29779;
T0* ge1019ov29338;
T0* ge1019ov29780;
T0* ge1019ov29339;
T0* ge1019ov29888;
T0* ge1019ov29658;
T0* ge1019ov29447;
T0* ge1019ov29857;
T0* ge1019ov29630;
T0* ge1019ov29416;
T0* ge1019ov29751;
T0* ge1019ov29592;
T0* ge1019ov29310;
T0* ge1019ov29749;
T0* ge1019ov29308;
T0* ge1019ov29745;
T0* ge1019ov29591;
T0* ge1019ov29304;
T0* ge1019ov29744;
T0* ge1019ov29590;
T0* ge1019ov29303;
T0* ge1019ov29986;
T0* ge1019ov29709;
T0* ge1019ov29545;
T0* ge1019ov29989;
T0* ge1019ov29713;
T0* ge1019ov29548;
T0* ge1019ov29946;
T0* ge1019ov29688;
T0* ge1019ov29505;
T0* ge1019ov29988;
T0* ge1019ov29712;
T0* ge1019ov29547;
T0* ge1019ov29856;
T0* ge1019ov29639;
T0* ge1019ov29415;
T0* ge1019ov29858;
T0* ge1019ov29417;
T0* ge1008ov38988;
T0* ge1008ov38983;
T0* ge1008ov38978;
T0* ge1008ov38989;
T0* ge1008ov38984;
T0* ge1008ov38979;
T0* ge1008ov38987;
T0* ge1008ov38982;
T0* ge1008ov38977;
T0* ge1019ov29999;
T0* ge1019ov29722;
T0* ge1019ov29558;
T0* ge807ov12853;
T0* ge807ov12898;
T0* ge807ov12852;
T0* ge807ov12849;
T0* ge807ov12913;
T0* ge807ov12897;
T0* ge807ov12872;
T0* ge807ov12899;
T0* ge807ov12914;
T0* ge807ov12856;
T0* ge807ov12901;
T0* ge807ov12868;
T0* ge807ov12871;
T0* ge807ov12921;
T0* ge807ov12862;
T0* ge807ov12893;
T0* ge807ov12881;
T0* ge807ov12907;
T0* ge807ov12861;
T0* ge807ov12919;
T0* ge807ov12889;
T0* ge807ov12875;
T0* ge807ov12906;
T0* ge1016ov38996;
T0* ge1016ov38995;
T0* ge807ov12892;
T0* ge807ov12854;
T0* ge807ov12886;
T0* ge807ov12902;
T0* ge807ov12890;
T0* ge807ov12917;
T0* ge807ov12880;
T0* ge807ov12864;
T0* ge807ov12866;
T0* ge807ov12903;
T0* ge807ov12855;
T0* ge807ov12877;
T0* ge807ov12905;
T0* ge1019ov29998;
T0* ge1019ov29557;
T0* ge1031ov24336;
T0* ge807ov12972;
T0* ge807ov12978;
T0* ge807ov12979;
T0* ge807ov12981;
T0* ge807ov12983;
T0* ge807ov12984;
T0* ge807ov12986;
T0* ge807ov12987;
T0* ge807ov13034;
T0* ge807ov13035;
T0* ge807ov13036;
T0* ge807ov12495;
T0* ge807ov12501;
T0* ge807ov12506;
T0* ge807ov12508;
T0* ge807ov12514;
T0* ge807ov12516;
T0* ge807ov12519;
T0* ge807ov12527;
T0* ge807ov12547;
T0* ge807ov12549;
T0* ge807ov12550;
T0* ge807ov12551;
T0* ge807ov12552;
T0* ge807ov12553;
T0* ge807ov12554;
T0* ge807ov12555;
T0* ge807ov12556;
T0* ge807ov12557;
T0* ge807ov12558;
T0* ge807ov12559;
T0* ge807ov12560;
T0* ge807ov12561;
T0* ge807ov12562;
T0* ge807ov12563;
T0* ge807ov12564;
T0* ge807ov12565;
T0* ge807ov12566;
T0* ge807ov12567;
T0* ge807ov12568;
T0* ge807ov12569;
T0* ge807ov12570;
T0* ge807ov12571;
T0* ge807ov12574;
T0* ge807ov12575;
T0* ge807ov12576;
T0* ge807ov12577;
T0* ge807ov12578;
T0* ge807ov12579;
T0* ge807ov12580;
T0* ge807ov12581;
T0* ge807ov12582;
T0* ge807ov12583;
T0* ge807ov12584;
T0* ge807ov12585;
T0* ge807ov12586;
T0* ge807ov12587;
T0* ge807ov12588;
T0* ge807ov12590;
T0* ge807ov12591;
T0* ge807ov12592;
T0* ge807ov12593;
T0* ge807ov12594;
T0* ge807ov12597;
T0* ge807ov12598;
T0* ge807ov12599;
T0* ge807ov12600;
T0* ge807ov12602;
T0* ge807ov12603;
T0* ge807ov12604;
T0* ge807ov12605;
T0* ge807ov12606;
T0* ge807ov12608;
T0* ge807ov12609;
T0* ge807ov12610;
T0* ge807ov12611;
T0* ge807ov12612;
T0* ge807ov12613;
T0* ge807ov12614;
T0* ge807ov12615;
T0* ge807ov12616;
T0* ge807ov12617;
T0* ge807ov12618;
T0* ge807ov12619;
T0* ge807ov12620;
T0* ge807ov12621;
T0* ge807ov12622;
T0* ge807ov12623;
T0* ge807ov12624;
T0* ge807ov12625;
T0* ge807ov12626;
T0* ge807ov12627;
T0* ge807ov12628;
T0* ge807ov12629;
T0* ge807ov12630;
T0* ge807ov12631;
T0* ge807ov12633;
T0* ge807ov12634;
T0* ge807ov12635;
T0* ge807ov12636;
T0* ge807ov12637;
T0* ge807ov12638;
T0* ge807ov12639;
T0* ge807ov12640;
T0* ge807ov12641;
T0* ge807ov12642;
T0* ge807ov12643;
T0* ge807ov12644;
T0* ge807ov12645;
T0* ge807ov12646;
T0* ge807ov12647;
T0* ge807ov12649;
T0* ge807ov12650;
T0* ge807ov12651;
T0* ge807ov12652;
T0* ge807ov12653;
T0* ge807ov12654;
T0* ge807ov12655;
T0* ge807ov12656;
T0* ge807ov12657;
T0* ge807ov12658;
T0* ge807ov12659;
T0* ge807ov12660;
T0* ge807ov12661;
T0* ge807ov12662;
T0* ge807ov12663;
T0* ge807ov12664;
T0* ge807ov12665;
T0* ge807ov12666;
T0* ge807ov12667;
T0* ge807ov12668;
T0* ge807ov12669;
T0* ge807ov12671;
T0* ge807ov12672;
T0* ge807ov12673;
T0* ge807ov12674;
T0* ge807ov12675;
T0* ge807ov12676;
T0* ge807ov12677;
T0* ge807ov12678;
T0* ge807ov12679;
T0* ge807ov12680;
T0* ge807ov12681;
T0* ge807ov12682;
T0* ge807ov12683;
T0* ge807ov12684;
T0* ge807ov12685;
T0* ge807ov12686;
T0* ge807ov12687;
T0* ge807ov12688;
T0* ge807ov12689;
T0* ge807ov12691;
T0* ge807ov12692;
T0* ge807ov12693;
T0* ge807ov12694;
T0* ge807ov12695;
T0* ge807ov12696;
T0* ge807ov12697;
T0* ge807ov12699;
T0* ge807ov12700;
T0* ge807ov12701;
T0* ge807ov12702;
T0* ge807ov12704;
T0* ge807ov12705;
T0* ge807ov12706;
T0* ge807ov12707;
T0* ge807ov12708;
T0* ge807ov12709;
T0* ge807ov12710;
T0* ge807ov12711;
T0* ge807ov12712;
T0* ge807ov12713;
T0* ge807ov12714;
T0* ge807ov12715;
T0* ge807ov12716;
T0* ge807ov12717;
T0* ge807ov12718;
T0* ge807ov12719;
T0* ge807ov12720;
T0* ge807ov12721;
T0* ge807ov12722;
T0* ge807ov12723;
T0* ge807ov12724;
T0* ge807ov12725;
T0* ge807ov12727;
T0* ge807ov12728;
T0* ge807ov12729;
T0* ge807ov12730;
T0* ge807ov12731;
T0* ge807ov12732;
T0* ge807ov12733;
T0* ge807ov12734;
T0* ge807ov12735;
T0* ge807ov12736;
T0* ge807ov12737;
T0* ge807ov12738;
T0* ge807ov12739;
T0* ge807ov12740;
T0* ge807ov12741;
T0* ge807ov12742;
T0* ge807ov12744;
T0* ge807ov12745;
T0* ge807ov12746;
T0* ge807ov12747;
T0* ge807ov12748;
T0* ge807ov12749;
T0* ge807ov12750;
T0* ge807ov12751;
T0* ge807ov12752;
T0* ge807ov12753;
T0* ge807ov12754;
T0* ge807ov12755;
T0* ge807ov12756;
T0* ge807ov12757;
T0* ge807ov12758;
T0* ge807ov12759;
T0* ge807ov12760;
T0* ge807ov12761;
T0* ge807ov12762;
T0* ge807ov12763;
T0* ge807ov12764;
T0* ge807ov12765;
T0* ge807ov12766;
T0* ge807ov12767;
T0* ge807ov12768;
T0* ge807ov12769;
T0* ge807ov12770;
T0* ge807ov12771;
T0* ge807ov12772;
T0* ge807ov12773;
T0* ge807ov12774;
T0* ge807ov12775;
T0* ge807ov12776;
T0* ge807ov12777;
T0* ge807ov12778;
T0* ge807ov12779;
T0* ge807ov12780;
T0* ge807ov12781;
T0* ge807ov12782;
T0* ge807ov12783;
T0* ge807ov12784;
T0* ge807ov12785;
T0* ge807ov12786;
T0* ge807ov12787;
T0* ge807ov12789;
T0* ge807ov12790;
T0* ge807ov12791;
T0* ge807ov12792;
T0* ge807ov12793;
T0* ge807ov12794;
T0* ge807ov12795;
T0* ge807ov12796;
T0* ge807ov12797;
T0* ge807ov12798;
T0* ge807ov12799;
T0* ge807ov12800;
T0* ge807ov12801;
T0* ge807ov12802;
T0* ge807ov12803;
T0* ge807ov12804;
T0* ge807ov12805;
T0* ge807ov12806;
T0* ge807ov12807;
T0* ge807ov12808;
T0* ge807ov12809;
T0* ge807ov12810;
T0* ge807ov12811;
T0* ge807ov12812;
T0* ge807ov12813;
T0* ge807ov12814;
T0* ge807ov12815;
T0* ge807ov12816;
T0* ge807ov12817;
T0* ge807ov12818;
T0* ge807ov12819;
T0* ge807ov12820;
T0* ge807ov12821;
T0* ge807ov12822;
T0* ge807ov12823;
T0* ge807ov12824;
T0* ge807ov12825;
T0* ge807ov12826;
T0* ge807ov12827;
T0* ge807ov12829;
T0* ge807ov12830;
T0* ge807ov12831;
T0* ge807ov12832;
T0* ge807ov12833;
T0* ge807ov12834;
T0* ge807ov12835;
T0* ge807ov12836;
T0* ge807ov12837;
T0* ge807ov12838;
T0* ge807ov12839;
T0* ge807ov12840;
T0* ge807ov12841;
T0* ge807ov12842;
T0* ge807ov12844;
T0* ge807ov12846;
T0* ge807ov12847;
T0* ge807ov12850;
T0* ge807ov12851;
T0* ge807ov12859;
T0* ge807ov12867;
T0* ge807ov12873;
T0* ge807ov12876;
T0* ge807ov12878;
T0* ge807ov12879;
T0* ge807ov12882;
T0* ge807ov12883;
T0* ge807ov12884;
T0* ge807ov12885;
T0* ge807ov12888;
T0* ge807ov12894;
T0* ge807ov12895;
T0* ge807ov12896;
T0* ge807ov12904;
T0* ge807ov12908;
T0* ge807ov12909;
T0* ge807ov12910;
T0* ge807ov12912;
T0* ge807ov12915;
T0* ge807ov12916;
T0* ge807ov12918;
T0* ge807ov12920;
T0* ge807ov12922;
T0* ge807ov12936;
T0* ge807ov12937;
T0* ge807ov12938;
T0* ge807ov12939;
T0* ge807ov12940;
T0* ge807ov12941;
T0* ge807ov12942;
T0* ge807ov12943;
T0* ge807ov12944;
T0* ge807ov12945;
T0* ge807ov12946;
T0* ge807ov12947;
T0* ge807ov12948;
T0* ge807ov12949;
T0* ge807ov12950;
T0* ge807ov12951;
T0* ge807ov12952;
T0* ge807ov12953;
T0* ge807ov12954;
T0* ge807ov12955;
T0* ge807ov12956;
T0* ge807ov12957;
T0* ge807ov12958;
T0* ge807ov12959;
T0* ge807ov12961;
T0* ge807ov12962;
T0* ge807ov12963;
T0* ge807ov12964;
T0* ge807ov12965;
T0* ge807ov12966;
T0* ge807ov12967;
T0* ge807ov12968;
T0* ge807ov12969;
T0* ge807ov12970;
T0* ge228ov17291;
T0* ge1031ov24364;
T0* ge1019ov29958;
T0* ge1019ov29695;
T0* ge1019ov29517;
T0* ge1019ov29875;
T0* ge1019ov29649;
T0* ge1019ov29434;
T0* ge1019ov29956;
T0* ge1019ov29693;
T0* ge1019ov29515;
T0* ge1019ov29955;
T0* ge1019ov29514;
T0* ge1019ov29766;
T0* ge1019ov29599;
T0* ge1019ov29325;
T0* ge1019ov29953;
T0* ge1019ov29692;
T0* ge1019ov29512;
T0* ge1019ov29952;
T0* ge1019ov29511;
T0* ge1019ov29765;
T0* ge1019ov29598;
T0* ge1019ov29324;
T0* ge1019ov29736;
T0* ge1019ov29584;
T0* ge1019ov29295;
T0* ge1019ov29874;
T0* ge1019ov29433;
T0* ge1019ov29872;
T0* ge1019ov29648;
T0* ge1019ov29431;
T0* ge1019ov29737;
T0* ge1019ov29296;
T0* ge1019ov29960;
T0* ge1019ov29696;
T0* ge1019ov29519;
T0* ge1019ov29971;
T0* ge1019ov29700;
T0* ge1019ov29530;
T0* ge1019ov30011;
T0* ge1019ov29727;
T0* ge1019ov29570;
T0* ge1019ov30009;
T0* ge1019ov29568;
T0* ge1019ov30010;
T0* ge1019ov29569;
T0* ge1019ov30006;
T0* ge1019ov29725;
T0* ge1019ov29565;
T0* ge1019ov30004;
T0* ge1019ov29563;
T0* ge1019ov30005;
T0* ge1019ov29564;
T0* ge1019ov30007;
T0* ge1019ov29726;
T0* ge1019ov29566;
T0* ge1019ov30008;
T0* ge1019ov29567;
T0* ge1019ov30002;
T0* ge1019ov29724;
T0* ge1019ov29561;
T0* ge1019ov30003;
T0* ge1019ov29562;
T0* ge1019ov29873;
T0* ge1019ov29432;
T0* ge1019ov30021;
T0* ge1019ov29731;
T0* ge1019ov29580;
T0* ge1019ov30019;
T0* ge1019ov29578;
T0* ge1019ov30020;
T0* ge1019ov29579;
T0* ge1019ov30016;
T0* ge1019ov29729;
T0* ge1019ov29575;
T0* ge1019ov30014;
T0* ge1019ov29573;
T0* ge1019ov30015;
T0* ge1019ov29574;
T0* ge1019ov30017;
T0* ge1019ov29730;
T0* ge1019ov29576;
T0* ge1019ov30018;
T0* ge1019ov29577;
T0* ge1019ov30012;
T0* ge1019ov29728;
T0* ge1019ov29571;
T0* ge1019ov30013;
T0* ge1019ov29572;
T0* ge1019ov29805;
T0* ge1019ov29617;
T0* ge1019ov29364;
T0* ge1019ov29804;
T0* ge1019ov29363;
T0* ge1019ov29803;
T0* ge1019ov29616;
T0* ge1019ov29362;
T0* ge1019ov29802;
T0* ge1019ov29361;
T0* ge1019ov29806;
T0* ge1019ov29618;
T0* ge1019ov29365;
T0* ge1019ov29797;
T0* ge1019ov29615;
T0* ge1019ov29356;
T0* ge1019ov29799;
T0* ge1019ov29358;
T0* ge1019ov29959;
T0* ge1019ov29518;
T0* ge1019ov29954;
T0* ge1019ov29513;
T0* ge1019ov29972;
T0* ge1019ov29531;
T0* ge1019ov29807;
T0* ge1019ov29366;
T0* ge1019ov29795;
T0* ge1019ov29354;
T0* ge1019ov29801;
T0* ge1019ov29360;
T0* ge1019ov29798;
T0* ge1019ov29357;
T0* ge1019ov29796;
T0* ge1019ov29355;
T0* ge1019ov29944;
T0* ge1019ov29687;
T0* ge1019ov29503;
T0* ge1019ov29945;
T0* ge1019ov29504;
T0* ge1019ov29932;
T0* ge1019ov29680;
T0* ge1019ov29491;
T0* ge1019ov29933;
T0* ge1019ov29681;
T0* ge1019ov29492;
T0* ge1019ov29929;
T0* ge1019ov29488;
T0* ge1019ov29967;
T0* ge1019ov29698;
T0* ge1019ov29526;
T0* ge1020ov8575;
T0* ge1020ov8797;
T0* ge1020ov8777;
T0* ge1020ov8687;
T0* ge1020ov8795;
T0* ge1020ov8791;
T0* ge1020ov8761;
T0* ge1020ov8689;
T0* ge1020ov8587;
T0* ge1020ov8688;
T0* ge1020ov8783;
T0* ge1020ov8770;
T0* ge1020ov8799;
T0* ge1019ov29966;
T0* ge1019ov29697;
T0* ge1019ov29525;
T0* ge1019ov29970;
T0* ge1019ov29699;
T0* ge1019ov29529;
T0* ge1019ov29969;
T0* ge1019ov29528;
T0* ge1019ov29965;
T0* ge1019ov29524;
T0* ge1019ov29964;
T0* ge1019ov29523;
T0* ge1019ov29963;
T0* ge1019ov29522;
T0* ge1019ov29962;
T0* ge1019ov29521;
T0* ge1019ov29961;
T0* ge1019ov29520;
T0* ge1019ov29981;
T0* ge1019ov29705;
T0* ge1019ov29540;
T0* ge1019ov29738;
T0* ge1019ov29585;
T0* ge1019ov29297;
T0* ge1019ov29894;
T0* ge1019ov29660;
T0* ge1019ov29453;
T0* ge1019ov29893;
T0* ge1019ov29452;
T0* ge1019ov29892;
T0* ge1019ov29451;
T0* ge1019ov29891;
T0* ge1019ov29450;
T0* ge1019ov29890;
T0* ge1019ov29449;
T0* ge1019ov29889;
T0* ge1019ov29659;
T0* ge1019ov29448;
T0* ge1020ov8800;
T0* ge1019ov29899;
T0* ge1019ov29663;
T0* ge1019ov29458;
T0* ge1019ov29906;
T0* ge1019ov29667;
T0* ge1019ov29465;
T0* ge1019ov29905;
T0* ge1019ov29464;
T0* ge1019ov29904;
T0* ge1019ov29666;
T0* ge1019ov29463;
T0* ge1019ov29903;
T0* ge1019ov29462;
T0* ge1019ov29902;
T0* ge1019ov29665;
T0* ge1019ov29461;
T0* ge1019ov29901;
T0* ge1019ov29460;
T0* ge1019ov29900;
T0* ge1019ov29664;
T0* ge1019ov29459;
T0* ge1019ov29898;
T0* ge1019ov29457;
T0* ge1020ov8764;
T0* ge1019ov29984;
T0* ge1019ov29707;
T0* ge1019ov29543;
T0* ge1019ov29982;
T0* ge1019ov29706;
T0* ge1019ov29541;
T0* ge1019ov29980;
T0* ge1019ov29539;
T0* ge1020ov8638;
T0* ge1019ov30022;
T0* ge1019ov29732;
T0* ge1019ov29581;
T0* ge1019ov29978;
T0* ge1019ov29537;
T0* ge1020ov8604;
T0* ge1020ov8605;
T0* ge1020ov8606;
T0* ge1020ov8607;
T0* ge1020ov8636;
T0* ge1020ov8637;
T0* ge1020ov8639;
T0* ge1019ov29979;
T0* ge1019ov29538;
T0* ge1019ov29808;
T0* ge1019ov29367;
T0* ge1019ov29974;
T0* ge1019ov29702;
T0* ge1019ov29533;
T0* ge801ov39794;
T0* ge801ov39793;
T0* ge1019ov29973;
T0* ge1019ov29701;
T0* ge1019ov29532;
T0* ge801ov39795;
T0* ge1019ov29991;
T0* ge1019ov29715;
T0* ge1019ov29550;
T0* ge1019ov29990;
T0* ge1019ov29714;
T0* ge1019ov29549;
T0* ge807ov12900;
T0* ge807ov12857;
T0* ge1020ov8589;
T0* ge1020ov8526;
T0* ge1020ov8514;
T0* ge1020ov8782;
T0* ge1020ov8539;
T0* ge1020ov8760;
T0* ge1019ov29942;
T0* ge1019ov29501;
T0* ge1019ov29938;
T0* ge1019ov29684;
T0* ge1019ov29497;
T0* ge1019ov29939;
T0* ge1019ov29498;
T0* ge1019ov29746;
T0* ge1019ov29305;
T0* ge1019ov29859;
T0* ge1019ov29640;
T0* ge1019ov29418;
T0* ge1019ov29940;
T0* ge1019ov29499;
T0* ge1019ov29761;
T0* ge1019ov29597;
T0* ge1019ov29320;
T0* ge1019ov29760;
T0* ge1019ov29319;
T0* ge1019ov29759;
T0* ge1019ov29596;
T0* ge1019ov29318;
T0* ge1019ov29763;
T0* ge1019ov29322;
T0* ge1019ov29764;
T0* ge1019ov29323;
T0* ge1019ov29758;
T0* ge1019ov29595;
T0* ge1019ov29317;
T0* ge1019ov29957;
T0* ge1019ov29694;
T0* ge1019ov29516;
T0* ge1020ov8769;
T0* ge1019ov29735;
T0* ge1019ov29583;
T0* ge1019ov29294;
T0* ge1019ov29809;
T0* ge1019ov29368;
T0* ge1019ov29914;
T0* ge1019ov29668;
T0* ge1019ov29473;
T0* ge1019ov29912;
T0* ge1019ov29471;
T0* ge1019ov29910;
T0* ge1019ov29469;
T0* ge1019ov29909;
T0* ge1019ov29468;
T0* ge1019ov29935;
T0* ge1019ov29682;
T0* ge1019ov29494;
T0* ge1019ov29937;
T0* ge1019ov29683;
T0* ge1019ov29496;
T0* ge1019ov29927;
T0* ge1019ov29677;
T0* ge1019ov29486;
T0* ge1019ov29968;
T0* ge1019ov29527;
T0* ge1019ov29913;
T0* ge1019ov29472;
T0* ge1019ov29911;
T0* ge1019ov29470;
T0* ge1019ov29908;
T0* ge1019ov29467;
T0* ge1019ov29907;
T0* ge1019ov29466;
T0* ge1019ov29931;
T0* ge1019ov29490;
T0* ge1019ov29926;
T0* ge1019ov29485;
T0* ge1019ov29915;
T0* ge1019ov29669;
T0* ge1019ov29474;
T0* ge1019ov29916;
T0* ge1019ov29475;
T0* ge1019ov29947;
T0* ge1019ov29506;
T0* ge1019ov29750;
T0* ge1019ov29309;
T0* ge1019ov29748;
T0* ge1019ov29307;
T0* ge1019ov29747;
T0* ge1019ov29306;
T0* ge1019ov29943;
T0* ge1019ov29686;
T0* ge1019ov29502;
T0* ge1019ov30000;
T0* ge1019ov29723;
T0* ge1019ov29559;
T0* ge1019ov30001;
T0* ge1019ov29560;
T0* ge1019ov29951;
T0* ge1019ov29691;
T0* ge1019ov29510;
T0* ge1019ov29950;
T0* ge1019ov29690;
T0* ge1019ov29509;
T0* ge1019ov29987;
T0* ge1019ov29711;
T0* ge1019ov29546;
T0* ge1019ov29977;
T0* ge1019ov29704;
T0* ge1019ov29536;
T0* ge1019ov29976;
T0* ge1019ov29535;
T0* ge1019ov29845;
T0* ge1019ov29404;
T0* ge1019ov29848;
T0* ge1019ov29635;
T0* ge1019ov29407;
T0* ge1019ov29838;
T0* ge1019ov29631;
T0* ge1019ov29397;
T0* ge1019ov29841;
T0* ge1019ov29633;
T0* ge1019ov29400;
T0* ge1019ov29844;
T0* ge1019ov29403;
T0* ge1019ov29810;
T0* ge1019ov29369;
T0* ge1019ov29922;
T0* ge1019ov29674;
T0* ge1019ov29481;
T0* ge1019ov29921;
T0* ge1019ov29673;
T0* ge1019ov29480;
T0* ge1019ov29919;
T0* ge1019ov29672;
T0* ge1019ov29478;
T0* ge1019ov29920;
T0* ge1019ov29479;
T0* ge1019ov29918;
T0* ge1019ov29671;
T0* ge1019ov29477;
T0* ge1019ov29917;
T0* ge1019ov29670;
T0* ge1019ov29476;
T0* ge1019ov29923;
T0* ge1019ov29676;
T0* ge1019ov29482;
T0* ge66ov39492;
T0* ge1008ov38986;
T0* ge1008ov38981;
T0* ge1008ov38976;
T0* ge1019ov29985;
T0* ge1019ov29708;
T0* ge1019ov29544;
T0* ge1020ov8538;
T0* ge1020ov8540;
T0* ge1020ov8755;
T0* ge1020ov8586;
T0* ge1019ov29896;
T0* ge1019ov29662;
T0* ge1019ov29455;
T0* ge1019ov29897;
T0* ge1019ov29456;
T0* ge1019ov29895;
T0* ge1019ov29661;
T0* ge1019ov29454;
T0* ge1020ov8590;
T0* ge1019ov29739;
T0* ge1019ov29586;
T0* ge1019ov29298;
T0* ge1019ov29740;
T0* ge1019ov29587;
T0* ge1019ov29299;
T0* ge1019ov29867;
T0* ge1019ov29645;
T0* ge1019ov29426;
T0* ge1019ov29793;
T0* ge1019ov29614;
T0* ge1019ov29352;
T0* ge1019ov29794;
T0* ge1019ov29353;
T0* ge1019ov29869;
T0* ge1019ov29646;
T0* ge1019ov29428;
T0* ge1019ov29870;
T0* ge1019ov29429;
T0* ge1019ov29868;
T0* ge1019ov29427;
T0* ge1019ov29871;
T0* ge1019ov29647;
T0* ge1019ov29430;
T0* ge1019ov29847;
T0* ge1019ov29406;
T0* ge1019ov29849;
T0* ge1019ov29408;
T0* ge1019ov29839;
T0* ge1019ov29398;
T0* ge1019ov29842;
T0* ge1019ov29401;
T0* ge1019ov29840;
T0* ge1019ov29632;
T0* ge1019ov29399;
T0* ge1019ov29846;
T0* ge1019ov29405;
T0* ge1019ov29757;
T0* ge1019ov29316;
T0* ge1219ov30186;
T0* ge1219ov30185;
T0* ge351ov13431;
T0* ge264ov13431;
T0* ge251ov13431;
T0* ge7ov4925;
T0* ge7ov4926;
T0* ge7ov4927;
T0* ge1018ov40166;
T0* ge1018ov40162;
T0* ge1018ov40161;
T0* ge1018ov40165;
T0* ge1018ov40160;
T0* ge1018ov40164;
T0* ge1018ov40159;
T0* ge1018ov40163;
T0* ge1018ov40158;
T0* ge807ov12960;
T0* ge807ov12971;
T0* ge811ov31574;
T0* ge807ov13032;
T0* ge807ov13033;
T0* ge807ov13013;
T0* ge807ov13029;
T0* ge807ov13017;
T0* ge807ov13018;
T0* ge807ov13019;
T0* ge807ov13020;
T0* ge807ov13014;
T0* ge807ov13021;
T0* ge807ov13022;
T0* ge807ov13023;
T0* ge807ov13024;
T0* ge807ov13015;
T0* ge807ov13030;
T0* ge807ov13025;
T0* ge807ov13026;
T0* ge807ov13027;
T0* ge807ov13016;
T0* ge807ov13028;
T0* ge807ov13031;
T0* ge1287ov32290;
T0* ge1287ov32292;
T0* ge713ov17273;
T0* ge713ov17274;
T0* ge807ov13009;
T0* ge807ov13008;
T0* ge807ov12996;
T0* ge807ov12997;
T0* ge807ov12998;
T0* ge807ov12999;
T0* ge807ov13000;
T0* ge807ov13001;
T0* ge807ov13002;
T0* ge807ov13003;
T0* ge807ov13004;
T0* ge807ov13005;
T0* ge807ov13006;
T0* ge807ov13007;
T0* ge807ov13011;
T0* ge807ov13012;
T0* ge807ov12992;
T0* ge807ov12993;
T0* ge807ov12994;
T0* ge807ov12995;
T0* ge807ov13010;
T0* ge832ov32947;
T0* ge832ov32946;
T0* ge807ov12926;
T0* ge807ov12927;
T0* ge807ov12925;
T0* ge807ov12923;
T0* ge807ov12924;
T0* ge807ov12931;
T0* ge807ov12932;
T0* ge807ov12930;
T0* ge807ov12928;
T0* ge807ov12929;
T0* ge807ov12933;
T0* ge807ov12934;
T0* ge807ov12935;
T0* ge851ov34408;
T0* ge839ov31481;
T0* ge51ov4876;
T0* ge37ov4876;
T0* ge43ov4876;
T0* ge42ov4876;
T0* ge41ov4876;
T0* ge32ov4876;
T0* ge31ov4876;
T0* ge48ov4876;
T0* ge61ov4876;
T0* ge1138ov4876;
T0* ge169ov4876;
T0* ge168ov4876;
T0* ge1132ov4876;
T0* ge1148ov4876;
T0* ge1145ov4876;
T0* ge1144ov4876;
T0* ge1140ov4876;
T0* ge1147ov4876;
T0* ge1139ov4876;
T0* ge1151ov4876;
T0* ge1135ov4876;
T0* ge1146ov4876;
T0* ge1150ov4876;
T0* ge1142ov4876;
T0* ge1133ov4876;
T0* ge1141ov4876;
T0* ge163ov4876;
T0* ge166ov4876;
T0* ge173ov4876;
T0* ge162ov4876;
T0* ge261ov32466;
T0* ge248ov2434;
T0* geic2;
T0* geic3;
T0* geic4;

void GE_init_const1()
{
	ge260ov13431 = (GE_ms8("\n", 1));
	ge224ov3803 = (GE_ms8("", 0));
	ge164ov4878 = (GE_ms8("", 0));
	ge324ov32283 = (GE_ms8("", 0));
	ge314ov15192 = (GE_ms8("", 0));
	ge262ov13431 = (GE_ms8("\n", 1));
	ge1020ov8802 = (GE_ms8(".bat", 4));
	ge1020ov8809 = (GE_ms8(".sh", 3));
	ge1020ov8808 = (GE_ms8(".rc", 3));
	ge1020ov8807 = (GE_ms8(".res", 4));
	ge246ov2455 = (GE_ms8("empty_name", 10));
	ge247ov13488 = (GE_ms8("dummy", 5));
	ge1020ov8803 = (GE_ms8(".c", 2));
	ge1020ov8805 = (GE_ms8(".cpp", 4));
	ge1020ov8762 = (GE_ms8("#include", 8));
	ge245ov21036 = (GE_ms8("", 0));
	ge245ov21037 = (GE_ms8("empty_name", 10));
	ge1722ov20031 = (GE_ms8("no pattern compiled", 19));
	ge1722ov20016 = (GE_ms8("unmatched parentheses", 21));
	ge1722ov20009 = (GE_ms8("back reference to non-existent subpattern", 41));
	ge1722ov19994 = (GE_ms8("compilation successfully", 24));
	ge1722ov20019 = (GE_ms8("lookbehind assertion is not fixed length", 40));
	ge1722ov20012 = (GE_ms8("missing ) after comment", 23));
	ge1722ov20020 = (GE_ms8("malformed number after (\?(", 26));
	ge1722ov20029 = (GE_ms8("invalid condition (\?(0)", 23));
	ge1722ov20022 = (GE_ms8("assertion expected after (\?(", 28));
	ge1722ov20018 = (GE_ms8("unrecognized character after (\?<", 32));
	ge1722ov20006 = (GE_ms8("unrecognized character after (\?", 31));
	ge1722ov20007 = (GE_ms8("too many capturing parenthesized sub-patterns", 45));
	ge1722ov20021 = (GE_ms8("conditional group contains more than two branches", 49));
	ge1722ov20008 = (GE_ms8("missing )", 9));
	ge1722ov19995 = (GE_ms8("\\ at end of pattern", 19));
	ge1722ov19996 = (GE_ms8("\\c at end of pattern", 20));
	ge1722ov19997 = (GE_ms8("unrecognized character follows \\", 32));
	ge1722ov20003 = (GE_ms8("nothing to repeat", 17));
	ge1722ov20005 = (GE_ms8("internal error: unexpected repeat", 33));
	ge1722ov20000 = (GE_ms8("missing terminating ] for character class", 41));
	ge1722ov20025 = (GE_ms8("POSIX collating elements are not supported", 42));
	ge1722ov20024 = (GE_ms8("unknown POSIX class name", 24));
	ge1722ov20001 = (GE_ms8("invalid escape sequence in character class", 42));
	ge1722ov20002 = (GE_ms8("range out of order in character class", 37));
	ge1722ov19999 = (GE_ms8("number too big in {} quantifier", 31));
	ge1722ov19998 = (GE_ms8("numbers out of order in {} quantifier", 37));
	ge1718ov19786 = (GE_ms8("", 0));
	ge1020ov8804 = (GE_ms8(".cfg", 4));
	ge1020ov8806 = (GE_ms8(".h", 2));
	ge1020ov8492 = (GE_ms8("#define", 7));
	ge1020ov8528 = (GE_ms8("EIF_TRACE", 9));
	ge1020ov8501 = (GE_ms8("EIF_EXCEPTION_TRACE", 19));
	ge1020ov8496 = (GE_ms8("EIF_BOEHM_GC", 12));
	ge1020ov8527 = (GE_ms8("EIF_THREADS", 11));
	ge1020ov8745 = (GE_ms8("GE_USE_ANCESTORS", 16));
	ge1020ov8749 = (GE_ms8("GE_USE_ATTRIBUTES", 17));
	ge1020ov8746 = (GE_ms8("GE_USE_ATTRIBUTE_NAME", 21));
	ge1020ov8748 = (GE_ms8("GE_USE_ATTRIBUTE_TYPE_ID", 24));
	ge1020ov8747 = (GE_ms8("GE_USE_ATTRIBUTE_OFFSET", 23));
	ge1020ov8750 = (GE_ms8("GE_USE_TYPE_GENERATOR", 21));
	ge1020ov8752 = (GE_ms8("GE_USE_TYPE_NAME", 16));
	ge1020ov8751 = (GE_ms8("GE_USE_TYPE_GENERIC_PARAMETERS", 30));
	ge1020ov8753 = (GE_ms8("GE_USE_TYPE_OBJECT_SIZE", 23));
	ge1013ov28998 = (GE_ms8("giaaa", 5));
	ge1013ov28997 = (GE_ms8("GIAAA", 5));
	ge1013ov28996 = (GE_ms8("[$1] internal error.", 20));
	ge807ov12698 = (GE_ms8("item", 4));
	ge807ov12572 = (GE_ms8("call", 4));
	ge807ov12874 = (GE_ms8("end", 3));
	ge265ov13532 = (GE_ms8(".", 1));
	ge265ov13533 = (GE_ms8("..", 2));
	ge253ov13874 = (GE_ms8("..", 2));
	ge253ov13873 = (GE_ms8(".", 1));
	ge268ov13532 = (GE_ms8(".", 1));
	ge268ov13533 = (GE_ms8("..", 2));
	ge246ov2457 = (GE_ms8("dummy", 5));
	ge1020ov8574 = (GE_ms8("GE_context", 10));
	ge1020ov8789 = (GE_ms8("tc", 2));
	ge1020ov8580 = (GE_ms8("GE_default_context", 18));
	ge1020ov8482 = (GE_ms8("ac", 2));
	ge1020ov8790 = (GE_ms8("&tc", 3));
	ge1020ov8649 = (GE_ms8("GE_new_exception_manager", 24));
	ge1020ov8648 = (GE_ms8("GE_new", 6));
	ge1020ov8603 = (GE_ms8("GE_init_exception_manager", 25));
	ge1020ov8696 = (GE_ms8("GE_set_exception_data", 21));
	ge1020ov8758 = (GE_ms8("#ifdef", 6));
	ge1020ov8536 = (GE_ms8("#endif", 6));
	ge1020ov8784 = (GE_ms8("return", 6));
	ge1020ov8582 = (GE_ms8("GE_dts", 6));
	ge1020ov8559 = (GE_ms8("GE_catcall", 10));
	ge1020ov8484 = (GE_ms8("->", 2));
	ge1020ov8754 = (GE_ms8("GE_void", 7));
	ge1020ov8557 = (GE_ms8("GE_boxed", 8));
	ge807ov12845 = (GE_ms8("Current", 7));
	ge807ov12865 = (GE_ms8("create", 6));
	ge1020ov8534 = (GE_ms8("EIF_WINDOWS", 11));
	ge1020ov8721 = (GE_ms8("GE_show_console", 15));
	ge1020ov8530 = (GE_ms8("EIF_TYPE_OBJ", 12));
	ge1020ov8742 = (GE_ms8("GE_types", 8));
	ge1020ov8502 = (GE_ms8("EIF_FALSE", 9));
	ge1020ov8529 = (GE_ms8("EIF_TRUE", 8));
	ge1020ov8779 = (GE_ms8("offsetof", 8));
	ge1020ov8741 = (GE_ms8("GE_type_infos", 13));
}

void GE_init_const2()
{
	ge1020ov8739 = (GE_ms8("GE_TYPE_FLAG_SPECIAL", 20));
	ge1020ov8740 = (GE_ms8("GE_TYPE_FLAG_TUPLE", 18));
	ge1020ov8735 = (GE_ms8("GE_TYPE_FLAG_NONE", 17));
	ge1020ov8723 = (GE_ms8("GE_TYPE_FLAG_BOOLEAN", 20));
	ge1020ov8724 = (GE_ms8("GE_TYPE_FLAG_CHARACTER_8", 24));
	ge1020ov8725 = (GE_ms8("GE_TYPE_FLAG_CHARACTER_32", 25));
	ge1020ov8727 = (GE_ms8("GE_TYPE_FLAG_INTEGER_8", 22));
	ge1020ov8728 = (GE_ms8("GE_TYPE_FLAG_INTEGER_16", 23));
	ge1020ov8729 = (GE_ms8("GE_TYPE_FLAG_INTEGER_32", 23));
	ge1020ov8730 = (GE_ms8("GE_TYPE_FLAG_INTEGER_64", 23));
	ge1020ov8731 = (GE_ms8("GE_TYPE_FLAG_NATURAL_8", 22));
	ge1020ov8732 = (GE_ms8("GE_TYPE_FLAG_NATURAL_16", 23));
	ge1020ov8733 = (GE_ms8("GE_TYPE_FLAG_NATURAL_32", 23));
	ge1020ov8734 = (GE_ms8("GE_TYPE_FLAG_NATURAL_64", 23));
	ge1020ov8736 = (GE_ms8("GE_TYPE_FLAG_POINTER", 20));
	ge1020ov8737 = (GE_ms8("GE_TYPE_FLAG_REAL_32", 20));
	ge1020ov8738 = (GE_ms8("GE_TYPE_FLAG_REAL_64", 20));
	ge1020ov8726 = (GE_ms8("GE_TYPE_FLAG_EXPANDED", 21));
	ge1020ov8785 = (GE_ms8("sizeof", 6));
	ge1020ov8541 = (GE_ms8("extern", 6));
	ge1020ov8531 = (GE_ms8("EIF_TYPE_INDEX", 14));
	ge1020ov8798 = (GE_ms8("void", 4));
	ge1020ov8602 = (GE_ms8("GE_init_const", 13));
	ge1020ov8578 = (GE_ms8("GE_deep_twin", 12));
	ge1020ov8577 = (GE_ms8("GE_deep", 7));
	ge1020ov8788 = (GE_ms8("switch", 6));
	ge1020ov8489 = (GE_ms8("case", 4));
	ge1020ov8579 = (GE_ms8("GE_default", 10));
	ge1020ov8757 = (GE_ms8("if", 2));
	ge1020ov8535 = (GE_ms8("else", 4));
	ge1020ov8756 = (GE_ms8("id", 2));
	ge1020ov8772 = (GE_ms8("memcpy", 6));
	ge1020ov8759 = (GE_ms8("#ifndef", 7));
	ge1020ov8549 = (GE_ms8("GE_alloc_cleared", 16));
	ge1020ov8550 = (GE_ms8("GE_alloc_atomic_cleared", 23));
	ge1020ov8773 = (GE_ms8("memset", 6));
	ge1020ov8545 = (GE_ms8("for", 3));
	ge807ov12848 = (GE_ms8("Result", 6));
	ge1020ov8635 = (GE_ms8("GE_mt", 5));
	ge1020ov8554 = (GE_ms8("GE_bma", 6));
	ge1020ov8631 = (GE_ms8("GE_ma", 5));
	ge1020ov8486 = (GE_ms8("break", 5));
	ge1020ov8491 = (GE_ms8("default", 7));
	ge1020ov8513 = (GE_ms8("eif_mem_free", 12));
	ge1020ov8744 = (GE_ms8("GE_unmark_object", 16));
	ge1020ov8743 = (GE_ms8("GE_unlock_marking", 17));
	ge1020ov8720 = (GE_ms8("GE_set_reference_field_at", 25));
	ge1020ov8719 = (GE_ms8("GE_set_reference_field", 22));
	ge1020ov8718 = (GE_ms8("GE_set_real_64_field_at", 23));
	ge1020ov8717 = (GE_ms8("GE_set_real_64_field", 20));
	ge1020ov8716 = (GE_ms8("GE_set_real_32_field_at", 23));
	ge1020ov8715 = (GE_ms8("GE_set_real_32_field", 20));
	ge1020ov8714 = (GE_ms8("GE_set_pointer_field_at", 23));
	ge1020ov8713 = (GE_ms8("GE_set_pointer_field", 20));
	ge1020ov8712 = (GE_ms8("GE_set_natural_64_field_at", 26));
	ge1020ov8711 = (GE_ms8("GE_set_natural_64_field", 23));
	ge1020ov8710 = (GE_ms8("GE_set_natural_32_field_at", 26));
	ge1020ov8709 = (GE_ms8("GE_set_natural_32_field", 23));
	ge1020ov8708 = (GE_ms8("GE_set_natural_16_field_at", 26));
	ge1020ov8707 = (GE_ms8("GE_set_natural_16_field", 23));
	ge1020ov8706 = (GE_ms8("GE_set_natural_8_field_at", 25));
	ge1020ov8705 = (GE_ms8("GE_set_natural_8_field", 22));
	ge1020ov8704 = (GE_ms8("GE_set_integer_64_field_at", 26));
	ge1020ov8703 = (GE_ms8("GE_set_integer_8_field", 22));
	ge1020ov8702 = (GE_ms8("GE_set_integer_32_field_at", 26));
	ge1020ov8701 = (GE_ms8("GE_set_integer_32_field", 23));
	ge1020ov8700 = (GE_ms8("GE_set_integer_16_field_at", 26));
	ge1020ov8699 = (GE_ms8("GE_set_integer_16_field", 23));
	ge1020ov8698 = (GE_ms8("GE_set_integer_8_field_at", 25));
	ge1020ov8697 = (GE_ms8("GE_set_integer_8_field", 22));
	ge1020ov8695 = (GE_ms8("GE_set_character_32_field_at", 28));
	ge1020ov8694 = (GE_ms8("GE_set_character_32_field", 25));
	ge1020ov8693 = (GE_ms8("GE_set_character_8_field_at", 27));
	ge1020ov8692 = (GE_ms8("GE_set_character_8_field", 24));
	ge1020ov8691 = (GE_ms8("GE_set_boolean_field_at", 23));
	ge1020ov8690 = (GE_ms8("GE_set_boolean_field", 20));
	ge1020ov8632 = (GE_ms8("GE_mark_object", 14));
	ge1020ov8630 = (GE_ms8("GE_lock_marking", 15));
	ge1020ov8581 = (GE_ms8("GE_developer_raise", 18));
	ge1020ov8659 = (GE_ms8("GE_object_id_free", 17));
	ge1020ov8565 = (GE_ms8("GE_ccom_local_free", 18));
	ge1020ov8546 = (GE_ms8("fprintf", 7));
	ge1020ov8786 = (GE_ms8("stderr", 6));
	ge1020ov8634 = (GE_ms8("GE_ms32", 7));
	ge1020ov8633 = (GE_ms8("GE_ms8", 6));
	ge1020ov8792 = (GE_ms8("type_id", 7));
	ge1020ov8665 = (GE_ms8("GE_raise", 8));
	ge1020ov8588 = (GE_ms8("GE_EX_FATAL", 11));
	ge1020ov8532 = (GE_ms8("EIF_VOID", 8));
	ge1020ov8585 = (GE_ms8("GE_EX_CDEF", 10));
	ge1020ov8664 = (GE_ms8("GE_power", 8));
	ge1020ov8493 = (GE_ms8("double", 6));
	ge1020ov8676 = (GE_ms8("GE_real_32_positive_infinity", 28));
	ge1020ov8684 = (GE_ms8("GE_real_64_positive_infinity", 28));
	ge1020ov8675 = (GE_ms8("GE_real_32_negative_infinity", 28));
	ge1020ov8683 = (GE_ms8("GE_real_64_negative_infinity", 28));
	ge1020ov8674 = (GE_ms8("GE_real_32_nan", 14));
	ge1020ov8682 = (GE_ms8("GE_real_64_nan", 14));
	ge1020ov8673 = (GE_ms8("GE_real_32_is_positive_infinity", 31));
	ge1020ov8681 = (GE_ms8("GE_real_64_is_positive_infinity", 31));
	ge1020ov8672 = (GE_ms8("GE_real_32_is_negative_infinity", 31));
}

void GE_init_const3()
{
	ge1020ov8680 = (GE_ms8("GE_real_64_is_negative_infinity", 31));
	ge1020ov8671 = (GE_ms8("GE_real_32_is_nan", 17));
	ge1020ov8679 = (GE_ms8("GE_real_64_is_nan", 17));
	ge1020ov8596 = (GE_ms8("GE_floor", 8));
	ge1020ov8567 = (GE_ms8("GE_ceiling", 10));
	ge1020ov8490 = (GE_ms8("char", 4));
	ge1020ov8499 = (GE_ms8("EIF_CHARACTER_32", 16));
	ge1020ov8523 = (GE_ms8("EIF_REAL_32", 11));
	ge1020ov8521 = (GE_ms8("EIF_POINTER", 11));
	ge1020ov8512 = (GE_ms8("EIF_IS_WINDOWS", 14));
	ge1020ov8511 = (GE_ms8("EIF_IS_VXWORKS", 14));
	ge1020ov8510 = (GE_ms8("EIF_IS_VMS", 10));
	ge1020ov8509 = (GE_ms8("EIF_IS_UNIX", 11));
	ge1020ov8508 = (GE_ms8("EIF_IS_MAC", 10));
	ge1020ov8506 = (GE_ms8("EIF_INTEGER_32", 14));
	ge1020ov8524 = (GE_ms8("EIF_REAL_64", 11));
	ge1020ov8498 = (GE_ms8("EIF_CHARACTER_8", 15));
	ge1020ov8495 = (GE_ms8("EIF_BOOLEAN", 11));
	ge1020ov8542 = (GE_ms8("find_referers", 13));
	ge1020ov8584 = (GE_ms8("GE_encoded_type_from_name", 25));
	ge1020ov8583 = (GE_ms8("GE_encoded_type_conforms_to", 27));
	ge1020ov8722 = (GE_ms8("GE_storable_version_of_encoded_type", 35));
	ge1020ov8655 = (GE_ms8("GE_object_at_offset", 19));
	ge1020ov8686 = (GE_ms8("GE_reference_field_at", 21));
	ge1020ov8685 = (GE_ms8("GE_reference_field", 18));
	ge1020ov8678 = (GE_ms8("GE_real_64_field_at", 19));
	ge1020ov8677 = (GE_ms8("GE_real_64_field", 16));
	ge1020ov8670 = (GE_ms8("GE_real_32_field_at", 19));
	ge1020ov8669 = (GE_ms8("GE_real_32_field", 16));
	ge1020ov8666 = (GE_ms8("GE_raw_object_at_offset", 23));
	ge1020ov8667 = (GE_ms8("GE_raw_reference_field_at", 25));
	ge1020ov8663 = (GE_ms8("GE_pointer_field_at", 19));
	ge1020ov8662 = (GE_ms8("GE_pointer_field", 16));
	ge1020ov8661 = (GE_ms8("GE_persistent_field_count_of_encoded_type", 41));
	ge1020ov8780 = (GE_ms8("once_objects", 12));
	ge1020ov8660 = (GE_ms8("GE_object_size", 14));
	ge1020ov8653 = (GE_ms8("GE_new_type_instance_of_encoded_type", 36));
	ge1020ov8652 = (GE_ms8("GE_new_tuple_instance_of_encoded_type", 37));
	ge1020ov8651 = (GE_ms8("GE_new_special_of_reference_instance_of_encoded_type", 52));
	ge1020ov8650 = (GE_ms8("GE_new_instance_of_encoded_type", 31));
	ge1020ov8647 = (GE_ms8("GE_natural_64_field_at", 22));
	ge1020ov8646 = (GE_ms8("GE_natural_64_field", 19));
	ge1020ov8645 = (GE_ms8("GE_natural_32_field_at", 22));
	ge1020ov8644 = (GE_ms8("GE_natural_32_field", 19));
	ge1020ov8643 = (GE_ms8("GE_natural_16_field_at", 22));
	ge1020ov8642 = (GE_ms8("GE_natural_16_field", 19));
	ge1020ov8641 = (GE_ms8("GE_natural_8_field_at", 21));
	ge1020ov8640 = (GE_ms8("GE_natural_8_field", 18));
	ge1020ov8628 = (GE_ms8("GE_is_tuple_encoded_type", 24));
	ge1020ov8629 = (GE_ms8("GE_is_tuple_object", 18));
	ge1020ov8625 = (GE_ms8("GE_is_special_of_reference_encoded_type", 39));
	ge1020ov8627 = (GE_ms8("GE_is_special_of_reference_or_basic_expanded_encoded_type", 57));
	ge1020ov8626 = (GE_ms8("GE_is_special_of_reference_object", 33));
	ge1020ov8624 = (GE_ms8("GE_is_special_of_expanded_object", 32));
	ge1020ov8622 = (GE_ms8("GE_is_special_copy_semantics_item", 33));
	ge1020ov8623 = (GE_ms8("GE_is_special_object", 20));
	ge1020ov8621 = (GE_ms8("GE_is_object_marked", 19));
	ge1020ov8620 = (GE_ms8("GE_is_field_transient_of_encoded_type", 37));
	ge1020ov8619 = (GE_ms8("GE_is_field_expanded_of_encoded_type", 36));
	ge1020ov8618 = (GE_ms8("GE_is_expanded_object", 21));
	ge1020ov8617 = (GE_ms8("GE_is_copy_semantics_field", 26));
	ge1020ov8616 = (GE_ms8("GE_is_attached_encoded_type", 27));
	ge1020ov8615 = (GE_ms8("GE_integer_64_field_at", 22));
	ge1020ov8614 = (GE_ms8("GE_integer_8_field", 18));
	ge1020ov8613 = (GE_ms8("GE_integer_32_field_at", 22));
	ge1020ov8612 = (GE_ms8("GE_integer_32_field", 19));
	ge1020ov8611 = (GE_ms8("GE_integer_16_field_at", 22));
	ge1020ov8610 = (GE_ms8("GE_integer_16_field", 19));
	ge1020ov8609 = (GE_ms8("GE_integer_8_field_at", 21));
	ge1020ov8608 = (GE_ms8("GE_integer_8_field", 18));
	ge1020ov8600 = (GE_ms8("GE_generic_parameter_count_of_encoded_type", 42));
	ge1020ov8598 = (GE_ms8("GE_generator_of_encoded_type", 28));
	ge1020ov8597 = (GE_ms8("GE_generating_type_of_encoded_type", 34));
	ge1020ov8595 = (GE_ms8("GE_field_type_kind_of_encoded_type", 34));
	ge1020ov8594 = (GE_ms8("GE_field_static_type_of_encoded_type", 36));
	ge1020ov8593 = (GE_ms8("GE_field_offset_of_encoded_type", 31));
	ge1020ov8592 = (GE_ms8("GE_field_name_of_encoded_type", 29));
	ge1020ov8591 = (GE_ms8("GE_field_count_of_encoded_type", 30));
	ge1020ov8599 = (GE_ms8("GE_generic_parameter_of_encoded_type", 36));
	ge1020ov8657 = (GE_ms8("GE_object_encoded_type_at_offset", 32));
	ge1020ov8656 = (GE_ms8("GE_object_encoded_type", 22));
	ge1020ov8654 = (GE_ms8("GE_non_attached_encoded_type", 28));
	ge1020ov8573 = (GE_ms8("GE_compiler_version", 19));
	ge1020ov8572 = (GE_ms8("GE_check_assert", 15));
	ge1020ov8571 = (GE_ms8("GE_character_32_field_at", 24));
	ge1020ov8570 = (GE_ms8("GE_character_32_field", 21));
	ge1020ov8569 = (GE_ms8("GE_character_8_field_at", 23));
	ge1020ov8568 = (GE_ms8("GE_character_8_field", 20));
	ge1020ov8556 = (GE_ms8("GE_boolean_field_at", 19));
	ge1020ov8555 = (GE_ms8("GE_boolean_field", 16));
	ge1020ov8553 = (GE_ms8("GE_attached_encoded_type", 24));
	ge1020ov8658 = (GE_ms8("GE_object_id", 12));
	ge1020ov8601 = (GE_ms8("GE_id_object", 12));
	ge1020ov8561 = (GE_ms8("GE_ccom_error_text", 18));
	ge1020ov8560 = (GE_ms8("GE_ccom_character_size", 22));
	ge1020ov8564 = (GE_ms8("GE_ccom_hresult_facility", 24));
	ge1020ov8563 = (GE_ms8("GE_ccom_hresult_code", 20));
	ge1020ov8562 = (GE_ms8("GE_ccom_hresult", 15));
	ge1020ov8566 = (GE_ms8("GE_ccom_strlen", 14));
	ge1020ov8552 = (GE_ms8("GE_argv", 7));
	ge1020ov8551 = (GE_ms8("GE_argc", 7));
}

void GE_init_const4()
{
	ge1020ov8771 = (GE_ms8("memcmp", 6));
	ge1020ov8781 = (GE_ms8("||", 2));
	ge1020ov8774 = (GE_ms8("!", 1));
	ge1020ov8775 = (GE_ms8("!=", 2));
	ge1020ov8483 = (GE_ms8("&&", 2));
	ge1020ov8776 = (GE_ms8("", 0));
	ge1020ov8537 = (GE_ms8("==", 2));
	ge1020ov8558 = (GE_ms8("GE_call", 7));
	ge807ov12507 = (GE_ms8("FUNCTION", 8));
	ge807ov12530 = (GE_ms8("PROCEDURE", 9));
	ge1020ov8487 = (GE_ms8("call", 4));
	ge1020ov8488 = (GE_ms8("caller", 6));
	ge807ov12541 = (GE_ms8("TUPLE", 5));
	ge1020ov8763 = (GE_ms8("initialize", 10));
	ge1020ov8547 = (GE_ms8("GE_alloc", 8));
	ge1020ov8548 = (GE_ms8("GE_alloc_atomic", 15));
	ge1020ov8668 = (GE_ms8("GE_register_dispose", 19));
	ge1020ov8494 = (GE_ms8("EIF_ANY", 7));
	ge1020ov8787 = (GE_ms8("struct", 6));
	ge1020ov8794 = (GE_ms8("uint16_t", 8));
	ge1020ov8543 = (GE_ms8("flags", 5));
	ge1020ov8793 = (GE_ms8("typedef", 7));
	ge1020ov8519 = (GE_ms8("EIF_NATURAL_64", 14));
	ge1020ov8518 = (GE_ms8("EIF_NATURAL_32", 14));
	ge1020ov8517 = (GE_ms8("EIF_NATURAL_16", 14));
	ge1020ov8516 = (GE_ms8("EIF_NATURAL_8", 13));
	ge1020ov8507 = (GE_ms8("EIF_INTEGER_64", 14));
	ge1020ov8505 = (GE_ms8("EIF_INTEGER_16", 14));
	ge1020ov8504 = (GE_ms8("EIF_INTEGER_8", 13));
	ge1020ov8500 = (GE_ms8("EIF_DOUBLE", 10));
	ge807ov12503 = (GE_ms8("DOUBLE", 6));
	ge1020ov8522 = (GE_ms8("EIF_REAL", 8));
	ge807ov12531 = (GE_ms8("REAL", 4));
	ge1020ov8515 = (GE_ms8("EIF_NATURAL", 11));
	ge807ov12521 = (GE_ms8("NATURAL", 7));
	ge1020ov8503 = (GE_ms8("EIF_INTEGER", 11));
	ge807ov12509 = (GE_ms8("INTEGER", 7));
	ge1020ov8533 = (GE_ms8("EIF_WIDE_CHAR", 13));
	ge807ov12544 = (GE_ms8("WIDE_CHARACTER", 14));
	ge1020ov8497 = (GE_ms8("EIF_CHARACTER", 13));
	ge807ov12498 = (GE_ms8("CHARACTER", 9));
	ge807ov12518 = (GE_ms8("ITERATION_CURSOR", 16));
	ge807ov12517 = (GE_ms8("ITERABLE", 8));
	ge807ov12502 = (GE_ms8("DISPOSABLE", 10));
	ge807ov12539 = (GE_ms8("SYSTEM_OBJECT", 13));
	ge807ov12494 = (GE_ms8("ANY", 3));
	ge807ov12496 = (GE_ms8("ARRAY", 5));
	ge807ov12543 = (GE_ms8("TYPED_POINTER", 13));
	ge807ov12542 = (GE_ms8("TYPE", 4));
	ge807ov12535 = (GE_ms8("SPECIAL", 7));
	ge807ov12534 = (GE_ms8("ROUTINE", 7));
	ge807ov12529 = (GE_ms8("PREDICATE", 9));
	ge807ov12528 = (GE_ms8("POINTER", 7));
	ge807ov12533 = (GE_ms8("REAL_64", 7));
	ge807ov12532 = (GE_ms8("REAL_32", 7));
	ge807ov12525 = (GE_ms8("NATURAL_64", 10));
	ge807ov12524 = (GE_ms8("NATURAL_32", 10));
	ge807ov12523 = (GE_ms8("NATURAL_16", 10));
	ge807ov12522 = (GE_ms8("NATURAL_8", 9));
	ge807ov12513 = (GE_ms8("INTEGER_64", 10));
	ge807ov12512 = (GE_ms8("INTEGER_32", 10));
	ge807ov12511 = (GE_ms8("INTEGER_16", 10));
	ge807ov12510 = (GE_ms8("INTEGER_8", 9));
	ge807ov12500 = (GE_ms8("CHARACTER_32", 12));
	ge807ov12499 = (GE_ms8("CHARACTER_8", 11));
	ge807ov12497 = (GE_ms8("BOOLEAN", 7));
	ge807ov12863 = (GE_ms8("class", 5));
	ge807ov12545 = (GE_ms8("*UNKNOWN*", 9));
	ge1019ov29975 = (GE_ms8("vwbe0a", 6));
	ge1019ov29703 = (GE_ms8("VWBE", 4));
	ge1019ov29534 = (GE_ms8("boolean expression of non-BOOLEAN type \'$7\'.", 44));
	ge1017ov28986 = (GE_ms8("gvsrc5a", 7));
	ge1017ov28980 = (GE_ms8("GVSRC5", 6));
	ge1017ov28974 = (GE_ms8("[$1] root creation procedure `$3\' is not a feature of root class $2.", 68));
	ge1017ov28982 = (GE_ms8("vsrc1a", 6));
	ge1017ov28976 = (GE_ms8("VSRC1", 5));
	ge1017ov28970 = (GE_ms8("[$1] root class $2 should not be generic.", 41));
	ge1017ov28985 = (GE_ms8("gvsrc4a", 7));
	ge1017ov28979 = (GE_ms8("GVSRC4", 6));
	ge1017ov28973 = (GE_ms8("[$1] unknown root class $2.", 27));
	ge1017ov28987 = (GE_ms8("gvsrc6a", 7));
	ge1017ov28981 = (GE_ms8("GVSRC6", 6));
	ge1017ov28975 = (GE_ms8("[$1] root creation procedure `$3\' is not declared as publicly available creation procedure in root class $2.", 108));
	ge807ov12601 = (GE_ms8("default_create", 14));
	ge1017ov28984 = (GE_ms8("gvsrc3a", 7));
	ge1017ov28978 = (GE_ms8("GVSRC3", 6));
	ge1017ov28972 = (GE_ms8("[$1] missing root class.", 24));
	ge1019ov29997 = (GE_ms8("gvkfe6a", 7));
	ge1019ov29721 = (GE_ms8("GVKFE-6", 7));
	ge1019ov29556 = (GE_ms8("routine `$7\' in kernel class $5 has not the expected signature \'$8\'.", 68));
	ge807ov12788 = (GE_ms8("set_exception_data", 18));
	ge1019ov29995 = (GE_ms8("gvkfe4a", 7));
	ge1019ov29719 = (GE_ms8("GVKFE-4", 7));
	ge1019ov29554 = (GE_ms8("feature `$7\' in kernel class $5 is not a procedure.", 51));
	ge807ov12648 = (GE_ms8("init_exception_manager", 22));
	ge807ov12690 = (GE_ms8("is_target_closed", 16));
	ge807ov12589 = (GE_ms8("closed_operands", 15));
	ge807ov12828 = (GE_ms8("to_pointer", 10));
	ge807ov12743 = (GE_ms8("pointer_item", 12));
	ge807ov12843 = (GE_ms8("upper", 5));
	ge807ov12703 = (GE_ms8("lower", 5));
}

void GE_init_const5()
{
	ge807ov12548 = (GE_ms8("area", 4));
	ge807ov12573 = (GE_ms8("capacity", 8));
	ge1019ov29994 = (GE_ms8("gvkfe3a", 7));
	ge1019ov29718 = (GE_ms8("GVKFE-3", 7));
	ge1019ov29553 = (GE_ms8("attribute `$7\' in kernel class $5 has not the expected type \'$8\'.", 65));
	ge1019ov29992 = (GE_ms8("gvkfe1a", 7));
	ge1019ov29716 = (GE_ms8("GVKFE-1", 7));
	ge1019ov29551 = (GE_ms8("feature `$7\' is missing in kernel class $5.", 43));
	ge1019ov29993 = (GE_ms8("gvkfe2a", 7));
	ge1019ov29717 = (GE_ms8("GVKFE-2", 7));
	ge1019ov29552 = (GE_ms8("feature `$7\' in kernel class $5 is not an attribute.", 52));
	ge807ov12596 = (GE_ms8("count", 5));
	ge1017ov28983 = (GE_ms8("gvknl1a", 7));
	ge1017ov28977 = (GE_ms8("GVKNL1", 6));
	ge1017ov28971 = (GE_ms8("[$1] missing kernel class $2.", 29));
	ge807ov12869 = (GE_ms8("deferred", 8));
	ge807ov12991 = (GE_ms8("WIDE_CHARACTER_REF", 18));
	ge807ov12975 = (GE_ms8("CHARACTER_32_REF", 16));
	ge807ov12536 = (GE_ms8("STRING", 6));
	ge807ov12537 = (GE_ms8("STRING_8", 8));
	ge807ov12988 = (GE_ms8("REAL_REF", 8));
	ge807ov12989 = (GE_ms8("REAL_32_REF", 11));
	ge807ov12982 = (GE_ms8("NATURAL_REF", 11));
	ge807ov12985 = (GE_ms8("NATURAL_32_REF", 14));
	ge807ov12977 = (GE_ms8("INTEGER_REF", 11));
	ge807ov12980 = (GE_ms8("INTEGER_32_REF", 14));
	ge807ov12976 = (GE_ms8("DOUBLE_REF", 10));
	ge807ov12990 = (GE_ms8("REAL_64_REF", 11));
	ge807ov12973 = (GE_ms8("CHARACTER_REF", 13));
	ge807ov12974 = (GE_ms8("CHARACTER_8_REF", 15));
	ge807ov12891 = (GE_ms8("like", 4));
	ge807ov12870 = (GE_ms8("detachable", 10));
	ge807ov12540 = (GE_ms8("SYSTEM_STRING", 13));
	ge807ov12887 = (GE_ms8("inherit", 7));
	ge807ov12538 = (GE_ms8("STRING_32", 9));
	ge807ov12526 = (GE_ms8("NONE", 4));
	ge807ov12515 = (GE_ms8("ISE_EXCEPTION_MANAGER", 21));
	ge807ov12505 = (GE_ms8("EXCEPTION_MANAGER", 17));
	ge807ov12504 = (GE_ms8("EXCEPTION", 9));
	ge807ov12911 = (GE_ms8("separate", 8));
	ge1111ov6044 = (GE_ms8("system", 6));
	ge1108ov17045 = (GE_ms8("ESYN", 4));
	ge1108ov16957 = (GE_ms8("$5", 2));
	ge1108ov17095 = (GE_ms8("EABX", 4));
	ge1108ov17007 = (GE_ms8("root element of ECF file should be \'system\' and not \'$5\'.", 57));
	ge1111ov6052 = (GE_ms8("void_safety", 11));
	ge1111ov6023 = (GE_ms8("is_attached_by_default", 22));
	ge1111ov6024 = (GE_ms8("is_obsolete_routine_type", 24));
	ge1111ov6046 = (GE_ms8("trace", 5));
	ge1100ov6298 = (GE_ms8("console_application", 19));
	ge1100ov6299 = (GE_ms8("concurrency", 11));
	ge1100ov6300 = (GE_ms8("exception_trace", 15));
	ge1108ov17094 = (GE_ms8("EABW", 4));
	ge1108ov17006 = (GE_ms8("no library target specified in library ECF file \"$5\".", 53));
	ge1111ov6048 = (GE_ms8("uuid", 4));
	ge1111ov6031 = (GE_ms8("name", 4));
	ge1111ov6045 = (GE_ms8("target", 6));
	ge1111ov6026 = (GE_ms8("library_target", 14));
	ge1108ov17088 = (GE_ms8("EABQ", 4));
	ge1108ov17000 = (GE_ms8("\'library_target\' attribute \"$5\" in element \'system\' is not the name of an existing target.", 90));
	ge1108ov17087 = (GE_ms8("EABP", 4));
	ge1108ov16999 = (GE_ms8("\'library_target\' attribute in element \'system\' is empty.", 56));
	ge1108ov17096 = (GE_ms8("EABY", 4));
	ge1108ov17008 = (GE_ms8("no \'target\' element found in element \'system\'.", 46));
	ge1111ov6008 = (GE_ms8("cluster", 7));
	ge1111ov6036 = (GE_ms8("override", 8));
	ge1111ov6025 = (GE_ms8("library", 7));
	ge1111ov6005 = (GE_ms8("assembly", 8));
	ge1111ov6021 = (GE_ms8("file_rule", 9));
	ge1111ov6017 = (GE_ms8("external_include", 16));
	ge1111ov6018 = (GE_ms8("external_library", 16));
	ge1111ov6019 = (GE_ms8("external_object", 15));
	ge1111ov6042 = (GE_ms8("root", 4));
	ge1111ov6050 = (GE_ms8("variable", 8));
	ge1111ov6043 = (GE_ms8("setting", 7));
	ge1111ov6035 = (GE_ms8("option", 6));
	ge1111ov6049 = (GE_ms8("value", 5));
	ge1108ov17132 = (GE_ms8("ESVE", 4));
	ge1108ov17044 = (GE_ms8("\'value\' attribute in element \'setting\' is empty.", 48));
	ge1108ov17131 = (GE_ms8("ESVM", 4));
	ge1108ov17043 = (GE_ms8("\'value\' attribute is missing in element \'setting\'.", 50));
	ge1108ov17130 = (GE_ms8("ESNE", 4));
	ge1108ov17042 = (GE_ms8("\'name\' attribute in element \'setting\' is empty.", 47));
	ge1108ov17129 = (GE_ms8("ESNM", 4));
	ge1108ov17041 = (GE_ms8("\'name\' attribute is missing in element \'setting\'.", 49));
	ge1108ov17092 = (GE_ms8("EABU", 4));
	ge1108ov17004 = (GE_ms8("\'value\' attribute in element \'variable\' is empty.", 49));
	ge1108ov17091 = (GE_ms8("EABT", 4));
	ge1108ov17003 = (GE_ms8("\'value\' attribute is missing in element \'variable\'.", 51));
	ge1108ov17090 = (GE_ms8("EABS", 4));
	ge1108ov17002 = (GE_ms8("\'name\' attribute in element \'variable\' is empty.", 48));
	ge1108ov17089 = (GE_ms8("EABR", 4));
	ge1108ov17001 = (GE_ms8("\'name\' attribute is missing in element \'variable\'.", 50));
	ge1111ov6004 = (GE_ms8("all_classes", 11));
	ge1111ov6007 = (GE_ms8("class", 5));
	ge1111ov6020 = (GE_ms8("feature", 7));
	ge1108ov17100 = (GE_ms8("EACC", 4));
	ge1108ov17012 = (GE_ms8("\'feature\' attribute in element \'root\' is empty.", 47));
	ge1108ov17099 = (GE_ms8("EACB", 4));
	ge1108ov17011 = (GE_ms8("\'class\' attribute in element \'root\' is empty.", 45));
	ge1108ov17098 = (GE_ms8("EACA", 4));
}

void GE_init_const6()
{
	ge1108ov17010 = (GE_ms8("\'class\' attribute is missing in element \'root\'.", 47));
	ge1108ov17097 = (GE_ms8("EABZ", 4));
	ge1108ov17009 = (GE_ms8("\'all_classes\' attribute \"$5\" in element \'root\' should be a boolean.", 67));
	ge1114ov6003 = (GE_ms8("false", 5));
	ge1114ov6002 = (GE_ms8("true", 4));
	ge1111ov6033 = (GE_ms8("location", 8));
	ge1111ov6011 = (GE_ms8("condition", 9));
	ge1111ov6037 = (GE_ms8("platform", 8));
	ge1111ov6006 = (GE_ms8("build", 5));
	ge1111ov6030 = (GE_ms8("multithreaded", 13));
	ge1111ov6010 = (GE_ms8("concurrency", 11));
	ge1111ov6013 = (GE_ms8("dotnet", 6));
	ge1111ov6014 = (GE_ms8("dynamic_runtime", 15));
	ge1111ov6012 = (GE_ms8("custom", 6));
	ge1111ov6051 = (GE_ms8("version", 7));
	ge1111ov6027 = (GE_ms8("min", 3));
	ge1111ov6028 = (GE_ms8("max", 3));
	ge1111ov6047 = (GE_ms8("type", 4));
	ge1111ov6009 = (GE_ms8("compiler", 8));
	ge1111ov6029 = (GE_ms8("msil_clr", 8));
	ge1108ov17081 = (GE_ms8("EABJ", 4));
	ge1108ov16993 = (GE_ms8("\'type\' attribute \"$5\" in \'version\' condition should be either \"compiler\" or \"msil_clr\".", 87));
	ge1108ov17080 = (GE_ms8("EABI", 4));
	ge1108ov16992 = (GE_ms8("\'type\' attribute is missing in \'version\' condition.", 51));
	ge1108ov17079 = (GE_ms8("EABH", 4));
	ge1108ov16991 = (GE_ms8("\'max\' attribute \"$6\" should be greater than or equal to \'min\' attribute \"$5\" in \'version\' condition.", 100));
	ge1108ov17078 = (GE_ms8("EABG", 4));
	ge1108ov16990 = (GE_ms8("\'max\' attribute \"$5\" in \'version\' condition should be of the form \"N.N.N.N\".", 76));
	ge1108ov17077 = (GE_ms8("EABF", 4));
	ge1108ov16989 = (GE_ms8("\'min\' attribute \"$5\" in \'version\' condition should be of the form \"N.N.N.N\".", 76));
	ge1111ov6016 = (GE_ms8("excluded_value", 14));
	ge1108ov17063 = (GE_ms8("EAAR", 4));
	ge1108ov16975 = (GE_ms8("\'excluded_value\' attribute in \'custom\' condition is empty.", 58));
	ge1108ov17064 = (GE_ms8("EAAS", 4));
	ge1108ov16976 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'custom\' condition.", 71));
	ge1108ov17062 = (GE_ms8("EAAQ", 4));
	ge1108ov16974 = (GE_ms8("\'value\' attribute in \'custom\' condition is empty.", 49));
	ge1108ov17061 = (GE_ms8("EAAP", 4));
	ge1108ov16973 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'custom\' condition.", 68));
	ge1108ov17060 = (GE_ms8("EAAO", 4));
	ge1108ov16972 = (GE_ms8("\'name\' attribute in \'custom\' condition is empty.", 48));
	ge1108ov17059 = (GE_ms8("EAAN", 4));
	ge1108ov16971 = (GE_ms8("\'name\' attribute is missing in \'custom\' condition.", 50));
	ge1108ov17068 = (GE_ms8("EAAW", 4));
	ge1108ov16980 = (GE_ms8("\'value\' attribute \"$5\" in \'dynamic_runtime\' condition should be a boolean.", 74));
	ge1108ov17067 = (GE_ms8("EAAV", 4));
	ge1108ov16979 = (GE_ms8("\'value\' attribute is missing in \'dynamic_runtime\' condition.", 60));
	ge1108ov17066 = (GE_ms8("EAAU", 4));
	ge1108ov16978 = (GE_ms8("\'value\' attribute \"$5\" in \'dotnet\' condition should be a boolean.", 65));
	ge1108ov17065 = (GE_ms8("EAAT", 4));
	ge1108ov16977 = (GE_ms8("\'value\' attribute is missing in \'dotnet\' condition.", 51));
	ge1108ov17128 = (GE_ms8("EADE", 4));
	ge1108ov17040 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'concurrency\' condition.", 76));
	ge1108ov17127 = (GE_ms8("EADD", 4));
	ge1108ov17039 = (GE_ms8("\'excluded_value\' attribute in \'concurrency\' condition is empty.", 63));
	ge1108ov17126 = (GE_ms8("EADC", 4));
	ge1108ov17038 = (GE_ms8("\'value\' attribute in \'concurrency\' condition is empty.", 54));
	ge1108ov17125 = (GE_ms8("EADB", 4));
	ge1108ov17037 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'concurrency\' condition.", 73));
	ge1108ov17070 = (GE_ms8("EAAY", 4));
	ge1108ov16982 = (GE_ms8("\'value\' attribute \"$5\" in \'multithreaded\' condition should be a boolean.", 72));
	ge1108ov17069 = (GE_ms8("EAAX", 4));
	ge1108ov16981 = (GE_ms8("\'value\' attribute is missing in \'multithreaded\' condition.", 58));
	ge1108ov17052 = (GE_ms8("EAAG", 4));
	ge1108ov16964 = (GE_ms8("\'excluded_value\' attribute in \'build\' condition is empty.", 57));
	ge1108ov17053 = (GE_ms8("EAAH", 4));
	ge1108ov16965 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'build\' condition.", 70));
	ge1108ov17051 = (GE_ms8("EAAF", 4));
	ge1108ov16963 = (GE_ms8("\'value\' attribute in \'build\' condition is empty.", 48));
	ge1108ov17050 = (GE_ms8("EAAE", 4));
	ge1108ov16962 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'build\' condition.", 67));
	ge1108ov17073 = (GE_ms8("EABB", 4));
	ge1108ov16985 = (GE_ms8("\'excluded_value\' attribute in \'platform\' condition is empty.", 60));
	ge1108ov17074 = (GE_ms8("EABC", 4));
	ge1108ov16986 = (GE_ms8("\'value\' or \'excluded_value\' attribute is missing in \'platform\' condition.", 73));
	ge1108ov17072 = (GE_ms8("EABA", 4));
	ge1108ov16984 = (GE_ms8("\'value\' attribute in \'platform\' condition is empty.", 51));
	ge1108ov17071 = (GE_ms8("EAAZ", 4));
	ge1108ov16983 = (GE_ms8("cannot have both \'value\' and \'excluded_value\' in \'platform\' condition.", 70));
	ge1108ov17111 = (GE_ms8("EACN", 4));
	ge1108ov17023 = (GE_ms8("\'location\' attribute in element \'external_object\' is empty.", 59));
	ge1108ov17110 = (GE_ms8("EACM", 4));
	ge1108ov17022 = (GE_ms8("\'location\' attribute is missing in element \'external_object\'.", 61));
	ge1108ov17109 = (GE_ms8("EACL", 4));
	ge1108ov17021 = (GE_ms8("\'location\' attribute in element \'external_library\' is empty.", 60));
	ge1108ov17108 = (GE_ms8("EACK", 4));
	ge1108ov17020 = (GE_ms8("\'location\' attribute is missing in element \'external_library\'.", 62));
	ge1108ov17107 = (GE_ms8("EACJ", 4));
	ge1108ov17019 = (GE_ms8("\'location\' attribute in element \'external_include\' is empty.", 60));
	ge1108ov17106 = (GE_ms8("EACI", 4));
	ge1108ov17018 = (GE_ms8("\'location\' attribute is missing in element \'external_include\'.", 62));
	ge1111ov6015 = (GE_ms8("exclude", 7));
	ge1111ov6022 = (GE_ms8("include", 7));
	ge1111ov6039 = (GE_ms8("readonly", 8));
	ge1111ov6038 = (GE_ms8("prefix", 6));
	ge1111ov6041 = (GE_ms8("renaming", 8));
	ge1111ov6034 = (GE_ms8("old_name", 8));
	ge1111ov6032 = (GE_ms8("new_name", 8));
	ge1108ov17116 = (GE_ms8("EACS", 4));
	ge1108ov17028 = (GE_ms8("\'old_name\' attribute $5 already appears in another \'renaming\' clause.", 69));
	ge1108ov17115 = (GE_ms8("EACR", 4));
}

void GE_init_const7()
{
	ge1108ov17027 = (GE_ms8("\'new_name\' attribute in \'renaming\' clause is empty.", 51));
	ge1108ov17114 = (GE_ms8("EACQ", 4));
	ge1108ov17026 = (GE_ms8("\'new_name\' attribute is missing in \'renaming\' clause.", 53));
	ge1108ov17113 = (GE_ms8("EACP", 4));
	ge1108ov17025 = (GE_ms8("\'old_name\' attribute in \'renaming\' clause is empty.", 51));
	ge1108ov17112 = (GE_ms8("EACO", 4));
	ge1108ov17024 = (GE_ms8("\'old_name\' attribute is missing in \'renaming\' clause.", 53));
	ge1108ov17120 = (GE_ms8("EACW", 4));
	ge1108ov17032 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'assembly\' should be a boolean.", 68));
	ge1108ov17124 = (GE_ms8("EADA", 4));
	ge1108ov17036 = (GE_ms8("\'location\' attribute in element \'assembly\' is empty.", 52));
	ge1108ov17123 = (GE_ms8("EACZ", 4));
	ge1108ov17035 = (GE_ms8("\'name\' attribute in element \'assembly\' is empty.", 48));
	ge1108ov17122 = (GE_ms8("EACY", 4));
	ge1108ov17034 = (GE_ms8("\'location\' attribute is missing in element \'assembly\'.", 54));
	ge1108ov17121 = (GE_ms8("EACX", 4));
	ge1108ov17033 = (GE_ms8("\'name\' attribute is missing in element \'assembly\'.", 50));
	ge1108ov17119 = (GE_ms8("EACV", 4));
	ge1108ov17031 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'library\' should be a boolean.", 67));
	ge1108ov17049 = (GE_ms8("EAAD", 4));
	ge1108ov16961 = (GE_ms8("\'location\' attribute in element \'library\' is empty.", 51));
	ge1108ov17048 = (GE_ms8("EAAC", 4));
	ge1108ov16960 = (GE_ms8("\'name\' attribute in element \'library\' is empty.", 47));
	ge1108ov17047 = (GE_ms8("EAAB", 4));
	ge1108ov16959 = (GE_ms8("\'location\' attribute is missing in element \'library\'.", 53));
	ge1108ov17046 = (GE_ms8("EAAA", 4));
	ge1108ov16958 = (GE_ms8("\'name\' attribute is missing in element \'library\'.", 49));
	ge1111ov6040 = (GE_ms8("recursive", 9));
	ge1108ov17118 = (GE_ms8("EACU", 4));
	ge1108ov17030 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'override\' should be a boolean.", 68));
	ge1108ov17105 = (GE_ms8("EACH", 4));
	ge1108ov17017 = (GE_ms8("\'recursive\' attribute \"$5\" in element \'override\' should be a boolean.", 69));
	ge1108ov17104 = (GE_ms8("EACG", 4));
	ge1108ov17016 = (GE_ms8("\'location\' attribute in element \'override\' is empty.", 52));
	ge1108ov17102 = (GE_ms8("EACE", 4));
	ge1108ov17014 = (GE_ms8("\'location\' attribute is missing in element \'override\'.", 54));
	ge1108ov17103 = (GE_ms8("EACF", 4));
	ge1108ov17015 = (GE_ms8("\'name\' attribute in element \'override\' is empty.", 48));
	ge1108ov17101 = (GE_ms8("EACD", 4));
	ge1108ov17013 = (GE_ms8("\'name\' attribute is missing in element \'override\'.", 50));
	ge1108ov17117 = (GE_ms8("EACT", 4));
	ge1108ov17029 = (GE_ms8("\'readonly\' attribute \"$5\" in element \'cluster\' should be a boolean.", 67));
	ge1108ov17058 = (GE_ms8("EAAM", 4));
	ge1108ov16970 = (GE_ms8("\'recursive\' attribute \"$5\" in element \'cluster\' should be a boolean.", 68));
	ge1108ov17057 = (GE_ms8("EAAL", 4));
	ge1108ov16969 = (GE_ms8("\'location\' attribute in element \'cluster\' is empty.", 51));
	ge1108ov17055 = (GE_ms8("EAAJ", 4));
	ge1108ov16967 = (GE_ms8("\'location\' attribute is missing in element \'cluster\'.", 53));
	ge1108ov17056 = (GE_ms8("EAAK", 4));
	ge1108ov16968 = (GE_ms8("\'name\' attribute in element \'cluster\' is empty.", 47));
	ge1108ov17054 = (GE_ms8("EAAI", 4));
	ge1108ov16966 = (GE_ms8("\'name\' attribute is missing in element \'cluster\'.", 49));
	ge1108ov17076 = (GE_ms8("EABE", 4));
	ge1108ov16988 = (GE_ms8("\'name\' attribute in element \'target\' is empty.", 46));
	ge1108ov17075 = (GE_ms8("EABD", 4));
	ge1108ov16987 = (GE_ms8("\'name\' attribute is missing in element \'target\'.", 48));
	ge1108ov17085 = (GE_ms8("EABN", 4));
	ge1108ov16997 = (GE_ms8("\'name\' attribute in element \'system\' describing a library is empty.", 67));
	ge1108ov17084 = (GE_ms8("EABM", 4));
	ge1108ov16996 = (GE_ms8("\'name\' attribute is missing in element \'system\' describing a library.", 69));
	ge1108ov17086 = (GE_ms8("EABO", 4));
	ge1108ov16998 = (GE_ms8("\'uuid\' attribute is missing in element \'system\' describing a library.", 69));
	ge1108ov17093 = (GE_ms8("EABV", 4));
	ge1108ov17005 = (GE_ms8("cannot open library ECF file \"$5\".", 34));
	ge1100ov6304 = (GE_ms8("multithreaded", 13));
	ge1100ov6303 = (GE_ms8("msil_generation", 15));
	ge1108ov17083 = (GE_ms8("EABL", 4));
	ge1108ov16995 = (GE_ms8("\'name\' attribute in element \'system\' is empty.", 46));
	ge1108ov17082 = (GE_ms8("EABK", 4));
	ge1108ov16994 = (GE_ms8("\'name\' attribute is missing in element \'system\'.", 48));
	ge1289ov16084 = (GE_ms8("PE reference only allowed in DTD", 32));
	ge1289ov16046 = (GE_ms8("< not allowed in attribute value", 32));
	ge1289ov16044 = (GE_ms8("-- not allowed in comment", 25));
	ge1289ov16085 = (GE_ms8("xml prefix reserved in processing instruction", 45));
	ge1289ov16057 = (GE_ms8("Misformed XML Declaration", 25));
	ge1289ov16056 = (GE_ms8("Misplaced markup declaration", 28));
	ge1289ov16067 = (GE_ms8("End tag does not match start tag", 32));
	ge1289ov16061 = (GE_ms8("Missing element end tag", 23));
	ge1289ov16060 = (GE_ms8("Error in element content", 24));
	ge1289ov16059 = (GE_ms8("Misformed start tag", 19));
	ge1289ov16065 = (GE_ms8("Attribute declared twice", 24));
	ge1289ov16064 = (GE_ms8("Misformed attribute in tag", 26));
	ge1289ov16066 = (GE_ms8("Error in end tag", 16));
	ge1289ov16043 = (GE_ms8("]]> not allowed in content", 26));
	ge1289ov16069 = (GE_ms8("Error in XML declaration", 24));
	ge1289ov16078 = (GE_ms8("Misformed element type declaration", 34));
	ge1292ov15898 = (GE_ms8("*", 1));
	ge1292ov15896 = (GE_ms8("+", 1));
	ge1292ov15897 = (GE_ms8("\?", 1));
	ge1289ov16079 = (GE_ms8("Misformed attribute list declaration", 36));
	ge1289ov16080 = (GE_ms8("Misformed attribute definition declaration", 42));
	ge1289ov16083 = (GE_ms8("Misformed conditional section", 29));
	ge1289ov16081 = (GE_ms8("Misformed entity declaration", 28));
	ge1289ov16082 = (GE_ms8("Misformed entity notation", 25));
	ge1289ov16076 = (GE_ms8("Parser is not configured to support external DTDs", 49));
	ge1285ov30825 = (GE_ms8("1.0", 3));
	ge1285ov30826 = (GE_ms8("utf-8", 5));
	ge1289ov16049 = (GE_ms8("unsupported character encoding", 30));
	ge1289ov16072 = (GE_ms8("External reference in quoted value", 34));
	ge1282ov15511 = (GE_ms8("undefined", 9));
	ge1282ov15510 = (GE_ms8("(TRUNCATED)", 11));
}

void GE_init_const8()
{
	ge1289ov16092 = (GE_ms8("Unexpected non-ASCII character in ASCII-only mode", 49));
	ge1289ov16093 = (GE_ms8("Unexpected non-latin1 character in latin1-only mode", 51));
	ge1289ov16094 = (GE_ms8("Invalid UTF8 character sequence", 31));
	ge1289ov16087 = (GE_ms8("Name misformed", 14));
	ge1289ov16070 = (GE_ms8("Literal entity expected in attribute", 36));
	ge1289ov16071 = (GE_ms8("Entity is not defined", 21));
	ge1289ov16073 = (GE_ms8("Entity cannot be recursively included", 37));
	ge1289ov16077 = (GE_ms8("Undefined PE entity", 19));
	ge1239ov15354 = (GE_ms8("root", 4));
	ge1129ov5023 = (GE_ms8("abstract", 8));
	ge1129ov5024 = (GE_ms8("address_expression", 18));
	ge1129ov5025 = (GE_ms8("arguments", 9));
	ge1129ov5026 = (GE_ms8("array_optimization", 18));
	ge1129ov5027 = (GE_ms8("assembly", 8));
	ge1129ov5028 = (GE_ms8("assertion", 9));
	ge1129ov5029 = (GE_ms8("attached_by_default", 19));
	ge1129ov5030 = (GE_ms8("automatic_backup", 16));
	ge1129ov5031 = (GE_ms8("callback", 8));
	ge1129ov5032 = (GE_ms8("case_insensitive", 16));
	ge1129ov5033 = (GE_ms8("check_generic_creation_constraint", 33));
	ge1129ov5034 = (GE_ms8("check_vape", 10));
	ge1129ov5035 = (GE_ms8("clean", 5));
	ge1129ov5036 = (GE_ms8("cls_compliant", 13));
	ge1129ov5037 = (GE_ms8("component", 9));
	ge1129ov5038 = (GE_ms8("console_application", 19));
	ge1129ov5039 = (GE_ms8("create_keyword_extension", 24));
	ge1129ov5040 = (GE_ms8("culture", 7));
	ge1129ov5041 = (GE_ms8("c_compiler_options", 18));
	ge1129ov5042 = (GE_ms8("dead_code_removal", 17));
	ge1129ov5043 = (GE_ms8("debug", 5));
	ge1129ov5044 = (GE_ms8("debug_tag", 9));
	ge1129ov5045 = (GE_ms8("debugger", 8));
	ge1129ov5046 = (GE_ms8("document", 8));
	ge1129ov5047 = (GE_ms8("dotnet_naming_convention", 24));
	ge1129ov5048 = (GE_ms8("dynamic_runtime", 15));
	ge1129ov5049 = (GE_ms8("ecf_library", 11));
	ge1129ov5050 = (GE_ms8("enforce_unique_class_names", 26));
	ge1129ov5051 = (GE_ms8("exception_trace", 15));
	ge1129ov5052 = (GE_ms8("exclude", 7));
	ge1129ov5053 = (GE_ms8("export", 6));
	ge1129ov5054 = (GE_ms8("external_runtime", 16));
	ge1129ov5055 = (GE_ms8("finalize", 8));
	ge1129ov5056 = (GE_ms8("flat_fst_optimization", 21));
	ge1129ov5057 = (GE_ms8("force_32bits", 12));
	ge1129ov5058 = (GE_ms8("fst_expansion_factor", 20));
	ge1129ov5059 = (GE_ms8("fst_optimization", 16));
	ge1129ov5060 = (GE_ms8("full_class_checking", 19));
	ge1129ov5061 = (GE_ms8("garbage_collector", 17));
	ge1129ov5062 = (GE_ms8("gc_info", 7));
	ge1129ov5063 = (GE_ms8("heap_size", 9));
	ge1129ov5064 = (GE_ms8("header", 6));
	ge1129ov5065 = (GE_ms8("high_memory_compiler", 20));
	ge1129ov5066 = (GE_ms8("il_verifiable", 13));
	ge1129ov5067 = (GE_ms8("include", 7));
	ge1129ov5068 = (GE_ms8("inlining", 8));
	ge1129ov5069 = (GE_ms8("inlining_size", 13));
	ge1129ov5070 = (GE_ms8("jumps_optimization", 18));
	ge1129ov5071 = (GE_ms8("layout", 6));
	ge1129ov5072 = (GE_ms8("layout_optimization", 19));
	ge1129ov5073 = (GE_ms8("leaves_optimization", 19));
	ge1129ov5074 = (GE_ms8("line_generation", 15));
	ge1129ov5075 = (GE_ms8("link", 4));
	ge1129ov5076 = (GE_ms8("linker", 6));
	ge1129ov5077 = (GE_ms8("linux_fpu_double_precision", 26));
	ge1129ov5078 = (GE_ms8("manifest_string_trace", 21));
	ge1129ov5079 = (GE_ms8("map", 3));
	ge1129ov5080 = (GE_ms8("metadata_cache_path", 19));
	ge1129ov5081 = (GE_ms8("msil_assembly_compatibility", 27));
	ge1129ov5082 = (GE_ms8("msil_classes_per_module", 23));
	ge1129ov5083 = (GE_ms8("msil_clr_version", 16));
	ge1129ov5084 = (GE_ms8("msil_culture", 12));
	ge1129ov5085 = (GE_ms8("msil_generation", 15));
	ge1129ov5086 = (GE_ms8("msil_generation_version", 23));
	ge1129ov5087 = (GE_ms8("msil_key_file_name", 18));
	ge1129ov5088 = (GE_ms8("msil_use_optimized_precompile", 29));
	ge1129ov5089 = (GE_ms8("multithreaded", 13));
	ge1129ov5090 = (GE_ms8("namespace", 9));
	ge1129ov5091 = (GE_ms8("no_default_lib", 14));
	ge1129ov5092 = (GE_ms8("old_verbatim_strings", 20));
	ge1129ov5093 = (GE_ms8("override_cluster", 16));
	ge1129ov5094 = (GE_ms8("portable_code_generation", 24));
	ge1129ov5095 = (GE_ms8("precompiled", 11));
	ge1129ov5096 = (GE_ms8("prefix", 6));
	ge1129ov5097 = (GE_ms8("profile", 7));
	ge1129ov5098 = (GE_ms8("public_key_token", 16));
	ge1129ov5099 = (GE_ms8("read_only", 9));
	ge1129ov5100 = (GE_ms8("recursive", 9));
	ge1129ov5101 = (GE_ms8("reloads_optimization", 20));
	ge1129ov5102 = (GE_ms8("shared_library_definition", 25));
	ge1129ov5103 = (GE_ms8("split", 5));
	ge1129ov5104 = (GE_ms8("stack_size", 10));
	ge1129ov5105 = (GE_ms8("storable", 8));
	ge1129ov5106 = (GE_ms8("storable_filename", 17));
	ge1129ov5107 = (GE_ms8("strip", 5));
	ge1129ov5108 = (GE_ms8("syntax", 6));
	ge1129ov5109 = (GE_ms8("target", 6));
	ge1129ov5110 = (GE_ms8("trace", 5));
	ge1129ov5111 = (GE_ms8("use_cluster_name_as_namespace", 29));
	ge1129ov5112 = (GE_ms8("use_full_cluster_name_as_namespace", 34));
	ge1129ov5113 = (GE_ms8("verbose", 7));
	ge1129ov5114 = (GE_ms8("version", 7));
}

void GE_init_const9()
{
	ge1129ov5115 = (GE_ms8("visible_filename", 16));
	ge1129ov5116 = (GE_ms8("void_safety", 11));
	ge1129ov5117 = (GE_ms8("warning", 7));
	ge1129ov5118 = (GE_ms8("wedit", 5));
	ge1129ov5219 = (GE_ms8("boehm", 5));
	ge1129ov5231 = (GE_ms8("internal", 8));
	ge1160ov4990 = (GE_ms8("", 0));
	ge1129ov5242 = (GE_ms8("require", 7));
	ge1129ov5227 = (GE_ms8("ensure", 6));
	ge1129ov5232 = (GE_ms8("invariant", 9));
	ge1129ov5233 = (GE_ms8("loop_invariant", 14));
	ge1129ov5234 = (GE_ms8("loop_variant", 12));
	ge1129ov5220 = (GE_ms8("check", 5));
	ge1129ov5238 = (GE_ms8("none", 4));
	ge1129ov5245 = (GE_ms8("style", 5));
	ge1129ov5225 = (GE_ms8("default", 7));
	ge1129ov5216 = (GE_ms8("all", 3));
	ge1129ov5241 = (GE_ms8("on_demand", 9));
	ge1129ov5223 = (GE_ms8("complete", 8));
	ge1129ov5228 = (GE_ms8("exe", 3));
	ge1129ov5226 = (GE_ms8("dll", 3));
	ge1129ov5222 = (GE_ms8("com", 3));
	ge1129ov5237 = (GE_ms8("no_main", 7));
	ge1129ov5239 = (GE_ms8("obsolete", 8));
	ge1129ov5247 = (GE_ms8("transitional", 12));
	ge1129ov5244 = (GE_ms8("standard", 8));
	ge1129ov5236 = (GE_ms8("microsoft", 9));
	ge1129ov5218 = (GE_ms8("auto", 4));
	ge1129ov5243 = (GE_ms8("sequential", 10));
	ge1129ov5217 = (GE_ms8("array", 5));
	ge1129ov5224 = (GE_ms8("constant", 8));
	ge1129ov5240 = (GE_ms8("once", 4));
	ge1129ov5235 = (GE_ms8("low_level", 9));
	ge1129ov5229 = (GE_ms8("feature", 7));
	ge1129ov5221 = (GE_ms8("class", 5));
	ge1129ov5249 = (GE_ms8("winapi", 6));
	ge1129ov5230 = (GE_ms8("generate", 8));
	ge1129ov5246 = (GE_ms8("supplier_precondition", 21));
	ge1160ov4989 = (GE_ms8("false", 5));
	ge1160ov4988 = (GE_ms8("true", 4));
	ge1119ov23794 = (GE_ms8("", 0));
	ge1125ov15761 = (GE_ms8("", 0));
	ge1325ov5873 = (GE_ms8(" \t\r\n", 4));
	ge9ov4860 = (GE_ms8("The value \'$2\' is not valid for the option \'$1\'.", 48));
	ge9ov4867 = (GE_ms8("APIPAR", 6));
	ge7ov4924 = (GE_ms8("usage: ", 7));
	ge284ov1975 = (GE_ms8("3.9", 3));
	ge6ov4496 = (GE_ms8("Errors parsing arguments, aborting.", 35));
	ge9ov4863 = (GE_ms8("Too many occurrences of option \'$1\'.", 36));
	ge9ov4870 = (GE_ms8("APSOPT", 6));
	ge9ov4861 = (GE_ms8("The mandatory option \'$1\' is missing.", 37));
	ge9ov4868 = (GE_ms8("APMOPT", 6));
	ge9ov4862 = (GE_ms8("The option \'$1\' is missing a parameter.", 39));
	ge9ov4869 = (GE_ms8("APMPAR", 6));
	ge9ov4864 = (GE_ms8("Unknown option \'$1\'.", 20));
	ge9ov4871 = (GE_ms8("APUOPT", 6));
	ge9ov4865 = (GE_ms8("The flag \'$1\' was given the parameter \'$2\'.", 43));
	ge9ov4872 = (GE_ms8("APUPAR", 6));
	ge6ov4491 = (GE_ms8("help", 4));
	ge6ov4490 = (GE_ms8("Display this help text.", 23));
	ge6ov4498 = (GE_ms8("parameters ...", 14));
	ge6ov4497 = (GE_ms8("", 0));
	ge1168ov3256 = (GE_ms8("ISE_LIBRARY", 11));
	ge1168ov3254 = (GE_ms8("ISE_EIFFEL", 10));
	ge1296ov30395 = (GE_ms8(" ", 1));
	ge1296ov30396 = (GE_ms8("  ", 2));
	ge1287ov32291 = (GE_ms8("iso-8859-1", 10));
	ge1287ov32293 = (GE_ms8("utf-16", 6));
	ge807ov12520 = (GE_ms8("NATIVE_ARRAY", 12));
	ge1009ov39783 = (GE_ms8("gaaaa", 5));
	ge1009ov39781 = (GE_ms8("GAAAA", 5));
	ge1009ov39779 = (GE_ms8("[$1] assembly $2: .NET assemblies not supported.", 48));
	ge807ov12860 = (GE_ms8("attached", 8));
	ge900ov19235 = (GE_ms8("TUPLE", 5));
	ge893ov28775 = (GE_ms8("like ", 5));
	ge889ov28767 = (GE_ms8("like Current", 12));
	ge1019ov29948 = (GE_ms8("vtgc0a", 6));
	ge1019ov29689 = (GE_ms8("VTGC", 4));
	ge1019ov29507 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge1019ov29949 = (GE_ms8("vtgc0b", 6));
	ge1019ov29508 = (GE_ms8("`$7\' is not the final name of a procedure in constraint\'s base class $8.", 72));
	ge1019ov29855 = (GE_ms8("vgcp3c", 6));
	ge1019ov29638 = (GE_ms8("VGCP-3", 6));
	ge1019ov29414 = (GE_ms8("procedure name `$7\' appears twice in creation clause of constraint.", 67));
	ge1019ov29769 = (GE_ms8("vdrd2c", 6));
	ge1019ov29600 = (GE_ms8("VDRD-2", 6));
	ge1019ov29328 = (GE_ms8("signature of selected feature `$7\' does not conform to the signature of replicated feature `$8\' in parent $9.", 109));
	ge1019ov29770 = (GE_ms8("vdrd2d", 6));
	ge1019ov29329 = (GE_ms8("signature of selected feature `$7\' inherited from $8 does not conform to the signature of replicated feature `$9\' in parent $10.", 128));
	ge1019ov29753 = (GE_ms8("vdjr0b", 6));
	ge1019ov29593 = (GE_ms8("VDJR", 4));
	ge1019ov29312 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of argument number $10 differs.", 122));
	ge1019ov29752 = (GE_ms8("vdjr0a", 6));
	ge1019ov29311 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Different number of arguments.", 116));
	ge1019ov29754 = (GE_ms8("vdjr0c", 6));
	ge1019ov29313 = (GE_ms8("joined deferred features `$7\' inherited from $8 and $9 don\'t have the same signature. Type of result differs.", 109));
	ge1019ov29778 = (GE_ms8("vdrd6b", 6));
	ge1019ov29604 = (GE_ms8("VDRD-6", 6));
	ge1019ov29337 = (GE_ms8("attribute `$7\' inherited from $8 and its redeclared version don\'t have the same type expandedness.", 98));
	ge1019ov29767 = (GE_ms8("vdrd2a", 6));
	ge1019ov29326 = (GE_ms8("signature of feature `$7\' does not conform to the signature of redeclared feature `$8\' in parent $9.", 100));
}

void GE_init_const10()
{
	ge1019ov29768 = (GE_ms8("vdrd2b", 6));
	ge1019ov29327 = (GE_ms8("signature of feature `$7\' inherited from $8 does not conform to the signature of redeclared feature `$9\' in parent $10.", 119));
	ge1019ov29885 = (GE_ms8("vmrc2b", 6));
	ge1019ov29655 = (GE_ms8("VMRC-2", 6));
	ge1019ov29444 = (GE_ms8("replicated features $7 have been selected more than once.", 57));
	ge1019ov29884 = (GE_ms8("vmrc2a", 6));
	ge1019ov29443 = (GE_ms8("replicated features $7 have not been selected.", 46));
	ge1019ov29886 = (GE_ms8("vmss1a", 6));
	ge1019ov29656 = (GE_ms8("VMSS-1", 6));
	ge1019ov29445 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1019ov29782 = (GE_ms8("vdrs1a", 6));
	ge1019ov29606 = (GE_ms8("VDRS-1", 6));
	ge1019ov29341 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1019ov29788 = (GE_ms8("vdus1a", 6));
	ge1019ov29610 = (GE_ms8("VDUS-1", 6));
	ge1019ov29347 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1019ov29877 = (GE_ms8("vlel2a", 6));
	ge1019ov29651 = (GE_ms8("VLEL-2", 6));
	ge1019ov29436 = (GE_ms8("`$7\' is not the final name of a feature inherited from $8.", 58));
	ge1019ov29860 = (GE_ms8("vhrc1a", 6));
	ge1019ov29641 = (GE_ms8("VHRC-1", 6));
	ge1019ov29419 = (GE_ms8("`$7\' is not the final name of a feature in $8.", 46));
	ge1019ov29887 = (GE_ms8("vmss2a", 6));
	ge1019ov29657 = (GE_ms8("VMSS-2", 6));
	ge1019ov29446 = (GE_ms8("feature name `$7\' appears twice in the Select subclause of parent $8.", 69));
	ge1019ov29785 = (GE_ms8("vdrs3a", 6));
	ge1019ov29608 = (GE_ms8("VDRS-3", 6));
	ge1019ov29344 = (GE_ms8("feature name `$7\' appears twice in the Redefine subclause of parent $8.", 71));
	ge1019ov29792 = (GE_ms8("vdus4a", 6));
	ge1019ov29613 = (GE_ms8("VDUS-4", 6));
	ge1019ov29351 = (GE_ms8("feature name `$7\' appears twice in the Undefine subclause of parent $8.", 71));
	ge1019ov29878 = (GE_ms8("vlel3a", 6));
	ge1019ov29652 = (GE_ms8("VLEL-3", 6));
	ge1019ov29437 = (GE_ms8("feature name `$7\' appears twice in the Export subclause of parent $8.", 69));
	ge1019ov29876 = (GE_ms8("vlel1a", 6));
	ge1019ov29650 = (GE_ms8("VLEL-1", 6));
	ge1019ov29435 = (GE_ms8("\'all\' keyword appears twice in the Export subclause of parent $7.", 65));
	ge1019ov29861 = (GE_ms8("vhrc2a", 6));
	ge1019ov29642 = (GE_ms8("VHRC-2", 6));
	ge1019ov29420 = (GE_ms8("feature name `$7\' appears as first element of two Rename_pairs.", 63));
	ge1019ov29879 = (GE_ms8("vmfn0a", 6));
	ge1019ov29653 = (GE_ms8("VMFN", 4));
	ge1019ov29438 = (GE_ms8("two features with the same name `$7\'.", 37));
	ge807ov12858 = (GE_ms8("as", 2));
	ge807ov12632 = (GE_ms8("forth", 5));
	ge807ov12546 = (GE_ms8("after", 5));
	ge807ov12726 = (GE_ms8("new_cursor", 10));
	ge807ov12607 = (GE_ms8("dispose", 7));
	ge1019ov29996 = (GE_ms8("gvkfe5a", 7));
	ge1019ov29720 = (GE_ms8("GVKFE-5", 7));
	ge1019ov29555 = (GE_ms8("feature `$7\' in kernel class $5 is not a query.", 47));
	ge807ov12670 = (GE_ms8("is_equal", 8));
	ge807ov12595 = (GE_ms8("copy", 4));
	ge1019ov29851 = (GE_ms8("vgcp2a", 6));
	ge1019ov29637 = (GE_ms8("VGCP-2", 6));
	ge1019ov29410 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge1019ov29852 = (GE_ms8("vgcp2b", 6));
	ge1019ov29411 = (GE_ms8("`$7\' is not the final name of a procedure.", 42));
	ge1019ov29843 = (GE_ms8("vgcc6a", 6));
	ge1019ov29634 = (GE_ms8("VGCC-6", 6));
	ge1019ov29402 = (GE_ms8("`$7\' is the final name of a once-procedure.", 43));
	ge1019ov29854 = (GE_ms8("vgcp3b", 6));
	ge1019ov29413 = (GE_ms8("procedure name `$7\' appears in two different creation clauses.", 62));
	ge1019ov29853 = (GE_ms8("vgcp3a", 6));
	ge1019ov29412 = (GE_ms8("procedure name `$7\' appears twice in creation clause.", 53));
	ge1019ov29850 = (GE_ms8("vgcp1a", 6));
	ge1019ov29636 = (GE_ms8("VGCP-1", 6));
	ge1019ov29409 = (GE_ms8("deferred class has a creation clause.", 37));
	ge1019ov29815 = (GE_ms8("vfac4a", 6));
	ge1019ov29622 = (GE_ms8("VFAC-4", 6));
	ge1019ov29374 = (GE_ms8("the type of the $10-th argument of assigner procedure `$8\' and of the $9-th argument of query `$7\' do not have the same deanchored form.", 136));
	ge1019ov29814 = (GE_ms8("vfac3a", 6));
	ge1019ov29621 = (GE_ms8("VFAC-3", 6));
	ge1019ov29373 = (GE_ms8("the type of the first argument of assigner procedure `$8\' and the result type of query `$7\' do not have the same deanchored form.", 129));
	ge1019ov29813 = (GE_ms8("vfac2a", 6));
	ge1019ov29620 = (GE_ms8("VFAC-2", 6));
	ge1019ov29372 = (GE_ms8("the number of arguments in assigner procedure `$8\' is not one more than the number of arguments in query `$7\'.", 110));
	ge1019ov29812 = (GE_ms8("vfac1b", 6));
	ge1019ov29619 = (GE_ms8("VFAC-1", 6));
	ge1019ov29371 = (GE_ms8("query `$7\' has an assigner mark `$8\' but this feature is not a procedure.", 73));
	ge1019ov29811 = (GE_ms8("vfac1a", 6));
	ge1019ov29370 = (GE_ms8("query `$7\' has an assigner mark `$8\' but there is no feature with that name.", 76));
	ge1019ov29743 = (GE_ms8("vcch2a", 6));
	ge1019ov29589 = (GE_ms8("VCCH-2", 6));
	ge1019ov29302 = (GE_ms8("class is marked as deferred but has no deferred feature.", 56));
	ge1019ov29741 = (GE_ms8("vcch1a", 6));
	ge1019ov29588 = (GE_ms8("VCCH-1", 6));
	ge1019ov29300 = (GE_ms8("class is not marked as deferred but has deferred feature `$7\'.", 62));
	ge1019ov29821 = (GE_ms8("vfav1f", 6));
	ge1019ov29623 = (GE_ms8("VFAV-1", 6));
	ge1019ov29380 = (GE_ms8("features `$7\' and `$9\' have both the same binary Operator alias `$8\'.", 69));
	ge1019ov29818 = (GE_ms8("vfav1c", 6));
	ge1019ov29377 = (GE_ms8("features `$7\' and `$9\' have both the same unary Operator alias `$8\'.", 68));
	ge1019ov29829 = (GE_ms8("vfav4b", 6));
	ge1019ov29625 = (GE_ms8("VFAV-4", 6));
	ge1019ov29388 = (GE_ms8("features `$7\' and `$9\' have both the same Parenthesis alias `$8\'.", 65));
	ge1019ov29825 = (GE_ms8("vfav2b", 6));
	ge1019ov29624 = (GE_ms8("VFAV-2", 6));
	ge1019ov29384 = (GE_ms8("features `$7\' and `$9\' have both the same Bracket alias `$8\'.", 61));
	ge1019ov29822 = (GE_ms8("vfav1g", 6));
	ge1019ov29381 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same binary Operator alias `$8\'.", 88));
}

void GE_init_const11()
{
	ge1019ov29819 = (GE_ms8("vfav1d", 6));
	ge1019ov29378 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same unary Operator alias `$8\'.", 87));
	ge1019ov29830 = (GE_ms8("vfav4c", 6));
	ge1019ov29389 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same Parenthesis alias `$8\'.", 84));
	ge1019ov29826 = (GE_ms8("vfav2c", 6));
	ge1019ov29385 = (GE_ms8("features `$7\' and `$9\' inherited from $11 have both the same Bracket alias `$8\'.", 80));
	ge1019ov29823 = (GE_ms8("vfav1h", 6));
	ge1019ov29382 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same binary Operator alias `$8\'.", 107));
	ge1019ov29820 = (GE_ms8("vfav1e", 6));
	ge1019ov29379 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same unary Operator alias `$8\'.", 106));
	ge1019ov29831 = (GE_ms8("vfav4d", 6));
	ge1019ov29390 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Parenthesis alias `$8\'.", 103));
	ge1019ov29827 = (GE_ms8("vfav2d", 6));
	ge1019ov29386 = (GE_ms8("features `$7\' inherited from $9 and `$10\' inherited from $12 have both the same Bracket alias `$8\'.", 99));
	ge1019ov29941 = (GE_ms8("vtat2a", 6));
	ge1019ov29685 = (GE_ms8("VTAT-2", 6));
	ge1019ov29500 = (GE_ms8("anchor cycle $7.", 16));
	ge1019ov29837 = (GE_ms8("vffd7b", 6));
	ge1019ov29629 = (GE_ms8("VFFD-7", 6));
	ge1019ov29396 = (GE_ms8("feature `$7\' is a once funtion but its type contains a formal generic parameter.", 80));
	ge1019ov29836 = (GE_ms8("vffd7a", 6));
	ge1019ov29395 = (GE_ms8("feature `$7\' is a once funtion but its type contains an anchored type.", 70));
	ge1019ov29817 = (GE_ms8("vfav1b", 6));
	ge1019ov29376 = (GE_ms8("feature `$7\' has a unary Operator alias `$8\' but is not a query with no argument.", 81));
	ge1019ov29816 = (GE_ms8("vfav1a", 6));
	ge1019ov29375 = (GE_ms8("feature `$7\' has a binary Operator alias `$8\' but is not a query with at exactly one argument.", 94));
	ge1019ov29828 = (GE_ms8("vfav4a", 6));
	ge1019ov29387 = (GE_ms8("feature `$7\' has a Parenthesis alias `$8\' but is not a feature with at least one argument.", 90));
	ge1019ov29824 = (GE_ms8("vfav2a", 6));
	ge1019ov29383 = (GE_ms8("feature `$7\' has a Bracket alias `$8\' but is not a query with at least one argument.", 84));
	ge1019ov29835 = (GE_ms8("vffd6a", 6));
	ge1019ov29628 = (GE_ms8("VFFD-6", 6));
	ge1019ov29394 = (GE_ms8("feature `$7\' has an Infix name but is not a function with exactly one argument.", 79));
	ge1019ov29834 = (GE_ms8("vffd5a", 6));
	ge1019ov29627 = (GE_ms8("VFFD-5", 6));
	ge1019ov29393 = (GE_ms8("feature `$7\' has a Prefix name but is not an attribute or a function with no argument.", 86));
	ge1019ov29833 = (GE_ms8("vffd4a", 6));
	ge1019ov29626 = (GE_ms8("VFFD-4", 6));
	ge1019ov29392 = (GE_ms8("deferred feature `$7\' is marked as frozen.", 42));
	ge1019ov29930 = (GE_ms8("vrfa0a", 6));
	ge1019ov29679 = (GE_ms8("VRFA", 4));
	ge1019ov29489 = (GE_ms8("argument name \'$7\' in feature `$8\' is also the final name of a feature.", 71));
	ge1019ov29928 = (GE_ms8("vreg0a", 6));
	ge1019ov29678 = (GE_ms8("VREG", 4));
	ge1019ov29487 = (GE_ms8("argument name \'$7\' appear twice in feature `$8\'.", 48));
	ge1019ov29756 = (GE_ms8("vdjr2b", 6));
	ge1019ov29594 = (GE_ms8("VDJR-2", 6));
	ge1019ov29315 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge1019ov29883 = (GE_ms8("vmfn2b", 6));
	ge1019ov29654 = (GE_ms8("VMFN-2", 6));
	ge1019ov29442 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $11 has a different one `$10\'.", 110));
	ge1019ov29755 = (GE_ms8("vdjr2a", 6));
	ge1019ov29314 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge1019ov29882 = (GE_ms8("vmfn2a", 6));
	ge1019ov29441 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but the version inherited from $10 has none.", 93));
	ge1019ov29881 = (GE_ms8("vmfn0c", 6));
	ge1019ov29440 = (GE_ms8("two features with the same name `$7\' inherited from $8 and `$9\' inherited from $10.", 83));
	ge1019ov29786 = (GE_ms8("vdrs4a", 6));
	ge1019ov29609 = (GE_ms8("VDRS-4", 6));
	ge1019ov29345 = (GE_ms8("Redefine subclause of $8 lists feature `$7\' but it is not redefined.", 68));
	ge1019ov29784 = (GE_ms8("vdrs2b", 6));
	ge1019ov29607 = (GE_ms8("VDRS-2", 6));
	ge1019ov29343 = (GE_ms8("cannot redefine the constant attribute `$7\'.", 44));
	ge1019ov29783 = (GE_ms8("vdrs2a", 6));
	ge1019ov29342 = (GE_ms8("cannot redefine the frozen feature `$7\'.", 40));
	ge1019ov29790 = (GE_ms8("vdus2b", 6));
	ge1019ov29611 = (GE_ms8("VDUS-2", 6));
	ge1019ov29349 = (GE_ms8("cannot undefine the attribute `$7\'.", 35));
	ge1019ov29789 = (GE_ms8("vdus2a", 6));
	ge1019ov29348 = (GE_ms8("cannot undefine the frozen feature `$7\'.", 40));
	ge1019ov29791 = (GE_ms8("vdus3a", 6));
	ge1019ov29612 = (GE_ms8("VDUS-3", 6));
	ge1019ov29350 = (GE_ms8("cannot undefine the deferred feature `$7\'.", 42));
	ge1019ov29865 = (GE_ms8("vhrc4d", 6));
	ge1019ov29643 = (GE_ms8("VHRC-4", 6));
	ge1019ov29424 = (GE_ms8("`$7\' has a unary Operator alias `$8\' but `$9\' in $10 is not a query with no argument.", 85));
	ge1019ov29864 = (GE_ms8("vhrc4c", 6));
	ge1019ov29423 = (GE_ms8("`$7\' has a binary Operator alias `$8\' but `$9\' in $10 is not a query with exactly one argument.", 95));
	ge1019ov29832 = (GE_ms8("vfav4e", 6));
	ge1019ov29391 = (GE_ms8("`$7\' has a Parenthesis alias `$8\' but `$9\' in $10 is not a feature with at least one argument.", 94));
	ge1019ov29863 = (GE_ms8("vhrc4b", 6));
	ge1019ov29422 = (GE_ms8("`$7\' has a Bracket alias `$8\' but `$9\' in $10 is not a query with at least one argument.", 88));
	ge1019ov29862 = (GE_ms8("vhrc4a", 6));
	ge1019ov29421 = (GE_ms8("`$7\' is of the Prefix form but `$8\' in $9 is not an attribute nor a function with no argument.", 94));
	ge1019ov29866 = (GE_ms8("vhrc5a", 6));
	ge1019ov29644 = (GE_ms8("VHRC-5", 6));
	ge1019ov29425 = (GE_ms8("`$7\' is of the Infix form but `$8\' in $9 is not a function with one argument.", 77));
	ge1019ov29772 = (GE_ms8("vdrd3b", 6));
	ge1019ov29601 = (GE_ms8("VDRD-3", 6));
	ge1019ov29331 = (GE_ms8("feature `$7\' is redeclared but its postconditions do not begin with \'ensure then\'.", 82));
	ge1019ov29771 = (GE_ms8("vdrd3a", 6));
	ge1019ov29330 = (GE_ms8("feature `$7\' is redeclared but its preconditions do not begin with \'require else\'.", 82));
	ge1019ov29777 = (GE_ms8("vdrd6a", 6));
	ge1019ov29336 = (GE_ms8("attribute `$7\' inherited from $8 is not redeclared into an attribute.", 69));
	ge1019ov29774 = (GE_ms8("vdrd4b", 6));
	ge1019ov29602 = (GE_ms8("VDRD-4", 6));
	ge1019ov29333 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 98));
	ge1019ov29775 = (GE_ms8("vdrd4c", 6));
	ge1019ov29334 = (GE_ms8("effective feature `$8\' inherited from $9 is redefined into a deferred one but is not listed in the Undefine and Redefine subclauses.", 132));
	ge1019ov29880 = (GE_ms8("vmfn0b", 6));
	ge1019ov29439 = (GE_ms8("two features with the same name `$7\' in current class and `$8\' inherited from $9.", 81));
}

void GE_init_const12()
{
	ge1019ov29773 = (GE_ms8("vdrd4a", 6));
	ge1019ov29332 = (GE_ms8("deferred feature `$7\' inherited from $8 is redefined but is not listed in the Redefine subclause.", 97));
	ge1019ov29787 = (GE_ms8("vdrs4b", 6));
	ge1019ov29346 = (GE_ms8("redeclaration of feature `$7\' from $8 is an effecting and should not appear in the Redefine subclause.", 102));
	ge1019ov29776 = (GE_ms8("vdrd5a", 6));
	ge1019ov29603 = (GE_ms8("VDRD-5", 6));
	ge1019ov29335 = (GE_ms8("effective feature `$7\' inherited from $8 is redefined into a deferred one.", 74));
	ge1019ov29781 = (GE_ms8("vdrd7c", 6));
	ge1019ov29605 = (GE_ms8("VDRD-7", 6));
	ge1019ov29340 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has a different one `$11\'.", 102));
	ge1019ov29779 = (GE_ms8("vdrd7a", 6));
	ge1019ov29338 = (GE_ms8("feature `$7\' inherited from $8 has no alias but its redeclared version has one `$10\'.", 85));
	ge1019ov29780 = (GE_ms8("vdrd7b", 6));
	ge1019ov29339 = (GE_ms8("feature `$7\' inherited from $9 has an alias `$8\' but its redeclared version has none.", 85));
	ge1019ov29888 = (GE_ms8("vmss3a", 6));
	ge1019ov29658 = (GE_ms8("VMSS-3", 6));
	ge1019ov29447 = (GE_ms8("feature name `$7\' appears in the Select subclause of parent $8 but is not replicated.", 85));
	ge1019ov29857 = (GE_ms8("vhpr1a", 6));
	ge1019ov29630 = (GE_ms8("VHPR-1", 6));
	ge1019ov29416 = (GE_ms8("inheritance cycle $7.", 21));
	ge1019ov29751 = (GE_ms8("vcfg3h", 6));
	ge1019ov29592 = (GE_ms8("VCFG-3", 6));
	ge1019ov29310 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge1019ov29749 = (GE_ms8("vcfg3e", 6));
	ge1019ov29308 = (GE_ms8("formal generic constraint cycle $7.", 35));
	ge1019ov29745 = (GE_ms8("vcfg2a", 6));
	ge1019ov29591 = (GE_ms8("VCFG-2", 6));
	ge1019ov29304 = (GE_ms8("\'$7\' is the name of formal generic parameters #$7 and #$8.", 58));
	ge1019ov29744 = (GE_ms8("vcfg1a", 6));
	ge1019ov29590 = (GE_ms8("VCFG-1", 6));
	ge1019ov29303 = (GE_ms8("formal generic parameter \'$7\' has the same name as a class in the surrounding universe.", 87));
	ge1019ov29986 = (GE_ms8("gvagp0a", 7));
	ge1019ov29709 = (GE_ms8("GVAGP", 5));
	ge1019ov29545 = (GE_ms8("ancestors with generic parameter mismatch: \'$7\' and \'$8\'.", 57));
	ge1019ov29989 = (GE_ms8("gvhso2a", 7));
	ge1019ov29713 = (GE_ms8("GVHSO-2", 7));
	ge1019ov29548 = (GE_ms8("implicitly inherits from class SYSTEM_OBJECT but SYSTEM_OBJECT is not a .NET class.", 83));
	ge1019ov29946 = (GE_ms8("vtct0a", 6));
	ge1019ov29688 = (GE_ms8("VTCT", 4));
	ge1019ov29505 = (GE_ms8("type based on unknown class $7.", 31));
	ge1019ov29988 = (GE_ms8("gvhso1a", 7));
	ge1019ov29712 = (GE_ms8("GVHSO-1", 7));
	ge1019ov29547 = (GE_ms8("implicitly inherits from unknown class SYSTEM_OBJECT.", 53));
	ge1019ov29856 = (GE_ms8("vhay0a", 6));
	ge1019ov29639 = (GE_ms8("VHAY", 4));
	ge1019ov29415 = (GE_ms8("implicitly inherits from unknown class ANY.", 43));
	ge1019ov29858 = (GE_ms8("vhpr1b", 6));
	ge1019ov29417 = (GE_ms8("inheritance cycle when inheriting from $7.", 42));
	ge1008ov38988 = (GE_ms8("gcdep", 5));
	ge1008ov38983 = (GE_ms8("GCDEP", 5));
	ge1008ov38978 = (GE_ms8("[$1] cluster $2: class $3 (from cluster $4) is a provider of class $5 (from cluster $6) which is not contained in any of the clusters $7.", 137));
	ge1008ov38989 = (GE_ms8("gcpro", 5));
	ge1008ov38984 = (GE_ms8("GCPRO", 5));
	ge1008ov38979 = (GE_ms8("[$1] cluster $2: class $3 (from cluster $4) depends on class $5 (from cluster $6) which is not contained in any of the clusters $7.", 131));
	ge1008ov38987 = (GE_ms8("gcaab", 5));
	ge1008ov38982 = (GE_ms8("GCAAB", 5));
	ge1008ov38977 = (GE_ms8("[$1] cluster $2: cannot read Eiffel file \'$3\'.", 46));
	ge1019ov29999 = (GE_ms8("gvscn1b", 7));
	ge1019ov29722 = (GE_ms8("GVSCN-1", 7));
	ge1019ov29558 = (GE_ms8("file \'$8\' does not contain the expected class $5.", 49));
	ge807ov12853 = (GE_ms8("agent", 5));
	ge807ov12898 = (GE_ms8("once", 4));
	ge807ov12852 = (GE_ms8("across", 6));
	ge807ov12849 = (GE_ms8("True", 4));
	ge807ov12913 = (GE_ms8("strip", 5));
	ge807ov12897 = (GE_ms8("old", 3));
	ge807ov12872 = (GE_ms8("else", 4));
	ge807ov12899 = (GE_ms8("or", 2));
	ge807ov12914 = (GE_ms8("then", 4));
	ge807ov12856 = (GE_ms8("and", 3));
	ge807ov12901 = (GE_ms8("precursor", 9));
	ge807ov12868 = (GE_ms8("debug", 5));
	ge807ov12871 = (GE_ms8("do", 2));
	ge807ov12921 = (GE_ms8("when", 4));
	ge807ov12862 = (GE_ms8("check", 5));
	ge807ov12893 = (GE_ms8("loop", 4));
	ge807ov12881 = (GE_ms8("from", 4));
	ge807ov12907 = (GE_ms8("rescue", 6));
	ge807ov12861 = (GE_ms8("attribute", 9));
	ge807ov12919 = (GE_ms8("variant", 7));
	ge807ov12889 = (GE_ms8("invariant", 9));
	ge807ov12875 = (GE_ms8("ensure", 6));
	ge807ov12906 = (GE_ms8("require", 7));
	ge1016ov38996 = (GE_ms8("gssss", 5));
	ge1016ov38995 = (GE_ms8("Syntax error:\n$1", 16));
	ge807ov12892 = (GE_ms8("local", 5));
	ge807ov12854 = (GE_ms8("alias", 5));
	ge807ov12886 = (GE_ms8("infix", 5));
	ge807ov12902 = (GE_ms8("prefix", 6));
	ge807ov12890 = (GE_ms8("is", 2));
	ge807ov12917 = (GE_ms8("unique", 6));
	ge807ov12880 = (GE_ms8("feature", 7));
	ge807ov12864 = (GE_ms8("convert", 7));
	ge807ov12866 = (GE_ms8("creation", 8));
	ge807ov12903 = (GE_ms8("redefine", 8));
	ge807ov12855 = (GE_ms8("all", 3));
	ge807ov12877 = (GE_ms8("export", 6));
	ge807ov12905 = (GE_ms8("rename", 6));
	ge1019ov29998 = (GE_ms8("gvscn1a", 7));
	ge1019ov29557 = (GE_ms8("file \'$8\' contains class $9 instead of the expected class $5.", 61));
	ge1031ov24336 = (GE_ms8("", 0));
}

void GE_init_const13()
{
	ge807ov12972 = (GE_ms8("BOOLEAN_REF", 11));
	ge807ov12978 = (GE_ms8("INTEGER_8_REF", 13));
	ge807ov12979 = (GE_ms8("INTEGER_16_REF", 14));
	ge807ov12981 = (GE_ms8("INTEGER_64_REF", 14));
	ge807ov12983 = (GE_ms8("NATURAL_8_REF", 13));
	ge807ov12984 = (GE_ms8("NATURAL_16_REF", 14));
	ge807ov12986 = (GE_ms8("NATURAL_64_REF", 14));
	ge807ov12987 = (GE_ms8("POINTER_REF", 11));
	ge807ov13034 = (GE_ms8("built_in", 8));
	ge807ov13035 = (GE_ms8("static built_in", 15));
	ge807ov13036 = (GE_ms8("built_in static", 15));
	ge807ov12495 = (GE_ms8("ARGUMENTS_32", 12));
	ge807ov12501 = (GE_ms8("COM_FAILURE", 11));
	ge807ov12506 = (GE_ms8("EXCEPTION_MANAGER_FACTORY", 25));
	ge807ov12508 = (GE_ms8("IDENTIFIED_ROUTINES", 19));
	ge807ov12514 = (GE_ms8("INTERNAL", 8));
	ge807ov12516 = (GE_ms8("ISE_RUNTIME", 11));
	ge807ov12519 = (GE_ms8("MEMORY", 6));
	ge807ov12527 = (GE_ms8("PLATFORM", 8));
	ge807ov12547 = (GE_ms8("aliased_resized_area", 20));
	ge807ov12549 = (GE_ms8("argument_count", 14));
	ge807ov12550 = (GE_ms8("as_integer_8", 12));
	ge807ov12551 = (GE_ms8("as_integer_16", 13));
	ge807ov12552 = (GE_ms8("as_integer_32", 13));
	ge807ov12553 = (GE_ms8("as_integer_64", 13));
	ge807ov12554 = (GE_ms8("as_natural_8", 12));
	ge807ov12555 = (GE_ms8("as_natural_16", 13));
	ge807ov12556 = (GE_ms8("as_natural_32", 13));
	ge807ov12557 = (GE_ms8("as_natural_64", 13));
	ge807ov12558 = (GE_ms8("attached_type", 13));
	ge807ov12559 = (GE_ms8("base_address", 12));
	ge807ov12560 = (GE_ms8("base_class_name", 15));
	ge807ov12561 = (GE_ms8("bit_and", 7));
	ge807ov12562 = (GE_ms8("bit_not", 7));
	ge807ov12563 = (GE_ms8("bit_or", 6));
	ge807ov12564 = (GE_ms8("bit_shift_left", 14));
	ge807ov12565 = (GE_ms8("bit_shift_right", 15));
	ge807ov12566 = (GE_ms8("bit_xor", 7));
	ge807ov12567 = (GE_ms8("boolean_bytes", 13));
	ge807ov12568 = (GE_ms8("boolean_field", 13));
	ge807ov12569 = (GE_ms8("boolean_field_at", 16));
	ge807ov12570 = (GE_ms8("boolean_item", 12));
	ge807ov12571 = (GE_ms8("c_strlen", 8));
	ge807ov12574 = (GE_ms8("catch", 5));
	ge807ov12575 = (GE_ms8("ccom_hresult", 12));
	ge807ov12576 = (GE_ms8("ccom_hresult_code", 17));
	ge807ov12577 = (GE_ms8("ccom_hresult_facility", 21));
	ge807ov12578 = (GE_ms8("ceiling_real_32", 15));
	ge807ov12579 = (GE_ms8("ceiling_real_64", 15));
	ge807ov12580 = (GE_ms8("character_8_field", 17));
	ge807ov12581 = (GE_ms8("character_8_field_at", 20));
	ge807ov12582 = (GE_ms8("character_8_item", 16));
	ge807ov12583 = (GE_ms8("character_32_field", 18));
	ge807ov12584 = (GE_ms8("character_32_field_at", 21));
	ge807ov12585 = (GE_ms8("character_32_item", 17));
	ge807ov12586 = (GE_ms8("character_bytes", 15));
	ge807ov12587 = (GE_ms8("character_size", 14));
	ge807ov12588 = (GE_ms8("check_assert", 12));
	ge807ov12590 = (GE_ms8("code", 4));
	ge807ov12591 = (GE_ms8("compiler_version", 16));
	ge807ov12592 = (GE_ms8("conforms_to", 11));
	ge807ov12593 = (GE_ms8("conjuncted", 10));
	ge807ov12594 = (GE_ms8("conjuncted_semistrict", 21));
	ge807ov12597 = (GE_ms8("cwin_error_text", 15));
	ge807ov12598 = (GE_ms8("cwin_local_free", 15));
	ge807ov12599 = (GE_ms8("deep_twin", 9));
	ge807ov12600 = (GE_ms8("default", 7));
	ge807ov12602 = (GE_ms8("detachable_type", 15));
	ge807ov12603 = (GE_ms8("developer_raise", 15));
	ge807ov12604 = (GE_ms8("disjuncted", 10));
	ge807ov12605 = (GE_ms8("disjuncted_exclusive", 20));
	ge807ov12606 = (GE_ms8("disjuncted_semistrict", 21));
	ge807ov12608 = (GE_ms8("double_bytes", 12));
	ge807ov12609 = (GE_ms8("dynamic_type", 12));
	ge807ov12610 = (GE_ms8("dynamic_type_at_offset", 22));
	ge807ov12611 = (GE_ms8("eif_gen_param_id", 16));
	ge807ov12612 = (GE_ms8("eif_id_object", 13));
	ge807ov12613 = (GE_ms8("eif_object_id", 13));
	ge807ov12614 = (GE_ms8("eif_object_id_free", 18));
	ge807ov12615 = (GE_ms8("element_size", 12));
	ge807ov12616 = (GE_ms8("exception_from_code", 19));
	ge807ov12617 = (GE_ms8("exception_manager", 17));
	ge807ov12618 = (GE_ms8("extend", 6));
	ge807ov12619 = (GE_ms8("field", 5));
	ge807ov12620 = (GE_ms8("field_count", 11));
	ge807ov12621 = (GE_ms8("field_count_of_type", 19));
	ge807ov12622 = (GE_ms8("field_name", 10));
	ge807ov12623 = (GE_ms8("field_name_of_type", 18));
	ge807ov12624 = (GE_ms8("field_offset_of_type", 20));
	ge807ov12625 = (GE_ms8("field_static_type", 17));
	ge807ov12626 = (GE_ms8("field_static_type_of_type", 25));
	ge807ov12627 = (GE_ms8("field_type", 10));
	ge807ov12628 = (GE_ms8("field_type_of_type", 18));
	ge807ov12629 = (GE_ms8("find_referers", 13));
	ge807ov12630 = (GE_ms8("floor_real_32", 13));
	ge807ov12631 = (GE_ms8("floor_real_64", 13));
	ge807ov12633 = (GE_ms8("free", 4));
	ge807ov12634 = (GE_ms8("generating_type", 15));
	ge807ov12635 = (GE_ms8("generating_type_of_type", 23));
	ge807ov12636 = (GE_ms8("generator", 9));
	ge807ov12637 = (GE_ms8("generator_of_type", 17));
}

void GE_init_const14()
{
	ge807ov12638 = (GE_ms8("generic_parameter_count", 23));
	ge807ov12639 = (GE_ms8("generic_parameter_type", 22));
	ge807ov12640 = (GE_ms8("has_default", 11));
	ge807ov12641 = (GE_ms8("hash_code", 9));
	ge807ov12642 = (GE_ms8("i_th_argument_pointer", 21));
	ge807ov12643 = (GE_ms8("i_th_argument_string", 20));
	ge807ov12644 = (GE_ms8("identity", 8));
	ge807ov12645 = (GE_ms8("ignore", 6));
	ge807ov12646 = (GE_ms8("implication", 11));
	ge807ov12647 = (GE_ms8("in_assertion", 12));
	ge807ov12649 = (GE_ms8("integer_8_field", 15));
	ge807ov12650 = (GE_ms8("integer_8_field_at", 18));
	ge807ov12651 = (GE_ms8("integer_8_item", 14));
	ge807ov12652 = (GE_ms8("integer_16_field", 16));
	ge807ov12653 = (GE_ms8("integer_16_field_at", 19));
	ge807ov12654 = (GE_ms8("integer_16_item", 15));
	ge807ov12655 = (GE_ms8("integer_32_field", 16));
	ge807ov12656 = (GE_ms8("integer_32_field_at", 19));
	ge807ov12657 = (GE_ms8("integer_32_item", 15));
	ge807ov12658 = (GE_ms8("integer_64_field", 16));
	ge807ov12659 = (GE_ms8("integer_64_field_at", 19));
	ge807ov12660 = (GE_ms8("integer_64_item", 15));
	ge807ov12661 = (GE_ms8("integer_bytes", 13));
	ge807ov12662 = (GE_ms8("integer_quotient", 16));
	ge807ov12663 = (GE_ms8("integer_remainder", 17));
	ge807ov12664 = (GE_ms8("is_attached_type", 16));
	ge807ov12665 = (GE_ms8("is_caught", 9));
	ge807ov12666 = (GE_ms8("is_copy_semantics_field", 23));
	ge807ov12667 = (GE_ms8("is_deep_equal", 13));
	ge807ov12668 = (GE_ms8("is_default_pointer", 18));
	ge807ov12669 = (GE_ms8("is_dotnet", 9));
	ge807ov12671 = (GE_ms8("is_expanded", 11));
	ge807ov12672 = (GE_ms8("is_field_expanded_of_type", 25));
	ge807ov12673 = (GE_ms8("is_field_transient_of_type", 26));
	ge807ov12674 = (GE_ms8("is_ignorable", 12));
	ge807ov12675 = (GE_ms8("is_ignored", 10));
	ge807ov12676 = (GE_ms8("is_less", 7));
	ge807ov12677 = (GE_ms8("is_mac", 6));
	ge807ov12678 = (GE_ms8("is_nan", 6));
	ge807ov12679 = (GE_ms8("is_negative_infinity", 20));
	ge807ov12680 = (GE_ms8("is_object_marked", 16));
	ge807ov12681 = (GE_ms8("is_positive_infinity", 20));
	ge807ov12682 = (GE_ms8("is_raisable", 11));
	ge807ov12683 = (GE_ms8("is_scoop_capable", 16));
	ge807ov12684 = (GE_ms8("is_special", 10));
	ge807ov12685 = (GE_ms8("is_special_copy_semantics_item", 30));
	ge807ov12686 = (GE_ms8("is_special_of_expanded", 22));
	ge807ov12687 = (GE_ms8("is_special_of_reference", 23));
	ge807ov12688 = (GE_ms8("is_special_of_reference_or_basic_type", 37));
	ge807ov12689 = (GE_ms8("is_special_of_reference_type", 28));
	ge807ov12691 = (GE_ms8("is_thread_capable", 17));
	ge807ov12692 = (GE_ms8("is_tuple", 8));
	ge807ov12693 = (GE_ms8("is_tuple_type", 13));
	ge807ov12694 = (GE_ms8("is_unix", 7));
	ge807ov12695 = (GE_ms8("is_vms", 6));
	ge807ov12696 = (GE_ms8("is_vxworks", 10));
	ge807ov12697 = (GE_ms8("is_windows", 10));
	ge807ov12699 = (GE_ms8("item_code", 9));
	ge807ov12700 = (GE_ms8("last_exception", 14));
	ge807ov12701 = (GE_ms8("last_result", 11));
	ge807ov12702 = (GE_ms8("lock_marking", 12));
	ge807ov12704 = (GE_ms8("make", 4));
	ge807ov12705 = (GE_ms8("make_empty", 10));
	ge807ov12706 = (GE_ms8("mark_object", 11));
	ge807ov12707 = (GE_ms8("max_type_id", 11));
	ge807ov12708 = (GE_ms8("minus", 5));
	ge807ov12709 = (GE_ms8("name", 4));
	ge807ov12710 = (GE_ms8("nan", 3));
	ge807ov12711 = (GE_ms8("natural_8_field", 15));
	ge807ov12712 = (GE_ms8("natural_8_field_at", 18));
	ge807ov12713 = (GE_ms8("natural_8_item", 14));
	ge807ov12714 = (GE_ms8("natural_16_field", 16));
	ge807ov12715 = (GE_ms8("natural_16_field_at", 19));
	ge807ov12716 = (GE_ms8("natural_16_item", 15));
	ge807ov12717 = (GE_ms8("natural_32_code", 15));
	ge807ov12718 = (GE_ms8("natural_32_field", 16));
	ge807ov12719 = (GE_ms8("natural_32_field_at", 19));
	ge807ov12720 = (GE_ms8("natural_32_item", 15));
	ge807ov12721 = (GE_ms8("natural_64_field", 16));
	ge807ov12722 = (GE_ms8("natural_64_field_at", 19));
	ge807ov12723 = (GE_ms8("natural_64_item", 15));
	ge807ov12724 = (GE_ms8("negated", 7));
	ge807ov12725 = (GE_ms8("negative_infinity", 17));
	ge807ov12727 = (GE_ms8("new_instance", 12));
	ge807ov12728 = (GE_ms8("new_instance_of", 15));
	ge807ov12729 = (GE_ms8("new_special_any_instance", 24));
	ge807ov12730 = (GE_ms8("new_special_of_reference_instance_of", 36));
	ge807ov12731 = (GE_ms8("new_tuple_instance_of", 21));
	ge807ov12732 = (GE_ms8("new_type_instance_of", 20));
	ge807ov12733 = (GE_ms8("object_comparison", 17));
	ge807ov12734 = (GE_ms8("object_size", 11));
	ge807ov12735 = (GE_ms8("once_objects", 12));
	ge807ov12736 = (GE_ms8("opposite", 8));
	ge807ov12737 = (GE_ms8("out", 3));
	ge807ov12738 = (GE_ms8("persistent_field_count_of_type", 30));
	ge807ov12739 = (GE_ms8("plus", 4));
	ge807ov12740 = (GE_ms8("pointer_bytes", 13));
	ge807ov12741 = (GE_ms8("pointer_field", 13));
	ge807ov12742 = (GE_ms8("pointer_field_at", 16));
	ge807ov12744 = (GE_ms8("positive_infinity", 17));
	ge807ov12745 = (GE_ms8("power", 5));
}

void GE_init_const15()
{
	ge807ov12746 = (GE_ms8("pre_ecma_mapping_status", 23));
	ge807ov12747 = (GE_ms8("product", 7));
	ge807ov12748 = (GE_ms8("put", 3));
	ge807ov12749 = (GE_ms8("put_boolean", 11));
	ge807ov12750 = (GE_ms8("put_character_8", 15));
	ge807ov12751 = (GE_ms8("put_character_32", 16));
	ge807ov12752 = (GE_ms8("put_integer_8", 13));
	ge807ov12753 = (GE_ms8("put_integer_16", 14));
	ge807ov12754 = (GE_ms8("put_integer_32", 14));
	ge807ov12755 = (GE_ms8("put_integer_64", 14));
	ge807ov12756 = (GE_ms8("put_natural_8", 13));
	ge807ov12757 = (GE_ms8("put_natural_16", 14));
	ge807ov12758 = (GE_ms8("put_natural_32", 14));
	ge807ov12759 = (GE_ms8("put_natural_64", 14));
	ge807ov12760 = (GE_ms8("put_pointer", 11));
	ge807ov12761 = (GE_ms8("put_real_32", 11));
	ge807ov12762 = (GE_ms8("put_real_64", 11));
	ge807ov12763 = (GE_ms8("put_reference", 13));
	ge807ov12764 = (GE_ms8("quotient", 8));
	ge807ov12765 = (GE_ms8("raise", 5));
	ge807ov12766 = (GE_ms8("raw_reference_field_at", 22));
	ge807ov12767 = (GE_ms8("raw_reference_field_at_offset", 29));
	ge807ov12768 = (GE_ms8("real_32_field", 13));
	ge807ov12769 = (GE_ms8("real_32_field_at", 16));
	ge807ov12770 = (GE_ms8("real_32_item", 12));
	ge807ov12771 = (GE_ms8("real_64_field", 13));
	ge807ov12772 = (GE_ms8("real_64_field_at", 16));
	ge807ov12773 = (GE_ms8("real_64_item", 12));
	ge807ov12774 = (GE_ms8("real_bytes", 10));
	ge807ov12775 = (GE_ms8("reference_field", 15));
	ge807ov12776 = (GE_ms8("reference_field_at", 18));
	ge807ov12777 = (GE_ms8("reference_field_at_offset", 25));
	ge807ov12778 = (GE_ms8("reference_item", 14));
	ge807ov12779 = (GE_ms8("runtime_name", 12));
	ge807ov12780 = (GE_ms8("same_type", 9));
	ge807ov12781 = (GE_ms8("set_boolean_field", 17));
	ge807ov12782 = (GE_ms8("set_boolean_field_at", 20));
	ge807ov12783 = (GE_ms8("set_character_8_field", 21));
	ge807ov12784 = (GE_ms8("set_character_8_field_at", 24));
	ge807ov12785 = (GE_ms8("set_character_32_field", 22));
	ge807ov12786 = (GE_ms8("set_character_32_field_at", 25));
	ge807ov12787 = (GE_ms8("set_count", 9));
	ge807ov12789 = (GE_ms8("set_integer_8_field", 19));
	ge807ov12790 = (GE_ms8("set_integer_8_field_at", 22));
	ge807ov12791 = (GE_ms8("set_integer_16_field", 20));
	ge807ov12792 = (GE_ms8("set_integer_16_field_at", 23));
	ge807ov12793 = (GE_ms8("set_integer_32_field", 20));
	ge807ov12794 = (GE_ms8("set_integer_32_field_at", 23));
	ge807ov12795 = (GE_ms8("set_integer_64_field", 20));
	ge807ov12796 = (GE_ms8("set_integer_64_field_at", 23));
	ge807ov12797 = (GE_ms8("set_is_ignored", 14));
	ge807ov12798 = (GE_ms8("set_item", 8));
	ge807ov12799 = (GE_ms8("set_natural_8_field", 19));
	ge807ov12800 = (GE_ms8("set_natural_8_field_at", 22));
	ge807ov12801 = (GE_ms8("set_natural_16_field", 20));
	ge807ov12802 = (GE_ms8("set_natural_16_field_at", 23));
	ge807ov12803 = (GE_ms8("set_natural_32_field", 20));
	ge807ov12804 = (GE_ms8("set_natural_32_field_at", 23));
	ge807ov12805 = (GE_ms8("set_natural_64_field", 20));
	ge807ov12806 = (GE_ms8("set_natural_64_field_at", 23));
	ge807ov12807 = (GE_ms8("set_object_comparison", 21));
	ge807ov12808 = (GE_ms8("set_operands", 12));
	ge807ov12809 = (GE_ms8("set_pointer_field", 17));
	ge807ov12810 = (GE_ms8("set_pointer_field_at", 20));
	ge807ov12811 = (GE_ms8("set_pre_ecma_mapping", 20));
	ge807ov12812 = (GE_ms8("set_real_32_field", 17));
	ge807ov12813 = (GE_ms8("set_real_32_field_at", 20));
	ge807ov12814 = (GE_ms8("set_real_64_field", 17));
	ge807ov12815 = (GE_ms8("set_real_64_field_at", 20));
	ge807ov12816 = (GE_ms8("set_reference_field", 19));
	ge807ov12817 = (GE_ms8("set_reference_field_at", 22));
	ge807ov12818 = (GE_ms8("standard_copy", 13));
	ge807ov12819 = (GE_ms8("standard_is_equal", 17));
	ge807ov12820 = (GE_ms8("standard_twin", 13));
	ge807ov12821 = (GE_ms8("storable_version_of_type", 24));
	ge807ov12822 = (GE_ms8("tagged_out", 10));
	ge807ov12823 = (GE_ms8("to_character", 12));
	ge807ov12824 = (GE_ms8("to_character_8", 14));
	ge807ov12825 = (GE_ms8("to_character_32", 15));
	ge807ov12826 = (GE_ms8("to_double", 9));
	ge807ov12827 = (GE_ms8("to_integer_32", 13));
	ge807ov12829 = (GE_ms8("to_real", 7));
	ge807ov12830 = (GE_ms8("to_real_32", 10));
	ge807ov12831 = (GE_ms8("to_real_64", 10));
	ge807ov12832 = (GE_ms8("truncated_to_integer", 20));
	ge807ov12833 = (GE_ms8("truncated_to_integer_64", 23));
	ge807ov12834 = (GE_ms8("truncated_to_real", 17));
	ge807ov12835 = (GE_ms8("twin", 4));
	ge807ov12836 = (GE_ms8("type_conforms_to", 16));
	ge807ov12837 = (GE_ms8("type_id", 7));
	ge807ov12838 = (GE_ms8("type_id_from_name", 17));
	ge807ov12839 = (GE_ms8("type_of_code", 12));
	ge807ov12840 = (GE_ms8("type_of_type", 12));
	ge807ov12841 = (GE_ms8("unlock_marking", 14));
	ge807ov12842 = (GE_ms8("unmark_object", 13));
	ge807ov12844 = (GE_ms8("wide_character_bytes", 20));
	ge807ov12846 = (GE_ms8("False", 5));
	ge807ov12847 = (GE_ms8("Precursor", 9));
	ge807ov12850 = (GE_ms8("Void", 4));
	ge807ov12851 = (GE_ms8("Unique", 6));
	ge807ov12859 = (GE_ms8("assign", 6));
}

void GE_init_const16()
{
	ge807ov12867 = (GE_ms8("current", 7));
	ge807ov12873 = (GE_ms8("elseif", 6));
	ge807ov12876 = (GE_ms8("expanded", 8));
	ge807ov12878 = (GE_ms8("external", 8));
	ge807ov12879 = (GE_ms8("false", 5));
	ge807ov12882 = (GE_ms8("frozen", 6));
	ge807ov12883 = (GE_ms8("if", 2));
	ge807ov12884 = (GE_ms8("implies", 7));
	ge807ov12885 = (GE_ms8("indexing", 8));
	ge807ov12888 = (GE_ms8("inspect", 7));
	ge807ov12894 = (GE_ms8("not", 3));
	ge807ov12895 = (GE_ms8("note", 4));
	ge807ov12896 = (GE_ms8("obsolete", 8));
	ge807ov12904 = (GE_ms8("reference", 9));
	ge807ov12908 = (GE_ms8("result", 6));
	ge807ov12909 = (GE_ms8("retry", 5));
	ge807ov12910 = (GE_ms8("select", 6));
	ge807ov12912 = (GE_ms8("some", 4));
	ge807ov12915 = (GE_ms8("true", 4));
	ge807ov12916 = (GE_ms8("undefine", 8));
	ge807ov12918 = (GE_ms8("until", 5));
	ge807ov12920 = (GE_ms8("void", 4));
	ge807ov12922 = (GE_ms8("xor", 3));
	ge807ov12936 = (GE_ms8("->", 2));
	ge807ov12937 = (GE_ms8(":=", 2));
	ge807ov12938 = (GE_ms8("\?=", 2));
	ge807ov12939 = (GE_ms8("@", 1));
	ge807ov12940 = (GE_ms8("!", 1));
	ge807ov12941 = (GE_ms8(":", 1));
	ge807ov12942 = (GE_ms8(",", 1));
	ge807ov12943 = (GE_ms8("//", 2));
	ge807ov12944 = (GE_ms8("/", 1));
	ge807ov12945 = (GE_ms8("$", 1));
	ge807ov12946 = (GE_ms8(".", 1));
	ge807ov12947 = (GE_ms8("..", 2));
	ge807ov12948 = (GE_ms8("=", 1));
	ge807ov12949 = (GE_ms8(">=", 2));
	ge807ov12950 = (GE_ms8(">", 1));
	ge807ov12951 = (GE_ms8("<=", 2));
	ge807ov12952 = (GE_ms8("<<", 2));
	ge807ov12953 = (GE_ms8("{", 1));
	ge807ov12954 = (GE_ms8("[", 1));
	ge807ov12955 = (GE_ms8("(", 1));
	ge807ov12956 = (GE_ms8("<", 1));
	ge807ov12957 = (GE_ms8("-", 1));
	ge807ov12958 = (GE_ms8("\\\\", 2));
	ge807ov12959 = (GE_ms8("/=", 2));
	ge807ov12961 = (GE_ms8("+", 1));
	ge807ov12962 = (GE_ms8("^", 1));
	ge807ov12963 = (GE_ms8("\?", 1));
	ge807ov12964 = (GE_ms8(">>", 2));
	ge807ov12965 = (GE_ms8("}", 1));
	ge807ov12966 = (GE_ms8("]", 1));
	ge807ov12967 = (GE_ms8(")", 1));
	ge807ov12968 = (GE_ms8(";", 1));
	ge807ov12969 = (GE_ms8("~", 1));
	ge807ov12970 = (GE_ms8("*", 1));
	ge228ov17291 = (GE_ms8("", 0));
	ge1031ov24364 = (GE_ms8("dummy", 5));
	ge1019ov29958 = (GE_ms8("vuex1a", 6));
	ge1019ov29695 = (GE_ms8("VUEX-1", 6));
	ge1019ov29517 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1019ov29875 = (GE_ms8("vkcn2c", 6));
	ge1019ov29649 = (GE_ms8("VKCN-2", 6));
	ge1019ov29434 = (GE_ms8("procedure `$8\' appears in a call expression.", 44));
	ge1019ov29956 = (GE_ms8("vuar2b", 6));
	ge1019ov29693 = (GE_ms8("VUAR-2", 6));
	ge1019ov29515 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge1019ov29955 = (GE_ms8("vuar2a", 6));
	ge1019ov29514 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge1019ov29766 = (GE_ms8("vdpr4b", 6));
	ge1019ov29599 = (GE_ms8("VDPR-4B", 7));
	ge1019ov29325 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$7\' in class $8.", 140));
	ge1019ov29953 = (GE_ms8("vuar1b", 6));
	ge1019ov29692 = (GE_ms8("VUAR-1", 6));
	ge1019ov29512 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge1019ov29952 = (GE_ms8("vuar1a", 6));
	ge1019ov29511 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge1019ov29765 = (GE_ms8("vdpr4a", 6));
	ge1019ov29598 = (GE_ms8("VDPR-4A", 7));
	ge1019ov29324 = (GE_ms8("the number of actual arguments in Precursor call is not the same as the number of formal arguments of feature `$7\' in class $8.", 127));
	ge1019ov29736 = (GE_ms8("vape0a", 6));
	ge1019ov29584 = (GE_ms8("VAPE", 4));
	ge1019ov29295 = (GE_ms8("feature `$8\' of class $5 appearing in the precondition of `$9\' is not exported to class $10 to which feature `$9\' is exported.", 126));
	ge1019ov29874 = (GE_ms8("vkcn2a", 6));
	ge1019ov29433 = (GE_ms8("procedure `$8\' of class $9 appears in a call expression.", 56));
	ge1019ov29872 = (GE_ms8("vkcn1a", 6));
	ge1019ov29648 = (GE_ms8("VKCN-1", 6));
	ge1019ov29431 = (GE_ms8("query `$8\' of class $9 appears in a call instruction.", 53));
	ge1019ov29737 = (GE_ms8("vape0b", 6));
	ge1019ov29296 = (GE_ms8("feature `$8\' of class $9 appearing in the precondition of `$10\' is not exported to class $11 to which feature `$10\' is exported.", 128));
	ge1019ov29960 = (GE_ms8("vuex2b", 6));
	ge1019ov29696 = (GE_ms8("VUEX-2", 6));
	ge1019ov29519 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge1019ov29971 = (GE_ms8("vuta2a", 6));
	ge1019ov29700 = (GE_ms8("VUTA-2", 6));
	ge1019ov29530 = (GE_ms8("the target (of type \'$9\') of the call to feature `$8\' is not attached.", 70));
	ge1019ov30011 = (GE_ms8("gvuao0c", 7));
	ge1019ov29727 = (GE_ms8("GVUAO", 5));
	ge1019ov29570 = (GE_ms8("`$7\' is an object-test local of in an invariant and hence cannot have actual arguments.", 87));
	ge1019ov30009 = (GE_ms8("gvuao0a", 7));
}

void GE_init_const17()
{
	ge1019ov29568 = (GE_ms8("`$7\' is an object-test local of feature `$8\' and hence cannot have actual arguments.", 84));
	ge1019ov30010 = (GE_ms8("gvuao0b", 7));
	ge1019ov29569 = (GE_ms8("`$7\' is an object-test local of an inline agent and hence cannot have actual arguments.", 87));
	ge1019ov30006 = (GE_ms8("gvuac0c", 7));
	ge1019ov29725 = (GE_ms8("GVUAC", 5));
	ge1019ov29565 = (GE_ms8("`$7\' is an across cursor of in an invariant and hence cannot have actual arguments.", 83));
	ge1019ov30004 = (GE_ms8("gvuac0a", 7));
	ge1019ov29563 = (GE_ms8("`$7\' is an across cursor of feature `$8\' and hence cannot have actual arguments.", 80));
	ge1019ov30005 = (GE_ms8("gvuac0b", 7));
	ge1019ov29564 = (GE_ms8("`$7\' is an across cursor of an inline agent and hence cannot have actual arguments.", 83));
	ge1019ov30007 = (GE_ms8("gvual0a", 7));
	ge1019ov29726 = (GE_ms8("GVUAL", 5));
	ge1019ov29566 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot have actual arguments.", 80));
	ge1019ov30008 = (GE_ms8("gvual0b", 7));
	ge1019ov29567 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot have actual arguments.", 83));
	ge1019ov30002 = (GE_ms8("gvuaa0a", 7));
	ge1019ov29724 = (GE_ms8("GVUAA", 5));
	ge1019ov29561 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot have actual arguments.", 81));
	ge1019ov30003 = (GE_ms8("gvuaa0b", 7));
	ge1019ov29562 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot have actual arguments.", 84));
	ge1019ov29873 = (GE_ms8("vkcn1c", 6));
	ge1019ov29432 = (GE_ms8("query `$8\' appears in a call instruction.", 41));
	ge1019ov30021 = (GE_ms8("gvuio0c", 7));
	ge1019ov29731 = (GE_ms8("GVUIO", 5));
	ge1019ov29580 = (GE_ms8("`$7\' is an object-test local of an invariant and hence cannot be an instruction.", 80));
	ge1019ov30019 = (GE_ms8("gvuio0a", 7));
	ge1019ov29578 = (GE_ms8("`$7\' is an object-test local of feature `$8\' and hence cannot be an instruction.", 80));
	ge1019ov30020 = (GE_ms8("gvuio0b", 7));
	ge1019ov29579 = (GE_ms8("`$7\' is an object-test local of an inline agent and hence cannot be an instruction.", 83));
	ge1019ov30016 = (GE_ms8("gvuic0c", 7));
	ge1019ov29729 = (GE_ms8("GVUIC", 5));
	ge1019ov29575 = (GE_ms8("`$7\' is an across cursor of an invariant and hence cannot be an instruction.", 76));
	ge1019ov30014 = (GE_ms8("gvuic0a", 7));
	ge1019ov29573 = (GE_ms8("`$7\' is an across cursor of feature `$8\' and hence cannot be an instruction.", 76));
	ge1019ov30015 = (GE_ms8("gvuic0b", 7));
	ge1019ov29574 = (GE_ms8("`$7\' is an across cursor of an inline agent and hence cannot be an instruction.", 79));
	ge1019ov30017 = (GE_ms8("gvuil0a", 7));
	ge1019ov29730 = (GE_ms8("GVUIL", 5));
	ge1019ov29576 = (GE_ms8("`$7\' is a local variable of feature `$8\' and hence cannot be an instruction.", 76));
	ge1019ov30018 = (GE_ms8("gvuil0b", 7));
	ge1019ov29577 = (GE_ms8("`$7\' is a local variable of an inline agent and hence cannot be an instruction.", 79));
	ge1019ov30012 = (GE_ms8("gvuia0a", 7));
	ge1019ov29728 = (GE_ms8("GVUIA", 5));
	ge1019ov29571 = (GE_ms8("`$7\' is a formal argument of feature `$8\' and hence cannot be an instruction.", 77));
	ge1019ov30013 = (GE_ms8("gvuia0b", 7));
	ge1019ov29572 = (GE_ms8("`$7\' is a formal argument of an inline agent and hence cannot be an instruction.", 80));
	ge1019ov29805 = (GE_ms8("veen9b", 6));
	ge1019ov29617 = (GE_ms8("VEEN-9", 6));
	ge1019ov29364 = (GE_ms8("`$7\' appearing in the invariant or one of its possibly nested inline agents, is an across cursor that is used outside of its scope.", 131));
	ge1019ov29804 = (GE_ms8("veen9a", 6));
	ge1019ov29363 = (GE_ms8("`$7\' appearing in feature `$8\' or one of its possibly nested inline agents, is an across cursor that is used outside of its scope.", 130));
	ge1019ov29803 = (GE_ms8("veen8b", 6));
	ge1019ov29616 = (GE_ms8("VEEN-8", 6));
	ge1019ov29362 = (GE_ms8("`$7\' appearing in the invariant or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 135));
	ge1019ov29802 = (GE_ms8("veen8a", 6));
	ge1019ov29361 = (GE_ms8("`$7\' appearing in feature `$8\' or one of its possibly nested inline agents, is an object-test local that is used outside of its scope.", 134));
	ge1019ov29806 = (GE_ms8("vevi0a", 6));
	ge1019ov29618 = (GE_ms8("VEVI", 4));
	ge1019ov29365 = (GE_ms8("local entity `$7\' declared as attached is used before being initialized.", 72));
	ge1019ov29797 = (GE_ms8("veen2c", 6));
	ge1019ov29615 = (GE_ms8("VEEN-2", 6));
	ge1019ov29356 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of feature `$8\'.", 79));
	ge1019ov29799 = (GE_ms8("veen2e", 6));
	ge1019ov29358 = (GE_ms8("local entity `$7\' appears in the precondition or postcondition of an inline agent.", 82));
	ge1019ov29959 = (GE_ms8("vuex2a", 6));
	ge1019ov29518 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge1019ov29954 = (GE_ms8("vuar1c", 6));
	ge1019ov29513 = (GE_ms8("call to Tuple label `$7\' cannot have arguments.", 47));
	ge1019ov29972 = (GE_ms8("vuta2b", 6));
	ge1019ov29531 = (GE_ms8("the target (of type \'$8\') of the call to Tuple label `$7\' is not attached.", 74));
	ge1019ov29807 = (GE_ms8("vevi0b", 6));
	ge1019ov29366 = (GE_ms8("entity \'Result\' declared as attached is used before being initialized.", 70));
	ge1019ov29795 = (GE_ms8("veen2a", 6));
	ge1019ov29354 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of a procedure `$7\'.", 88));
	ge1019ov29801 = (GE_ms8("veen2g", 6));
	ge1019ov29360 = (GE_ms8("entity \'Result\' appears in the body, postcondition or rescue clause of an inline agent whose associated feature is a procedure.", 127));
	ge1019ov29798 = (GE_ms8("veen2d", 6));
	ge1019ov29357 = (GE_ms8("entity \'Result\' appears in the invariant of the class.", 54));
	ge1019ov29796 = (GE_ms8("veen2b", 6));
	ge1019ov29355 = (GE_ms8("entity \'Result\' appears in the precondition of feature `$7\'.", 60));
	ge1019ov29944 = (GE_ms8("vtcg4a", 6));
	ge1019ov29687 = (GE_ms8("VTCG-4", 6));
	ge1019ov29503 = (GE_ms8("base class $9 of the $7-th actual generic parameter of $10 does not make feature `$8\' available as creation procedure to class $10.", 131));
	ge1019ov29945 = (GE_ms8("vtcg4b", 6));
	ge1019ov29504 = (GE_ms8("the $7-th actual generic parameter of $10, which is the $9-th formal generic parameter of class $5, does not list feature `$8\' as creation procedure in its generic constraint.", 175));
	ge1019ov29932 = (GE_ms8("vrle1a", 6));
	ge1019ov29680 = (GE_ms8("VRLE-1", 6));
	ge1019ov29491 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the final name of a feature.", 77));
	ge1019ov29933 = (GE_ms8("vrle2a", 6));
	ge1019ov29681 = (GE_ms8("VRLE-2", 6));
	ge1019ov29492 = (GE_ms8("local variable name \'$7\' in feature `$8\' is also the name of a formal argument of this feature.", 95));
	ge1019ov29929 = (GE_ms8("vreg0b", 6));
	ge1019ov29488 = (GE_ms8("local variable name \'$7\' appear twice in feature `$8\'.", 54));
	ge1019ov29967 = (GE_ms8("vuot3a", 6));
	ge1019ov29698 = (GE_ms8("VUOT-3", 6));
	ge1019ov29526 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the same feature `$7\' or in the same inline agent.", 143));
	ge1020ov8575 = (GE_ms8("GE_current_context", 18));
	ge1020ov8797 = (GE_ms8("unsigned", 8));
	ge1020ov8777 = (GE_ms8("object", 6));
	ge1020ov8687 = (GE_ms8("GE_rescue", 9));
	ge1020ov8795 = (GE_ms8("uint32_t", 8));
}

void GE_init_const18()
{
	ge1020ov8791 = (GE_ms8("tr", 2));
	ge1020ov8761 = (GE_ms8("in_rescue", 9));
	ge1020ov8689 = (GE_ms8("GE_setjmp", 9));
	ge1020ov8587 = (GE_ms8("GE_EX_FAIL", 10));
	ge1020ov8688 = (GE_ms8("GE_retry", 8));
	ge1020ov8783 = (GE_ms8("previous", 8));
	ge1020ov8770 = (GE_ms8("last_rescue", 11));
	ge1020ov8799 = (GE_ms8("volatile", 8));
	ge1019ov29966 = (GE_ms8("vuot1f", 6));
	ge1019ov29697 = (GE_ms8("VUOT-1", 6));
	ge1019ov29525 = (GE_ms8("the scope of object-test with local name \'$6\' overlaps with the scope of another object-test with the same local name.", 118));
	ge1019ov29970 = (GE_ms8("vuot4b", 6));
	ge1019ov29699 = (GE_ms8("VUOT-4", 6));
	ge1019ov29529 = (GE_ms8("ISE does not support object-tests in check instructions.", 56));
	ge1019ov29969 = (GE_ms8("vuot4a", 6));
	ge1019ov29528 = (GE_ms8("ISE does not support object-tests in preconditions.", 51));
	ge1019ov29965 = (GE_ms8("vuot1e", 6));
	ge1019ov29524 = (GE_ms8("object-test with local name \'$6\' appears in the scope of an across cursor with the same name.", 93));
	ge1019ov29964 = (GE_ms8("vuot1d", 6));
	ge1019ov29523 = (GE_ms8("object-test with local name \'$6\' appears in the scope of another object-test local with the same name.", 102));
	ge1019ov29963 = (GE_ms8("vuot1c", 6));
	ge1019ov29522 = (GE_ms8("object-test local name \'$6\' is also the name of a local variable of an enclosing feature or inline agent.", 105));
	ge1019ov29962 = (GE_ms8("vuot1b", 6));
	ge1019ov29521 = (GE_ms8("object-test local name \'$6\' is also the name of a formal argument of an enclosing feature or inline agent.", 106));
	ge1019ov29961 = (GE_ms8("vuot1a", 6));
	ge1019ov29520 = (GE_ms8("object-test local name \'$6\' is also the final name of a feature.", 64));
	ge1019ov29981 = (GE_ms8("vwmq0d", 6));
	ge1019ov29705 = (GE_ms8("VWMQ", 4));
	ge1019ov29540 = (GE_ms8("type \'$7\' in the string constant is not one of the sized variants of STRING.", 76));
	ge1019ov29738 = (GE_ms8("vave0a", 6));
	ge1019ov29585 = (GE_ms8("VAVE", 4));
	ge1019ov29297 = (GE_ms8("loop variant expression of non-INTEGER type \'$7\'.", 49));
	ge1019ov29894 = (GE_ms8("voit2e", 6));
	ge1019ov29660 = (GE_ms8("VOIT-2", 6));
	ge1019ov29453 = (GE_ms8("across with cursor name \'$6\' appears in the scope of another across cursor with the same name.", 94));
	ge1019ov29893 = (GE_ms8("voit2d", 6));
	ge1019ov29452 = (GE_ms8("across with cursor name \'$6\' appears in the scope of an object-test local with the same name.", 93));
	ge1019ov29892 = (GE_ms8("voit2c", 6));
	ge1019ov29451 = (GE_ms8("across cursor name \'$6\' is also the name of a local variable of an enclosing feature or inline agent.", 101));
	ge1019ov29891 = (GE_ms8("voit2b", 6));
	ge1019ov29450 = (GE_ms8("across cursor name \'$6\' is also the name of a formal argument of an enclosing feature or inline agent.", 102));
	ge1019ov29890 = (GE_ms8("voit2a", 6));
	ge1019ov29449 = (GE_ms8("across cursor name \'$6\' is also the final name of a feature.", 60));
	ge1019ov29889 = (GE_ms8("voit1a", 6));
	ge1019ov29659 = (GE_ms8("VOIT-1", 6));
	ge1019ov29448 = (GE_ms8("the type \'$7\' of the across iterable expression does not conform to any generic derivation of ITERABLE.", 103));
	ge1020ov8800 = (GE_ms8("while", 5));
	ge1019ov29899 = (GE_ms8("vpca1b", 6));
	ge1019ov29663 = (GE_ms8("VPCA-1", 6));
	ge1019ov29458 = (GE_ms8("`$7\' is not the final name of a feature in class $8.", 52));
	ge1019ov29906 = (GE_ms8("vpca5b", 6));
	ge1019ov29667 = (GE_ms8("VPCA-5", 6));
	ge1019ov29465 = (GE_ms8("the type \'$10\' specified for the $9-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 155));
	ge1019ov29905 = (GE_ms8("vpca5a", 6));
	ge1019ov29464 = (GE_ms8("the type \'$11\' specified for the $10-th actual argument of Call_agent does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 168));
	ge1019ov29904 = (GE_ms8("vpca4b", 6));
	ge1019ov29666 = (GE_ms8("VPCA-4", 6));
	ge1019ov29463 = (GE_ms8("the $9-th actual argument (of type \'$10\') does not conform to the corresponding formal argument (of type \'$11\') of feature `$8\'.", 128));
	ge1019ov29903 = (GE_ms8("vpca4a", 6));
	ge1019ov29462 = (GE_ms8("the $10-th actual argument (of type \'$11\') does not conform to the corresponding formal argument (of type \'$12\') of feature `$8\' in class $9.", 141));
	ge1019ov29902 = (GE_ms8("vpca3b", 6));
	ge1019ov29665 = (GE_ms8("VPCA-3", 6));
	ge1019ov29461 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\'.", 97));
	ge1019ov29901 = (GE_ms8("vpca3a", 6));
	ge1019ov29460 = (GE_ms8("the number of actual arguments is not the same as the number of formal arguments of feature `$8\' in class $9.", 109));
	ge1019ov29900 = (GE_ms8("vpca2a", 6));
	ge1019ov29664 = (GE_ms8("VPCA-2", 6));
	ge1019ov29459 = (GE_ms8("feature `$8\' of class $9 is not exported to class $5.", 53));
	ge1019ov29898 = (GE_ms8("vpca1a", 6));
	ge1019ov29457 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1020ov8764 = (GE_ms8("int", 3));
	ge1019ov29984 = (GE_ms8("vwst2a", 6));
	ge1019ov29707 = (GE_ms8("VWST-2", 6));
	ge1019ov29543 = (GE_ms8("feature name `$7\' appears twice in strip expression.", 52));
	ge1019ov29982 = (GE_ms8("vwst1a", 6));
	ge1019ov29706 = (GE_ms8("VWST-1", 6));
	ge1019ov29541 = (GE_ms8("feature name `$7\' is not the final name of a feature in class $5.", 65));
	ge1019ov29980 = (GE_ms8("vwmq0c", 6));
	ge1019ov29539 = (GE_ms8("type \'$7\' in the character constant is not one of the sized variants of CHARACTER.", 82));
	ge1020ov8638 = (GE_ms8("GE_nat32", 8));
	ge1019ov30022 = (GE_ms8("gvwmc2a", 7));
	ge1019ov29732 = (GE_ms8("GVWMC-2", 7));
	ge1019ov29581 = (GE_ms8("integer constant \'$7\' is not representable as an instance of \'$8\'.", 66));
	ge1019ov29978 = (GE_ms8("vwmq0a", 6));
	ge1019ov29537 = (GE_ms8("type \'$7\' in the integer constant is not one of the sized variants of INTEGER.", 78));
	ge1020ov8604 = (GE_ms8("GE_int8", 7));
	ge1020ov8605 = (GE_ms8("GE_int16", 8));
	ge1020ov8606 = (GE_ms8("GE_int32", 8));
	ge1020ov8607 = (GE_ms8("GE_int64", 8));
	ge1020ov8636 = (GE_ms8("GE_nat8", 7));
	ge1020ov8637 = (GE_ms8("GE_nat16", 8));
	ge1020ov8639 = (GE_ms8("GE_nat64", 8));
	ge1019ov29979 = (GE_ms8("vwmq0b", 6));
	ge1019ov29538 = (GE_ms8("type \'$7\' in the real constant is not one of the sized variants of REAL.", 72));
	ge1019ov29808 = (GE_ms8("vevi0c", 6));
	ge1019ov29367 = (GE_ms8("entity \'Result\' declared as attached is not initialized at the end of the body of function `$7\'.", 96));
	ge1019ov29974 = (GE_ms8("vvok2a", 6));
	ge1019ov29702 = (GE_ms8("VVOK-2", 6));
	ge1019ov29533 = (GE_ms8("once key \"$6\" is not supported. The supported once keys are \"THREAD\", \"PROCESS\" and \"OBJECT\".", 93));
	ge801ov39794 = (GE_ms8("PROCESS", 7));
	ge801ov39793 = (GE_ms8("THREAD", 6));
}

void GE_init_const19()
{
	ge1019ov29973 = (GE_ms8("vvok1a", 6));
	ge1019ov29701 = (GE_ms8("VVOK-1", 6));
	ge1019ov29532 = (GE_ms8("once keys \"$6\" and \"$7\" cannot be combined.", 43));
	ge801ov39795 = (GE_ms8("OBJECT", 6));
	ge1019ov29991 = (GE_ms8("gvkbu1a", 7));
	ge1019ov29715 = (GE_ms8("GVKBU-1", 7));
	ge1019ov29550 = (GE_ms8("unknown built-in routine `$7\' in class $5.", 42));
	ge1019ov29990 = (GE_ms8("gvkbs0a", 7));
	ge1019ov29714 = (GE_ms8("GVKBS", 5));
	ge1019ov29549 = (GE_ms8("built-in routine `$7\' in class $5 has not the expected signature \'$8\'.", 70));
	ge807ov12900 = (GE_ms8("or else", 7));
	ge807ov12857 = (GE_ms8("and then", 8));
	ge1020ov8589 = (GE_ms8("GE_EX_PROG", 10));
	ge1020ov8526 = (GE_ms8("EIF_TEST", 8));
	ge1020ov8514 = (GE_ms8("EIF_NATIVE_CHAR", 15));
	ge1020ov8782 = (GE_ms8("pre_ecma_mapping_status", 23));
	ge1020ov8539 = (GE_ms8("exception_manager", 17));
	ge1020ov8760 = (GE_ms8("in_assertion", 12));
	ge1019ov29942 = (GE_ms8("vtat2b", 6));
	ge1019ov29501 = (GE_ms8("invalid type \'$7\' when part of a qualified anchored type: the type of anchor `$8\' must not depend (possibly recursively) on a qualified anchored type.", 150));
	ge1019ov29938 = (GE_ms8("vtat1a", 6));
	ge1019ov29684 = (GE_ms8("VTAT-1", 6));
	ge1019ov29497 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query.", 69));
	ge1019ov29939 = (GE_ms8("vtat1b", 6));
	ge1019ov29498 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query, or an argument of routine `$9\'.", 101));
	ge1019ov29746 = (GE_ms8("vcfg3a", 6));
	ge1019ov29305 = (GE_ms8("invalid type \'$7\' in constraint of formal generic parameter.", 60));
	ge1019ov29859 = (GE_ms8("vhpr3a", 6));
	ge1019ov29640 = (GE_ms8("VHPR-3", 6));
	ge1019ov29418 = (GE_ms8("invalid type \'$7\' in parent clause.", 35));
	ge1019ov29940 = (GE_ms8("vtat1c", 6));
	ge1019ov29499 = (GE_ms8("invalid type \'$7\': the anchor `$8\' must be the final name of a query in class $9.", 81));
	ge1019ov29761 = (GE_ms8("vdpr3b", 6));
	ge1019ov29597 = (GE_ms8("VDPR-3", 6));
	ge1019ov29320 = (GE_ms8("feature `$7\' is not the redefinition of an effective feature.", 61));
	ge1019ov29760 = (GE_ms8("vdpr3a", 6));
	ge1019ov29319 = (GE_ms8("conflict in Precursor construct between effective features `$7\' inherited from \'$8\' and `$9\' inherited from \'$10\'.", 114));
	ge1019ov29759 = (GE_ms8("vdpr2a", 6));
	ge1019ov29596 = (GE_ms8("VDPR-2", 6));
	ge1019ov29318 = (GE_ms8("class $7 in Precursor construct is not a parent of class $6.", 60));
	ge1019ov29763 = (GE_ms8("vdpr3d", 6));
	ge1019ov29322 = (GE_ms8("feature `$7\' is not the redeclaration of a feature.", 51));
	ge1019ov29764 = (GE_ms8("vdpr3e", 6));
	ge1019ov29323 = (GE_ms8("the associated feature of inline agents cannot be redefined.", 60));
	ge1019ov29758 = (GE_ms8("vdpr1b", 6));
	ge1019ov29595 = (GE_ms8("VDPR-1", 6));
	ge1019ov29317 = (GE_ms8("Precursor expression does not appear in a Routine_body.", 55));
	ge1019ov29957 = (GE_ms8("vuar4a", 6));
	ge1019ov29694 = (GE_ms8("VUAR-4", 6));
	ge1019ov29516 = (GE_ms8("`$7\' is not the final name of a feature in class $5.", 52));
	ge1020ov8769 = (GE_ms8("is_special", 10));
	ge1019ov29735 = (GE_ms8("vaol1a", 6));
	ge1019ov29583 = (GE_ms8("VAOL-1", 6));
	ge1019ov29294 = (GE_ms8("old expression does not appear in a postcondition.", 50));
	ge1019ov29809 = (GE_ms8("vevi0d", 6));
	ge1019ov29368 = (GE_ms8("entity \'Result\' declared as attached is not initialized at the end of the body of inline agent.", 95));
	ge1019ov29914 = (GE_ms8("vpir1h", 6));
	ge1019ov29668 = (GE_ms8("VPIR-1", 6));
	ge1019ov29473 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of an across cursor of an enclosing feature or inline agent whose scope contains the inline agent.", 156));
	ge1019ov29912 = (GE_ms8("vpir1f", 6));
	ge1019ov29471 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 160));
	ge1019ov29910 = (GE_ms8("vpir1d", 6));
	ge1019ov29469 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 118));
	ge1019ov29909 = (GE_ms8("vpir1c", 6));
	ge1019ov29468 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 119));
	ge1019ov29935 = (GE_ms8("vrlv1b", 6));
	ge1019ov29682 = (GE_ms8("VRLV-1", 6));
	ge1019ov29494 = (GE_ms8("local variable name \'$7\' in inline agent is also the final name of a feature.", 77));
	ge1019ov29937 = (GE_ms8("vrlv2b", 6));
	ge1019ov29683 = (GE_ms8("VRLV-2", 6));
	ge1019ov29496 = (GE_ms8("local variable name \'$7\' in inline agent is also the name of a formal argument of this agent.", 93));
	ge1019ov29927 = (GE_ms8("vred0d", 6));
	ge1019ov29677 = (GE_ms8("VRED", 4));
	ge1019ov29486 = (GE_ms8("local variable name \'$7\' appear twice in inline agent.", 54));
	ge1019ov29968 = (GE_ms8("vuot3b", 6));
	ge1019ov29527 = (GE_ms8("object-test with local name \'$6\' has the same name as another object-test local appearing in the invariant or in the same inline agent.", 135));
	ge1019ov29913 = (GE_ms8("vpir1g", 6));
	ge1019ov29472 = (GE_ms8("argument name \'$7\' in inline agent is also the name of an across cursor of an enclosing feature or inline agent whose scope contains the inline agent.", 150));
	ge1019ov29911 = (GE_ms8("vpir1e", 6));
	ge1019ov29470 = (GE_ms8("argument name \'$7\' in inline agent is also the name of an object-test local of an enclosing feature or inline agent whose scope contains the inline agent.", 154));
	ge1019ov29908 = (GE_ms8("vpir1b", 6));
	ge1019ov29467 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a local variable of an enclosing feature or inline agent.", 112));
	ge1019ov29907 = (GE_ms8("vpir1a", 6));
	ge1019ov29466 = (GE_ms8("argument name \'$7\' in inline agent is also the name of a formal argument of an enclosing feature or inline agent.", 113));
	ge1019ov29931 = (GE_ms8("vrfa0b", 6));
	ge1019ov29490 = (GE_ms8("argument name \'$7\' in inline agent is also the final name of a feature.", 71));
	ge1019ov29926 = (GE_ms8("vred0c", 6));
	ge1019ov29485 = (GE_ms8("argument name \'$7\' appear twice in inline agent.", 48));
	ge1019ov29915 = (GE_ms8("vpir3a", 6));
	ge1019ov29669 = (GE_ms8("VPIR-3", 6));
	ge1019ov29474 = (GE_ms8("inline agents cannot be of the once form.", 41));
	ge1019ov29916 = (GE_ms8("vpir3b", 6));
	ge1019ov29475 = (GE_ms8("inline agents cannot be of the external form.", 45));
	ge1019ov29947 = (GE_ms8("vtct0b", 6));
	ge1019ov29506 = (GE_ms8("type based on unknown class $7.", 31));
	ge1019ov29750 = (GE_ms8("vcfg3f", 6));
	ge1019ov29309 = (GE_ms8("constraint of formal generic parameter \'$7\' contains \'$8\' itself.", 65));
	ge1019ov29748 = (GE_ms8("vcfg3c", 6));
	ge1019ov29307 = (GE_ms8("constraint of formal generic parameter \'$7\' is another formal generic parameter \'$8\'.", 85));
	ge1019ov29747 = (GE_ms8("vcfg3b", 6));
	ge1019ov29306 = (GE_ms8("constraint of formal generic parameter \'$7\' is \'$8\' itself.", 59));
}

void GE_init_const20()
{
	ge1019ov29943 = (GE_ms8("vtcg3a", 6));
	ge1019ov29686 = (GE_ms8("VTCG-3", 6));
	ge1019ov29502 = (GE_ms8("actual generic parameter \'$7\' in type \'$9\' does not conform to constraint \'$8\'.", 79));
	ge1019ov30000 = (GE_ms8("gvtcg5a", 7));
	ge1019ov29723 = (GE_ms8("GVTCG-5", 7));
	ge1019ov29559 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not a reference type but the corresponding formal parameter is marked as reference.", 129));
	ge1019ov30001 = (GE_ms8("gvtcg5b", 7));
	ge1019ov29560 = (GE_ms8("actual generic parameter \'$7\' in type \'$8\' is not expanded type but the corresponding formal parameter is marked as expanded.", 125));
	ge1019ov29951 = (GE_ms8("vtug2a", 6));
	ge1019ov29691 = (GE_ms8("VTUG-2", 6));
	ge1019ov29510 = (GE_ms8("type \'$7\' has wrong number of actual generic parameters.", 56));
	ge1019ov29950 = (GE_ms8("vtug1a", 6));
	ge1019ov29690 = (GE_ms8("VTUG-1", 6));
	ge1019ov29509 = (GE_ms8("type \'$7\' has actual generic parameters but class $8 is not generic.", 68));
	ge1019ov29987 = (GE_ms8("gvhpr5a", 7));
	ge1019ov29711 = (GE_ms8("GVHPR-5", 7));
	ge1019ov29546 = (GE_ms8("cannot inherit from Tuple_type \'$7\'.", 36));
	ge1019ov29977 = (GE_ms8("vweq0b", 6));
	ge1019ov29704 = (GE_ms8("VWEQ", 4));
	ge1019ov29536 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms or converts to the other.", 88));
	ge1019ov29976 = (GE_ms8("vweq0a", 6));
	ge1019ov29535 = (GE_ms8("none of the operands of \'$7\' (of types \'$8\' and \'$9\') conforms or converts to the other.", 88));
	ge1019ov29845 = (GE_ms8("vgcc6c", 6));
	ge1019ov29404 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge1019ov29848 = (GE_ms8("vgcc8a", 6));
	ge1019ov29635 = (GE_ms8("VGCC-8", 6));
	ge1019ov29407 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge1019ov29838 = (GE_ms8("vgcc1a", 6));
	ge1019ov29631 = (GE_ms8("VGCC-1", 6));
	ge1019ov29397 = (GE_ms8("creation expression with no Creation_call part, but $7 is deferred.", 67));
	ge1019ov29841 = (GE_ms8("vgcc5a", 6));
	ge1019ov29633 = (GE_ms8("VGCC-5", 6));
	ge1019ov29400 = (GE_ms8("creation expression with no Creation_call part, but $7 has a Creators part.", 75));
	ge1019ov29844 = (GE_ms8("vgcc6b", 6));
	ge1019ov29403 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge1019ov29810 = (GE_ms8("vevi0e", 6));
	ge1019ov29369 = (GE_ms8("entity \'Result\' declared as attached is not initialized at the end of the body of attribute `$7\'.", 97));
	ge1019ov29922 = (GE_ms8("vqmc5a", 6));
	ge1019ov29674 = (GE_ms8("VQMC-5", 6));
	ge1019ov29481 = (GE_ms8("string constant attribute `$7\' is not declared of type STRING.", 62));
	ge1019ov29921 = (GE_ms8("vqmc4a", 6));
	ge1019ov29673 = (GE_ms8("VQMC-4", 6));
	ge1019ov29480 = (GE_ms8("real constant attribute `$7\' is not declared of type REAL or DOUBLE.", 68));
	ge1019ov29919 = (GE_ms8("vqmc3a", 6));
	ge1019ov29672 = (GE_ms8("VQMC-3", 6));
	ge1019ov29478 = (GE_ms8("integer constant attribute `$7\' is not declared of type INTEGER.", 64));
	ge1019ov29920 = (GE_ms8("vqmc3b", 6));
	ge1019ov29479 = (GE_ms8("integer value \'$9\' in constant attribute `$7\' is not representable as an instance of \'$8\'.", 90));
	ge1019ov29918 = (GE_ms8("vqmc2a", 6));
	ge1019ov29671 = (GE_ms8("VQMC-2", 6));
	ge1019ov29477 = (GE_ms8("character constant attribute `$7\' is not declared of type CHARACTER.", 68));
	ge1019ov29917 = (GE_ms8("vqmc1a", 6));
	ge1019ov29670 = (GE_ms8("VQMC-1", 6));
	ge1019ov29476 = (GE_ms8("boolean constant attribute `$7\' is not declared of type BOOLEAN.", 64));
	ge1019ov29923 = (GE_ms8("vqui0a", 6));
	ge1019ov29676 = (GE_ms8("VQUI", 4));
	ge1019ov29482 = (GE_ms8("unique attribute `$7\' is not declared of type INTEGER.", 54));
	ge66ov39492 = (GE_ms8("standard input", 14));
	ge1008ov38986 = (GE_ms8("gcaaa", 5));
	ge1008ov38981 = (GE_ms8("GCAAA", 5));
	ge1008ov38976 = (GE_ms8("[$1] cluster $2: cannot read cluster directory \'$3\'.", 52));
	ge1019ov29985 = (GE_ms8("vxrt0a", 6));
	ge1019ov29708 = (GE_ms8("VXRT", 4));
	ge1019ov29544 = (GE_ms8("Retry instruction does not appear in a Rescue clause.", 53));
	ge1020ov8538 = (GE_ms8("exception_code", 14));
	ge1020ov8540 = (GE_ms8("exception_tag", 13));
	ge1020ov8755 = (GE_ms8("goto", 4));
	ge1020ov8586 = (GE_ms8("GE_EX_CHECK", 11));
	ge1019ov29896 = (GE_ms8("vomb2a", 6));
	ge1019ov29662 = (GE_ms8("VOMB-2", 6));
	ge1019ov29455 = (GE_ms8("inspect constant of type \'$7\' different from type \'$8\' of inspect expression.", 77));
	ge1019ov29897 = (GE_ms8("vomb2b", 6));
	ge1019ov29456 = (GE_ms8("inspect choice `$7\' is not a constant attribute.", 48));
	ge1019ov29895 = (GE_ms8("vomb1a", 6));
	ge1019ov29661 = (GE_ms8("VOMB-1", 6));
	ge1019ov29454 = (GE_ms8("inspect expression of type \'$7\' different from INTEGER or CHARACTER.", 68));
	ge1020ov8590 = (GE_ms8("GE_EX_WHEN", 10));
	ge1019ov29739 = (GE_ms8("vbac1a", 6));
	ge1019ov29586 = (GE_ms8("VBAC-1", 6));
	ge1019ov29298 = (GE_ms8("the source of the assigner call (of type \'$7\') does not conform nor convert to its target (of type \'$8\').", 105));
	ge1019ov29740 = (GE_ms8("vbac2a", 6));
	ge1019ov29587 = (GE_ms8("VBAC-2", 6));
	ge1019ov29299 = (GE_ms8("query `$7\' in class $8 has no assigner command.", 47));
	ge1019ov29867 = (GE_ms8("vjar0a", 6));
	ge1019ov29645 = (GE_ms8("VJAR", 4));
	ge1019ov29426 = (GE_ms8("the source of the assignment (of type \'$7\') does not conform nor convert to its target entity (of type \'$8\').", 109));
	ge1019ov29793 = (GE_ms8("veen0a", 6));
	ge1019ov29614 = (GE_ms8("VEEN", 4));
	ge1019ov29352 = (GE_ms8("`$7\' appears in feature `$8\', but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of feature `$8\'.", 152));
	ge1019ov29794 = (GE_ms8("veen0b", 6));
	ge1019ov29353 = (GE_ms8("`$7\' appears in an inline agent, but it is not the final name of a feature in class $6 nor the name of a local variable or formal argument of this inline agent.", 160));
	ge1019ov29869 = (GE_ms8("vjaw0b", 6));
	ge1019ov29646 = (GE_ms8("VJAW", 4));
	ge1019ov29428 = (GE_ms8("`$7\' is the name of a formal argument of feature `$8\'. A Writable is either a local variable (including Result) or an attribute.", 128));
	ge1019ov29870 = (GE_ms8("vjaw0c", 6));
	ge1019ov29429 = (GE_ms8("`$7\' is the name of a formal argument of an inline agent. A Writable is either a local variable (including Result) or an attribute.", 131));
	ge1019ov29868 = (GE_ms8("vjaw0a", 6));
	ge1019ov29427 = (GE_ms8("feature `$7\' is not an attribute. A Writable is either a local variable (including Result) or an attribute.", 107));
	ge1019ov29871 = (GE_ms8("vjrv0a", 6));
	ge1019ov29647 = (GE_ms8("VJRV", 4));
	ge1019ov29430 = (GE_ms8("the type \'$7\' of the target entity of the assignment attempt is not a reference type.", 85));
}

void GE_init_const21()
{
	ge1019ov29847 = (GE_ms8("vgcc6e", 6));
	ge1019ov29406 = (GE_ms8("procedure `$8\' of class $9 is not exported for creation to class $5.", 68));
	ge1019ov29849 = (GE_ms8("vgcc8b", 6));
	ge1019ov29408 = (GE_ms8("procedure `$8\' of class $9 is not listed as creation procedure of the $10-th formal generic parameter of class $5.", 114));
	ge1019ov29839 = (GE_ms8("vgcc1b", 6));
	ge1019ov29398 = (GE_ms8("creation instruction with no Creation_call part, but $7 is deferred.", 68));
	ge1019ov29842 = (GE_ms8("vgcc5b", 6));
	ge1019ov29401 = (GE_ms8("creation instruction with no Creation_call part, but $7 has a Creators part.", 76));
	ge1019ov29840 = (GE_ms8("vgcc3a", 6));
	ge1019ov29632 = (GE_ms8("VGCC-3", 6));
	ge1019ov29399 = (GE_ms8("explicit creation type \'$7\' does not conform to target entity type \'$8\'.", 72));
	ge1019ov29846 = (GE_ms8("vgcc6d", 6));
	ge1019ov29405 = (GE_ms8("`$7\' is not the final name of a procedure in class $9.", 54));
	ge1019ov29757 = (GE_ms8("vdpr1a", 6));
	ge1019ov29316 = (GE_ms8("Precursor instruction does not appear in a Routine_body.", 56));
	ge1219ov30186 = (GE_ms8("Namespace declared twice", 24));
	ge1219ov30185 = (GE_ms8("Undeclared namespace error", 26));
	ge351ov13431 = (GE_ms8("\n", 1));
	ge264ov13431 = (GE_ms8("\n", 1));
	ge251ov13431 = (GE_ms8("\n", 1));
	ge7ov4925 = (GE_ms8("\n", 1));
	ge7ov4926 = (GE_ms8("\n", 1));
	ge7ov4927 = (GE_ms8("\nOptions:\n", 10));
	ge1018ov40166 = (GE_ms8("vscn0d", 6));
	ge1018ov40162 = (GE_ms8("VSCN", 4));
	ge1018ov40161 = (GE_ms8("[$1] $2 $3: class $4 cannot be overridden both by class $5 in $6 \'$7\' and by class $8 in $9 \'$10\'.", 98));
	ge1018ov40165 = (GE_ms8("vscn0c", 6));
	ge1018ov40160 = (GE_ms8("[$1] $2 $3: assembly class $4 appearing as class $5 in assembly \'$6\' cannot be overridden by class $8 in $9 \'$10\'$11.", 117));
	ge1018ov40164 = (GE_ms8("vscn0b", 6));
	ge1018ov40159 = (GE_ms8("[$1] $2 $3: built-in class NONE cannot be overridden by class $5 in $6 \'$7\'$8.", 78));
	ge1018ov40163 = (GE_ms8("vscn0a", 6));
	ge1018ov40158 = (GE_ms8("[$1] $2 $3: class $4 name clash between class $5 in $6 \'$7\'$8 and class $9 in $10 \'$11\'$12.", 91));
	ge807ov12960 = (GE_ms8("/~", 2));
	ge807ov12971 = (GE_ms8("***unknown_name***", 18));
	ge811ov31574 = (GE_ms8("alias \"", 7));
	ge807ov13032 = (GE_ms8("alias \"[]\"", 10));
	ge807ov13033 = (GE_ms8("alias \"()\"", 10));
	ge807ov13013 = (GE_ms8("alias \"and\"", 11));
	ge807ov13029 = (GE_ms8("alias \"and then\"", 16));
	ge807ov13017 = (GE_ms8("alias \"//\"", 10));
	ge807ov13018 = (GE_ms8("alias \"/\"", 9));
	ge807ov13019 = (GE_ms8("alias \">=\"", 10));
	ge807ov13020 = (GE_ms8("alias \">\"", 9));
	ge807ov13014 = (GE_ms8("alias \"implies\"", 15));
	ge807ov13021 = (GE_ms8("alias \"<=\"", 10));
	ge807ov13022 = (GE_ms8("alias \"<\"", 9));
	ge807ov13023 = (GE_ms8("alias \"-\"", 9));
	ge807ov13024 = (GE_ms8("alias \"\\\\\"", 10));
	ge807ov13015 = (GE_ms8("alias \"or\"", 10));
	ge807ov13030 = (GE_ms8("alias \"or else\"", 15));
	ge807ov13025 = (GE_ms8("alias \"+\"", 9));
	ge807ov13026 = (GE_ms8("alias \"^\"", 9));
	ge807ov13027 = (GE_ms8("alias \"*\"", 9));
	ge807ov13016 = (GE_ms8("alias \"xor\"", 11));
	ge807ov13028 = (GE_ms8("alias \"..\"", 10));
	ge807ov13031 = (GE_ms8("alias \"not\"", 11));
	ge1287ov32290 = (GE_ms8("us-ascii", 8));
	ge1287ov32292 = (GE_ms8("utf-8", 5));
	ge713ov17273 = (GE_ms8(".", 1));
	ge713ov17274 = (GE_ms8("..", 2));
	ge807ov13009 = (GE_ms8("infix \"or else\"", 15));
	ge807ov13008 = (GE_ms8("infix \"and then\"", 16));
	ge807ov12996 = (GE_ms8("infix \"//\"", 10));
	ge807ov12997 = (GE_ms8("infix \"/\"", 9));
	ge807ov12998 = (GE_ms8("infix \">=\"", 10));
	ge807ov12999 = (GE_ms8("infix \">\"", 9));
	ge807ov13000 = (GE_ms8("infix \"<=\"", 10));
	ge807ov13001 = (GE_ms8("infix \"<\"", 9));
	ge807ov13002 = (GE_ms8("infix \"-\"", 9));
	ge807ov13003 = (GE_ms8("infix \"\\\\\"", 10));
	ge807ov13004 = (GE_ms8("infix \"+\"", 9));
	ge807ov13005 = (GE_ms8("infix \"^\"", 9));
	ge807ov13006 = (GE_ms8("infix \"*\"", 9));
	ge807ov13007 = (GE_ms8("infix \"..\"", 10));
	ge807ov13011 = (GE_ms8("prefix \"-\"", 10));
	ge807ov13012 = (GE_ms8("prefix \"+\"", 10));
	ge807ov12992 = (GE_ms8("infix \"and\"", 11));
	ge807ov12993 = (GE_ms8("infix \"implies\"", 15));
	ge807ov12994 = (GE_ms8("infix \"or\"", 10));
	ge807ov12995 = (GE_ms8("infix \"xor\"", 11));
	ge807ov13010 = (GE_ms8("prefix \"not\"", 12));
	ge832ov32947 = (GE_ms8("infix \"", 7));
	ge832ov32946 = (GE_ms8("prefix \"", 8));
	ge807ov12926 = (GE_ms8("attached separate expanded", 26));
	ge807ov12927 = (GE_ms8("attached separate reference", 27));
	ge807ov12925 = (GE_ms8("attached separate", 17));
	ge807ov12923 = (GE_ms8("attached expanded", 17));
	ge807ov12924 = (GE_ms8("attached reference", 18));
	ge807ov12931 = (GE_ms8("detachable separate expanded", 28));
	ge807ov12932 = (GE_ms8("detachable separate reference", 29));
	ge807ov12930 = (GE_ms8("detachable separate", 19));
	ge807ov12928 = (GE_ms8("detachable expanded", 19));
	ge807ov12929 = (GE_ms8("detachable reference", 20));
	ge807ov12933 = (GE_ms8("separate expanded", 17));
	ge807ov12934 = (GE_ms8("separate reference", 18));
	ge807ov12935 = (GE_ms8("", 0));
	ge851ov34408 = (GE_ms8("prefix \"", 8));
	ge839ov31481 = (GE_ms8("infix \"", 7));
	ge51ov4876 = (GE_ms8("\"$1\", line $2: negative range in character class", 48));
	ge37ov4876 = (GE_ms8("\"$1\", line $2: character \'$3\' out of range", 42));
	ge43ov4876 = (GE_ms8("$0: variable trailing context rules cannot be used with -f", 58));
}

void GE_init_const22()
{
	ge42ov4876 = (GE_ms8("$0: `reject\' cannot be used with -f", 35));
	ge41ov4876 = (GE_ms8("$0: -f and -m don\'t make sense together", 39));
	ge32ov4876 = (GE_ms8("\"$1\", line $2: bad character: $3", 32));
	ge31ov4876 = (GE_ms8("\"$1\", line $2: bad character class or missing close bracket", 59));
	ge48ov4876 = (GE_ms8("\"$1\", line $2: missing quote", 28));
	ge61ov4876 = (GE_ms8("\"$1\", line $2: unrecognized rule", 32));
	ge1138ov4876 = (GE_ms8("found invalid expression \'$1\' at $2", 35));
	ge169ov4876 = (GE_ms8("$0: too many (i.e. $1) nested include files", 43));
	ge168ov4876 = (GE_ms8("Syntax error in \"$1\" at line $2", 31));
	ge1132ov4876 = (GE_ms8("attribute \'$2\' of element <$1> at $4 is obsolete, use element $3 instead", 72));
	ge1148ov4876 = (GE_ms8("option name \'$1\' in option-element is unknown $2", 48));
	ge1145ov4876 = (GE_ms8("<exclude> at $1 is obsolete, use \'if\'/\'unless\' attributes instead", 65));
	ge1144ov4876 = (GE_ms8("<cluster> at $1 is obsolete. Specify options, clusters and mounts directly under <system> instead", 97));
	ge1140ov4876 = (GE_ms8("element \'$1\' must have child-element \'$2\' $3", 44));
	ge1147ov4876 = (GE_ms8("found unknown element \'$2\' in element \'$1\' $3", 45));
	ge1139ov4876 = (GE_ms8("element \'$1\' must have attribute \'$2\' $3", 40));
	ge1151ov4876 = (GE_ms8("Xace document must have a \'$1\' root-element $2", 46));
	ge1135ov4876 = (GE_ms8("element <$1> at $3 is obsolete, use element $2 instead", 54));
	ge1146ov4876 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a positive integer value $4", 70));
	ge1150ov4876 = (GE_ms8("attribute \'$2\' in element \'$1\' should have one of the following values: $4 $5", 77));
	ge1142ov4876 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a non-empty value $3", 63));
	ge1133ov4876 = (GE_ms8("attribute \'$2\' in element \'$1\' should have a boolean value $4", 61));
	ge1141ov4876 = (GE_ms8("Library \'$1\' mounted with incompatible prefixes \'$2\' and \'$3\' in $4 and $5", 74));
	ge163ov4876 = (GE_ms8("$0: cannot write to \'$1\'", 24));
	ge166ov4876 = (GE_ms8("$1", 2));
	ge173ov4876 = (GE_ms8("$0 version $1", 13));
	ge162ov4876 = (GE_ms8("$0: cannot read \'$1\'", 20));
	ge261ov32466 = (GE_ms8("", 0));
	ge248ov2434 = (GE_ms8("", 0));
	geic2 = (GE_ms8(" (label on item #", 17));
	geic3 = (GE_ms8(" with a manifest tuple argument", 31));
	geic4 = (GE_ms8(" of type ", 9));
}

void GE_init_const()
{
	GE_init_const1();
	GE_init_const2();
	GE_init_const3();
	GE_init_const4();
	GE_init_const5();
	GE_init_const6();
	GE_init_const7();
	GE_init_const8();
	GE_init_const9();
	GE_init_const10();
	GE_init_const11();
	GE_init_const12();
	GE_init_const13();
	GE_init_const14();
	GE_init_const15();
	GE_init_const16();
	GE_init_const17();
	GE_init_const18();
	GE_init_const19();
	GE_init_const20();
	GE_init_const21();
	GE_init_const22();
}

EIF_TYPE_OBJ GE_types[1915] = {
{0, 0, EIF_FALSE, 0, 0},
{1885, 1, EIF_FALSE, 0, 0},
{0, 2, EIF_FALSE, 0, 0},
{0, 3, EIF_FALSE, 0, 0},
{0, 4, EIF_FALSE, 0, 0},
{0, 5, EIF_FALSE, 0, 0},
{858, 6, EIF_FALSE, 0, 0},
{0, 7, EIF_FALSE, 0, 0},
{0, 8, EIF_FALSE, 0, 0},
{0, 9, EIF_FALSE, 0, 0},
{0, 10, EIF_FALSE, 0, 0},
{0, 11, EIF_FALSE, 0, 0},
{0, 12, EIF_FALSE, 0, 0},
{0, 13, EIF_FALSE, 0, 0},
{0, 14, EIF_FALSE, 0, 0},
{0, 15, EIF_TRUE, 0, 0},
{0, 16, EIF_TRUE, 0, 0},
{1398, 17, EIF_FALSE, 0, 0},
{0, 18, EIF_FALSE, 0, 0},
{0, 19, EIF_FALSE, 0, 0},
{0, 20, EIF_FALSE, 0, 0},
{0, 21, EIF_FALSE, 0, 0},
{0, 22, EIF_FALSE, 0, 0},
{0, 23, EIF_FALSE, 0, 0},
{0, 24, EIF_FALSE, 0, 0},
{0, 25, EIF_FALSE, 0, 0},
{0, 26, EIF_FALSE, 0, 0},
{0, 27, EIF_FALSE, 0, 0},
{1794, 28, EIF_FALSE, 0, 0},
{0, 29, EIF_FALSE, &T29f60, 0},
{0, 30, EIF_FALSE, 0, 0},
{0, 31, EIF_FALSE, 0, 0},
{0, 32, EIF_FALSE, 0, 0},
{0, 33, EIF_FALSE, 0, 0},
{0, 34, EIF_FALSE, 0, 0},
{0, 35, EIF_FALSE, 0, 0},
{0, 36, EIF_FALSE, 0, 0},
{0, 37, EIF_FALSE, 0, 0},
{0, 38, EIF_FALSE, 0, 0},
{0, 39, EIF_FALSE, 0, 0},
{0, 40, EIF_FALSE, 0, 0},
{0, 41, EIF_FALSE, 0, 0},
{0, 42, EIF_FALSE, 0, 0},
{0, 43, EIF_FALSE, 0, 0},
{0, 44, EIF_FALSE, 0, 0},
{0, 45, EIF_FALSE, 0, 0},
{0, 46, EIF_FALSE, 0, 0},
{0, 47, EIF_FALSE, 0, 0},
{0, 48, EIF_FALSE, 0, 0},
{0, 49, EIF_FALSE, 0, 0},
{0, 50, EIF_FALSE, 0, 0},
{0, 51, EIF_FALSE, 0, 0},
{0, 52, EIF_FALSE, 0, 0},
{0, 53, EIF_FALSE, 0, 0},
{0, 54, EIF_FALSE, 0, 0},
{0, 55, EIF_FALSE, 0, 0},
{0, 56, EIF_FALSE, 0, 0},
{0, 57, EIF_FALSE, 0, 0},
{0, 58, EIF_FALSE, 0, 0},
{0, 59, EIF_FALSE, 0, 0},
{0, 60, EIF_FALSE, 0, 0},
{0, 61, EIF_FALSE, 0, 0},
{0, 62, EIF_FALSE, 0, 0},
{0, 63, EIF_FALSE, 0, 0},
{0, 64, EIF_FALSE, 0, 0},
{0, 65, EIF_FALSE, 0, 0},
{0, 66, EIF_FALSE, 0, 0},
{0, 67, EIF_FALSE, 0, 0},
{0, 68, EIF_FALSE, 0, 0},
{0, 69, EIF_FALSE, 0, 0},
{0, 70, EIF_FALSE, 0, 0},
{0, 71, EIF_FALSE, 0, 0},
{0, 72, EIF_FALSE, 0, 0},
{0, 73, EIF_FALSE, 0, 0},
{0, 74, EIF_FALSE, 0, 0},
{0, 75, EIF_FALSE, 0, 0},
{0, 76, EIF_FALSE, 0, 0},
{0, 77, EIF_FALSE, 0, 0},
{0, 78, EIF_FALSE, 0, 0},
{0, 79, EIF_FALSE, 0, 0},
{0, 80, EIF_FALSE, 0, 0},
{0, 81, EIF_FALSE, 0, 0},
{1536, 82, EIF_FALSE, 0, 0},
{0, 83, EIF_FALSE, 0, 0},
{0, 84, EIF_FALSE, 0, 0},
{0, 85, EIF_FALSE, 0, 0},
{0, 86, EIF_FALSE, 0, 0},
{0, 87, EIF_FALSE, 0, 0},
{89, 88, EIF_FALSE, 0, 0},
{0, 89, EIF_FALSE, 0, 0},
{91, 90, EIF_FALSE, 0, 0},
{0, 91, EIF_FALSE, 0, 0},
{93, 92, EIF_FALSE, 0, 0},
{0, 93, EIF_FALSE, 0, 0},
{0, 94, EIF_FALSE, 0, 0},
{0, 95, EIF_FALSE, 0, 0},
{0, 96, EIF_FALSE, 0, 0},
{0, 97, EIF_FALSE, 0, 0},
{0, 98, EIF_FALSE, 0, 0},
{0, 99, EIF_FALSE, 0, 0},
{0, 100, EIF_FALSE, 0, 0},
{0, 101, EIF_FALSE, 0, 0},
{0, 102, EIF_FALSE, 0, 0},
{0, 103, EIF_FALSE, 0, 0},
{0, 104, EIF_FALSE, 0, 0},
{0, 105, EIF_FALSE, 0, 0},
{0, 106, EIF_FALSE, 0, 0},
{0, 107, EIF_FALSE, 0, 0},
{0, 108, EIF_FALSE, 0, 0},
{0, 109, EIF_FALSE, 0, 0},
{0, 110, EIF_FALSE, 0, 0},
{0, 111, EIF_FALSE, 0, 0},
{0, 112, EIF_FALSE, 0, 0},
{0, 113, EIF_FALSE, 0, 0},
{0, 114, EIF_FALSE, 0, 0},
{0, 115, EIF_FALSE, 0, 0},
{0, 116, EIF_FALSE, 0, 0},
{1793, 117, EIF_FALSE, 0, 0},
{0, 118, EIF_FALSE, 0, 0},
{0, 119, EIF_FALSE, 0, 0},
{0, 120, EIF_FALSE, 0, 0},
{0, 121, EIF_FALSE, 0, 0},
{0, 122, EIF_FALSE, 0, 0},
{0, 123, EIF_TRUE, 0, 0},
{0, 124, EIF_TRUE, 0, 0},
{0, 125, EIF_FALSE, 0, 0},
{0, 126, EIF_FALSE, 0, 0},
{0, 127, EIF_FALSE, 0, 0},
{0, 128, EIF_FALSE, &T128f10, 0},
{0, 129, EIF_FALSE, 0, 0},
{0, 130, EIF_FALSE, 0, 0},
{0, 131, EIF_FALSE, 0, 0},
{0, 132, EIF_FALSE, 0, 0},
{0, 133, EIF_FALSE, 0, 0},
{0, 134, EIF_FALSE, 0, 0},
{0, 135, EIF_FALSE, 0, 0},
{0, 136, EIF_FALSE, 0, 0},
{0, 137, EIF_FALSE, 0, 0},
{0, 138, EIF_FALSE, 0, 0},
{0, 139, EIF_FALSE, 0, 0},
{0, 140, EIF_FALSE, 0, 0},
{0, 141, EIF_TRUE, 0, 0},
{0, 142, EIF_FALSE, 0, 0},
{0, 143, EIF_FALSE, 0, 0},
{0, 144, EIF_FALSE, 0, 0},
{0, 145, EIF_FALSE, 0, 0},
{0, 146, EIF_FALSE, 0, 0},
{0, 147, EIF_FALSE, 0, 0},
{0, 148, EIF_FALSE, 0, 0},
{0, 149, EIF_FALSE, 0, 0},
{0, 150, EIF_FALSE, 0, 0},
{0, 151, EIF_FALSE, 0, 0},
{0, 152, EIF_FALSE, 0, 0},
{0, 153, EIF_FALSE, 0, 0},
{0, 154, EIF_FALSE, 0, 0},
{0, 155, EIF_FALSE, 0, 0},
{0, 156, EIF_FALSE, 0, 0},
{0, 157, EIF_FALSE, 0, 0},
{0, 158, EIF_FALSE, 0, 0},
{0, 159, EIF_FALSE, 0, 0},
{0, 160, EIF_FALSE, 0, 0},
{0, 161, EIF_FALSE, 0, 0},
{0, 162, EIF_FALSE, 0, 0},
{0, 163, EIF_FALSE, 0, 0},
{0, 164, EIF_FALSE, 0, 0},
{0, 165, EIF_FALSE, 0, 0},
{0, 166, EIF_FALSE, 0, 0},
{0, 167, EIF_FALSE, 0, 0},
{0, 168, EIF_FALSE, 0, 0},
{0, 169, EIF_FALSE, 0, 0},
{0, 170, EIF_FALSE, 0, 0},
{0, 171, EIF_FALSE, 0, 0},
{0, 172, EIF_FALSE, 0, 0},
{0, 173, EIF_FALSE, 0, 0},
{0, 174, EIF_FALSE, 0, 0},
{0, 175, EIF_FALSE, 0, 0},
{0, 176, EIF_FALSE, 0, 0},
{0, 177, EIF_FALSE, 0, 0},
{0, 178, EIF_FALSE, 0, 0},
{0, 179, EIF_FALSE, 0, 0},
{0, 180, EIF_FALSE, 0, 0},
{637, 181, EIF_FALSE, 0, 0},
{0, 182, EIF_FALSE, 0, 0},
{0, 183, EIF_FALSE, 0, 0},
{0, 184, EIF_FALSE, 0, 0},
{0, 185, EIF_FALSE, 0, 0},
{0, 186, EIF_FALSE, 0, 0},
{0, 187, EIF_FALSE, 0, 0},
{0, 188, EIF_FALSE, 0, 0},
{0, 189, EIF_FALSE, 0, 0},
{0, 190, EIF_FALSE, 0, 0},
{0, 191, EIF_FALSE, 0, 0},
{0, 192, EIF_FALSE, 0, 0},
{0, 193, EIF_FALSE, 0, 0},
{0, 194, EIF_FALSE, 0, 0},
{0, 195, EIF_FALSE, 0, 0},
{0, 196, EIF_FALSE, 0, 0},
{0, 197, EIF_FALSE, 0, 0},
{0, 198, EIF_FALSE, 0, 0},
{0, 199, EIF_FALSE, 0, 0},
{0, 200, EIF_FALSE, 0, 0},
{0, 201, EIF_FALSE, 0, 0},
{0, 202, EIF_FALSE, 0, 0},
{0, 203, EIF_FALSE, 0, 0},
{0, 204, EIF_FALSE, 0, 0},
{0, 205, EIF_FALSE, 0, 0},
{0, 206, EIF_FALSE, 0, 0},
{0, 207, EIF_FALSE, 0, 0},
{0, 208, EIF_FALSE, 0, 0},
{0, 209, EIF_TRUE, 0, 0},
{0, 210, EIF_FALSE, 0, 0},
{0, 211, EIF_TRUE, 0, 0},
{0, 212, EIF_FALSE, 0, 0},
{0, 213, EIF_FALSE, 0, 0},
{0, 214, EIF_FALSE, 0, 0},
{0, 215, EIF_FALSE, 0, 0},
{0, 216, EIF_FALSE, 0, 0},
{0, 217, EIF_TRUE, 0, 0},
{0, 218, EIF_TRUE, 0, 0},
{0, 219, EIF_TRUE, 0, 0},
{0, 220, EIF_FALSE, 0, 0},
{0, 221, EIF_FALSE, 0, 0},
{0, 222, EIF_TRUE, 0, 0},
{0, 223, EIF_FALSE, 0, 0},
{0, 224, EIF_TRUE, 0, 0},
{0, 225, EIF_FALSE, 0, 0},
{0, 226, EIF_FALSE, 0, 0},
{0, 227, EIF_TRUE, 0, 0},
{0, 228, EIF_FALSE, 0, 0},
{0, 229, EIF_FALSE, 0, 0},
{0, 230, EIF_FALSE, 0, 0},
{0, 231, EIF_FALSE, 0, 0},
{0, 232, EIF_FALSE, 0, 0},
{0, 233, EIF_FALSE, 0, 0},
{0, 234, EIF_FALSE, 0, 0},
{0, 235, EIF_FALSE, 0, 0},
{0, 236, EIF_FALSE, 0, 0},
{0, 237, EIF_FALSE, 0, 0},
{0, 238, EIF_FALSE, 0, 0},
{0, 239, EIF_FALSE, 0, 0},
{0, 240, EIF_FALSE, 0, 0},
{0, 241, EIF_FALSE, 0, 0},
{0, 242, EIF_FALSE, 0, 0},
{0, 243, EIF_FALSE, 0, 0},
{0, 244, EIF_FALSE, 0, 0},
{0, 245, EIF_FALSE, 0, 0},
{0, 246, EIF_FALSE, 0, 0},
{0, 247, EIF_FALSE, 0, 0},
{0, 248, EIF_FALSE, 0, 0},
{0, 249, EIF_FALSE, 0, 0},
{0, 250, EIF_FALSE, 0, 0},
{0, 251, EIF_FALSE, 0, 0},
{0, 252, EIF_FALSE, 0, 0},
{0, 253, EIF_FALSE, 0, 0},
{0, 254, EIF_FALSE, 0, 0},
{0, 255, EIF_FALSE, 0, 0},
{0, 256, EIF_FALSE, 0, 0},
{0, 257, EIF_FALSE, 0, 0},
{0, 258, EIF_FALSE, 0, 0},
{0, 259, EIF_FALSE, 0, 0},
{0, 260, EIF_FALSE, 0, 0},
{0, 261, EIF_FALSE, 0, 0},
{0, 262, EIF_TRUE, 0, 0},
{0, 263, EIF_FALSE, 0, 0},
{0, 264, EIF_FALSE, 0, 0},
{0, 265, EIF_FALSE, 0, 0},
{0, 266, EIF_FALSE, 0, 0},
{0, 267, EIF_FALSE, 0, 0},
{0, 268, EIF_FALSE, 0, 0},
{0, 269, EIF_FALSE, 0, 0},
{0, 270, EIF_FALSE, 0, 0},
{0, 271, EIF_FALSE, 0, 0},
{0, 272, EIF_FALSE, 0, 0},
{0, 273, EIF_FALSE, 0, 0},
{0, 274, EIF_FALSE, 0, 0},
{0, 275, EIF_FALSE, 0, 0},
{0, 276, EIF_FALSE, 0, 0},
{0, 277, EIF_FALSE, 0, 0},
{0, 278, EIF_FALSE, 0, 0},
{0, 279, EIF_FALSE, 0, 0},
{0, 280, EIF_FALSE, 0, 0},
{0, 281, EIF_FALSE, 0, 0},
{0, 282, EIF_FALSE, 0, 0},
{0, 283, EIF_FALSE, 0, 0},
{0, 284, EIF_FALSE, 0, 0},
{0, 285, EIF_FALSE, 0, 0},
{0, 286, EIF_FALSE, 0, 0},
{0, 287, EIF_FALSE, 0, 0},
{1613, 288, EIF_FALSE, 0, 0},
{0, 289, EIF_FALSE, 0, 0},
{0, 290, EIF_FALSE, 0, 0},
{0, 291, EIF_FALSE, 0, 0},
{0, 292, EIF_FALSE, 0, 0},
{0, 293, EIF_FALSE, 0, 0},
{0, 294, EIF_FALSE, 0, 0},
{0, 295, EIF_FALSE, 0, 0},
{0, 296, EIF_FALSE, 0, 0},
{0, 297, EIF_FALSE, 0, 0},
{0, 298, EIF_FALSE, 0, 0},
{0, 299, EIF_FALSE, 0, 0},
{0, 300, EIF_FALSE, 0, 0},
{0, 301, EIF_FALSE, 0, 0},
{0, 302, EIF_FALSE, 0, 0},
{0, 303, EIF_FALSE, 0, 0},
{0, 304, EIF_FALSE, &T304f28, 0},
{0, 305, EIF_FALSE, 0, 0},
{0, 306, EIF_FALSE, 0, 0},
{0, 307, EIF_FALSE, 0, 0},
{0, 308, EIF_FALSE, 0, 0},
{0, 309, EIF_FALSE, 0, 0},
{0, 310, EIF_FALSE, 0, 0},
{0, 311, EIF_FALSE, 0, 0},
{0, 312, EIF_FALSE, 0, 0},
{0, 313, EIF_FALSE, 0, 0},
{0, 314, EIF_FALSE, 0, 0},
{1664, 315, EIF_FALSE, 0, 0},
{0, 316, EIF_FALSE, 0, 0},
{0, 317, EIF_FALSE, 0, 0},
{0, 318, EIF_FALSE, 0, 0},
{0, 319, EIF_FALSE, 0, 0},
{0, 320, EIF_FALSE, 0, 0},
{0, 321, EIF_FALSE, 0, 0},
{0, 322, EIF_FALSE, 0, 0},
{0, 323, EIF_FALSE, 0, 0},
{0, 324, EIF_FALSE, 0, 0},
{0, 325, EIF_FALSE, 0, 0},
{0, 326, EIF_FALSE, 0, 0},
{0, 327, EIF_FALSE, 0, 0},
{0, 328, EIF_FALSE, 0, 0},
{0, 329, EIF_FALSE, 0, 0},
{0, 330, EIF_FALSE, 0, 0},
{0, 331, EIF_FALSE, 0, 0},
{0, 332, EIF_FALSE, 0, 0},
{0, 333, EIF_FALSE, 0, 0},
{0, 334, EIF_FALSE, 0, 0},
{0, 335, EIF_FALSE, &T335f30, 0},
{0, 336, EIF_FALSE, 0, 0},
{0, 337, EIF_FALSE, 0, 0},
{0, 338, EIF_FALSE, 0, 0},
{0, 339, EIF_FALSE, 0, 0},
{0, 340, EIF_FALSE, 0, 0},
{0, 341, EIF_FALSE, 0, 0},
{0, 342, EIF_FALSE, 0, 0},
{0, 343, EIF_FALSE, 0, 0},
{0, 344, EIF_FALSE, 0, 0},
{0, 345, EIF_FALSE, 0, 0},
{0, 346, EIF_FALSE, 0, 0},
{0, 347, EIF_FALSE, 0, 0},
{0, 348, EIF_FALSE, 0, 0},
{0, 349, EIF_FALSE, 0, 0},
{0, 350, EIF_FALSE, 0, 0},
{0, 351, EIF_FALSE, 0, 0},
{0, 352, EIF_FALSE, 0, 0},
{0, 353, EIF_FALSE, 0, 0},
{0, 354, EIF_FALSE, 0, 0},
{0, 355, EIF_FALSE, 0, 0},
{0, 356, EIF_FALSE, 0, 0},
{0, 357, EIF_FALSE, 0, 0},
{0, 358, EIF_FALSE, 0, 0},
{0, 359, EIF_FALSE, 0, 0},
{0, 360, EIF_FALSE, 0, 0},
{0, 361, EIF_FALSE, 0, 0},
{0, 362, EIF_FALSE, 0, 0},
{0, 363, EIF_FALSE, 0, 0},
{0, 364, EIF_FALSE, 0, 0},
{0, 365, EIF_FALSE, 0, 0},
{0, 366, EIF_FALSE, 0, 0},
{0, 367, EIF_FALSE, 0, 0},
{0, 368, EIF_FALSE, 0, 0},
{0, 369, EIF_FALSE, 0, 0},
{0, 370, EIF_FALSE, 0, 0},
{0, 371, EIF_FALSE, 0, 0},
{0, 372, EIF_FALSE, 0, 0},
{0, 373, EIF_FALSE, 0, 0},
{0, 374, EIF_FALSE, 0, 0},
{0, 375, EIF_FALSE, 0, 0},
{0, 376, EIF_FALSE, 0, 0},
{0, 377, EIF_FALSE, 0, 0},
{0, 378, EIF_FALSE, 0, 0},
{0, 379, EIF_FALSE, 0, 0},
{0, 380, EIF_FALSE, 0, 0},
{0, 381, EIF_FALSE, 0, 0},
{0, 382, EIF_FALSE, 0, 0},
{0, 383, EIF_FALSE, 0, 0},
{0, 384, EIF_FALSE, 0, 0},
{1818, 385, EIF_FALSE, 0, 0},
{0, 386, EIF_FALSE, 0, 0},
{0, 387, EIF_FALSE, 0, 0},
{0, 388, EIF_FALSE, 0, 0},
{0, 389, EIF_FALSE, 0, 0},
{0, 390, EIF_FALSE, 0, 0},
{0, 391, EIF_FALSE, 0, 0},
{0, 392, EIF_FALSE, 0, 0},
{0, 393, EIF_FALSE, 0, 0},
{0, 394, EIF_FALSE, 0, 0},
{0, 395, EIF_FALSE, 0, 0},
{0, 396, EIF_FALSE, 0, 0},
{0, 397, EIF_FALSE, 0, 0},
{0, 398, EIF_FALSE, 0, 0},
{0, 399, EIF_FALSE, 0, 0},
{0, 400, EIF_FALSE, 0, 0},
{0, 401, EIF_FALSE, 0, 0},
{0, 402, EIF_FALSE, 0, 0},
{0, 403, EIF_FALSE, 0, 0},
{0, 404, EIF_FALSE, 0, 0},
{0, 405, EIF_FALSE, 0, 0},
{0, 406, EIF_FALSE, 0, 0},
{0, 407, EIF_FALSE, 0, 0},
{0, 408, EIF_FALSE, 0, 0},
{0, 409, EIF_FALSE, 0, 0},
{0, 410, EIF_FALSE, 0, 0},
{0, 411, EIF_FALSE, 0, 0},
{0, 412, EIF_FALSE, 0, 0},
{0, 413, EIF_FALSE, 0, 0},
{0, 414, EIF_FALSE, 0, 0},
{0, 415, EIF_FALSE, 0, 0},
{0, 416, EIF_FALSE, 0, 0},
{0, 417, EIF_FALSE, 0, 0},
{0, 418, EIF_FALSE, 0, 0},
{0, 419, EIF_FALSE, 0, 0},
{0, 420, EIF_FALSE, 0, 0},
{0, 421, EIF_FALSE, 0, 0},
{0, 422, EIF_FALSE, 0, 0},
{0, 423, EIF_FALSE, 0, 0},
{0, 424, EIF_FALSE, 0, 0},
{0, 425, EIF_FALSE, 0, 0},
{0, 426, EIF_FALSE, 0, 0},
{0, 427, EIF_FALSE, 0, 0},
{0, 428, EIF_FALSE, 0, 0},
{0, 429, EIF_FALSE, 0, 0},
{0, 430, EIF_FALSE, 0, 0},
{0, 431, EIF_FALSE, 0, 0},
{0, 432, EIF_FALSE, 0, 0},
{0, 433, EIF_FALSE, 0, 0},
{0, 434, EIF_FALSE, 0, 0},
{0, 435, EIF_FALSE, 0, 0},
{0, 436, EIF_FALSE, 0, 0},
{0, 437, EIF_FALSE, 0, 0},
{0, 438, EIF_FALSE, 0, 0},
{0, 439, EIF_FALSE, 0, 0},
{0, 440, EIF_FALSE, 0, 0},
{0, 441, EIF_FALSE, 0, 0},
{0, 442, EIF_FALSE, 0, 0},
{0, 443, EIF_FALSE, 0, 0},
{0, 444, EIF_FALSE, 0, 0},
{0, 445, EIF_FALSE, 0, 0},
{0, 446, EIF_FALSE, 0, 0},
{0, 447, EIF_FALSE, 0, 0},
{0, 448, EIF_FALSE, 0, 0},
{0, 449, EIF_FALSE, 0, 0},
{0, 450, EIF_FALSE, 0, 0},
{0, 451, EIF_FALSE, 0, 0},
{0, 452, EIF_FALSE, 0, 0},
{0, 453, EIF_FALSE, 0, 0},
{0, 454, EIF_FALSE, 0, 0},
{0, 455, EIF_FALSE, 0, 0},
{0, 456, EIF_FALSE, 0, 0},
{0, 457, EIF_FALSE, 0, 0},
{0, 458, EIF_FALSE, 0, 0},
{0, 459, EIF_FALSE, 0, 0},
{0, 460, EIF_FALSE, 0, 0},
{0, 461, EIF_FALSE, 0, 0},
{0, 462, EIF_FALSE, 0, 0},
{0, 463, EIF_FALSE, 0, 0},
{0, 464, EIF_FALSE, 0, 0},
{0, 465, EIF_FALSE, 0, 0},
{0, 466, EIF_FALSE, 0, 0},
{0, 467, EIF_FALSE, 0, 0},
{0, 468, EIF_FALSE, 0, 0},
{0, 469, EIF_FALSE, 0, 0},
{0, 470, EIF_FALSE, 0, 0},
{0, 471, EIF_FALSE, 0, 0},
{0, 472, EIF_FALSE, 0, 0},
{0, 473, EIF_FALSE, 0, 0},
{0, 474, EIF_FALSE, 0, 0},
{0, 475, EIF_FALSE, 0, 0},
{0, 476, EIF_FALSE, 0, 0},
{0, 477, EIF_FALSE, 0, 0},
{0, 478, EIF_FALSE, 0, 0},
{0, 479, EIF_FALSE, 0, 0},
{0, 480, EIF_FALSE, 0, 0},
{0, 481, EIF_FALSE, 0, 0},
{0, 482, EIF_FALSE, 0, 0},
{0, 483, EIF_FALSE, 0, 0},
{0, 484, EIF_FALSE, 0, 0},
{0, 485, EIF_FALSE, 0, 0},
{0, 486, EIF_FALSE, 0, 0},
{0, 487, EIF_FALSE, 0, 0},
{0, 488, EIF_FALSE, 0, 0},
{0, 489, EIF_FALSE, 0, 0},
{0, 490, EIF_FALSE, 0, 0},
{0, 491, EIF_FALSE, 0, 0},
{0, 492, EIF_FALSE, 0, 0},
{0, 493, EIF_FALSE, 0, 0},
{0, 494, EIF_FALSE, 0, 0},
{0, 495, EIF_FALSE, 0, 0},
{0, 496, EIF_FALSE, 0, 0},
{0, 497, EIF_FALSE, 0, 0},
{0, 498, EIF_FALSE, 0, 0},
{0, 499, EIF_FALSE, 0, 0},
{0, 500, EIF_FALSE, 0, 0},
{0, 501, EIF_FALSE, 0, 0},
{0, 502, EIF_FALSE, 0, 0},
{0, 503, EIF_FALSE, 0, 0},
{0, 504, EIF_FALSE, 0, 0},
{0, 505, EIF_FALSE, 0, 0},
{0, 506, EIF_FALSE, 0, 0},
{0, 507, EIF_FALSE, 0, 0},
{0, 508, EIF_FALSE, 0, 0},
{0, 509, EIF_FALSE, 0, 0},
{0, 510, EIF_FALSE, 0, 0},
{0, 511, EIF_FALSE, 0, 0},
{0, 512, EIF_FALSE, 0, 0},
{0, 513, EIF_FALSE, 0, 0},
{0, 514, EIF_FALSE, 0, 0},
{0, 515, EIF_FALSE, 0, 0},
{0, 516, EIF_FALSE, 0, 0},
{0, 517, EIF_FALSE, 0, 0},
{0, 518, EIF_FALSE, 0, 0},
{0, 519, EIF_FALSE, 0, 0},
{0, 520, EIF_FALSE, 0, 0},
{0, 521, EIF_FALSE, 0, 0},
{0, 522, EIF_FALSE, 0, 0},
{0, 523, EIF_FALSE, 0, 0},
{0, 524, EIF_FALSE, 0, 0},
{0, 525, EIF_FALSE, 0, 0},
{0, 526, EIF_FALSE, 0, 0},
{0, 527, EIF_FALSE, 0, 0},
{0, 528, EIF_FALSE, 0, 0},
{0, 529, EIF_FALSE, 0, 0},
{0, 530, EIF_FALSE, 0, 0},
{0, 531, EIF_FALSE, 0, 0},
{0, 532, EIF_FALSE, 0, 0},
{0, 533, EIF_FALSE, 0, 0},
{0, 534, EIF_FALSE, 0, 0},
{0, 535, EIF_FALSE, 0, 0},
{0, 536, EIF_FALSE, 0, 0},
{0, 537, EIF_FALSE, 0, 0},
{0, 538, EIF_FALSE, 0, 0},
{0, 539, EIF_FALSE, 0, 0},
{0, 540, EIF_FALSE, 0, 0},
{0, 541, EIF_FALSE, 0, 0},
{0, 542, EIF_FALSE, 0, 0},
{0, 543, EIF_FALSE, 0, 0},
{0, 544, EIF_FALSE, 0, 0},
{0, 545, EIF_FALSE, 0, 0},
{0, 546, EIF_FALSE, 0, 0},
{0, 547, EIF_TRUE, 0, 0},
{0, 548, EIF_FALSE, 0, 0},
{0, 549, EIF_FALSE, 0, 0},
{0, 550, EIF_FALSE, 0, 0},
{0, 551, EIF_FALSE, 0, 0},
{0, 552, EIF_TRUE, 0, 0},
{0, 553, EIF_FALSE, 0, 0},
{0, 554, EIF_FALSE, 0, 0},
{0, 555, EIF_TRUE, 0, 0},
{0, 556, EIF_FALSE, 0, 0},
{0, 557, EIF_FALSE, 0, 0},
{0, 558, EIF_FALSE, 0, 0},
{0, 559, EIF_FALSE, 0, 0},
{0, 560, EIF_FALSE, 0, 0},
{0, 561, EIF_FALSE, 0, 0},
{0, 562, EIF_FALSE, 0, 0},
{0, 563, EIF_TRUE, 0, 0},
{0, 564, EIF_FALSE, 0, 0},
{0, 565, EIF_FALSE, 0, 0},
{0, 566, EIF_FALSE, 0, 0},
{0, 567, EIF_FALSE, 0, 0},
{0, 568, EIF_FALSE, 0, 0},
{0, 569, EIF_FALSE, 0, 0},
{0, 570, EIF_FALSE, 0, 0},
{0, 571, EIF_FALSE, 0, 0},
{0, 572, EIF_FALSE, 0, 0},
{0, 573, EIF_TRUE, 0, 0},
{0, 574, EIF_FALSE, 0, 0},
{0, 575, EIF_FALSE, 0, 0},
{0, 576, EIF_FALSE, 0, 0},
{0, 577, EIF_FALSE, 0, 0},
{0, 578, EIF_FALSE, 0, 0},
{0, 579, EIF_FALSE, 0, 0},
{0, 580, EIF_FALSE, 0, 0},
{0, 581, EIF_FALSE, 0, 0},
{0, 582, EIF_FALSE, 0, 0},
{0, 583, EIF_FALSE, 0, 0},
{0, 584, EIF_FALSE, 0, 0},
{0, 585, EIF_FALSE, 0, 0},
{0, 586, EIF_FALSE, 0, 0},
{0, 587, EIF_TRUE, 0, 0},
{0, 588, EIF_FALSE, 0, 0},
{0, 589, EIF_FALSE, 0, 0},
{0, 590, EIF_TRUE, 0, 0},
{0, 591, EIF_FALSE, 0, 0},
{0, 592, EIF_FALSE, 0, 0},
{0, 593, EIF_TRUE, 0, 0},
{0, 594, EIF_FALSE, 0, 0},
{0, 595, EIF_FALSE, 0, 0},
{0, 596, EIF_TRUE, 0, 0},
{0, 597, EIF_FALSE, 0, 0},
{0, 598, EIF_FALSE, 0, 0},
{0, 599, EIF_TRUE, 0, 0},
{0, 600, EIF_FALSE, 0, 0},
{0, 601, EIF_FALSE, 0, 0},
{0, 602, EIF_TRUE, 0, 0},
{0, 603, EIF_FALSE, 0, 0},
{0, 604, EIF_FALSE, 0, 0},
{0, 605, EIF_TRUE, 0, 0},
{0, 606, EIF_FALSE, 0, 0},
{0, 607, EIF_FALSE, 0, 0},
{0, 608, EIF_FALSE, 0, 0},
{0, 609, EIF_TRUE, 0, 0},
{0, 610, EIF_FALSE, 0, 0},
{0, 611, EIF_FALSE, 0, 0},
{0, 612, EIF_FALSE, 0, 0},
{0, 613, EIF_FALSE, 0, 0},
{0, 614, EIF_FALSE, 0, 0},
{0, 615, EIF_FALSE, 0, 0},
{0, 616, EIF_FALSE, 0, 0},
{0, 617, EIF_FALSE, 0, 0},
{0, 618, EIF_FALSE, 0, 0},
{0, 619, EIF_TRUE, 0, 0},
{0, 620, EIF_FALSE, 0, 0},
{0, 621, EIF_FALSE, 0, 0},
{0, 622, EIF_FALSE, 0, 0},
{0, 623, EIF_TRUE, 0, 0},
{0, 624, EIF_FALSE, 0, 0},
{0, 625, EIF_FALSE, 0, 0},
{0, 626, EIF_FALSE, 0, 0},
{0, 627, EIF_FALSE, 0, 0},
{0, 628, EIF_FALSE, 0, 0},
{0, 629, EIF_FALSE, 0, 0},
{0, 630, EIF_FALSE, 0, 0},
{0, 631, EIF_FALSE, 0, 0},
{0, 632, EIF_FALSE, 0, 0},
{0, 633, EIF_FALSE, 0, 0},
{0, 634, EIF_FALSE, 0, 0},
{0, 635, EIF_FALSE, 0, 0},
{0, 636, EIF_FALSE, 0, 0},
{0, 637, EIF_FALSE, 0, 0},
{0, 638, EIF_FALSE, 0, 0},
{0, 639, EIF_FALSE, 0, 0},
{0, 640, EIF_FALSE, 0, 0},
{0, 641, EIF_FALSE, 0, 0},
{0, 642, EIF_FALSE, 0, 0},
{0, 643, EIF_TRUE, 0, 0},
{0, 644, EIF_FALSE, 0, 0},
{0, 645, EIF_TRUE, 0, 0},
{0, 646, EIF_TRUE, 0, 0},
{0, 647, EIF_FALSE, 0, 0},
{0, 648, EIF_FALSE, 0, 0},
{0, 649, EIF_FALSE, 0, 0},
{0, 650, EIF_FALSE, 0, 0},
{0, 651, EIF_FALSE, 0, 0},
{0, 652, EIF_FALSE, 0, 0},
{0, 653, EIF_FALSE, 0, 0},
{0, 654, EIF_FALSE, 0, 0},
{0, 655, EIF_FALSE, 0, 0},
{0, 656, EIF_FALSE, 0, 0},
{0, 657, EIF_TRUE, 0, 0},
{0, 658, EIF_FALSE, 0, 0},
{0, 659, EIF_FALSE, 0, 0},
{0, 660, EIF_FALSE, 0, 0},
{0, 661, EIF_FALSE, 0, 0},
{0, 662, EIF_TRUE, 0, 0},
{0, 663, EIF_FALSE, 0, 0},
{0, 664, EIF_FALSE, 0, 0},
{0, 665, EIF_FALSE, 0, 0},
{0, 666, EIF_FALSE, 0, 0},
{0, 667, EIF_TRUE, 0, 0},
{0, 668, EIF_FALSE, 0, 0},
{0, 669, EIF_FALSE, 0, 0},
{0, 670, EIF_FALSE, 0, 0},
{0, 671, EIF_FALSE, 0, 0},
{0, 672, EIF_TRUE, 0, 0},
{0, 673, EIF_FALSE, 0, 0},
{0, 674, EIF_FALSE, 0, 0},
{0, 675, EIF_FALSE, 0, 0},
{0, 676, EIF_FALSE, 0, 0},
{0, 677, EIF_TRUE, 0, 0},
{0, 678, EIF_FALSE, 0, 0},
{0, 679, EIF_FALSE, 0, 0},
{0, 680, EIF_TRUE, 0, 0},
{0, 681, EIF_FALSE, 0, 0},
{0, 682, EIF_FALSE, 0, 0},
{0, 683, EIF_TRUE, 0, 0},
{0, 684, EIF_FALSE, 0, 0},
{0, 685, EIF_FALSE, 0, 0},
{0, 686, EIF_TRUE, 0, 0},
{0, 687, EIF_FALSE, 0, 0},
{0, 688, EIF_FALSE, 0, 0},
{0, 689, EIF_TRUE, 0, 0},
{0, 690, EIF_FALSE, 0, 0},
{0, 691, EIF_FALSE, 0, 0},
{0, 692, EIF_TRUE, 0, 0},
{0, 693, EIF_FALSE, 0, 0},
{0, 694, EIF_FALSE, 0, 0},
{0, 695, EIF_FALSE, 0, 0},
{0, 696, EIF_TRUE, 0, 0},
{0, 697, EIF_FALSE, 0, 0},
{0, 698, EIF_FALSE, 0, 0},
{0, 699, EIF_FALSE, 0, 0},
{0, 700, EIF_FALSE, 0, 0},
{0, 701, EIF_TRUE, 0, 0},
{0, 702, EIF_FALSE, 0, 0},
{0, 703, EIF_TRUE, 0, 0},
{0, 704, EIF_FALSE, 0, 0},
{0, 705, EIF_FALSE, 0, 0},
{0, 706, EIF_FALSE, 0, 0},
{0, 707, EIF_TRUE, 0, 0},
{0, 708, EIF_FALSE, 0, 0},
{0, 709, EIF_FALSE, 0, 0},
{0, 710, EIF_TRUE, 0, 0},
{0, 711, EIF_FALSE, 0, 0},
{0, 712, EIF_FALSE, 0, 0},
{0, 713, EIF_FALSE, 0, 0},
{0, 714, EIF_FALSE, 0, 0},
{0, 715, EIF_FALSE, 0, 0},
{0, 716, EIF_FALSE, 0, 0},
{0, 717, EIF_FALSE, 0, 0},
{0, 718, EIF_FALSE, 0, 0},
{0, 719, EIF_FALSE, 0, 0},
{0, 720, EIF_FALSE, 0, 0},
{0, 721, EIF_FALSE, 0, 0},
{0, 722, EIF_FALSE, 0, 0},
{0, 723, EIF_TRUE, 0, 0},
{0, 724, EIF_FALSE, 0, 0},
{0, 725, EIF_FALSE, 0, 0},
{0, 726, EIF_FALSE, 0, 0},
{0, 727, EIF_FALSE, 0, 0},
{0, 728, EIF_FALSE, 0, 0},
{0, 729, EIF_FALSE, 0, 0},
{0, 730, EIF_FALSE, 0, 0},
{0, 731, EIF_FALSE, 0, 0},
{0, 732, EIF_FALSE, 0, 0},
{0, 733, EIF_FALSE, 0, 0},
{0, 734, EIF_TRUE, 0, 0},
{0, 735, EIF_FALSE, 0, 0},
{0, 736, EIF_FALSE, 0, 0},
{0, 737, EIF_FALSE, 0, 0},
{0, 738, EIF_TRUE, 0, 0},
{0, 739, EIF_FALSE, 0, 0},
{0, 740, EIF_FALSE, 0, 0},
{0, 741, EIF_FALSE, 0, 0},
{0, 742, EIF_TRUE, 0, 0},
{0, 743, EIF_FALSE, 0, 0},
{0, 744, EIF_FALSE, 0, 0},
{0, 745, EIF_FALSE, 0, 0},
{0, 746, EIF_TRUE, 0, 0},
{0, 747, EIF_FALSE, 0, 0},
{0, 748, EIF_TRUE, 0, 0},
{0, 749, EIF_FALSE, 0, 0},
{0, 750, EIF_FALSE, 0, 0},
{0, 751, EIF_FALSE, 0, 0},
{0, 752, EIF_FALSE, 0, 0},
{0, 753, EIF_FALSE, 0, 0},
{0, 754, EIF_FALSE, 0, 0},
{0, 755, EIF_FALSE, 0, 0},
{0, 756, EIF_TRUE, 0, 0},
{0, 757, EIF_FALSE, 0, 0},
{0, 758, EIF_FALSE, 0, 0},
{0, 759, EIF_FALSE, 0, 0},
{0, 760, EIF_FALSE, 0, 0},
{1819, 761, EIF_FALSE, 0, 0},
{0, 762, EIF_TRUE, 0, 0},
{0, 763, EIF_FALSE, 0, 0},
{0, 764, EIF_FALSE, 0, 0},
{0, 765, EIF_FALSE, 0, 0},
{0, 766, EIF_TRUE, 0, 0},
{0, 767, EIF_FALSE, 0, 0},
{0, 768, EIF_FALSE, 0, 0},
{0, 769, EIF_FALSE, 0, 0},
{0, 770, EIF_TRUE, 0, 0},
{0, 771, EIF_FALSE, 0, 0},
{0, 772, EIF_FALSE, 0, 0},
{0, 773, EIF_FALSE, 0, 0},
{0, 774, EIF_FALSE, 0, 0},
{0, 775, EIF_FALSE, 0, 0},
{0, 776, EIF_FALSE, 0, 0},
{0, 777, EIF_FALSE, 0, 0},
{0, 778, EIF_FALSE, 0, 0},
{0, 779, EIF_FALSE, 0, 0},
{0, 780, EIF_FALSE, 0, 0},
{0, 781, EIF_FALSE, 0, 0},
{0, 782, EIF_FALSE, 0, 0},
{0, 783, EIF_FALSE, 0, 0},
{0, 784, EIF_FALSE, 0, 0},
{0, 785, EIF_FALSE, 0, 0},
{0, 786, EIF_FALSE, 0, 0},
{0, 787, EIF_FALSE, 0, 0},
{0, 788, EIF_FALSE, 0, 0},
{0, 789, EIF_FALSE, 0, 0},
{0, 790, EIF_FALSE, 0, 0},
{0, 791, EIF_FALSE, 0, 0},
{0, 792, EIF_FALSE, 0, 0},
{0, 793, EIF_FALSE, 0, 0},
{0, 794, EIF_FALSE, 0, 0},
{0, 795, EIF_FALSE, 0, 0},
{0, 796, EIF_FALSE, 0, 0},
{0, 797, EIF_FALSE, 0, 0},
{0, 798, EIF_FALSE, 0, 0},
{0, 799, EIF_FALSE, 0, 0},
{0, 800, EIF_FALSE, 0, 0},
{0, 801, EIF_FALSE, 0, 0},
{0, 802, EIF_FALSE, 0, 0},
{0, 803, EIF_FALSE, 0, 0},
{0, 804, EIF_FALSE, 0, 0},
{0, 805, EIF_FALSE, 0, 0},
{0, 806, EIF_FALSE, 0, 0},
{0, 807, EIF_FALSE, 0, 0},
{0, 808, EIF_FALSE, 0, 0},
{0, 809, EIF_FALSE, 0, 0},
{0, 810, EIF_FALSE, 0, 0},
{0, 811, EIF_FALSE, 0, 0},
{0, 812, EIF_FALSE, 0, 0},
{0, 813, EIF_FALSE, 0, 0},
{0, 814, EIF_FALSE, 0, 0},
{0, 815, EIF_FALSE, 0, 0},
{0, 816, EIF_FALSE, 0, 0},
{0, 817, EIF_FALSE, 0, 0},
{0, 818, EIF_FALSE, 0, 0},
{0, 819, EIF_FALSE, 0, 0},
{0, 820, EIF_FALSE, 0, 0},
{0, 821, EIF_FALSE, 0, 0},
{0, 822, EIF_FALSE, 0, 0},
{0, 823, EIF_FALSE, 0, 0},
{0, 824, EIF_FALSE, 0, 0},
{0, 825, EIF_FALSE, 0, 0},
{0, 826, EIF_FALSE, 0, 0},
{0, 827, EIF_FALSE, 0, 0},
{0, 828, EIF_FALSE, 0, 0},
{0, 829, EIF_FALSE, 0, 0},
{0, 830, EIF_FALSE, 0, 0},
{0, 831, EIF_FALSE, 0, 0},
{0, 832, EIF_FALSE, 0, 0},
{0, 833, EIF_FALSE, 0, 0},
{0, 834, EIF_FALSE, 0, 0},
{0, 835, EIF_FALSE, 0, 0},
{0, 836, EIF_FALSE, 0, 0},
{0, 837, EIF_FALSE, 0, 0},
{0, 838, EIF_FALSE, 0, 0},
{0, 839, EIF_FALSE, 0, 0},
{0, 840, EIF_FALSE, 0, 0},
{0, 841, EIF_FALSE, 0, 0},
{0, 842, EIF_FALSE, 0, 0},
{0, 843, EIF_FALSE, 0, 0},
{0, 844, EIF_FALSE, 0, 0},
{0, 845, EIF_FALSE, 0, 0},
{0, 846, EIF_FALSE, 0, 0},
{0, 847, EIF_FALSE, 0, 0},
{0, 848, EIF_FALSE, 0, 0},
{0, 849, EIF_FALSE, 0, 0},
{0, 850, EIF_FALSE, 0, 0},
{0, 851, EIF_FALSE, 0, 0},
{0, 852, EIF_FALSE, 0, 0},
{0, 853, EIF_FALSE, 0, 0},
{0, 854, EIF_FALSE, 0, 0},
{0, 855, EIF_FALSE, 0, 0},
{0, 856, EIF_FALSE, 0, 0},
{0, 857, EIF_FALSE, 0, 0},
{0, 858, EIF_FALSE, 0, 0},
{0, 859, EIF_FALSE, 0, 0},
{0, 860, EIF_FALSE, 0, 0},
{0, 861, EIF_FALSE, 0, 0},
{0, 862, EIF_FALSE, 0, 0},
{0, 863, EIF_FALSE, 0, 0},
{0, 864, EIF_FALSE, 0, 0},
{0, 865, EIF_TRUE, 0, 0},
{0, 866, EIF_FALSE, 0, 0},
{0, 867, EIF_FALSE, 0, 0},
{0, 868, EIF_TRUE, 0, 0},
{0, 869, EIF_FALSE, 0, 0},
{0, 870, EIF_FALSE, 0, 0},
{0, 871, EIF_FALSE, 0, 0},
{0, 872, EIF_FALSE, 0, 0},
{0, 873, EIF_FALSE, 0, 0},
{0, 874, EIF_FALSE, 0, 0},
{0, 875, EIF_FALSE, 0, 0},
{0, 876, EIF_FALSE, 0, 0},
{0, 877, EIF_TRUE, 0, 0},
{0, 878, EIF_FALSE, 0, 0},
{0, 879, EIF_TRUE, 0, 0},
{0, 880, EIF_FALSE, 0, 0},
{0, 881, EIF_FALSE, 0, 0},
{0, 882, EIF_FALSE, 0, 0},
{0, 883, EIF_FALSE, 0, 0},
{0, 884, EIF_TRUE, 0, 0},
{0, 885, EIF_FALSE, 0, 0},
{0, 886, EIF_FALSE, 0, 0},
{0, 887, EIF_FALSE, 0, 0},
{0, 888, EIF_FALSE, 0, 0},
{0, 889, EIF_FALSE, 0, 0},
{0, 890, EIF_FALSE, 0, 0},
{0, 891, EIF_FALSE, 0, 0},
{0, 892, EIF_FALSE, 0, 0},
{0, 893, EIF_FALSE, 0, 0},
{0, 894, EIF_FALSE, 0, 0},
{0, 895, EIF_FALSE, 0, 0},
{0, 896, EIF_FALSE, 0, 0},
{0, 897, EIF_FALSE, 0, 0},
{0, 898, EIF_FALSE, 0, 0},
{0, 899, EIF_FALSE, 0, 0},
{0, 900, EIF_FALSE, 0, 0},
{0, 901, EIF_FALSE, 0, 0},
{0, 902, EIF_FALSE, 0, 0},
{0, 903, EIF_FALSE, 0, 0},
{0, 904, EIF_FALSE, 0, 0},
{0, 905, EIF_FALSE, 0, 0},
{0, 906, EIF_FALSE, 0, 0},
{0, 907, EIF_FALSE, 0, 0},
{0, 908, EIF_FALSE, 0, 0},
{0, 909, EIF_FALSE, 0, 0},
{0, 910, EIF_FALSE, 0, 0},
{0, 911, EIF_TRUE, 0, 0},
{0, 912, EIF_FALSE, 0, 0},
{0, 913, EIF_FALSE, 0, 0},
{0, 914, EIF_TRUE, 0, 0},
{0, 915, EIF_FALSE, 0, 0},
{0, 916, EIF_FALSE, 0, 0},
{0, 917, EIF_TRUE, 0, 0},
{0, 918, EIF_FALSE, 0, 0},
{0, 919, EIF_TRUE, 0, 0},
{0, 920, EIF_FALSE, 0, 0},
{0, 921, EIF_TRUE, 0, 0},
{0, 922, EIF_FALSE, 0, 0},
{0, 923, EIF_FALSE, 0, 0},
{0, 924, EIF_TRUE, 0, 0},
{0, 925, EIF_FALSE, 0, 0},
{0, 926, EIF_FALSE, 0, 0},
{0, 927, EIF_TRUE, 0, 0},
{0, 928, EIF_FALSE, 0, 0},
{0, 929, EIF_FALSE, 0, 0},
{0, 930, EIF_TRUE, 0, 0},
{0, 931, EIF_FALSE, 0, 0},
{0, 932, EIF_TRUE, 0, 0},
{0, 933, EIF_FALSE, 0, 0},
{0, 934, EIF_FALSE, 0, 0},
{0, 935, EIF_TRUE, 0, 0},
{0, 936, EIF_FALSE, 0, 0},
{0, 937, EIF_FALSE, 0, 0},
{0, 938, EIF_TRUE, 0, 0},
{0, 939, EIF_FALSE, 0, 0},
{0, 940, EIF_FALSE, 0, 0},
{0, 941, EIF_TRUE, 0, 0},
{0, 942, EIF_FALSE, 0, 0},
{0, 943, EIF_TRUE, 0, 0},
{0, 944, EIF_FALSE, 0, 0},
{0, 945, EIF_FALSE, 0, 0},
{0, 946, EIF_TRUE, 0, 0},
{0, 947, EIF_FALSE, 0, 0},
{0, 948, EIF_TRUE, 0, 0},
{0, 949, EIF_FALSE, 0, 0},
{0, 950, EIF_FALSE, 0, 0},
{0, 951, EIF_TRUE, 0, 0},
{0, 952, EIF_FALSE, 0, 0},
{0, 953, EIF_FALSE, 0, 0},
{0, 954, EIF_TRUE, 0, 0},
{0, 955, EIF_FALSE, 0, 0},
{0, 956, EIF_FALSE, 0, 0},
{0, 957, EIF_TRUE, 0, 0},
{0, 958, EIF_FALSE, 0, 0},
{0, 959, EIF_FALSE, 0, 0},
{0, 960, EIF_TRUE, 0, 0},
{0, 961, EIF_FALSE, 0, 0},
{0, 962, EIF_TRUE, 0, 0},
{0, 963, EIF_FALSE, 0, 0},
{0, 964, EIF_FALSE, 0, 0},
{0, 965, EIF_TRUE, 0, 0},
{0, 966, EIF_FALSE, 0, 0},
{0, 967, EIF_FALSE, 0, 0},
{0, 968, EIF_TRUE, 0, 0},
{0, 969, EIF_FALSE, 0, 0},
{0, 970, EIF_FALSE, 0, 0},
{0, 971, EIF_TRUE, 0, 0},
{0, 972, EIF_FALSE, 0, 0},
{0, 973, EIF_TRUE, 0, 0},
{0, 974, EIF_FALSE, 0, 0},
{0, 975, EIF_TRUE, 0, 0},
{0, 976, EIF_FALSE, 0, 0},
{0, 977, EIF_TRUE, 0, 0},
{0, 978, EIF_FALSE, 0, 0},
{0, 979, EIF_FALSE, 0, 0},
{0, 980, EIF_TRUE, 0, 0},
{0, 981, EIF_FALSE, 0, 0},
{0, 982, EIF_FALSE, 0, 0},
{0, 983, EIF_TRUE, 0, 0},
{0, 984, EIF_FALSE, 0, 0},
{0, 985, EIF_TRUE, 0, 0},
{0, 986, EIF_FALSE, 0, 0},
{0, 987, EIF_TRUE, 0, 0},
{0, 988, EIF_FALSE, 0, 0},
{0, 989, EIF_FALSE, 0, 0},
{0, 990, EIF_TRUE, 0, 0},
{0, 991, EIF_FALSE, 0, 0},
{0, 992, EIF_FALSE, 0, 0},
{0, 993, EIF_TRUE, 0, 0},
{0, 994, EIF_FALSE, 0, 0},
{0, 995, EIF_FALSE, 0, 0},
{0, 996, EIF_TRUE, 0, 0},
{0, 997, EIF_FALSE, 0, 0},
{0, 998, EIF_FALSE, 0, 0},
{0, 999, EIF_TRUE, 0, 0},
{0, 1000, EIF_FALSE, 0, 0},
{0, 1001, EIF_FALSE, 0, 0},
{0, 1002, EIF_TRUE, 0, 0},
{0, 1003, EIF_FALSE, 0, 0},
{0, 1004, EIF_FALSE, 0, 0},
{0, 1005, EIF_TRUE, 0, 0},
{0, 1006, EIF_FALSE, 0, 0},
{0, 1007, EIF_FALSE, 0, 0},
{0, 1008, EIF_TRUE, 0, 0},
{0, 1009, EIF_FALSE, 0, 0},
{0, 1010, EIF_FALSE, 0, 0},
{0, 1011, EIF_TRUE, 0, 0},
{0, 1012, EIF_FALSE, 0, 0},
{0, 1013, EIF_FALSE, 0, 0},
{0, 1014, EIF_TRUE, 0, 0},
{0, 1015, EIF_FALSE, 0, 0},
{0, 1016, EIF_TRUE, 0, 0},
{0, 1017, EIF_FALSE, 0, 0},
{0, 1018, EIF_TRUE, 0, 0},
{0, 1019, EIF_FALSE, 0, 0},
{0, 1020, EIF_FALSE, 0, 0},
{0, 1021, EIF_TRUE, 0, 0},
{0, 1022, EIF_FALSE, 0, 0},
{0, 1023, EIF_TRUE, 0, 0},
{0, 1024, EIF_FALSE, 0, 0},
{0, 1025, EIF_FALSE, 0, 0},
{0, 1026, EIF_TRUE, 0, 0},
{0, 1027, EIF_FALSE, 0, 0},
{0, 1028, EIF_FALSE, 0, 0},
{0, 1029, EIF_TRUE, 0, 0},
{0, 1030, EIF_FALSE, 0, 0},
{0, 1031, EIF_FALSE, 0, 0},
{0, 1032, EIF_TRUE, 0, 0},
{0, 1033, EIF_FALSE, 0, 0},
{0, 1034, EIF_FALSE, 0, 0},
{0, 1035, EIF_TRUE, 0, 0},
{0, 1036, EIF_FALSE, 0, 0},
{0, 1037, EIF_FALSE, 0, 0},
{0, 1038, EIF_TRUE, 0, 0},
{0, 1039, EIF_FALSE, 0, 0},
{0, 1040, EIF_FALSE, 0, 0},
{0, 1041, EIF_TRUE, 0, 0},
{0, 1042, EIF_FALSE, 0, 0},
{0, 1043, EIF_FALSE, 0, 0},
{0, 1044, EIF_TRUE, 0, 0},
{0, 1045, EIF_FALSE, 0, 0},
{0, 1046, EIF_FALSE, 0, 0},
{0, 1047, EIF_TRUE, 0, 0},
{0, 1048, EIF_FALSE, 0, 0},
{0, 1049, EIF_TRUE, 0, 0},
{0, 1050, EIF_FALSE, 0, 0},
{0, 1051, EIF_FALSE, 0, 0},
{0, 1052, EIF_TRUE, 0, 0},
{0, 1053, EIF_FALSE, 0, 0},
{0, 1054, EIF_TRUE, 0, 0},
{0, 1055, EIF_FALSE, 0, 0},
{0, 1056, EIF_FALSE, 0, 0},
{0, 1057, EIF_TRUE, 0, 0},
{0, 1058, EIF_FALSE, 0, 0},
{0, 1059, EIF_FALSE, 0, 0},
{0, 1060, EIF_TRUE, 0, 0},
{0, 1061, EIF_FALSE, 0, 0},
{0, 1062, EIF_FALSE, 0, 0},
{0, 1063, EIF_TRUE, 0, 0},
{0, 1064, EIF_FALSE, 0, 0},
{0, 1065, EIF_FALSE, 0, 0},
{0, 1066, EIF_TRUE, 0, 0},
{0, 1067, EIF_FALSE, 0, 0},
{0, 1068, EIF_TRUE, 0, 0},
{0, 1069, EIF_FALSE, 0, 0},
{0, 1070, EIF_TRUE, 0, 0},
{0, 1071, EIF_FALSE, 0, 0},
{0, 1072, EIF_FALSE, 0, 0},
{0, 1073, EIF_TRUE, 0, 0},
{0, 1074, EIF_FALSE, 0, 0},
{0, 1075, EIF_FALSE, 0, 0},
{0, 1076, EIF_TRUE, 0, 0},
{0, 1077, EIF_FALSE, 0, 0},
{0, 1078, EIF_FALSE, 0, 0},
{0, 1079, EIF_TRUE, 0, 0},
{0, 1080, EIF_FALSE, 0, 0},
{0, 1081, EIF_FALSE, 0, 0},
{0, 1082, EIF_TRUE, 0, 0},
{0, 1083, EIF_FALSE, 0, 0},
{0, 1084, EIF_TRUE, 0, 0},
{0, 1085, EIF_FALSE, 0, 0},
{0, 1086, EIF_FALSE, 0, 0},
{0, 1087, EIF_TRUE, 0, 0},
{0, 1088, EIF_FALSE, 0, 0},
{0, 1089, EIF_TRUE, 0, 0},
{0, 1090, EIF_FALSE, 0, 0},
{0, 1091, EIF_FALSE, 0, 0},
{0, 1092, EIF_TRUE, 0, 0},
{0, 1093, EIF_FALSE, 0, 0},
{0, 1094, EIF_TRUE, 0, 0},
{0, 1095, EIF_FALSE, 0, 0},
{0, 1096, EIF_FALSE, 0, 0},
{0, 1097, EIF_TRUE, 0, 0},
{0, 1098, EIF_FALSE, 0, 0},
{0, 1099, EIF_FALSE, 0, 0},
{0, 1100, EIF_TRUE, 0, 0},
{0, 1101, EIF_FALSE, 0, 0},
{0, 1102, EIF_TRUE, 0, 0},
{0, 1103, EIF_FALSE, 0, 0},
{0, 1104, EIF_FALSE, 0, 0},
{0, 1105, EIF_TRUE, 0, 0},
{0, 1106, EIF_FALSE, 0, 0},
{0, 1107, EIF_FALSE, 0, 0},
{0, 1108, EIF_TRUE, 0, 0},
{0, 1109, EIF_FALSE, 0, 0},
{0, 1110, EIF_FALSE, 0, 0},
{0, 1111, EIF_TRUE, 0, 0},
{0, 1112, EIF_FALSE, 0, 0},
{0, 1113, EIF_FALSE, 0, 0},
{0, 1114, EIF_TRUE, 0, 0},
{0, 1115, EIF_FALSE, 0, 0},
{0, 1116, EIF_FALSE, 0, 0},
{0, 1117, EIF_TRUE, 0, 0},
{0, 1118, EIF_FALSE, 0, 0},
{0, 1119, EIF_FALSE, 0, 0},
{0, 1120, EIF_TRUE, 0, 0},
{0, 1121, EIF_FALSE, 0, 0},
{0, 1122, EIF_FALSE, 0, 0},
{0, 1123, EIF_TRUE, 0, 0},
{0, 1124, EIF_FALSE, 0, 0},
{0, 1125, EIF_FALSE, 0, 0},
{0, 1126, EIF_TRUE, 0, 0},
{0, 1127, EIF_FALSE, 0, 0},
{0, 1128, EIF_TRUE, 0, 0},
{0, 1129, EIF_FALSE, 0, 0},
{0, 1130, EIF_TRUE, 0, 0},
{0, 1131, EIF_FALSE, 0, 0},
{0, 1132, EIF_FALSE, 0, 0},
{0, 1133, EIF_TRUE, 0, 0},
{0, 1134, EIF_FALSE, 0, 0},
{0, 1135, EIF_FALSE, 0, 0},
{0, 1136, EIF_TRUE, 0, 0},
{0, 1137, EIF_FALSE, 0, 0},
{0, 1138, EIF_FALSE, 0, 0},
{0, 1139, EIF_TRUE, 0, 0},
{0, 1140, EIF_FALSE, 0, 0},
{0, 1141, EIF_TRUE, 0, 0},
{0, 1142, EIF_FALSE, 0, 0},
{0, 1143, EIF_FALSE, 0, 0},
{0, 1144, EIF_TRUE, 0, 0},
{0, 1145, EIF_FALSE, 0, 0},
{0, 1146, EIF_FALSE, 0, 0},
{0, 1147, EIF_TRUE, 0, 0},
{0, 1148, EIF_FALSE, 0, 0},
{0, 1149, EIF_FALSE, 0, 0},
{0, 1150, EIF_TRUE, 0, 0},
{0, 1151, EIF_FALSE, 0, 0},
{0, 1152, EIF_FALSE, 0, 0},
{0, 1153, EIF_TRUE, 0, 0},
{0, 1154, EIF_FALSE, 0, 0},
{0, 1155, EIF_TRUE, 0, 0},
{0, 1156, EIF_FALSE, 0, 0},
{0, 1157, EIF_FALSE, 0, 0},
{0, 1158, EIF_TRUE, 0, 0},
{0, 1159, EIF_FALSE, 0, 0},
{0, 1160, EIF_FALSE, 0, 0},
{0, 1161, EIF_TRUE, 0, 0},
{0, 1162, EIF_FALSE, 0, 0},
{0, 1163, EIF_TRUE, 0, 0},
{0, 1164, EIF_FALSE, 0, 0},
{0, 1165, EIF_TRUE, 0, 0},
{0, 1166, EIF_FALSE, 0, 0},
{0, 1167, EIF_TRUE, 0, 0},
{0, 1168, EIF_FALSE, 0, 0},
{0, 1169, EIF_TRUE, 0, 0},
{0, 1170, EIF_FALSE, 0, 0},
{0, 1171, EIF_FALSE, 0, 0},
{0, 1172, EIF_TRUE, 0, 0},
{0, 1173, EIF_FALSE, 0, 0},
{0, 1174, EIF_FALSE, 0, 0},
{0, 1175, EIF_TRUE, 0, 0},
{0, 1176, EIF_FALSE, 0, 0},
{0, 1177, EIF_TRUE, 0, 0},
{0, 1178, EIF_FALSE, 0, 0},
{0, 1179, EIF_FALSE, 0, 0},
{0, 1180, EIF_TRUE, 0, 0},
{0, 1181, EIF_FALSE, 0, 0},
{0, 1182, EIF_FALSE, 0, 0},
{0, 1183, EIF_TRUE, 0, 0},
{0, 1184, EIF_FALSE, 0, 0},
{0, 1185, EIF_FALSE, 0, 0},
{0, 1186, EIF_TRUE, 0, 0},
{0, 1187, EIF_FALSE, 0, 0},
{0, 1188, EIF_FALSE, 0, 0},
{0, 1189, EIF_TRUE, 0, 0},
{0, 1190, EIF_FALSE, 0, 0},
{0, 1191, EIF_FALSE, 0, 0},
{0, 1192, EIF_TRUE, 0, 0},
{0, 1193, EIF_FALSE, 0, 0},
{0, 1194, EIF_FALSE, 0, 0},
{0, 1195, EIF_TRUE, 0, 0},
{0, 1196, EIF_FALSE, 0, 0},
{0, 1197, EIF_FALSE, 0, 0},
{0, 1198, EIF_TRUE, 0, 0},
{0, 1199, EIF_FALSE, 0, 0},
{0, 1200, EIF_TRUE, 0, 0},
{0, 1201, EIF_FALSE, 0, 0},
{0, 1202, EIF_FALSE, 0, 0},
{0, 1203, EIF_FALSE, 0, 0},
{0, 1204, EIF_FALSE, 0, 0},
{0, 1205, EIF_FALSE, 0, 0},
{0, 1206, EIF_FALSE, 0, 0},
{0, 1207, EIF_FALSE, 0, 0},
{0, 1208, EIF_FALSE, 0, 0},
{0, 1209, EIF_FALSE, 0, 0},
{0, 1210, EIF_FALSE, 0, 0},
{0, 1211, EIF_FALSE, 0, 0},
{0, 1212, EIF_FALSE, 0, 0},
{0, 1213, EIF_FALSE, 0, 0},
{0, 1214, EIF_FALSE, 0, 0},
{0, 1215, EIF_FALSE, 0, 0},
{0, 1216, EIF_FALSE, 0, 0},
{0, 1217, EIF_FALSE, 0, 0},
{0, 1218, EIF_FALSE, 0, 0},
{0, 1219, EIF_FALSE, 0, 0},
{0, 1220, EIF_FALSE, 0, 0},
{0, 1221, EIF_FALSE, 0, 0},
{0, 1222, EIF_FALSE, 0, 0},
{0, 1223, EIF_FALSE, 0, 0},
{0, 1224, EIF_FALSE, 0, 0},
{0, 1225, EIF_FALSE, 0, 0},
{0, 1226, EIF_FALSE, 0, 0},
{0, 1227, EIF_FALSE, 0, 0},
{0, 1228, EIF_FALSE, 0, 0},
{0, 1229, EIF_FALSE, 0, 0},
{1663, 1230, EIF_FALSE, 0, 0},
{0, 1231, EIF_FALSE, 0, 0},
{0, 1232, EIF_FALSE, 0, 0},
{0, 1233, EIF_FALSE, 0, 0},
{0, 1234, EIF_FALSE, 0, 0},
{0, 1235, EIF_FALSE, 0, 0},
{0, 1236, EIF_FALSE, 0, 0},
{0, 1237, EIF_FALSE, 0, 0},
{0, 1238, EIF_FALSE, 0, 0},
{0, 1239, EIF_FALSE, 0, 0},
{0, 1240, EIF_FALSE, 0, 0},
{0, 1241, EIF_FALSE, 0, 0},
{0, 1242, EIF_FALSE, 0, 0},
{0, 1243, EIF_FALSE, 0, 0},
{0, 1244, EIF_FALSE, 0, 0},
{0, 1245, EIF_FALSE, 0, 0},
{0, 1246, EIF_FALSE, 0, 0},
{0, 1247, EIF_FALSE, 0, 0},
{0, 1248, EIF_FALSE, 0, 0},
{0, 1249, EIF_FALSE, 0, 0},
{0, 1250, EIF_FALSE, 0, 0},
{0, 1251, EIF_FALSE, 0, 0},
{0, 1252, EIF_FALSE, 0, 0},
{0, 1253, EIF_FALSE, 0, 0},
{0, 1254, EIF_FALSE, 0, 0},
{0, 1255, EIF_FALSE, 0, 0},
{0, 1256, EIF_FALSE, 0, 0},
{0, 1257, EIF_FALSE, 0, 0},
{0, 1258, EIF_FALSE, 0, 0},
{0, 1259, EIF_FALSE, 0, 0},
{0, 1260, EIF_FALSE, 0, 0},
{0, 1261, EIF_FALSE, 0, 0},
{0, 1262, EIF_FALSE, 0, 0},
{0, 1263, EIF_FALSE, 0, 0},
{0, 1264, EIF_FALSE, 0, 0},
{0, 1265, EIF_FALSE, 0, 0},
{0, 1266, EIF_FALSE, 0, 0},
{0, 1267, EIF_FALSE, 0, 0},
{0, 1268, EIF_FALSE, 0, 0},
{0, 1269, EIF_FALSE, 0, 0},
{0, 1270, EIF_FALSE, 0, 0},
{0, 1271, EIF_FALSE, 0, 0},
{0, 1272, EIF_FALSE, 0, 0},
{0, 1273, EIF_FALSE, 0, 0},
{0, 1274, EIF_FALSE, 0, 0},
{0, 1275, EIF_FALSE, 0, 0},
{0, 1276, EIF_FALSE, 0, 0},
{0, 1277, EIF_FALSE, 0, 0},
{0, 1278, EIF_FALSE, 0, 0},
{0, 1279, EIF_FALSE, 0, 0},
{0, 1280, EIF_FALSE, 0, 0},
{0, 1281, EIF_FALSE, 0, 0},
{0, 1282, EIF_FALSE, 0, 0},
{0, 1283, EIF_FALSE, 0, 0},
{0, 1284, EIF_FALSE, 0, 0},
{0, 1285, EIF_FALSE, 0, 0},
{0, 1286, EIF_FALSE, 0, 0},
{0, 1287, EIF_FALSE, 0, 0},
{0, 1288, EIF_FALSE, 0, 0},
{0, 1289, EIF_FALSE, 0, 0},
{0, 1290, EIF_FALSE, 0, 0},
{0, 1291, EIF_FALSE, 0, 0},
{0, 1292, EIF_FALSE, 0, 0},
{0, 1293, EIF_FALSE, 0, 0},
{0, 1294, EIF_FALSE, 0, 0},
{0, 1295, EIF_FALSE, 0, 0},
{0, 1296, EIF_FALSE, 0, 0},
{0, 1297, EIF_FALSE, 0, 0},
{0, 1298, EIF_FALSE, 0, 0},
{0, 1299, EIF_FALSE, 0, 0},
{0, 1300, EIF_FALSE, 0, 0},
{0, 1301, EIF_FALSE, 0, 0},
{0, 1302, EIF_FALSE, 0, 0},
{0, 1303, EIF_FALSE, 0, 0},
{0, 1304, EIF_FALSE, 0, 0},
{0, 1305, EIF_FALSE, 0, 0},
{0, 1306, EIF_FALSE, 0, 0},
{0, 1307, EIF_FALSE, 0, 0},
{0, 1308, EIF_FALSE, 0, 0},
{0, 1309, EIF_FALSE, 0, 0},
{0, 1310, EIF_FALSE, 0, 0},
{0, 1311, EIF_FALSE, 0, 0},
{0, 1312, EIF_FALSE, 0, 0},
{0, 1313, EIF_FALSE, 0, 0},
{0, 1314, EIF_FALSE, 0, 0},
{0, 1315, EIF_FALSE, 0, 0},
{0, 1316, EIF_FALSE, 0, 0},
{0, 1317, EIF_FALSE, 0, 0},
{0, 1318, EIF_FALSE, 0, 0},
{0, 1319, EIF_FALSE, 0, 0},
{0, 1320, EIF_FALSE, 0, 0},
{0, 1321, EIF_TRUE, 0, 0},
{0, 1322, EIF_FALSE, 0, 0},
{0, 1323, EIF_FALSE, 0, 0},
{0, 1324, EIF_FALSE, 0, 0},
{0, 1325, EIF_FALSE, 0, 0},
{0, 1326, EIF_FALSE, 0, 0},
{0, 1327, EIF_FALSE, 0, 0},
{0, 1328, EIF_FALSE, 0, 0},
{0, 1329, EIF_TRUE, 0, 0},
{0, 1330, EIF_FALSE, 0, 0},
{0, 1331, EIF_FALSE, 0, 0},
{0, 1332, EIF_FALSE, 0, 0},
{0, 1333, EIF_FALSE, 0, 0},
{0, 1334, EIF_FALSE, 0, 0},
{0, 1335, EIF_TRUE, 0, 0},
{0, 1336, EIF_FALSE, 0, 0},
{0, 1337, EIF_FALSE, 0, 0},
{0, 1338, EIF_FALSE, 0, 0},
{0, 1339, EIF_FALSE, 0, 0},
{0, 1340, EIF_FALSE, 0, 0},
{0, 1341, EIF_FALSE, 0, 0},
{0, 1342, EIF_FALSE, 0, 0},
{0, 1343, EIF_FALSE, 0, 0},
{0, 1344, EIF_FALSE, 0, 0},
{0, 1345, EIF_FALSE, 0, 0},
{0, 1346, EIF_FALSE, 0, 0},
{0, 1347, EIF_FALSE, 0, 0},
{0, 1348, EIF_FALSE, 0, 0},
{0, 1349, EIF_FALSE, 0, 0},
{0, 1350, EIF_FALSE, 0, 0},
{0, 1351, EIF_FALSE, 0, 0},
{0, 1352, EIF_TRUE, 0, 0},
{0, 1353, EIF_FALSE, 0, 0},
{0, 1354, EIF_FALSE, 0, 0},
{0, 1355, EIF_FALSE, 0, 0},
{0, 1356, EIF_FALSE, 0, 0},
{0, 1357, EIF_TRUE, 0, 0},
{0, 1358, EIF_FALSE, 0, 0},
{0, 1359, EIF_FALSE, 0, 0},
{0, 1360, EIF_FALSE, 0, 0},
{0, 1361, EIF_FALSE, 0, 0},
{0, 1362, EIF_FALSE, 0, 0},
{0, 1363, EIF_FALSE, 0, 0},
{0, 1364, EIF_FALSE, 0, 0},
{0, 1365, EIF_FALSE, 0, 0},
{0, 1366, EIF_FALSE, 0, 0},
{0, 1367, EIF_FALSE, 0, 0},
{0, 1368, EIF_FALSE, 0, 0},
{0, 1369, EIF_TRUE, 0, 0},
{0, 1370, EIF_FALSE, 0, 0},
{0, 1371, EIF_FALSE, 0, 0},
{0, 1372, EIF_TRUE, 0, 0},
{0, 1373, EIF_FALSE, 0, 0},
{0, 1374, EIF_FALSE, 0, 0},
{0, 1375, EIF_FALSE, 0, 0},
{0, 1376, EIF_FALSE, 0, 0},
{0, 1377, EIF_TRUE, 0, 0},
{0, 1378, EIF_TRUE, 0, 0},
{0, 1379, EIF_FALSE, 0, 0},
{0, 1380, EIF_FALSE, 0, 0},
{0, 1381, EIF_TRUE, 0, 0},
{0, 1382, EIF_FALSE, 0, 0},
{0, 1383, EIF_TRUE, 0, 0},
{0, 1384, EIF_FALSE, 0, 0},
{0, 1385, EIF_FALSE, 0, 0},
{0, 1386, EIF_FALSE, 0, 0},
{0, 1387, EIF_FALSE, 0, 0},
{0, 1388, EIF_FALSE, 0, 0},
{0, 1389, EIF_FALSE, 0, 0},
{0, 1390, EIF_FALSE, 0, 0},
{0, 1391, EIF_FALSE, 0, 0},
{0, 1392, EIF_FALSE, 0, 0},
{0, 1393, EIF_FALSE, 0, 0},
{0, 1394, EIF_FALSE, 0, 0},
{0, 1395, EIF_FALSE, 0, 0},
{0, 1396, EIF_FALSE, 0, 0},
{0, 1397, EIF_FALSE, 0, 0},
{0, 1398, EIF_FALSE, 0, 0},
{0, 1399, EIF_FALSE, 0, 0},
{0, 1400, EIF_FALSE, 0, 0},
{0, 1401, EIF_FALSE, 0, 0},
{0, 1402, EIF_FALSE, 0, 0},
{0, 1403, EIF_FALSE, 0, 0},
{0, 1404, EIF_FALSE, 0, 0},
{0, 1405, EIF_FALSE, 0, 0},
{0, 1406, EIF_FALSE, 0, 0},
{0, 1407, EIF_FALSE, 0, 0},
{0, 1408, EIF_FALSE, 0, 0},
{0, 1409, EIF_FALSE, 0, 0},
{0, 1410, EIF_FALSE, 0, 0},
{0, 1411, EIF_FALSE, 0, 0},
{0, 1412, EIF_FALSE, 0, 0},
{0, 1413, EIF_FALSE, 0, 0},
{0, 1414, EIF_FALSE, 0, 0},
{0, 1415, EIF_FALSE, 0, 0},
{0, 1416, EIF_FALSE, 0, 0},
{0, 1417, EIF_FALSE, 0, 0},
{0, 1418, EIF_FALSE, 0, 0},
{0, 1419, EIF_FALSE, 0, 0},
{0, 1420, EIF_FALSE, 0, 0},
{0, 1421, EIF_FALSE, 0, 0},
{0, 1422, EIF_FALSE, 0, 0},
{0, 1423, EIF_FALSE, 0, 0},
{0, 1424, EIF_FALSE, 0, 0},
{0, 1425, EIF_FALSE, 0, 0},
{0, 1426, EIF_FALSE, 0, 0},
{0, 1427, EIF_FALSE, 0, 0},
{0, 1428, EIF_FALSE, 0, 0},
{0, 1429, EIF_FALSE, 0, 0},
{0, 1430, EIF_FALSE, 0, 0},
{0, 1431, EIF_FALSE, 0, 0},
{0, 1432, EIF_FALSE, 0, 0},
{0, 1433, EIF_FALSE, 0, 0},
{0, 1434, EIF_FALSE, 0, 0},
{0, 1435, EIF_FALSE, 0, 0},
{0, 1436, EIF_FALSE, 0, 0},
{0, 1437, EIF_FALSE, 0, 0},
{0, 1438, EIF_FALSE, 0, 0},
{0, 1439, EIF_FALSE, 0, 0},
{0, 1440, EIF_FALSE, 0, 0},
{0, 1441, EIF_FALSE, 0, 0},
{0, 1442, EIF_FALSE, 0, 0},
{0, 1443, EIF_FALSE, 0, 0},
{0, 1444, EIF_FALSE, 0, 0},
{0, 1445, EIF_FALSE, 0, 0},
{0, 1446, EIF_FALSE, 0, 0},
{0, 1447, EIF_TRUE, 0, 0},
{0, 1448, EIF_TRUE, 0, 0},
{0, 1449, EIF_FALSE, 0, 0},
{0, 1450, EIF_FALSE, 0, 0},
{0, 1451, EIF_FALSE, 0, 0},
{0, 1452, EIF_FALSE, 0, 0},
{0, 1453, EIF_FALSE, 0, 0},
{0, 1454, EIF_FALSE, 0, 0},
{0, 1455, EIF_FALSE, 0, 0},
{0, 1456, EIF_FALSE, 0, 0},
{0, 1457, EIF_FALSE, 0, 0},
{0, 1458, EIF_FALSE, 0, 0},
{0, 1459, EIF_FALSE, 0, 0},
{0, 1460, EIF_FALSE, 0, 0},
{0, 1461, EIF_FALSE, 0, 0},
{0, 1462, EIF_FALSE, 0, 0},
{0, 1463, EIF_FALSE, 0, 0},
{0, 1464, EIF_FALSE, 0, 0},
{0, 1465, EIF_FALSE, 0, 0},
{0, 1466, EIF_FALSE, 0, 0},
{0, 1467, EIF_TRUE, 0, 0},
{0, 1468, EIF_FALSE, 0, 0},
{0, 1469, EIF_FALSE, 0, 0},
{0, 1470, EIF_FALSE, 0, 0},
{0, 1471, EIF_FALSE, 0, 0},
{0, 1472, EIF_FALSE, 0, 0},
{0, 1473, EIF_FALSE, 0, 0},
{0, 1474, EIF_FALSE, 0, 0},
{0, 1475, EIF_TRUE, 0, 0},
{0, 1476, EIF_FALSE, 0, 0},
{0, 1477, EIF_FALSE, 0, 0},
{0, 1478, EIF_TRUE, 0, 0},
{0, 1479, EIF_FALSE, 0, 0},
{0, 1480, EIF_FALSE, 0, 0},
{0, 1481, EIF_FALSE, 0, 0},
{0, 1482, EIF_FALSE, 0, 0},
{0, 1483, EIF_FALSE, 0, 0},
{0, 1484, EIF_TRUE, 0, 0},
{0, 1485, EIF_FALSE, 0, 0},
{0, 1486, EIF_TRUE, 0, 0},
{0, 1487, EIF_FALSE, 0, 0},
{0, 1488, EIF_TRUE, 0, 0},
{0, 1489, EIF_FALSE, 0, 0},
{0, 1490, EIF_FALSE, 0, 0},
{0, 1491, EIF_FALSE, 0, 0},
{0, 1492, EIF_FALSE, 0, 0},
{0, 1493, EIF_FALSE, 0, 0},
{0, 1494, EIF_FALSE, 0, 0},
{0, 1495, EIF_FALSE, 0, 0},
{0, 1496, EIF_FALSE, 0, 0},
{0, 1497, EIF_FALSE, 0, 0},
{0, 1498, EIF_TRUE, 0, 0},
{0, 1499, EIF_FALSE, 0, 0},
{0, 1500, EIF_FALSE, 0, 0},
{0, 1501, EIF_FALSE, 0, 0},
{0, 1502, EIF_FALSE, 0, 0},
{0, 1503, EIF_FALSE, 0, 0},
{0, 1504, EIF_FALSE, 0, 0},
{0, 1505, EIF_TRUE, 0, 0},
{0, 1506, EIF_FALSE, 0, 0},
{0, 1507, EIF_FALSE, 0, 0},
{0, 1508, EIF_FALSE, 0, 0},
{0, 1509, EIF_FALSE, 0, 0},
{0, 1510, EIF_TRUE, 0, 0},
{0, 1511, EIF_FALSE, 0, 0},
{0, 1512, EIF_FALSE, 0, 0},
{0, 1513, EIF_FALSE, 0, 0},
{0, 1514, EIF_FALSE, 0, 0},
{0, 1515, EIF_FALSE, 0, 0},
{0, 1516, EIF_FALSE, 0, 0},
{0, 1517, EIF_FALSE, 0, 0},
{0, 1518, EIF_FALSE, 0, 0},
{0, 1519, EIF_FALSE, 0, 0},
{0, 1520, EIF_FALSE, 0, 0},
{0, 1521, EIF_FALSE, 0, 0},
{0, 1522, EIF_FALSE, 0, 0},
{0, 1523, EIF_FALSE, 0, 0},
{0, 1524, EIF_FALSE, 0, 0},
{0, 1525, EIF_FALSE, 0, 0},
{0, 1526, EIF_FALSE, 0, 0},
{0, 1527, EIF_FALSE, 0, 0},
{0, 1528, EIF_FALSE, 0, 0},
{0, 1529, EIF_FALSE, 0, 0},
{0, 1530, EIF_FALSE, 0, 0},
{0, 1531, EIF_FALSE, 0, 0},
{0, 1532, EIF_FALSE, 0, 0},
{0, 1533, EIF_FALSE, 0, 0},
{0, 1534, EIF_FALSE, 0, 0},
{0, 1535, EIF_FALSE, 0, 0},
{0, 1536, EIF_FALSE, 0, 0},
{0, 1537, EIF_FALSE, 0, 0},
{0, 1538, EIF_FALSE, 0, 0},
{0, 1539, EIF_FALSE, 0, 0},
{0, 1540, EIF_FALSE, 0, 0},
{0, 1541, EIF_TRUE, 0, 0},
{0, 1542, EIF_FALSE, 0, 0},
{0, 1543, EIF_TRUE, 0, 0},
{0, 1544, EIF_FALSE, 0, 0},
{0, 1545, EIF_FALSE, 0, 0},
{0, 1546, EIF_FALSE, 0, 0},
{0, 1547, EIF_FALSE, 0, 0},
{0, 1548, EIF_FALSE, 0, 0},
{0, 1549, EIF_FALSE, 0, 0},
{0, 1550, EIF_FALSE, 0, 0},
{0, 1551, EIF_FALSE, 0, 0},
{0, 1552, EIF_FALSE, 0, 0},
{0, 1553, EIF_FALSE, 0, 0},
{0, 1554, EIF_FALSE, 0, 0},
{0, 1555, EIF_FALSE, 0, 0},
{0, 1556, EIF_FALSE, 0, 0},
{0, 1557, EIF_FALSE, 0, 0},
{0, 1558, EIF_FALSE, 0, 0},
{0, 1559, EIF_FALSE, 0, 0},
{0, 1560, EIF_FALSE, 0, 0},
{0, 1561, EIF_FALSE, 0, 0},
{0, 1562, EIF_FALSE, 0, 0},
{0, 1563, EIF_FALSE, 0, 0},
{0, 1564, EIF_FALSE, 0, 0},
{0, 1565, EIF_FALSE, 0, 0},
{0, 1566, EIF_FALSE, 0, 0},
{0, 1567, EIF_FALSE, 0, 0},
{0, 1568, EIF_FALSE, 0, 0},
{0, 1569, EIF_FALSE, 0, 0},
{0, 1570, EIF_FALSE, 0, 0},
{0, 1571, EIF_FALSE, 0, 0},
{0, 1572, EIF_FALSE, 0, 0},
{0, 1573, EIF_FALSE, 0, 0},
{0, 1574, EIF_FALSE, 0, 0},
{0, 1575, EIF_FALSE, 0, 0},
{0, 1576, EIF_FALSE, 0, 0},
{0, 1577, EIF_FALSE, 0, 0},
{0, 1578, EIF_FALSE, 0, 0},
{0, 1579, EIF_FALSE, 0, 0},
{0, 1580, EIF_FALSE, 0, 0},
{0, 1581, EIF_FALSE, 0, 0},
{0, 1582, EIF_FALSE, 0, 0},
{0, 1583, EIF_FALSE, 0, 0},
{0, 1584, EIF_FALSE, 0, 0},
{0, 1585, EIF_FALSE, 0, 0},
{0, 1586, EIF_FALSE, 0, 0},
{0, 1587, EIF_FALSE, 0, 0},
{0, 1588, EIF_FALSE, 0, 0},
{0, 1589, EIF_FALSE, 0, 0},
{0, 1590, EIF_FALSE, 0, 0},
{0, 1591, EIF_FALSE, 0, 0},
{0, 1592, EIF_FALSE, 0, 0},
{0, 1593, EIF_FALSE, 0, 0},
{0, 1594, EIF_FALSE, 0, 0},
{0, 1595, EIF_FALSE, 0, 0},
{0, 1596, EIF_FALSE, 0, 0},
{0, 1597, EIF_FALSE, 0, 0},
{0, 1598, EIF_FALSE, 0, 0},
{0, 1599, EIF_FALSE, 0, 0},
{0, 1600, EIF_FALSE, 0, 0},
{0, 1601, EIF_FALSE, 0, 0},
{0, 1602, EIF_FALSE, 0, 0},
{0, 1603, EIF_FALSE, 0, 0},
{0, 1604, EIF_FALSE, 0, 0},
{0, 1605, EIF_FALSE, 0, 0},
{0, 1606, EIF_FALSE, 0, 0},
{0, 1607, EIF_FALSE, 0, 0},
{0, 1608, EIF_FALSE, 0, 0},
{0, 1609, EIF_FALSE, 0, 0},
{0, 1610, EIF_FALSE, 0, 0},
{0, 1611, EIF_FALSE, 0, 0},
{0, 1612, EIF_FALSE, 0, 0},
{0, 1613, EIF_FALSE, 0, 0},
{0, 1614, EIF_FALSE, 0, 0},
{0, 1615, EIF_TRUE, 0, 0},
{0, 1616, EIF_FALSE, 0, 0},
{0, 1617, EIF_FALSE, 0, 0},
{0, 1618, EIF_TRUE, 0, 0},
{0, 1619, EIF_TRUE, 0, 0},
{0, 1620, EIF_FALSE, 0, 0},
{0, 1621, EIF_FALSE, 0, 0},
{0, 1622, EIF_TRUE, 0, 0},
{0, 1623, EIF_FALSE, 0, 0},
{0, 1624, EIF_FALSE, 0, 0},
{0, 1625, EIF_TRUE, 0, 0},
{0, 1626, EIF_FALSE, 0, 0},
{0, 1627, EIF_FALSE, 0, 0},
{0, 1628, EIF_FALSE, 0, 0},
{0, 1629, EIF_TRUE, 0, 0},
{0, 1630, EIF_FALSE, 0, 0},
{0, 1631, EIF_FALSE, 0, 0},
{0, 1632, EIF_TRUE, 0, 0},
{0, 1633, EIF_FALSE, 0, 0},
{0, 1634, EIF_FALSE, 0, 0},
{0, 1635, EIF_TRUE, 0, 0},
{0, 1636, EIF_FALSE, 0, 0},
{0, 1637, EIF_FALSE, 0, 0},
{0, 1638, EIF_TRUE, 0, 0},
{0, 1639, EIF_FALSE, 0, 0},
{0, 1640, EIF_FALSE, 0, 0},
{0, 1641, EIF_TRUE, 0, 0},
{0, 1642, EIF_FALSE, 0, 0},
{0, 1643, EIF_FALSE, 0, 0},
{0, 1644, EIF_TRUE, 0, 0},
{0, 1645, EIF_FALSE, 0, 0},
{0, 1646, EIF_FALSE, 0, 0},
{0, 1647, EIF_FALSE, 0, 0},
{0, 1648, EIF_FALSE, 0, 0},
{0, 1649, EIF_FALSE, 0, 0},
{0, 1650, EIF_FALSE, 0, 0},
{0, 1651, EIF_TRUE, 0, 0},
{0, 1652, EIF_FALSE, 0, 0},
{0, 1653, EIF_FALSE, 0, 0},
{0, 1654, EIF_FALSE, 0, 0},
{0, 1655, EIF_FALSE, 0, 0},
{0, 1656, EIF_FALSE, 0, 0},
{0, 1657, EIF_FALSE, 0, 0},
{0, 1658, EIF_FALSE, 0, 0},
{0, 1659, EIF_FALSE, 0, 0},
{0, 1660, EIF_TRUE, 0, 0},
{0, 1661, EIF_FALSE, 0, 0},
{0, 1662, EIF_FALSE, 0, 0},
{0, 1663, EIF_FALSE, 0, 0},
{0, 1664, EIF_FALSE, 0, 0},
{0, 1665, EIF_TRUE, 0, 0},
{0, 1666, EIF_FALSE, 0, 0},
{0, 1667, EIF_FALSE, 0, 0},
{0, 1668, EIF_FALSE, 0, 0},
{0, 1669, EIF_FALSE, 0, 0},
{0, 1670, EIF_FALSE, 0, 0},
{0, 1671, EIF_FALSE, 0, 0},
{0, 1672, EIF_FALSE, 0, 0},
{0, 1673, EIF_FALSE, 0, 0},
{0, 1674, EIF_TRUE, 0, 0},
{0, 1675, EIF_FALSE, 0, 0},
{0, 1676, EIF_FALSE, 0, 0},
{0, 1677, EIF_FALSE, 0, 0},
{0, 1678, EIF_FALSE, 0, 0},
{0, 1679, EIF_FALSE, 0, 0},
{0, 1680, EIF_TRUE, 0, 0},
{0, 1681, EIF_FALSE, 0, 0},
{0, 1682, EIF_TRUE, 0, 0},
{0, 1683, EIF_FALSE, 0, 0},
{0, 1684, EIF_FALSE, 0, 0},
{0, 1685, EIF_TRUE, 0, 0},
{0, 1686, EIF_FALSE, 0, 0},
{0, 1687, EIF_FALSE, 0, 0},
{0, 1688, EIF_FALSE, 0, 0},
{0, 1689, EIF_FALSE, 0, 0},
{0, 1690, EIF_FALSE, 0, 0},
{0, 1691, EIF_FALSE, 0, 0},
{0, 1692, EIF_FALSE, 0, 0},
{0, 1693, EIF_FALSE, 0, 0},
{0, 1694, EIF_FALSE, 0, 0},
{0, 1695, EIF_FALSE, 0, 0},
{0, 1696, EIF_FALSE, 0, 0},
{0, 1697, EIF_TRUE, 0, 0},
{0, 1698, EIF_FALSE, 0, 0},
{0, 1699, EIF_FALSE, 0, 0},
{0, 1700, EIF_FALSE, 0, 0},
{0, 1701, EIF_FALSE, 0, 0},
{0, 1702, EIF_FALSE, 0, 0},
{0, 1703, EIF_FALSE, 0, 0},
{0, 1704, EIF_FALSE, 0, 0},
{0, 1705, EIF_FALSE, 0, 0},
{0, 1706, EIF_FALSE, 0, 0},
{0, 1707, EIF_FALSE, 0, 0},
{0, 1708, EIF_FALSE, 0, 0},
{0, 1709, EIF_FALSE, 0, 0},
{0, 1710, EIF_FALSE, 0, 0},
{0, 1711, EIF_FALSE, 0, 0},
{0, 1712, EIF_TRUE, 0, 0},
{0, 1713, EIF_FALSE, 0, 0},
{0, 1714, EIF_FALSE, 0, 0},
{0, 1715, EIF_FALSE, 0, 0},
{0, 1716, EIF_FALSE, 0, 0},
{0, 1717, EIF_FALSE, 0, 0},
{0, 1718, EIF_FALSE, 0, 0},
{0, 1719, EIF_FALSE, 0, 0},
{0, 1720, EIF_FALSE, 0, 0},
{0, 1721, EIF_FALSE, 0, 0},
{0, 1722, EIF_FALSE, 0, 0},
{0, 1723, EIF_FALSE, 0, 0},
{0, 1724, EIF_FALSE, 0, 0},
{0, 1725, EIF_FALSE, 0, 0},
{0, 1726, EIF_FALSE, 0, 0},
{0, 1727, EIF_FALSE, 0, 0},
{0, 1728, EIF_FALSE, 0, 0},
{0, 1729, EIF_FALSE, 0, 0},
{0, 1730, EIF_FALSE, 0, 0},
{0, 1731, EIF_FALSE, 0, 0},
{0, 1732, EIF_FALSE, 0, 0},
{0, 1733, EIF_FALSE, 0, 0},
{0, 1734, EIF_FALSE, 0, 0},
{0, 1735, EIF_FALSE, 0, 0},
{0, 1736, EIF_FALSE, 0, 0},
{0, 1737, EIF_FALSE, 0, 0},
{0, 1738, EIF_FALSE, 0, 0},
{0, 1739, EIF_FALSE, 0, 0},
{0, 1740, EIF_FALSE, 0, 0},
{0, 1741, EIF_FALSE, 0, 0},
{0, 1742, EIF_FALSE, 0, 0},
{0, 1743, EIF_FALSE, 0, 0},
{0, 1744, EIF_FALSE, 0, 0},
{0, 1745, EIF_TRUE, 0, 0},
{0, 1746, EIF_FALSE, 0, 0},
{0, 1747, EIF_FALSE, 0, 0},
{0, 1748, EIF_FALSE, 0, 0},
{0, 1749, EIF_FALSE, 0, 0},
{0, 1750, EIF_FALSE, 0, 0},
{0, 1751, EIF_FALSE, 0, 0},
{0, 1752, EIF_FALSE, 0, 0},
{0, 1753, EIF_FALSE, 0, 0},
{0, 1754, EIF_TRUE, 0, 0},
{0, 1755, EIF_FALSE, 0, 0},
{0, 1756, EIF_FALSE, 0, 0},
{0, 1757, EIF_TRUE, 0, 0},
{0, 1758, EIF_FALSE, 0, 0},
{0, 1759, EIF_FALSE, 0, 0},
{0, 1760, EIF_FALSE, 0, 0},
{0, 1761, EIF_FALSE, 0, 0},
{0, 1762, EIF_FALSE, 0, 0},
{0, 1763, EIF_FALSE, 0, 0},
{0, 1764, EIF_FALSE, 0, 0},
{0, 1765, EIF_FALSE, 0, 0},
{0, 1766, EIF_FALSE, 0, 0},
{0, 1767, EIF_FALSE, 0, 0},
{0, 1768, EIF_FALSE, 0, 0},
{0, 1769, EIF_TRUE, 0, 0},
{0, 1770, EIF_FALSE, 0, 0},
{0, 1771, EIF_FALSE, 0, 0},
{0, 1772, EIF_FALSE, 0, 0},
{0, 1773, EIF_FALSE, 0, 0},
{0, 1774, EIF_FALSE, 0, 0},
{0, 1775, EIF_FALSE, 0, 0},
{0, 1776, EIF_FALSE, 0, 0},
{0, 1777, EIF_FALSE, 0, 0},
{0, 1778, EIF_FALSE, 0, 0},
{0, 1779, EIF_FALSE, 0, 0},
{0, 1780, EIF_FALSE, 0, 0},
{0, 1781, EIF_FALSE, 0, 0},
{0, 1782, EIF_FALSE, 0, 0},
{0, 1783, EIF_FALSE, 0, 0},
{0, 1784, EIF_FALSE, 0, 0},
{0, 1785, EIF_TRUE, 0, 0},
{0, 1786, EIF_FALSE, 0, 0},
{0, 1787, EIF_FALSE, 0, 0},
{0, 1788, EIF_FALSE, 0, 0},
{0, 1789, EIF_FALSE, 0, 0},
{0, 1790, EIF_FALSE, 0, 0},
{0, 1791, EIF_FALSE, 0, 0},
{0, 1792, EIF_FALSE, 0, 0},
{0, 1793, EIF_FALSE, 0, 0},
{0, 1794, EIF_FALSE, 0, 0},
{0, 1795, EIF_FALSE, 0, 0},
{0, 1796, EIF_FALSE, 0, 0},
{0, 1797, EIF_FALSE, 0, 0},
{0, 1798, EIF_FALSE, 0, 0},
{0, 1799, EIF_FALSE, 0, 0},
{0, 1800, EIF_FALSE, 0, 0},
{0, 1801, EIF_FALSE, 0, 0},
{0, 1802, EIF_FALSE, 0, 0},
{0, 1803, EIF_FALSE, 0, 0},
{0, 1804, EIF_FALSE, 0, 0},
{0, 1805, EIF_FALSE, 0, 0},
{0, 1806, EIF_FALSE, 0, 0},
{0, 1807, EIF_FALSE, 0, 0},
{0, 1808, EIF_FALSE, 0, 0},
{0, 1809, EIF_FALSE, 0, 0},
{0, 1810, EIF_FALSE, 0, 0},
{0, 1811, EIF_FALSE, 0, 0},
{0, 1812, EIF_FALSE, 0, 0},
{0, 1813, EIF_FALSE, 0, 0},
{0, 1814, EIF_FALSE, 0, 0},
{0, 1815, EIF_FALSE, 0, 0},
{0, 1816, EIF_FALSE, 0, 0},
{0, 1817, EIF_FALSE, 0, 0},
{0, 1818, EIF_FALSE, 0, 0},
{0, 1819, EIF_FALSE, 0, 0},
{0, 1820, EIF_FALSE, 0, 0},
{0, 1821, EIF_FALSE, 0, 0},
{0, 1822, EIF_FALSE, 0, 0},
{0, 1823, EIF_FALSE, 0, 0},
{0, 1824, EIF_FALSE, 0, 0},
{0, 1825, EIF_FALSE, 0, 0},
{0, 1826, EIF_FALSE, 0, 0},
{0, 1827, EIF_FALSE, 0, 0},
{0, 1828, EIF_FALSE, 0, 0},
{0, 1829, EIF_FALSE, 0, 0},
{0, 1830, EIF_FALSE, 0, 0},
{0, 1831, EIF_FALSE, 0, 0},
{0, 1832, EIF_FALSE, 0, 0},
{0, 1833, EIF_FALSE, 0, 0},
{0, 1834, EIF_FALSE, 0, 0},
{0, 1835, EIF_FALSE, 0, 0},
{0, 1836, EIF_FALSE, 0, 0},
{0, 1837, EIF_FALSE, 0, 0},
{0, 1838, EIF_FALSE, 0, 0},
{0, 1839, EIF_FALSE, 0, 0},
{0, 1840, EIF_FALSE, 0, 0},
{0, 1841, EIF_FALSE, 0, 0},
{0, 1842, EIF_TRUE, 0, 0},
{0, 1843, EIF_FALSE, 0, 0},
{0, 1844, EIF_FALSE, 0, 0},
{0, 1845, EIF_FALSE, 0, 0},
{0, 1846, EIF_FALSE, 0, 0},
{0, 1847, EIF_FALSE, 0, 0},
{0, 1848, EIF_FALSE, 0, 0},
{0, 1849, EIF_FALSE, 0, 0},
{0, 1850, EIF_FALSE, 0, 0},
{0, 1851, EIF_FALSE, 0, 0},
{0, 1852, EIF_FALSE, 0, 0},
{0, 1853, EIF_TRUE, 0, 0},
{0, 1854, EIF_FALSE, 0, 0},
{0, 1855, EIF_FALSE, 0, 0},
{0, 1856, EIF_FALSE, 0, 0},
{0, 1857, EIF_FALSE, 0, 0},
{0, 1858, EIF_FALSE, 0, 0},
{0, 1859, EIF_FALSE, 0, 0},
{0, 1860, EIF_FALSE, 0, 0},
{0, 1861, EIF_TRUE, 0, 0},
{0, 1862, EIF_FALSE, 0, 0},
{0, 1863, EIF_FALSE, 0, 0},
{0, 1864, EIF_FALSE, 0, 0},
{0, 1865, EIF_FALSE, 0, 0},
{0, 1866, EIF_TRUE, 0, 0},
{0, 1867, EIF_FALSE, 0, 0},
{0, 1868, EIF_FALSE, 0, 0},
{0, 1869, EIF_FALSE, 0, 0},
{0, 1870, EIF_FALSE, 0, 0},
{0, 1871, EIF_FALSE, 0, 0},
{0, 1872, EIF_FALSE, 0, 0},
{0, 1873, EIF_FALSE, 0, 0},
{0, 1874, EIF_FALSE, 0, 0},
{0, 1875, EIF_FALSE, 0, 0},
{0, 1876, EIF_FALSE, 0, 0},
{0, 1877, EIF_FALSE, 0, 0},
{0, 1878, EIF_FALSE, 0, 0},
{0, 1879, EIF_FALSE, 0, 0},
{0, 1880, EIF_FALSE, 0, 0},
{0, 1881, EIF_FALSE, 0, 0},
{0, 1882, EIF_FALSE, 0, 0},
{0, 1883, EIF_FALSE, 0, 0},
{0, 1884, EIF_FALSE, 0, 0},
{0, 1885, EIF_FALSE, 0, 0},
{0, 1886, EIF_FALSE, 0, 0},
{0, 1887, EIF_FALSE, 0, 0},
{0, 1888, EIF_FALSE, 0, 0},
{0, 1889, EIF_FALSE, 0, 0},
{0, 1890, EIF_FALSE, 0, 0},
{0, 1891, EIF_FALSE, 0, 0},
{0, 1892, EIF_FALSE, 0, 0},
{0, 1893, EIF_FALSE, 0, 0},
{0, 1894, EIF_FALSE, 0, 0},
{0, 1895, EIF_FALSE, 0, 0},
{0, 1896, EIF_FALSE, 0, 0},
{0, 1897, EIF_FALSE, 0, 0},
{0, 1898, EIF_TRUE, 0, 0},
{0, 1899, EIF_FALSE, 0, 0},
{0, 1900, EIF_FALSE, 0, 0},
{0, 1901, EIF_TRUE, 0, 0},
{0, 1902, EIF_FALSE, 0, 0},
{0, 1903, EIF_FALSE, 0, 0},
{0, 1904, EIF_FALSE, 0, 0},
{0, 1905, EIF_FALSE, 0, 0},
{0, 1906, EIF_FALSE, 0, 0},
{0, 1907, EIF_FALSE, 0, 0},
{0, 1908, EIF_FALSE, 0, 0},
{0, 1909, EIF_FALSE, 0, 0},
{0, 1910, EIF_FALSE, 0, 0},
{0, 1911, EIF_FALSE, 0, 0},
{0, 1912, EIF_FALSE, 0, 0},
{0, 1913, EIF_FALSE, 0, 0},
{0, 1914, EIF_FALSE, 0, 0}
};


GE_type_info GE_type_infos[1915] = {
{0, 0, 0, 0},
{1, GE_TYPE_FLAG_BOOLEAN|GE_TYPE_FLAG_EXPANDED, 0, 0},
{2, GE_TYPE_FLAG_CHARACTER_8|GE_TYPE_FLAG_EXPANDED, 0, 0},
{3, GE_TYPE_FLAG_CHARACTER_32|GE_TYPE_FLAG_EXPANDED, 0, 0},
{4, GE_TYPE_FLAG_INTEGER_8|GE_TYPE_FLAG_EXPANDED, 0, 0},
{5, GE_TYPE_FLAG_INTEGER_16|GE_TYPE_FLAG_EXPANDED, 0, 0},
{6, GE_TYPE_FLAG_INTEGER_32|GE_TYPE_FLAG_EXPANDED, 0, 0},
{7, GE_TYPE_FLAG_INTEGER_64|GE_TYPE_FLAG_EXPANDED, 0, 0},
{8, GE_TYPE_FLAG_NATURAL_8|GE_TYPE_FLAG_EXPANDED, 0, 0},
{9, GE_TYPE_FLAG_NATURAL_16|GE_TYPE_FLAG_EXPANDED, 0, 0},
{10, GE_TYPE_FLAG_NATURAL_32|GE_TYPE_FLAG_EXPANDED, 0, 0},
{11, GE_TYPE_FLAG_NATURAL_64|GE_TYPE_FLAG_EXPANDED, 0, 0},
{12, GE_TYPE_FLAG_REAL_32|GE_TYPE_FLAG_EXPANDED, 0, 0},
{13, GE_TYPE_FLAG_REAL_64|GE_TYPE_FLAG_EXPANDED, 0, 0},
{14, GE_TYPE_FLAG_POINTER|GE_TYPE_FLAG_EXPANDED, 0, 0},
{15, GE_TYPE_FLAG_SPECIAL, &GE_new15, 0},
{16, GE_TYPE_FLAG_SPECIAL, &GE_new16, 0},
{17, 0, &GE_new17, 0},
{18, 0, &GE_new18, 0},
{19, 0, &GE_new19, 0},
{20, 0, 0, 0},
{21, GE_TYPE_FLAG_NONE, 0, 0},
{22, 0, &GE_new22, 0},
{23, 0, &GE_new23, 0},
{24, 0, &GE_new24, 0},
{25, 0, &GE_new25, 0},
{26, 0, &GE_new26, 0},
{27, GE_TYPE_FLAG_TUPLE, &GE_new27, 0},
{28, 0, 0, 0},
{29, 0, &GE_new29, &T29f60},
{30, 0, &GE_new30, 0},
{31, 0, &GE_new31, 0},
{32, 0, &GE_new32, 0},
{33, 0, &GE_new33, 0},
{34, 0, &GE_new34, 0},
{35, 0, 0, 0},
{36, 0, &GE_new36, 0},
{37, 0, &GE_new37, 0},
{38, 0, &GE_new38, 0},
{39, 0, &GE_new39, 0},
{40, 0, &GE_new40, 0},
{41, 0, &GE_new41, 0},
{42, 0, 0, 0},
{43, 0, &GE_new43, 0},
{44, 0, &GE_new44, 0},
{45, 0, &GE_new45, 0},
{46, 0, &GE_new46, 0},
{47, 0, 0, 0},
{48, 0, 0, 0},
{49, 0, 0, 0},
{50, 0, &GE_new50, 0},
{51, 0, 0, 0},
{52, 0, &GE_new52, 0},
{53, 0, &GE_new53, 0},
{54, 0, &GE_new54, 0},
{55, 0, &GE_new55, 0},
{56, 0, 0, 0},
{57, 0, &GE_new57, 0},
{58, 0, &GE_new58, 0},
{59, 0, 0, 0},
{60, 0, 0, 0},
{61, 0, &GE_new61, 0},
{62, 0, &GE_new62, 0},
{63, 0, &GE_new63, 0},
{64, 0, &GE_new64, 0},
{65, 0, &GE_new65, 0},
{66, 0, &GE_new66, 0},
{67, 0, &GE_new67, 0},
{68, 0, &GE_new68, 0},
{69, 0, &GE_new69, 0},
{70, 0, &GE_new70, 0},
{71, 0, &GE_new71, 0},
{72, 0, 0, 0},
{73, 0, 0, 0},
{74, 0, &GE_new74, 0},
{75, 0, &GE_new75, 0},
{76, 0, &GE_new76, 0},
{77, 0, &GE_new77, 0},
{78, 0, &GE_new78, 0},
{79, 0, &GE_new79, 0},
{80, 0, &GE_new80, 0},
{81, 0, &GE_new81, 0},
{82, 0, &GE_new82, 0},
{83, 0, 0, 0},
{84, 0, &GE_new84, 0},
{85, 0, 0, 0},
{86, 0, &GE_new86, 0},
{87, 0, &GE_new87, 0},
{88, 0, &GE_new88, 0},
{89, 0, 0, 0},
{90, 0, &GE_new90, 0},
{91, 0, 0, 0},
{92, 0, &GE_new92, 0},
{93, 0, 0, 0},
{94, 0, &GE_new94, 0},
{95, 0, &GE_new95, 0},
{96, 0, &GE_new96, 0},
{97, 0, &GE_new97, 0},
{98, 0, &GE_new98, 0},
{99, 0, &GE_new99, 0},
{100, 0, &GE_new100, 0},
{101, 0, 0, 0},
{102, 0, 0, 0},
{103, 0, &GE_new103, 0},
{104, 0, &GE_new104, 0},
{105, 0, &GE_new105, 0},
{106, 0, &GE_new106, 0},
{107, 0, &GE_new107, 0},
{108, 0, &GE_new108, 0},
{109, 0, &GE_new109, 0},
{110, 0, &GE_new110, 0},
{111, 0, &GE_new111, 0},
{112, 0, &GE_new112, 0},
{113, 0, &GE_new113, 0},
{114, 0, &GE_new114, 0},
{115, 0, &GE_new115, 0},
{116, 0, &GE_new116, 0},
{117, 0, &GE_new117, 0},
{118, 0, &GE_new118, 0},
{119, 0, &GE_new119, 0},
{120, 0, &GE_new120, 0},
{121, 0, &GE_new121, 0},
{122, 0, &GE_new122, 0},
{123, GE_TYPE_FLAG_SPECIAL, &GE_new123, 0},
{124, GE_TYPE_FLAG_SPECIAL, &GE_new124, 0},
{125, 0, 0, 0},
{126, 0, &GE_new126, 0},
{127, 0, 0, 0},
{128, 0, &GE_new128, &T128f10},
{129, 0, &GE_new129, 0},
{130, 0, &GE_new130, 0},
{131, 0, &GE_new131, 0},
{132, 0, &GE_new132, 0},
{133, 0, &GE_new133, 0},
{134, 0, &GE_new134, 0},
{135, 0, 0, 0},
{136, 0, &GE_new136, 0},
{137, 0, &GE_new137, 0},
{138, 0, &GE_new138, 0},
{139, 0, &GE_new139, 0},
{140, 0, &GE_new140, 0},
{141, GE_TYPE_FLAG_SPECIAL, &GE_new141, 0},
{142, 0, &GE_new142, 0},
{143, 0, &GE_new143, 0},
{144, 0, &GE_new144, 0},
{145, 0, 0, 0},
{146, 0, 0, 0},
{147, 0, &GE_new147, 0},
{148, 0, 0, 0},
{149, 0, 0, 0},
{150, 0, &GE_new150, 0},
{151, 0, &GE_new151, 0},
{152, 0, &GE_new152, 0},
{153, 0, &GE_new153, 0},
{154, 0, &GE_new154, 0},
{155, 0, &GE_new155, 0},
{156, 0, 0, 0},
{157, 0, &GE_new157, 0},
{158, 0, &GE_new158, 0},
{159, 0, &GE_new159, 0},
{160, 0, &GE_new160, 0},
{161, 0, &GE_new161, 0},
{162, 0, &GE_new162, 0},
{163, 0, &GE_new163, 0},
{164, 0, &GE_new164, 0},
{165, 0, 0, 0},
{166, 0, 0, 0},
{167, 0, &GE_new167, 0},
{168, 0, &GE_new168, 0},
{169, 0, 0, 0},
{170, 0, &GE_new170, 0},
{171, 0, &GE_new171, 0},
{172, 0, &GE_new172, 0},
{173, 0, &GE_new173, 0},
{174, 0, &GE_new174, 0},
{175, 0, &GE_new175, 0},
{176, 0, 0, 0},
{177, 0, &GE_new177, 0},
{178, 0, &GE_new178, 0},
{179, 0, &GE_new179, 0},
{180, 0, 0, 0},
{181, 0, &GE_new181, 0},
{182, 0, 0, 0},
{183, 0, &GE_new183, 0},
{184, 0, 0, 0},
{185, 0, 0, 0},
{186, 0, &GE_new186, 0},
{187, 0, &GE_new187, 0},
{188, 0, &GE_new188, 0},
{189, 0, &GE_new189, 0},
{190, 0, 0, 0},
{191, GE_TYPE_FLAG_TUPLE, &GE_new191, 0},
{192, GE_TYPE_FLAG_TUPLE, &GE_new192, 0},
{193, 0, &GE_new193, 0},
{194, 0, &GE_new194, 0},
{195, 0, &GE_new195, 0},
{196, 0, &GE_new196, 0},
{197, 0, &GE_new197, 0},
{198, 0, 0, 0},
{199, 0, &GE_new199, 0},
{200, 0, &GE_new200, 0},
{201, 0, &GE_new201, 0},
{202, 0, &GE_new202, 0},
{203, 0, &GE_new203, 0},
{204, 0, &GE_new204, 0},
{205, 0, &GE_new205, 0},
{206, 0, &GE_new206, 0},
{207, 0, 0, 0},
{208, 0, 0, 0},
{209, GE_TYPE_FLAG_SPECIAL, &GE_new209, 0},
{210, 0, &GE_new210, 0},
{211, GE_TYPE_FLAG_SPECIAL, &GE_new211, 0},
{212, 0, &GE_new212, 0},
{213, 0, &GE_new213, 0},
{214, 0, &GE_new214, 0},
{215, 0, &GE_new215, 0},
{216, 0, &GE_new216, 0},
{217, GE_TYPE_FLAG_SPECIAL, &GE_new217, 0},
{218, GE_TYPE_FLAG_SPECIAL, &GE_new218, 0},
{219, GE_TYPE_FLAG_SPECIAL, &GE_new219, 0},
{220, 0, &GE_new220, 0},
{221, 0, &GE_new221, 0},
{222, GE_TYPE_FLAG_SPECIAL, &GE_new222, 0},
{223, 0, &GE_new223, 0},
{224, GE_TYPE_FLAG_SPECIAL, &GE_new224, 0},
{225, 0, &GE_new225, 0},
{226, 0, &GE_new226, 0},
{227, GE_TYPE_FLAG_SPECIAL, &GE_new227, 0},
{228, 0, &GE_new228, 0},
{229, 0, &GE_new229, 0},
{230, 0, &GE_new230, 0},
{231, 0, &GE_new231, 0},
{232, 0, &GE_new232, 0},
{233, 0, &GE_new233, 0},
{234, GE_TYPE_FLAG_TUPLE, &GE_new234, 0},
{235, 0, &GE_new235, 0},
{236, GE_TYPE_FLAG_TUPLE, &GE_new236, 0},
{237, 0, &GE_new237, 0},
{238, 0, &GE_new238, 0},
{239, 0, &GE_new239, 0},
{240, 0, &GE_new240, 0},
{241, 0, &GE_new241, 0},
{242, GE_TYPE_FLAG_TUPLE, &GE_new242, 0},
{243, 0, 0, 0},
{244, 0, 0, 0},
{245, 0, 0, 0},
{246, 0, 0, 0},
{247, 0, &GE_new247, 0},
{248, 0, 0, 0},
{249, 0, 0, 0},
{250, 0, 0, 0},
{251, 0, &GE_new251, 0},
{252, 0, 0, 0},
{253, 0, 0, 0},
{254, 0, 0, 0},
{255, 0, 0, 0},
{256, 0, 0, 0},
{257, 0, 0, 0},
{258, 0, 0, 0},
{259, 0, &GE_new259, 0},
{260, 0, &GE_new260, 0},
{261, 0, &GE_new261, 0},
{262, GE_TYPE_FLAG_SPECIAL, &GE_new262, 0},
{263, 0, &GE_new263, 0},
{264, 0, &GE_new264, 0},
{265, 0, &GE_new265, 0},
{266, 0, &GE_new266, 0},
{267, 0, &GE_new267, 0},
{268, 0, &GE_new268, 0},
{269, 0, &GE_new269, 0},
{270, 0, &GE_new270, 0},
{271, 0, &GE_new271, 0},
{272, 0, &GE_new272, 0},
{273, 0, &GE_new273, 0},
{274, 0, &GE_new274, 0},
{275, 0, &GE_new275, 0},
{276, 0, &GE_new276, 0},
{277, 0, &GE_new277, 0},
{278, 0, &GE_new278, 0},
{279, 0, &GE_new279, 0},
{280, 0, &GE_new280, 0},
{281, 0, &GE_new281, 0},
{282, 0, &GE_new282, 0},
{283, 0, &GE_new283, 0},
{284, 0, &GE_new284, 0},
{285, 0, &GE_new285, 0},
{286, 0, &GE_new286, 0},
{287, 0, &GE_new287, 0},
{288, 0, 0, 0},
{289, 0, 0, 0},
{290, 0, &GE_new290, 0},
{291, 0, &GE_new291, 0},
{292, 0, &GE_new292, 0},
{293, 0, &GE_new293, 0},
{294, 0, &GE_new294, 0},
{295, 0, &GE_new295, 0},
{296, 0, &GE_new296, 0},
{297, 0, &GE_new297, 0},
{298, 0, &GE_new298, 0},
{299, 0, &GE_new299, 0},
{300, 0, &GE_new300, 0},
{301, 0, &GE_new301, 0},
{302, 0, &GE_new302, 0},
{303, 0, &GE_new303, 0},
{304, 0, &GE_new304, &T304f28},
{305, 0, &GE_new305, 0},
{306, 0, &GE_new306, 0},
{307, 0, &GE_new307, 0},
{308, 0, &GE_new308, 0},
{309, 0, &GE_new309, 0},
{310, 0, &GE_new310, 0},
{311, 0, &GE_new311, 0},
{312, 0, &GE_new312, 0},
{313, 0, &GE_new313, 0},
{314, 0, 0, 0},
{315, 0, 0, 0},
{316, 0, 0, 0},
{317, 0, &GE_new317, 0},
{318, 0, 0, 0},
{319, 0, &GE_new319, 0},
{320, 0, &GE_new320, 0},
{321, 0, &GE_new321, 0},
{322, 0, &GE_new322, 0},
{323, 0, 0, 0},
{324, 0, 0, 0},
{325, 0, &GE_new325, 0},
{326, 0, &GE_new326, 0},
{327, 0, 0, 0},
{328, 0, 0, 0},
{329, 0, 0, 0},
{330, 0, &GE_new330, 0},
{331, 0, &GE_new331, 0},
{332, 0, 0, 0},
{333, 0, 0, 0},
{334, 0, 0, 0},
{335, 0, &GE_new335, &T335f30},
{336, 0, &GE_new336, 0},
{337, 0, &GE_new337, 0},
{338, 0, &GE_new338, 0},
{339, 0, &GE_new339, 0},
{340, 0, &GE_new340, 0},
{341, 0, 0, 0},
{342, 0, 0, 0},
{343, 0, 0, 0},
{344, 0, &GE_new344, 0},
{345, 0, 0, 0},
{346, 0, 0, 0},
{347, 0, 0, 0},
{348, 0, 0, 0},
{349, 0, 0, 0},
{350, 0, &GE_new350, 0},
{351, 0, &GE_new351, 0},
{352, 0, &GE_new352, 0},
{353, GE_TYPE_FLAG_TUPLE, &GE_new353, 0},
{354, GE_TYPE_FLAG_TUPLE, &GE_new354, 0},
{355, 0, 0, 0},
{356, GE_TYPE_FLAG_TUPLE, &GE_new356, 0},
{357, GE_TYPE_FLAG_TUPLE, &GE_new357, 0},
{358, 0, &GE_new358, 0},
{359, 0, 0, 0},
{360, 0, 0, 0},
{361, 0, &GE_new361, 0},
{362, 0, 0, 0},
{363, GE_TYPE_FLAG_TUPLE, &GE_new363, 0},
{364, 0, 0, 0},
{365, GE_TYPE_FLAG_TUPLE, &GE_new365, 0},
{366, GE_TYPE_FLAG_TUPLE, &GE_new366, 0},
{367, 0, &GE_new367, 0},
{368, 0, 0, 0},
{369, 0, &GE_new369, 0},
{370, 0, &GE_new370, 0},
{371, 0, 0, 0},
{372, 0, &GE_new372, 0},
{373, 0, &GE_new373, 0},
{374, 0, &GE_new374, 0},
{375, 0, &GE_new375, 0},
{376, 0, &GE_new376, 0},
{377, 0, &GE_new377, 0},
{378, 0, &GE_new378, 0},
{379, 0, 0, 0},
{380, 0, &GE_new380, 0},
{381, 0, &GE_new381, 0},
{382, 0, &GE_new382, 0},
{383, 0, &GE_new383, 0},
{384, 0, &GE_new384, 0},
{385, 0, &GE_new385, 0},
{386, 0, &GE_new386, 0},
{387, 0, &GE_new387, 0},
{388, 0, &GE_new388, 0},
{389, 0, &GE_new389, 0},
{390, 0, &GE_new390, 0},
{391, 0, &GE_new391, 0},
{392, 0, &GE_new392, 0},
{393, 0, &GE_new393, 0},
{394, 0, &GE_new394, 0},
{395, 0, &GE_new395, 0},
{396, 0, 0, 0},
{397, 0, &GE_new397, 0},
{398, 0, 0, 0},
{399, 0, &GE_new399, 0},
{400, 0, 0, 0},
{401, 0, &GE_new401, 0},
{402, 0, &GE_new402, 0},
{403, 0, &GE_new403, 0},
{404, 0, 0, 0},
{405, 0, &GE_new405, 0},
{406, 0, &GE_new406, 0},
{407, 0, 0, 0},
{408, 0, &GE_new408, 0},
{409, 0, &GE_new409, 0},
{410, 0, &GE_new410, 0},
{411, 0, &GE_new411, 0},
{412, 0, 0, 0},
{413, 0, 0, 0},
{414, 0, &GE_new414, 0},
{415, 0, 0, 0},
{416, 0, &GE_new416, 0},
{417, 0, &GE_new417, 0},
{418, 0, &GE_new418, 0},
{419, 0, &GE_new419, 0},
{420, 0, &GE_new420, 0},
{421, 0, 0, 0},
{422, 0, &GE_new422, 0},
{423, 0, 0, 0},
{424, 0, &GE_new424, 0},
{425, 0, &GE_new425, 0},
{426, 0, 0, 0},
{427, 0, &GE_new427, 0},
{428, 0, &GE_new428, 0},
{429, 0, &GE_new429, 0},
{430, 0, &GE_new430, 0},
{431, 0, &GE_new431, 0},
{432, 0, &GE_new432, 0},
{433, 0, &GE_new433, 0},
{434, 0, 0, 0},
{435, 0, &GE_new435, 0},
{436, GE_TYPE_FLAG_TUPLE, &GE_new436, 0},
{437, 0, &GE_new437, 0},
{438, GE_TYPE_FLAG_TUPLE, &GE_new438, 0},
{439, 0, 0, 0},
{440, GE_TYPE_FLAG_TUPLE, &GE_new440, 0},
{441, 0, &GE_new441, 0},
{442, 0, &GE_new442, 0},
{443, 0, &GE_new443, 0},
{444, 0, &GE_new444, 0},
{445, 0, &GE_new445, 0},
{446, 0, &GE_new446, 0},
{447, 0, &GE_new447, 0},
{448, 0, &GE_new448, 0},
{449, 0, &GE_new449, 0},
{450, 0, 0, 0},
{451, 0, &GE_new451, 0},
{452, 0, &GE_new452, 0},
{453, 0, &GE_new453, 0},
{454, GE_TYPE_FLAG_TUPLE, &GE_new454, 0},
{455, 0, &GE_new455, 0},
{456, 0, &GE_new456, 0},
{457, GE_TYPE_FLAG_TUPLE, &GE_new457, 0},
{458, GE_TYPE_FLAG_TUPLE, &GE_new458, 0},
{459, 0, &GE_new459, 0},
{460, GE_TYPE_FLAG_TUPLE, &GE_new460, 0},
{461, 0, 0, 0},
{462, GE_TYPE_FLAG_TUPLE, &GE_new462, 0},
{463, 0, 0, 0},
{464, 0, 0, 0},
{465, 0, &GE_new465, 0},
{466, GE_TYPE_FLAG_TUPLE, &GE_new466, 0},
{467, 0, &GE_new467, 0},
{468, 0, &GE_new468, 0},
{469, 0, 0, 0},
{470, 0, &GE_new470, 0},
{471, 0, 0, 0},
{472, 0, &GE_new472, 0},
{473, 0, &GE_new473, 0},
{474, 0, &GE_new474, 0},
{475, 0, &GE_new475, 0},
{476, 0, &GE_new476, 0},
{477, 0, &GE_new477, 0},
{478, GE_TYPE_FLAG_TUPLE, &GE_new478, 0},
{479, 0, &GE_new479, 0},
{480, 0, 0, 0},
{481, GE_TYPE_FLAG_TUPLE, &GE_new481, 0},
{482, 0, &GE_new482, 0},
{483, 0, 0, 0},
{484, GE_TYPE_FLAG_TUPLE, &GE_new484, 0},
{485, 0, &GE_new485, 0},
{486, GE_TYPE_FLAG_TUPLE, &GE_new486, 0},
{487, 0, 0, 0},
{488, 0, &GE_new488, 0},
{489, 0, 0, 0},
{490, GE_TYPE_FLAG_TUPLE, &GE_new490, 0},
{491, 0, &GE_new491, 0},
{492, 0, 0, 0},
{493, 0, &GE_new493, 0},
{494, 0, &GE_new494, 0},
{495, 0, &GE_new495, 0},
{496, 0, &GE_new496, 0},
{497, GE_TYPE_FLAG_TUPLE, &GE_new497, 0},
{498, GE_TYPE_FLAG_TUPLE, &GE_new498, 0},
{499, GE_TYPE_FLAG_TUPLE, &GE_new499, 0},
{500, GE_TYPE_FLAG_TUPLE, &GE_new500, 0},
{501, GE_TYPE_FLAG_TUPLE, &GE_new501, 0},
{502, GE_TYPE_FLAG_TUPLE, &GE_new502, 0},
{503, 0, &GE_new503, 0},
{504, 0, &GE_new504, 0},
{505, 0, &GE_new505, 0},
{506, 0, &GE_new506, 0},
{507, 0, 0, 0},
{508, 0, 0, 0},
{509, 0, &GE_new509, 0},
{510, 0, &GE_new510, 0},
{511, 0, &GE_new511, 0},
{512, GE_TYPE_FLAG_TUPLE, &GE_new512, 0},
{513, GE_TYPE_FLAG_TUPLE, &GE_new513, 0},
{514, GE_TYPE_FLAG_TUPLE, &GE_new514, 0},
{515, GE_TYPE_FLAG_TUPLE, &GE_new515, 0},
{516, GE_TYPE_FLAG_TUPLE, &GE_new516, 0},
{517, 0, 0, 0},
{518, 0, 0, 0},
{519, GE_TYPE_FLAG_TUPLE, &GE_new519, 0},
{520, 0, 0, 0},
{521, 0, 0, 0},
{522, 0, 0, 0},
{523, GE_TYPE_FLAG_TUPLE, &GE_new523, 0},
{524, 0, 0, 0},
{525, 0, 0, 0},
{526, 0, &GE_new526, 0},
{527, 0, &GE_new527, 0},
{528, 0, &GE_new528, 0},
{529, 0, &GE_new529, 0},
{530, 0, 0, 0},
{531, 0, &GE_new531, 0},
{532, 0, &GE_new532, 0},
{533, 0, 0, 0},
{534, 0, 0, 0},
{535, 0, &GE_new535, 0},
{536, 0, &GE_new536, 0},
{537, 0, &GE_new537, 0},
{538, 0, &GE_new538, 0},
{539, 0, &GE_new539, 0},
{540, GE_TYPE_FLAG_EXPANDED, 0, 0},
{541, 0, &GE_new541, 0},
{542, 0, &GE_new542, 0},
{543, 0, 0, 0},
{544, 0, &GE_new544, 0},
{545, 0, &GE_new545, 0},
{546, 0, &GE_new546, 0},
{547, GE_TYPE_FLAG_SPECIAL, &GE_new547, 0},
{548, GE_TYPE_FLAG_EXPANDED, 0, 0},
{549, GE_TYPE_FLAG_EXPANDED, 0, 0},
{550, 0, &GE_new550, 0},
{551, 0, 0, 0},
{552, GE_TYPE_FLAG_SPECIAL, &GE_new552, 0},
{553, 0, &GE_new553, 0},
{554, 0, &GE_new554, 0},
{555, GE_TYPE_FLAG_SPECIAL, &GE_new555, 0},
{556, 0, &GE_new556, 0},
{557, 0, &GE_new557, 0},
{558, 0, &GE_new558, 0},
{559, 0, &GE_new559, 0},
{560, 0, &GE_new560, 0},
{561, 0, &GE_new561, 0},
{562, 0, &GE_new562, 0},
{563, GE_TYPE_FLAG_SPECIAL, &GE_new563, 0},
{564, 0, &GE_new564, 0},
{565, 0, &GE_new565, 0},
{566, 0, &GE_new566, 0},
{567, 0, 0, 0},
{568, 0, 0, 0},
{569, 0, 0, 0},
{570, 0, 0, 0},
{571, 0, 0, 0},
{572, 0, &GE_new572, 0},
{573, GE_TYPE_FLAG_SPECIAL, &GE_new573, 0},
{574, 0, &GE_new574, 0},
{575, 0, &GE_new575, 0},
{576, 0, &GE_new576, 0},
{577, 0, 0, 0},
{578, 0, &GE_new578, 0},
{579, 0, &GE_new579, 0},
{580, 0, &GE_new580, 0},
{581, 0, 0, 0},
{582, 0, &GE_new582, 0},
{583, 0, 0, 0},
{584, 0, &GE_new584, 0},
{585, 0, &GE_new585, 0},
{586, 0, &GE_new586, 0},
{587, GE_TYPE_FLAG_SPECIAL, &GE_new587, 0},
{588, 0, &GE_new588, 0},
{589, 0, &GE_new589, 0},
{590, GE_TYPE_FLAG_SPECIAL, &GE_new590, 0},
{591, 0, &GE_new591, 0},
{592, 0, &GE_new592, 0},
{593, GE_TYPE_FLAG_SPECIAL, &GE_new593, 0},
{594, 0, &GE_new594, 0},
{595, 0, &GE_new595, 0},
{596, GE_TYPE_FLAG_SPECIAL, &GE_new596, 0},
{597, 0, &GE_new597, 0},
{598, 0, &GE_new598, 0},
{599, GE_TYPE_FLAG_SPECIAL, &GE_new599, 0},
{600, 0, &GE_new600, 0},
{601, 0, &GE_new601, 0},
{602, GE_TYPE_FLAG_SPECIAL, &GE_new602, 0},
{603, 0, &GE_new603, 0},
{604, 0, &GE_new604, 0},
{605, GE_TYPE_FLAG_SPECIAL, &GE_new605, 0},
{606, 0, &GE_new606, 0},
{607, 0, &GE_new607, 0},
{608, 0, &GE_new608, 0},
{609, GE_TYPE_FLAG_SPECIAL, &GE_new609, 0},
{610, 0, 0, 0},
{611, 0, 0, 0},
{612, 0, &GE_new612, 0},
{613, 0, &GE_new613, 0},
{614, 0, 0, 0},
{615, 0, &GE_new615, 0},
{616, 0, &GE_new616, 0},
{617, 0, &GE_new617, 0},
{618, 0, &GE_new618, 0},
{619, GE_TYPE_FLAG_SPECIAL, &GE_new619, 0},
{620, 0, 0, 0},
{621, 0, 0, 0},
{622, 0, &GE_new622, 0},
{623, GE_TYPE_FLAG_SPECIAL, &GE_new623, 0},
{624, 0, 0, 0},
{625, 0, 0, 0},
{626, 0, &GE_new626, 0},
{627, 0, &GE_new627, 0},
{628, 0, &GE_new628, 0},
{629, 0, &GE_new629, 0},
{630, 0, &GE_new630, 0},
{631, GE_TYPE_FLAG_TUPLE, &GE_new631, 0},
{632, 0, &GE_new632, 0},
{633, 0, &GE_new633, 0},
{634, 0, 0, 0},
{635, 0, &GE_new635, 0},
{636, 0, &GE_new636, 0},
{637, 0, 0, 0},
{638, 0, &GE_new638, 0},
{639, 0, 0, 0},
{640, 0, 0, 0},
{641, 0, &GE_new641, 0},
{642, 0, &GE_new642, 0},
{643, GE_TYPE_FLAG_SPECIAL, &GE_new643, 0},
{644, 0, &GE_new644, 0},
{645, GE_TYPE_FLAG_SPECIAL, &GE_new645, 0},
{646, GE_TYPE_FLAG_SPECIAL, &GE_new646, 0},
{647, 0, &GE_new647, 0},
{648, 0, &GE_new648, 0},
{649, 0, 0, 0},
{650, 0, 0, 0},
{651, 0, &GE_new651, 0},
{652, 0, 0, 0},
{653, 0, &GE_new653, 0},
{654, 0, 0, 0},
{655, 0, 0, 0},
{656, 0, 0, 0},
{657, GE_TYPE_FLAG_SPECIAL, &GE_new657, 0},
{658, 0, &GE_new658, 0},
{659, 0, 0, 0},
{660, 0, &GE_new660, 0},
{661, 0, 0, 0},
{662, GE_TYPE_FLAG_SPECIAL, &GE_new662, 0},
{663, 0, &GE_new663, 0},
{664, 0, &GE_new664, 0},
{665, 0, &GE_new665, 0},
{666, 0, 0, 0},
{667, GE_TYPE_FLAG_SPECIAL, &GE_new667, 0},
{668, 0, &GE_new668, 0},
{669, 0, &GE_new669, 0},
{670, 0, 0, 0},
{671, 0, &GE_new671, 0},
{672, GE_TYPE_FLAG_SPECIAL, &GE_new672, 0},
{673, 0, &GE_new673, 0},
{674, 0, &GE_new674, 0},
{675, 0, &GE_new675, 0},
{676, 0, 0, 0},
{677, GE_TYPE_FLAG_SPECIAL, &GE_new677, 0},
{678, 0, &GE_new678, 0},
{679, 0, &GE_new679, 0},
{680, GE_TYPE_FLAG_SPECIAL, &GE_new680, 0},
{681, 0, &GE_new681, 0},
{682, 0, &GE_new682, 0},
{683, GE_TYPE_FLAG_SPECIAL, &GE_new683, 0},
{684, 0, &GE_new684, 0},
{685, 0, &GE_new685, 0},
{686, GE_TYPE_FLAG_SPECIAL, &GE_new686, 0},
{687, 0, &GE_new687, 0},
{688, 0, &GE_new688, 0},
{689, GE_TYPE_FLAG_SPECIAL, &GE_new689, 0},
{690, 0, 0, 0},
{691, 0, &GE_new691, 0},
{692, GE_TYPE_FLAG_SPECIAL, &GE_new692, 0},
{693, 0, &GE_new693, 0},
{694, 0, &GE_new694, 0},
{695, 0, &GE_new695, 0},
{696, GE_TYPE_FLAG_SPECIAL, &GE_new696, 0},
{697, 0, &GE_new697, 0},
{698, 0, &GE_new698, 0},
{699, 0, 0, 0},
{700, 0, &GE_new700, 0},
{701, GE_TYPE_FLAG_SPECIAL, &GE_new701, 0},
{702, 0, &GE_new702, 0},
{703, GE_TYPE_FLAG_SPECIAL, &GE_new703, 0},
{704, 0, 0, 0},
{705, 0, &GE_new705, 0},
{706, 0, &GE_new706, 0},
{707, GE_TYPE_FLAG_SPECIAL, &GE_new707, 0},
{708, 0, 0, 0},
{709, 0, &GE_new709, 0},
{710, GE_TYPE_FLAG_SPECIAL, &GE_new710, 0},
{711, 0, 0, 0},
{712, 0, &GE_new712, 0},
{713, 0, &GE_new713, 0},
{714, 0, &GE_new714, 0},
{715, 0, &GE_new715, 0},
{716, 0, 0, 0},
{717, 0, 0, 0},
{718, 0, 0, 0},
{719, 0, &GE_new719, 0},
{720, 0, &GE_new720, 0},
{721, 0, &GE_new721, 0},
{722, 0, 0, 0},
{723, GE_TYPE_FLAG_SPECIAL, &GE_new723, 0},
{724, 0, &GE_new724, 0},
{725, 0, &GE_new725, 0},
{726, 0, &GE_new726, 0},
{727, 0, 0, 0},
{728, 0, 0, 0},
{729, 0, &GE_new729, 0},
{730, 0, 0, 0},
{731, 0, 0, 0},
{732, 0, &GE_new732, 0},
{733, 0, 0, 0},
{734, GE_TYPE_FLAG_SPECIAL, &GE_new734, 0},
{735, 0, &GE_new735, 0},
{736, 0, &GE_new736, 0},
{737, 0, &GE_new737, 0},
{738, GE_TYPE_FLAG_SPECIAL, &GE_new738, 0},
{739, 0, &GE_new739, 0},
{740, 0, &GE_new740, 0},
{741, 0, &GE_new741, 0},
{742, GE_TYPE_FLAG_SPECIAL, &GE_new742, 0},
{743, 0, &GE_new743, 0},
{744, 0, &GE_new744, 0},
{745, 0, &GE_new745, 0},
{746, GE_TYPE_FLAG_SPECIAL, &GE_new746, 0},
{747, 0, &GE_new747, 0},
{748, GE_TYPE_FLAG_SPECIAL, &GE_new748, 0},
{749, 0, &GE_new749, 0},
{750, 0, &GE_new750, 0},
{751, 0, &GE_new751, 0},
{752, 0, &GE_new752, 0},
{753, 0, 0, 0},
{754, 0, 0, 0},
{755, 0, &GE_new755, 0},
{756, GE_TYPE_FLAG_SPECIAL, &GE_new756, 0},
{757, 0, &GE_new757, 0},
{758, 0, &GE_new758, 0},
{759, 0, &GE_new759, 0},
{760, 0, 0, 0},
{761, 0, 0, 0},
{762, GE_TYPE_FLAG_SPECIAL, &GE_new762, 0},
{763, 0, &GE_new763, 0},
{764, 0, &GE_new764, 0},
{765, 0, 0, 0},
{766, GE_TYPE_FLAG_SPECIAL, &GE_new766, 0},
{767, 0, &GE_new767, 0},
{768, 0, &GE_new768, 0},
{769, 0, &GE_new769, 0},
{770, GE_TYPE_FLAG_SPECIAL, &GE_new770, 0},
{771, 0, 0, 0},
{772, 0, &GE_new772, 0},
{773, 0, &GE_new773, 0},
{774, 0, &GE_new774, 0},
{775, 0, 0, 0},
{776, 0, &GE_new776, 0},
{777, 0, &GE_new777, 0},
{778, 0, &GE_new778, 0},
{779, 0, &GE_new779, 0},
{780, 0, &GE_new780, 0},
{781, 0, &GE_new781, 0},
{782, 0, &GE_new782, 0},
{783, 0, &GE_new783, 0},
{784, 0, &GE_new784, 0},
{785, 0, &GE_new785, 0},
{786, 0, &GE_new786, 0},
{787, 0, &GE_new787, 0},
{788, 0, &GE_new788, 0},
{789, 0, &GE_new789, 0},
{790, 0, 0, 0},
{791, 0, 0, 0},
{792, 0, &GE_new792, 0},
{793, 0, &GE_new793, 0},
{794, GE_TYPE_FLAG_TUPLE, &GE_new794, 0},
{795, GE_TYPE_FLAG_TUPLE, &GE_new795, 0},
{796, 0, &GE_new796, 0},
{797, 0, &GE_new797, 0},
{798, 0, &GE_new798, 0},
{799, GE_TYPE_FLAG_TUPLE, &GE_new799, 0},
{800, GE_TYPE_FLAG_TUPLE, &GE_new800, 0},
{801, 0, &GE_new801, 0},
{802, 0, &GE_new802, 0},
{803, 0, 0, 0},
{804, GE_TYPE_FLAG_TUPLE, &GE_new804, 0},
{805, GE_TYPE_FLAG_TUPLE, &GE_new805, 0},
{806, 0, &GE_new806, 0},
{807, 0, &GE_new807, 0},
{808, 0, &GE_new808, 0},
{809, 0, &GE_new809, 0},
{810, 0, &GE_new810, 0},
{811, 0, &GE_new811, 0},
{812, 0, &GE_new812, 0},
{813, 0, &GE_new813, 0},
{814, 0, &GE_new814, 0},
{815, 0, &GE_new815, 0},
{816, 0, &GE_new816, 0},
{817, 0, &GE_new817, 0},
{818, 0, 0, 0},
{819, 0, &GE_new819, 0},
{820, 0, &GE_new820, 0},
{821, 0, &GE_new821, 0},
{822, 0, &GE_new822, 0},
{823, 0, &GE_new823, 0},
{824, 0, 0, 0},
{825, 0, &GE_new825, 0},
{826, 0, &GE_new826, 0},
{827, 0, &GE_new827, 0},
{828, 0, &GE_new828, 0},
{829, 0, &GE_new829, 0},
{830, 0, &GE_new830, 0},
{831, 0, &GE_new831, 0},
{832, 0, 0, 0},
{833, 0, &GE_new833, 0},
{834, GE_TYPE_FLAG_TUPLE, &GE_new834, 0},
{835, GE_TYPE_FLAG_TUPLE, &GE_new835, 0},
{836, 0, 0, 0},
{837, 0, 0, 0},
{838, 0, &GE_new838, 0},
{839, 0, &GE_new839, 0},
{840, 0, &GE_new840, 0},
{841, 0, &GE_new841, 0},
{842, 0, 0, 0},
{843, 0, &GE_new843, 0},
{844, 0, &GE_new844, 0},
{845, 0, 0, 0},
{846, 0, &GE_new846, 0},
{847, 0, 0, 0},
{848, 0, 0, 0},
{849, 0, 0, 0},
{850, 0, &GE_new850, 0},
{851, 0, &GE_new851, 0},
{852, 0, &GE_new852, 0},
{853, 0, &GE_new853, 0},
{854, 0, &GE_new854, 0},
{855, 0, &GE_new855, 0},
{856, 0, 0, 0},
{857, 0, 0, 0},
{858, 0, 0, 0},
{859, 0, &GE_new859, 0},
{860, 0, 0, 0},
{861, 0, 0, 0},
{862, 0, &GE_new862, 0},
{863, GE_TYPE_FLAG_TUPLE, &GE_new863, 0},
{864, 0, &GE_new864, 0},
{865, GE_TYPE_FLAG_SPECIAL, &GE_new865, 0},
{866, 0, &GE_new866, 0},
{867, 0, &GE_new867, 0},
{868, GE_TYPE_FLAG_SPECIAL, &GE_new868, 0},
{869, 0, &GE_new869, 0},
{870, 0, 0, 0},
{871, 0, 0, 0},
{872, 0, 0, 0},
{873, 0, &GE_new873, 0},
{874, 0, &GE_new874, 0},
{875, 0, 0, 0},
{876, 0, &GE_new876, 0},
{877, GE_TYPE_FLAG_SPECIAL, &GE_new877, 0},
{878, 0, &GE_new878, 0},
{879, GE_TYPE_FLAG_SPECIAL, &GE_new879, 0},
{880, 0, &GE_new880, 0},
{881, 0, &GE_new881, 0},
{882, 0, &GE_new882, 0},
{883, GE_TYPE_FLAG_TUPLE, &GE_new883, 0},
{884, GE_TYPE_FLAG_SPECIAL, &GE_new884, 0},
{885, 0, &GE_new885, 0},
{886, 0, &GE_new886, 0},
{887, 0, 0, 0},
{888, 0, &GE_new888, 0},
{889, 0, 0, 0},
{890, 0, &GE_new890, 0},
{891, 0, &GE_new891, 0},
{892, 0, &GE_new892, 0},
{893, 0, &GE_new893, 0},
{894, 0, 0, 0},
{895, 0, &GE_new895, 0},
{896, 0, &GE_new896, 0},
{897, 0, &GE_new897, 0},
{898, 0, 0, 0},
{899, 0, &GE_new899, 0},
{900, 0, &GE_new900, 0},
{901, 0, &GE_new901, 0},
{902, 0, &GE_new902, 0},
{903, 0, &GE_new903, 0},
{904, 0, &GE_new904, 0},
{905, 0, &GE_new905, 0},
{906, 0, &GE_new906, 0},
{907, 0, &GE_new907, 0},
{908, 0, &GE_new908, 0},
{909, 0, &GE_new909, 0},
{910, 0, &GE_new910, 0},
{911, GE_TYPE_FLAG_SPECIAL, &GE_new911, 0},
{912, 0, &GE_new912, 0},
{913, 0, &GE_new913, 0},
{914, GE_TYPE_FLAG_SPECIAL, &GE_new914, 0},
{915, 0, &GE_new915, 0},
{916, 0, &GE_new916, 0},
{917, GE_TYPE_FLAG_SPECIAL, &GE_new917, 0},
{918, 0, &GE_new918, 0},
{919, GE_TYPE_FLAG_SPECIAL, &GE_new919, 0},
{920, 0, &GE_new920, 0},
{921, GE_TYPE_FLAG_SPECIAL, &GE_new921, 0},
{922, 0, &GE_new922, 0},
{923, 0, 0, 0},
{924, GE_TYPE_FLAG_SPECIAL, &GE_new924, 0},
{925, 0, &GE_new925, 0},
{926, 0, 0, 0},
{927, GE_TYPE_FLAG_SPECIAL, &GE_new927, 0},
{928, 0, &GE_new928, 0},
{929, 0, 0, 0},
{930, GE_TYPE_FLAG_SPECIAL, &GE_new930, 0},
{931, 0, &GE_new931, 0},
{932, GE_TYPE_FLAG_SPECIAL, &GE_new932, 0},
{933, 0, &GE_new933, 0},
{934, 0, &GE_new934, 0},
{935, GE_TYPE_FLAG_SPECIAL, &GE_new935, 0},
{936, 0, &GE_new936, 0},
{937, 0, 0, 0},
{938, GE_TYPE_FLAG_SPECIAL, &GE_new938, 0},
{939, 0, &GE_new939, 0},
{940, 0, &GE_new940, 0},
{941, GE_TYPE_FLAG_SPECIAL, &GE_new941, 0},
{942, 0, &GE_new942, 0},
{943, GE_TYPE_FLAG_SPECIAL, &GE_new943, 0},
{944, 0, &GE_new944, 0},
{945, 0, 0, 0},
{946, GE_TYPE_FLAG_SPECIAL, &GE_new946, 0},
{947, 0, &GE_new947, 0},
{948, GE_TYPE_FLAG_SPECIAL, &GE_new948, 0},
{949, 0, &GE_new949, 0},
{950, 0, &GE_new950, 0},
{951, GE_TYPE_FLAG_SPECIAL, &GE_new951, 0},
{952, 0, &GE_new952, 0},
{953, 0, &GE_new953, 0},
{954, GE_TYPE_FLAG_SPECIAL, &GE_new954, 0},
{955, 0, &GE_new955, 0},
{956, 0, &GE_new956, 0},
{957, GE_TYPE_FLAG_SPECIAL, &GE_new957, 0},
{958, 0, &GE_new958, 0},
{959, 0, &GE_new959, 0},
{960, GE_TYPE_FLAG_SPECIAL, &GE_new960, 0},
{961, 0, &GE_new961, 0},
{962, GE_TYPE_FLAG_SPECIAL, &GE_new962, 0},
{963, 0, &GE_new963, 0},
{964, 0, &GE_new964, 0},
{965, GE_TYPE_FLAG_SPECIAL, &GE_new965, 0},
{966, 0, &GE_new966, 0},
{967, 0, &GE_new967, 0},
{968, GE_TYPE_FLAG_SPECIAL, &GE_new968, 0},
{969, 0, &GE_new969, 0},
{970, 0, &GE_new970, 0},
{971, GE_TYPE_FLAG_SPECIAL, &GE_new971, 0},
{972, 0, &GE_new972, 0},
{973, GE_TYPE_FLAG_SPECIAL, &GE_new973, 0},
{974, 0, &GE_new974, 0},
{975, GE_TYPE_FLAG_SPECIAL, &GE_new975, 0},
{976, 0, &GE_new976, 0},
{977, GE_TYPE_FLAG_SPECIAL, &GE_new977, 0},
{978, 0, &GE_new978, 0},
{979, 0, 0, 0},
{980, GE_TYPE_FLAG_SPECIAL, &GE_new980, 0},
{981, 0, &GE_new981, 0},
{982, 0, &GE_new982, 0},
{983, GE_TYPE_FLAG_SPECIAL, &GE_new983, 0},
{984, 0, &GE_new984, 0},
{985, GE_TYPE_FLAG_SPECIAL, &GE_new985, 0},
{986, 0, &GE_new986, 0},
{987, GE_TYPE_FLAG_SPECIAL, &GE_new987, 0},
{988, 0, &GE_new988, 0},
{989, 0, 0, 0},
{990, GE_TYPE_FLAG_SPECIAL, &GE_new990, 0},
{991, 0, &GE_new991, 0},
{992, 0, &GE_new992, 0},
{993, GE_TYPE_FLAG_SPECIAL, &GE_new993, 0},
{994, 0, &GE_new994, 0},
{995, 0, &GE_new995, 0},
{996, GE_TYPE_FLAG_SPECIAL, &GE_new996, 0},
{997, 0, &GE_new997, 0},
{998, 0, &GE_new998, 0},
{999, GE_TYPE_FLAG_SPECIAL, &GE_new999, 0},
{1000, 0, &GE_new1000, 0},
{1001, 0, &GE_new1001, 0},
{1002, GE_TYPE_FLAG_SPECIAL, &GE_new1002, 0},
{1003, 0, &GE_new1003, 0},
{1004, 0, 0, 0},
{1005, GE_TYPE_FLAG_SPECIAL, &GE_new1005, 0},
{1006, 0, &GE_new1006, 0},
{1007, 0, 0, 0},
{1008, GE_TYPE_FLAG_SPECIAL, &GE_new1008, 0},
{1009, 0, &GE_new1009, 0},
{1010, 0, 0, 0},
{1011, GE_TYPE_FLAG_SPECIAL, &GE_new1011, 0},
{1012, 0, &GE_new1012, 0},
{1013, 0, &GE_new1013, 0},
{1014, GE_TYPE_FLAG_SPECIAL, &GE_new1014, 0},
{1015, 0, &GE_new1015, 0},
{1016, GE_TYPE_FLAG_SPECIAL, &GE_new1016, 0},
{1017, 0, &GE_new1017, 0},
{1018, GE_TYPE_FLAG_SPECIAL, &GE_new1018, 0},
{1019, 0, &GE_new1019, 0},
{1020, 0, &GE_new1020, 0},
{1021, GE_TYPE_FLAG_SPECIAL, &GE_new1021, 0},
{1022, 0, &GE_new1022, 0},
{1023, GE_TYPE_FLAG_SPECIAL, &GE_new1023, 0},
{1024, 0, &GE_new1024, 0},
{1025, 0, 0, 0},
{1026, GE_TYPE_FLAG_SPECIAL, &GE_new1026, 0},
{1027, 0, &GE_new1027, 0},
{1028, 0, 0, 0},
{1029, GE_TYPE_FLAG_SPECIAL, &GE_new1029, 0},
{1030, 0, &GE_new1030, 0},
{1031, 0, &GE_new1031, 0},
{1032, GE_TYPE_FLAG_SPECIAL, &GE_new1032, 0},
{1033, 0, &GE_new1033, 0},
{1034, 0, &GE_new1034, 0},
{1035, GE_TYPE_FLAG_SPECIAL, &GE_new1035, 0},
{1036, 0, &GE_new1036, 0},
{1037, 0, 0, 0},
{1038, GE_TYPE_FLAG_SPECIAL, &GE_new1038, 0},
{1039, 0, &GE_new1039, 0},
{1040, 0, 0, 0},
{1041, GE_TYPE_FLAG_SPECIAL, &GE_new1041, 0},
{1042, 0, &GE_new1042, 0},
{1043, 0, 0, 0},
{1044, GE_TYPE_FLAG_SPECIAL, &GE_new1044, 0},
{1045, 0, &GE_new1045, 0},
{1046, 0, &GE_new1046, 0},
{1047, GE_TYPE_FLAG_SPECIAL, &GE_new1047, 0},
{1048, 0, &GE_new1048, 0},
{1049, GE_TYPE_FLAG_SPECIAL, &GE_new1049, 0},
{1050, 0, &GE_new1050, 0},
{1051, 0, &GE_new1051, 0},
{1052, GE_TYPE_FLAG_SPECIAL, &GE_new1052, 0},
{1053, 0, &GE_new1053, 0},
{1054, GE_TYPE_FLAG_SPECIAL, &GE_new1054, 0},
{1055, 0, &GE_new1055, 0},
{1056, 0, &GE_new1056, 0},
{1057, GE_TYPE_FLAG_SPECIAL, &GE_new1057, 0},
{1058, 0, &GE_new1058, 0},
{1059, 0, &GE_new1059, 0},
{1060, GE_TYPE_FLAG_SPECIAL, &GE_new1060, 0},
{1061, 0, &GE_new1061, 0},
{1062, 0, &GE_new1062, 0},
{1063, GE_TYPE_FLAG_SPECIAL, &GE_new1063, 0},
{1064, 0, &GE_new1064, 0},
{1065, 0, 0, 0},
{1066, GE_TYPE_FLAG_SPECIAL, &GE_new1066, 0},
{1067, 0, &GE_new1067, 0},
{1068, GE_TYPE_FLAG_SPECIAL, &GE_new1068, 0},
{1069, 0, &GE_new1069, 0},
{1070, GE_TYPE_FLAG_SPECIAL, &GE_new1070, 0},
{1071, 0, &GE_new1071, 0},
{1072, 0, 0, 0},
{1073, GE_TYPE_FLAG_SPECIAL, &GE_new1073, 0},
{1074, 0, &GE_new1074, 0},
{1075, 0, &GE_new1075, 0},
{1076, GE_TYPE_FLAG_SPECIAL, &GE_new1076, 0},
{1077, 0, &GE_new1077, 0},
{1078, 0, &GE_new1078, 0},
{1079, GE_TYPE_FLAG_SPECIAL, &GE_new1079, 0},
{1080, 0, &GE_new1080, 0},
{1081, 0, &GE_new1081, 0},
{1082, GE_TYPE_FLAG_SPECIAL, &GE_new1082, 0},
{1083, 0, &GE_new1083, 0},
{1084, GE_TYPE_FLAG_SPECIAL, &GE_new1084, 0},
{1085, 0, &GE_new1085, 0},
{1086, 0, 0, 0},
{1087, GE_TYPE_FLAG_SPECIAL, &GE_new1087, 0},
{1088, 0, &GE_new1088, 0},
{1089, GE_TYPE_FLAG_SPECIAL, &GE_new1089, 0},
{1090, 0, &GE_new1090, 0},
{1091, 0, 0, 0},
{1092, GE_TYPE_FLAG_SPECIAL, &GE_new1092, 0},
{1093, 0, &GE_new1093, 0},
{1094, GE_TYPE_FLAG_SPECIAL, &GE_new1094, 0},
{1095, 0, &GE_new1095, 0},
{1096, 0, &GE_new1096, 0},
{1097, GE_TYPE_FLAG_SPECIAL, &GE_new1097, 0},
{1098, 0, &GE_new1098, 0},
{1099, 0, 0, 0},
{1100, GE_TYPE_FLAG_SPECIAL, &GE_new1100, 0},
{1101, 0, &GE_new1101, 0},
{1102, GE_TYPE_FLAG_SPECIAL, &GE_new1102, 0},
{1103, 0, &GE_new1103, 0},
{1104, 0, &GE_new1104, 0},
{1105, GE_TYPE_FLAG_SPECIAL, &GE_new1105, 0},
{1106, 0, &GE_new1106, 0},
{1107, 0, 0, 0},
{1108, GE_TYPE_FLAG_SPECIAL, &GE_new1108, 0},
{1109, 0, &GE_new1109, 0},
{1110, 0, 0, 0},
{1111, GE_TYPE_FLAG_SPECIAL, &GE_new1111, 0},
{1112, 0, &GE_new1112, 0},
{1113, 0, 0, 0},
{1114, GE_TYPE_FLAG_SPECIAL, &GE_new1114, 0},
{1115, 0, &GE_new1115, 0},
{1116, 0, 0, 0},
{1117, GE_TYPE_FLAG_SPECIAL, &GE_new1117, 0},
{1118, 0, &GE_new1118, 0},
{1119, 0, 0, 0},
{1120, GE_TYPE_FLAG_SPECIAL, &GE_new1120, 0},
{1121, 0, &GE_new1121, 0},
{1122, 0, &GE_new1122, 0},
{1123, GE_TYPE_FLAG_SPECIAL, &GE_new1123, 0},
{1124, 0, &GE_new1124, 0},
{1125, 0, 0, 0},
{1126, GE_TYPE_FLAG_SPECIAL, &GE_new1126, 0},
{1127, 0, &GE_new1127, 0},
{1128, GE_TYPE_FLAG_SPECIAL, &GE_new1128, 0},
{1129, 0, &GE_new1129, 0},
{1130, GE_TYPE_FLAG_SPECIAL, &GE_new1130, 0},
{1131, 0, &GE_new1131, 0},
{1132, 0, 0, 0},
{1133, GE_TYPE_FLAG_SPECIAL, &GE_new1133, 0},
{1134, 0, &GE_new1134, 0},
{1135, 0, &GE_new1135, 0},
{1136, GE_TYPE_FLAG_SPECIAL, &GE_new1136, 0},
{1137, 0, &GE_new1137, 0},
{1138, 0, 0, 0},
{1139, GE_TYPE_FLAG_SPECIAL, &GE_new1139, 0},
{1140, 0, &GE_new1140, 0},
{1141, GE_TYPE_FLAG_SPECIAL, &GE_new1141, 0},
{1142, 0, &GE_new1142, 0},
{1143, 0, &GE_new1143, 0},
{1144, GE_TYPE_FLAG_SPECIAL, &GE_new1144, 0},
{1145, 0, &GE_new1145, 0},
{1146, 0, &GE_new1146, 0},
{1147, GE_TYPE_FLAG_SPECIAL, &GE_new1147, 0},
{1148, 0, &GE_new1148, 0},
{1149, 0, 0, 0},
{1150, GE_TYPE_FLAG_SPECIAL, &GE_new1150, 0},
{1151, 0, &GE_new1151, 0},
{1152, 0, &GE_new1152, 0},
{1153, GE_TYPE_FLAG_SPECIAL, &GE_new1153, 0},
{1154, 0, &GE_new1154, 0},
{1155, GE_TYPE_FLAG_SPECIAL, &GE_new1155, 0},
{1156, 0, &GE_new1156, 0},
{1157, 0, 0, 0},
{1158, GE_TYPE_FLAG_SPECIAL, &GE_new1158, 0},
{1159, 0, &GE_new1159, 0},
{1160, 0, &GE_new1160, 0},
{1161, GE_TYPE_FLAG_SPECIAL, &GE_new1161, 0},
{1162, 0, &GE_new1162, 0},
{1163, GE_TYPE_FLAG_SPECIAL, &GE_new1163, 0},
{1164, 0, &GE_new1164, 0},
{1165, GE_TYPE_FLAG_SPECIAL, &GE_new1165, 0},
{1166, 0, &GE_new1166, 0},
{1167, GE_TYPE_FLAG_SPECIAL, &GE_new1167, 0},
{1168, 0, &GE_new1168, 0},
{1169, GE_TYPE_FLAG_SPECIAL, &GE_new1169, 0},
{1170, 0, &GE_new1170, 0},
{1171, 0, 0, 0},
{1172, GE_TYPE_FLAG_SPECIAL, &GE_new1172, 0},
{1173, 0, &GE_new1173, 0},
{1174, 0, 0, 0},
{1175, GE_TYPE_FLAG_SPECIAL, &GE_new1175, 0},
{1176, 0, &GE_new1176, 0},
{1177, GE_TYPE_FLAG_SPECIAL, &GE_new1177, 0},
{1178, 0, &GE_new1178, 0},
{1179, 0, &GE_new1179, 0},
{1180, GE_TYPE_FLAG_SPECIAL, &GE_new1180, 0},
{1181, 0, &GE_new1181, 0},
{1182, 0, &GE_new1182, 0},
{1183, GE_TYPE_FLAG_SPECIAL, &GE_new1183, 0},
{1184, 0, &GE_new1184, 0},
{1185, 0, 0, 0},
{1186, GE_TYPE_FLAG_SPECIAL, &GE_new1186, 0},
{1187, 0, &GE_new1187, 0},
{1188, 0, 0, 0},
{1189, GE_TYPE_FLAG_SPECIAL, &GE_new1189, 0},
{1190, 0, &GE_new1190, 0},
{1191, 0, &GE_new1191, 0},
{1192, GE_TYPE_FLAG_SPECIAL, &GE_new1192, 0},
{1193, 0, &GE_new1193, 0},
{1194, 0, &GE_new1194, 0},
{1195, GE_TYPE_FLAG_SPECIAL, &GE_new1195, 0},
{1196, 0, &GE_new1196, 0},
{1197, 0, &GE_new1197, 0},
{1198, GE_TYPE_FLAG_SPECIAL, &GE_new1198, 0},
{1199, 0, &GE_new1199, 0},
{1200, GE_TYPE_FLAG_SPECIAL, &GE_new1200, 0},
{1201, 0, 0, 0},
{1202, 0, 0, 0},
{1203, 0, &GE_new1203, 0},
{1204, 0, &GE_new1204, 0},
{1205, 0, &GE_new1205, 0},
{1206, 0, &GE_new1206, 0},
{1207, 0, &GE_new1207, 0},
{1208, 0, &GE_new1208, 0},
{1209, 0, &GE_new1209, 0},
{1210, 0, &GE_new1210, 0},
{1211, 0, &GE_new1211, 0},
{1212, 0, &GE_new1212, 0},
{1213, 0, &GE_new1213, 0},
{1214, 0, &GE_new1214, 0},
{1215, 0, 0, 0},
{1216, 0, &GE_new1216, 0},
{1217, 0, &GE_new1217, 0},
{1218, 0, &GE_new1218, 0},
{1219, 0, &GE_new1219, 0},
{1220, 0, 0, 0},
{1221, 0, 0, 0},
{1222, 0, 0, 0},
{1223, 0, &GE_new1223, 0},
{1224, 0, &GE_new1224, 0},
{1225, 0, &GE_new1225, 0},
{1226, 0, &GE_new1226, 0},
{1227, 0, &GE_new1227, 0},
{1228, 0, &GE_new1228, 0},
{1229, 0, &GE_new1229, 0},
{1230, 0, &GE_new1230, 0},
{1231, 0, &GE_new1231, 0},
{1232, 0, 0, 0},
{1233, 0, &GE_new1233, 0},
{1234, 0, &GE_new1234, 0},
{1235, 0, 0, 0},
{1236, 0, &GE_new1236, 0},
{1237, 0, &GE_new1237, 0},
{1238, 0, &GE_new1238, 0},
{1239, 0, 0, 0},
{1240, 0, &GE_new1240, 0},
{1241, 0, &GE_new1241, 0},
{1242, 0, &GE_new1242, 0},
{1243, 0, &GE_new1243, 0},
{1244, 0, &GE_new1244, 0},
{1245, 0, &GE_new1245, 0},
{1246, 0, &GE_new1246, 0},
{1247, 0, 0, 0},
{1248, 0, 0, 0},
{1249, 0, &GE_new1249, 0},
{1250, 0, 0, 0},
{1251, 0, &GE_new1251, 0},
{1252, 0, &GE_new1252, 0},
{1253, 0, &GE_new1253, 0},
{1254, 0, &GE_new1254, 0},
{1255, 0, &GE_new1255, 0},
{1256, 0, &GE_new1256, 0},
{1257, 0, &GE_new1257, 0},
{1258, 0, &GE_new1258, 0},
{1259, 0, &GE_new1259, 0},
{1260, 0, &GE_new1260, 0},
{1261, 0, &GE_new1261, 0},
{1262, 0, &GE_new1262, 0},
{1263, 0, 0, 0},
{1264, 0, &GE_new1264, 0},
{1265, 0, &GE_new1265, 0},
{1266, 0, &GE_new1266, 0},
{1267, 0, &GE_new1267, 0},
{1268, 0, &GE_new1268, 0},
{1269, 0, &GE_new1269, 0},
{1270, 0, &GE_new1270, 0},
{1271, 0, &GE_new1271, 0},
{1272, 0, &GE_new1272, 0},
{1273, 0, &GE_new1273, 0},
{1274, 0, &GE_new1274, 0},
{1275, 0, &GE_new1275, 0},
{1276, 0, &GE_new1276, 0},
{1277, 0, &GE_new1277, 0},
{1278, 0, &GE_new1278, 0},
{1279, 0, &GE_new1279, 0},
{1280, 0, &GE_new1280, 0},
{1281, 0, &GE_new1281, 0},
{1282, 0, &GE_new1282, 0},
{1283, 0, &GE_new1283, 0},
{1284, 0, &GE_new1284, 0},
{1285, 0, &GE_new1285, 0},
{1286, 0, 0, 0},
{1287, 0, &GE_new1287, 0},
{1288, 0, &GE_new1288, 0},
{1289, 0, &GE_new1289, 0},
{1290, 0, &GE_new1290, 0},
{1291, 0, &GE_new1291, 0},
{1292, 0, &GE_new1292, 0},
{1293, 0, &GE_new1293, 0},
{1294, 0, &GE_new1294, 0},
{1295, 0, 0, 0},
{1296, 0, &GE_new1296, 0},
{1297, 0, &GE_new1297, 0},
{1298, 0, 0, 0},
{1299, 0, &GE_new1299, 0},
{1300, 0, &GE_new1300, 0},
{1301, 0, &GE_new1301, 0},
{1302, 0, &GE_new1302, 0},
{1303, 0, &GE_new1303, 0},
{1304, 0, &GE_new1304, 0},
{1305, 0, &GE_new1305, 0},
{1306, 0, &GE_new1306, 0},
{1307, 0, &GE_new1307, 0},
{1308, 0, &GE_new1308, 0},
{1309, 0, &GE_new1309, 0},
{1310, 0, &GE_new1310, 0},
{1311, 0, &GE_new1311, 0},
{1312, 0, &GE_new1312, 0},
{1313, 0, &GE_new1313, 0},
{1314, 0, &GE_new1314, 0},
{1315, 0, &GE_new1315, 0},
{1316, 0, 0, 0},
{1317, 0, &GE_new1317, 0},
{1318, 0, &GE_new1318, 0},
{1319, 0, &GE_new1319, 0},
{1320, 0, &GE_new1320, 0},
{1321, GE_TYPE_FLAG_SPECIAL, &GE_new1321, 0},
{1322, 0, 0, 0},
{1323, 0, &GE_new1323, 0},
{1324, 0, 0, 0},
{1325, 0, &GE_new1325, 0},
{1326, 0, &GE_new1326, 0},
{1327, 0, &GE_new1327, 0},
{1328, 0, &GE_new1328, 0},
{1329, GE_TYPE_FLAG_SPECIAL, &GE_new1329, 0},
{1330, 0, 0, 0},
{1331, 0, &GE_new1331, 0},
{1332, 0, &GE_new1332, 0},
{1333, 0, 0, 0},
{1334, 0, &GE_new1334, 0},
{1335, GE_TYPE_FLAG_SPECIAL, &GE_new1335, 0},
{1336, 0, &GE_new1336, 0},
{1337, 0, &GE_new1337, 0},
{1338, 0, &GE_new1338, 0},
{1339, 0, &GE_new1339, 0},
{1340, 0, &GE_new1340, 0},
{1341, 0, &GE_new1341, 0},
{1342, 0, &GE_new1342, 0},
{1343, 0, &GE_new1343, 0},
{1344, 0, 0, 0},
{1345, 0, &GE_new1345, 0},
{1346, 0, &GE_new1346, 0},
{1347, 0, 0, 0},
{1348, 0, &GE_new1348, 0},
{1349, 0, &GE_new1349, 0},
{1350, 0, &GE_new1350, 0},
{1351, 0, &GE_new1351, 0},
{1352, GE_TYPE_FLAG_SPECIAL, &GE_new1352, 0},
{1353, 0, &GE_new1353, 0},
{1354, 0, &GE_new1354, 0},
{1355, 0, &GE_new1355, 0},
{1356, 0, &GE_new1356, 0},
{1357, GE_TYPE_FLAG_SPECIAL, &GE_new1357, 0},
{1358, 0, 0, 0},
{1359, 0, 0, 0},
{1360, 0, &GE_new1360, 0},
{1361, 0, &GE_new1361, 0},
{1362, 0, &GE_new1362, 0},
{1363, 0, &GE_new1363, 0},
{1364, 0, &GE_new1364, 0},
{1365, 0, &GE_new1365, 0},
{1366, 0, &GE_new1366, 0},
{1367, 0, &GE_new1367, 0},
{1368, 0, &GE_new1368, 0},
{1369, GE_TYPE_FLAG_SPECIAL, &GE_new1369, 0},
{1370, 0, &GE_new1370, 0},
{1371, 0, &GE_new1371, 0},
{1372, GE_TYPE_FLAG_SPECIAL, &GE_new1372, 0},
{1373, 0, &GE_new1373, 0},
{1374, 0, &GE_new1374, 0},
{1375, 0, &GE_new1375, 0},
{1376, 0, &GE_new1376, 0},
{1377, GE_TYPE_FLAG_SPECIAL, &GE_new1377, 0},
{1378, GE_TYPE_FLAG_SPECIAL, &GE_new1378, 0},
{1379, 0, &GE_new1379, 0},
{1380, 0, &GE_new1380, 0},
{1381, GE_TYPE_FLAG_SPECIAL, &GE_new1381, 0},
{1382, 0, &GE_new1382, 0},
{1383, GE_TYPE_FLAG_SPECIAL, &GE_new1383, 0},
{1384, 0, &GE_new1384, 0},
{1385, 0, &GE_new1385, 0},
{1386, 0, 0, 0},
{1387, 0, &GE_new1387, 0},
{1388, 0, &GE_new1388, 0},
{1389, 0, &GE_new1389, 0},
{1390, 0, &GE_new1390, 0},
{1391, 0, 0, 0},
{1392, 0, 0, 0},
{1393, 0, &GE_new1393, 0},
{1394, 0, &GE_new1394, 0},
{1395, 0, 0, 0},
{1396, 0, &GE_new1396, 0},
{1397, 0, 0, 0},
{1398, 0, 0, 0},
{1399, 0, &GE_new1399, 0},
{1400, 0, &GE_new1400, 0},
{1401, GE_TYPE_FLAG_TUPLE, &GE_new1401, 0},
{1402, 0, &GE_new1402, 0},
{1403, 0, &GE_new1403, 0},
{1404, GE_TYPE_FLAG_TUPLE, &GE_new1404, 0},
{1405, GE_TYPE_FLAG_TUPLE, &GE_new1405, 0},
{1406, 0, 0, 0},
{1407, 0, 0, 0},
{1408, 0, &GE_new1408, 0},
{1409, GE_TYPE_FLAG_TUPLE, &GE_new1409, 0},
{1410, 0, &GE_new1410, 0},
{1411, GE_TYPE_FLAG_TUPLE, &GE_new1411, 0},
{1412, 0, 0, 0},
{1413, 0, &GE_new1413, 0},
{1414, 0, &GE_new1414, 0},
{1415, GE_TYPE_FLAG_EXPANDED, 0, 0},
{1416, GE_TYPE_FLAG_EXPANDED, 0, 0},
{1417, 0, &GE_new1417, 0},
{1418, 0, &GE_new1418, 0},
{1419, 0, &GE_new1419, 0},
{1420, 0, &GE_new1420, 0},
{1421, 0, 0, 0},
{1422, 0, 0, 0},
{1423, 0, 0, 0},
{1424, 0, 0, 0},
{1425, 0, 0, 0},
{1426, 0, &GE_new1426, 0},
{1427, GE_TYPE_FLAG_TUPLE, &GE_new1427, 0},
{1428, GE_TYPE_FLAG_TUPLE, &GE_new1428, 0},
{1429, 0, &GE_new1429, 0},
{1430, 0, &GE_new1430, 0},
{1431, 0, &GE_new1431, 0},
{1432, 0, &GE_new1432, 0},
{1433, 0, 0, 0},
{1434, GE_TYPE_FLAG_TUPLE, &GE_new1434, 0},
{1435, 0, &GE_new1435, 0},
{1436, 0, 0, 0},
{1437, 0, 0, 0},
{1438, 0, 0, 0},
{1439, 0, 0, 0},
{1440, 0, 0, 0},
{1441, 0, 0, 0},
{1442, 0, &GE_new1442, 0},
{1443, 0, &GE_new1443, 0},
{1444, 0, 0, 0},
{1445, 0, 0, 0},
{1446, 0, &GE_new1446, 0},
{1447, GE_TYPE_FLAG_SPECIAL, &GE_new1447, 0},
{1448, GE_TYPE_FLAG_SPECIAL, &GE_new1448, 0},
{1449, 0, &GE_new1449, 0},
{1450, 0, &GE_new1450, 0},
{1451, 0, &GE_new1451, 0},
{1452, 0, &GE_new1452, 0},
{1453, 0, &GE_new1453, 0},
{1454, 0, &GE_new1454, 0},
{1455, 0, &GE_new1455, 0},
{1456, 0, &GE_new1456, 0},
{1457, 0, &GE_new1457, 0},
{1458, 0, &GE_new1458, 0},
{1459, 0, &GE_new1459, 0},
{1460, 0, &GE_new1460, 0},
{1461, 0, 0, 0},
{1462, 0, 0, 0},
{1463, 0, 0, 0},
{1464, 0, 0, 0},
{1465, 0, &GE_new1465, 0},
{1466, 0, &GE_new1466, 0},
{1467, GE_TYPE_FLAG_SPECIAL, &GE_new1467, 0},
{1468, 0, &GE_new1468, 0},
{1469, 0, &GE_new1469, 0},
{1470, 0, &GE_new1470, 0},
{1471, 0, &GE_new1471, 0},
{1472, 0, 0, 0},
{1473, 0, &GE_new1473, 0},
{1474, 0, &GE_new1474, 0},
{1475, GE_TYPE_FLAG_SPECIAL, &GE_new1475, 0},
{1476, 0, &GE_new1476, 0},
{1477, 0, &GE_new1477, 0},
{1478, GE_TYPE_FLAG_SPECIAL, &GE_new1478, 0},
{1479, 0, 0, 0},
{1480, 0, &GE_new1480, 0},
{1481, 0, 0, 0},
{1482, 0, &GE_new1482, 0},
{1483, 0, &GE_new1483, 0},
{1484, GE_TYPE_FLAG_SPECIAL, &GE_new1484, 0},
{1485, 0, &GE_new1485, 0},
{1486, GE_TYPE_FLAG_SPECIAL, &GE_new1486, 0},
{1487, 0, &GE_new1487, 0},
{1488, GE_TYPE_FLAG_SPECIAL, &GE_new1488, 0},
{1489, 0, &GE_new1489, 0},
{1490, 0, &GE_new1490, 0},
{1491, 0, &GE_new1491, 0},
{1492, 0, &GE_new1492, 0},
{1493, 0, 0, 0},
{1494, 0, 0, 0},
{1495, 0, &GE_new1495, 0},
{1496, 0, &GE_new1496, 0},
{1497, 0, &GE_new1497, 0},
{1498, GE_TYPE_FLAG_SPECIAL, &GE_new1498, 0},
{1499, 0, 0, 0},
{1500, 0, 0, 0},
{1501, 0, &GE_new1501, 0},
{1502, 0, 0, 0},
{1503, 0, &GE_new1503, 0},
{1504, 0, &GE_new1504, 0},
{1505, GE_TYPE_FLAG_SPECIAL, &GE_new1505, 0},
{1506, 0, &GE_new1506, 0},
{1507, 0, 0, 0},
{1508, 0, &GE_new1508, 0},
{1509, 0, &GE_new1509, 0},
{1510, GE_TYPE_FLAG_SPECIAL, &GE_new1510, 0},
{1511, 0, &GE_new1511, 0},
{1512, 0, &GE_new1512, 0},
{1513, 0, 0, 0},
{1514, 0, &GE_new1514, 0},
{1515, 0, &GE_new1515, 0},
{1516, 0, &GE_new1516, 0},
{1517, 0, &GE_new1517, 0},
{1518, 0, &GE_new1518, 0},
{1519, 0, 0, 0},
{1520, 0, 0, 0},
{1521, 0, &GE_new1521, 0},
{1522, 0, &GE_new1522, 0},
{1523, 0, &GE_new1523, 0},
{1524, 0, &GE_new1524, 0},
{1525, 0, &GE_new1525, 0},
{1526, 0, 0, 0},
{1527, 0, &GE_new1527, 0},
{1528, 0, 0, 0},
{1529, 0, &GE_new1529, 0},
{1530, 0, &GE_new1530, 0},
{1531, 0, &GE_new1531, 0},
{1532, 0, &GE_new1532, 0},
{1533, 0, &GE_new1533, 0},
{1534, 0, &GE_new1534, 0},
{1535, 0, &GE_new1535, 0},
{1536, 0, 0, 0},
{1537, 0, &GE_new1537, 0},
{1538, 0, &GE_new1538, 0},
{1539, 0, &GE_new1539, 0},
{1540, 0, 0, 0},
{1541, GE_TYPE_FLAG_SPECIAL, &GE_new1541, 0},
{1542, 0, &GE_new1542, 0},
{1543, GE_TYPE_FLAG_SPECIAL, &GE_new1543, 0},
{1544, 0, &GE_new1544, 0},
{1545, 0, 0, 0},
{1546, 0, &GE_new1546, 0},
{1547, 0, &GE_new1547, 0},
{1548, 0, &GE_new1548, 0},
{1549, 0, &GE_new1549, 0},
{1550, GE_TYPE_FLAG_TUPLE, &GE_new1550, 0},
{1551, GE_TYPE_FLAG_TUPLE, &GE_new1551, 0},
{1552, GE_TYPE_FLAG_TUPLE, &GE_new1552, 0},
{1553, GE_TYPE_FLAG_TUPLE, &GE_new1553, 0},
{1554, 0, &GE_new1554, 0},
{1555, 0, &GE_new1555, 0},
{1556, 0, &GE_new1556, 0},
{1557, 0, &GE_new1557, 0},
{1558, 0, 0, 0},
{1559, 0, 0, 0},
{1560, GE_TYPE_FLAG_TUPLE, &GE_new1560, 0},
{1561, GE_TYPE_FLAG_TUPLE, &GE_new1561, 0},
{1562, 0, 0, 0},
{1563, 0, 0, 0},
{1564, 0, 0, 0},
{1565, 0, 0, 0},
{1566, 0, 0, 0},
{1567, 0, &GE_new1567, 0},
{1568, 0, &GE_new1568, 0},
{1569, 0, &GE_new1569, 0},
{1570, 0, 0, 0},
{1571, 0, &GE_new1571, 0},
{1572, 0, 0, 0},
{1573, 0, &GE_new1573, 0},
{1574, 0, 0, 0},
{1575, 0, &GE_new1575, 0},
{1576, 0, &GE_new1576, 0},
{1577, 0, 0, 0},
{1578, 0, 0, 0},
{1579, 0, 0, 0},
{1580, 0, 0, 0},
{1581, GE_TYPE_FLAG_TUPLE, &GE_new1581, 0},
{1582, 0, &GE_new1582, 0},
{1583, GE_TYPE_FLAG_TUPLE, &GE_new1583, 0},
{1584, 0, 0, 0},
{1585, GE_TYPE_FLAG_TUPLE, &GE_new1585, 0},
{1586, 0, &GE_new1586, 0},
{1587, 0, 0, 0},
{1588, GE_TYPE_FLAG_TUPLE, &GE_new1588, 0},
{1589, 0, &GE_new1589, 0},
{1590, 0, 0, 0},
{1591, 0, 0, 0},
{1592, 0, &GE_new1592, 0},
{1593, GE_TYPE_FLAG_TUPLE, &GE_new1593, 0},
{1594, 0, &GE_new1594, 0},
{1595, GE_TYPE_FLAG_TUPLE, &GE_new1595, 0},
{1596, 0, 0, 0},
{1597, 0, &GE_new1597, 0},
{1598, GE_TYPE_FLAG_TUPLE, &GE_new1598, 0},
{1599, 0, 0, 0},
{1600, 0, 0, 0},
{1601, 0, 0, 0},
{1602, 0, &GE_new1602, 0},
{1603, 0, 0, 0},
{1604, 0, 0, 0},
{1605, 0, 0, 0},
{1606, 0, 0, 0},
{1607, 0, 0, 0},
{1608, 0, 0, 0},
{1609, 0, 0, 0},
{1610, 0, 0, 0},
{1611, 0, 0, 0},
{1612, 0, &GE_new1612, 0},
{1613, 0, 0, 0},
{1614, 0, 0, 0},
{1615, GE_TYPE_FLAG_SPECIAL, &GE_new1615, 0},
{1616, 0, &GE_new1616, 0},
{1617, 0, &GE_new1617, 0},
{1618, GE_TYPE_FLAG_SPECIAL, &GE_new1618, 0},
{1619, GE_TYPE_FLAG_SPECIAL, &GE_new1619, 0},
{1620, 0, &GE_new1620, 0},
{1621, 0, &GE_new1621, 0},
{1622, GE_TYPE_FLAG_SPECIAL, &GE_new1622, 0},
{1623, 0, &GE_new1623, 0},
{1624, 0, &GE_new1624, 0},
{1625, GE_TYPE_FLAG_SPECIAL, &GE_new1625, 0},
{1626, 0, &GE_new1626, 0},
{1627, 0, &GE_new1627, 0},
{1628, 0, &GE_new1628, 0},
{1629, GE_TYPE_FLAG_SPECIAL, &GE_new1629, 0},
{1630, 0, &GE_new1630, 0},
{1631, 0, &GE_new1631, 0},
{1632, GE_TYPE_FLAG_SPECIAL, &GE_new1632, 0},
{1633, 0, &GE_new1633, 0},
{1634, 0, &GE_new1634, 0},
{1635, GE_TYPE_FLAG_SPECIAL, &GE_new1635, 0},
{1636, 0, &GE_new1636, 0},
{1637, 0, &GE_new1637, 0},
{1638, GE_TYPE_FLAG_SPECIAL, &GE_new1638, 0},
{1639, 0, &GE_new1639, 0},
{1640, 0, &GE_new1640, 0},
{1641, GE_TYPE_FLAG_SPECIAL, &GE_new1641, 0},
{1642, 0, &GE_new1642, 0},
{1643, 0, &GE_new1643, 0},
{1644, GE_TYPE_FLAG_SPECIAL, &GE_new1644, 0},
{1645, 0, &GE_new1645, 0},
{1646, 0, &GE_new1646, 0},
{1647, 0, &GE_new1647, 0},
{1648, 0, &GE_new1648, 0},
{1649, 0, &GE_new1649, 0},
{1650, 0, 0, 0},
{1651, GE_TYPE_FLAG_SPECIAL, &GE_new1651, 0},
{1652, 0, 0, 0},
{1653, 0, 0, 0},
{1654, 0, &GE_new1654, 0},
{1655, 0, &GE_new1655, 0},
{1656, 0, &GE_new1656, 0},
{1657, 0, &GE_new1657, 0},
{1658, 0, &GE_new1658, 0},
{1659, 0, &GE_new1659, 0},
{1660, GE_TYPE_FLAG_SPECIAL, &GE_new1660, 0},
{1661, 0, 0, 0},
{1662, 0, 0, 0},
{1663, 0, 0, 0},
{1664, 0, 0, 0},
{1665, GE_TYPE_FLAG_SPECIAL, &GE_new1665, 0},
{1666, 0, &GE_new1666, 0},
{1667, 0, &GE_new1667, 0},
{1668, 0, &GE_new1668, 0},
{1669, 0, &GE_new1669, 0},
{1670, 0, 0, 0},
{1671, 0, 0, 0},
{1672, 0, &GE_new1672, 0},
{1673, 0, &GE_new1673, 0},
{1674, GE_TYPE_FLAG_SPECIAL, &GE_new1674, 0},
{1675, 0, 0, 0},
{1676, 0, &GE_new1676, 0},
{1677, 0, &GE_new1677, 0},
{1678, 0, &GE_new1678, 0},
{1679, 0, &GE_new1679, 0},
{1680, GE_TYPE_FLAG_SPECIAL, &GE_new1680, 0},
{1681, 0, &GE_new1681, 0},
{1682, GE_TYPE_FLAG_SPECIAL, &GE_new1682, 0},
{1683, 0, &GE_new1683, 0},
{1684, 0, &GE_new1684, 0},
{1685, GE_TYPE_FLAG_SPECIAL, &GE_new1685, 0},
{1686, 0, 0, 0},
{1687, 0, 0, 0},
{1688, 0, &GE_new1688, 0},
{1689, 0, &GE_new1689, 0},
{1690, 0, &GE_new1690, 0},
{1691, 0, &GE_new1691, 0},
{1692, 0, &GE_new1692, 0},
{1693, 0, 0, 0},
{1694, 0, &GE_new1694, 0},
{1695, 0, &GE_new1695, 0},
{1696, 0, &GE_new1696, 0},
{1697, GE_TYPE_FLAG_SPECIAL, &GE_new1697, 0},
{1698, 0, &GE_new1698, 0},
{1699, 0, &GE_new1699, 0},
{1700, 0, 0, 0},
{1701, 0, 0, 0},
{1702, 0, &GE_new1702, 0},
{1703, 0, 0, 0},
{1704, 0, 0, 0},
{1705, 0, &GE_new1705, 0},
{1706, GE_TYPE_FLAG_TUPLE, &GE_new1706, 0},
{1707, GE_TYPE_FLAG_TUPLE, &GE_new1707, 0},
{1708, 0, 0, 0},
{1709, 0, 0, 0},
{1710, 0, 0, 0},
{1711, 0, 0, 0},
{1712, GE_TYPE_FLAG_SPECIAL, &GE_new1712, 0},
{1713, 0, &GE_new1713, 0},
{1714, 0, 0, 0},
{1715, 0, 0, 0},
{1716, 0, 0, 0},
{1717, 0, &GE_new1717, 0},
{1718, 0, 0, 0},
{1719, 0, 0, 0},
{1720, 0, &GE_new1720, 0},
{1721, 0, 0, 0},
{1722, 0, 0, 0},
{1723, 0, 0, 0},
{1724, GE_TYPE_FLAG_TUPLE, &GE_new1724, 0},
{1725, 0, 0, 0},
{1726, 0, 0, 0},
{1727, 0, 0, 0},
{1728, 0, 0, 0},
{1729, 0, 0, 0},
{1730, 0, 0, 0},
{1731, 0, 0, 0},
{1732, 0, &GE_new1732, 0},
{1733, 0, 0, 0},
{1734, 0, 0, 0},
{1735, 0, &GE_new1735, 0},
{1736, 0, 0, 0},
{1737, 0, 0, 0},
{1738, GE_TYPE_FLAG_TUPLE, &GE_new1738, 0},
{1739, GE_TYPE_FLAG_TUPLE, &GE_new1739, 0},
{1740, GE_TYPE_FLAG_TUPLE, &GE_new1740, 0},
{1741, GE_TYPE_FLAG_TUPLE, &GE_new1741, 0},
{1742, GE_TYPE_FLAG_TUPLE, &GE_new1742, 0},
{1743, 0, 0, 0},
{1744, 0, 0, 0},
{1745, GE_TYPE_FLAG_SPECIAL, &GE_new1745, 0},
{1746, 0, &GE_new1746, 0},
{1747, 0, &GE_new1747, 0},
{1748, 0, &GE_new1748, 0},
{1749, 0, &GE_new1749, 0},
{1750, 0, &GE_new1750, 0},
{1751, 0, &GE_new1751, 0},
{1752, 0, &GE_new1752, 0},
{1753, 0, &GE_new1753, 0},
{1754, GE_TYPE_FLAG_SPECIAL, &GE_new1754, 0},
{1755, 0, &GE_new1755, 0},
{1756, 0, &GE_new1756, 0},
{1757, GE_TYPE_FLAG_SPECIAL, &GE_new1757, 0},
{1758, 0, &GE_new1758, 0},
{1759, 0, &GE_new1759, 0},
{1760, 0, &GE_new1760, 0},
{1761, 0, &GE_new1761, 0},
{1762, 0, &GE_new1762, 0},
{1763, 0, &GE_new1763, 0},
{1764, 0, &GE_new1764, 0},
{1765, 0, &GE_new1765, 0},
{1766, 0, &GE_new1766, 0},
{1767, 0, &GE_new1767, 0},
{1768, 0, &GE_new1768, 0},
{1769, GE_TYPE_FLAG_SPECIAL, &GE_new1769, 0},
{1770, 0, &GE_new1770, 0},
{1771, 0, &GE_new1771, 0},
{1772, 0, &GE_new1772, 0},
{1773, 0, &GE_new1773, 0},
{1774, 0, &GE_new1774, 0},
{1775, 0, &GE_new1775, 0},
{1776, 0, &GE_new1776, 0},
{1777, 0, &GE_new1777, 0},
{1778, 0, &GE_new1778, 0},
{1779, 0, &GE_new1779, 0},
{1780, 0, &GE_new1780, 0},
{1781, 0, 0, 0},
{1782, 0, &GE_new1782, 0},
{1783, 0, 0, 0},
{1784, 0, &GE_new1784, 0},
{1785, GE_TYPE_FLAG_SPECIAL, &GE_new1785, 0},
{1786, 0, 0, 0},
{1787, 0, 0, 0},
{1788, 0, &GE_new1788, 0},
{1789, 0, &GE_new1789, 0},
{1790, 0, &GE_new1790, 0},
{1791, 0, 0, 0},
{1792, 0, &GE_new1792, 0},
{1793, 0, 0, 0},
{1794, 0, 0, 0},
{1795, GE_TYPE_FLAG_TUPLE, &GE_new1795, 0},
{1796, 0, 0, 0},
{1797, 0, 0, 0},
{1798, 0, 0, 0},
{1799, 0, 0, 0},
{1800, 0, 0, 0},
{1801, 0, 0, 0},
{1802, 0, 0, 0},
{1803, 0, 0, 0},
{1804, 0, 0, 0},
{1805, 0, 0, 0},
{1806, 0, 0, 0},
{1807, 0, 0, 0},
{1808, 0, 0, 0},
{1809, 0, 0, 0},
{1810, 0, &GE_new1810, 0},
{1811, 0, 0, 0},
{1812, 0, 0, 0},
{1813, 0, 0, 0},
{1814, 0, 0, 0},
{1815, 0, &GE_new1815, 0},
{1816, 0, &GE_new1816, 0},
{1817, 0, 0, 0},
{1818, 0, 0, 0},
{1819, 0, 0, 0},
{1820, 0, 0, 0},
{1821, 0, 0, 0},
{1822, 0, 0, 0},
{1823, GE_TYPE_FLAG_TUPLE, &GE_new1823, 0},
{1824, 0, &GE_new1824, 0},
{1825, GE_TYPE_FLAG_TUPLE, &GE_new1825, 0},
{1826, GE_TYPE_FLAG_TUPLE, &GE_new1826, 0},
{1827, 0, &GE_new1827, 0},
{1828, GE_TYPE_FLAG_TUPLE, &GE_new1828, 0},
{1829, 0, &GE_new1829, 0},
{1830, GE_TYPE_FLAG_TUPLE, &GE_new1830, 0},
{1831, 0, 0, 0},
{1832, 0, 0, 0},
{1833, 0, 0, 0},
{1834, 0, &GE_new1834, 0},
{1835, 0, 0, 0},
{1836, 0, 0, 0},
{1837, 0, &GE_new1837, 0},
{1838, 0, 0, 0},
{1839, 0, &GE_new1839, 0},
{1840, 0, &GE_new1840, 0},
{1841, 0, &GE_new1841, 0},
{1842, GE_TYPE_FLAG_SPECIAL, &GE_new1842, 0},
{1843, 0, &GE_new1843, 0},
{1844, 0, &GE_new1844, 0},
{1845, 0, 0, 0},
{1846, 0, 0, 0},
{1847, 0, &GE_new1847, 0},
{1848, 0, 0, 0},
{1849, 0, &GE_new1849, 0},
{1850, 0, 0, 0},
{1851, 0, &GE_new1851, 0},
{1852, 0, &GE_new1852, 0},
{1853, GE_TYPE_FLAG_SPECIAL, &GE_new1853, 0},
{1854, 0, &GE_new1854, 0},
{1855, 0, 0, 0},
{1856, 0, &GE_new1856, 0},
{1857, 0, &GE_new1857, 0},
{1858, 0, 0, 0},
{1859, 0, &GE_new1859, 0},
{1860, 0, 0, 0},
{1861, GE_TYPE_FLAG_SPECIAL, &GE_new1861, 0},
{1862, 0, 0, 0},
{1863, 0, &GE_new1863, 0},
{1864, 0, &GE_new1864, 0},
{1865, 0, 0, 0},
{1866, GE_TYPE_FLAG_SPECIAL, &GE_new1866, 0},
{1867, 0, &GE_new1867, 0},
{1868, 0, &GE_new1868, 0},
{1869, 0, &GE_new1869, 0},
{1870, 0, &GE_new1870, 0},
{1871, 0, &GE_new1871, 0},
{1872, 0, &GE_new1872, 0},
{1873, 0, 0, 0},
{1874, 0, &GE_new1874, 0},
{1875, 0, 0, 0},
{1876, 0, 0, 0},
{1877, 0, &GE_new1877, 0},
{1878, 0, &GE_new1878, 0},
{1879, 0, &GE_new1879, 0},
{1880, 0, &GE_new1880, 0},
{1881, 0, &GE_new1881, 0},
{1882, 0, 0, 0},
{1883, 0, 0, 0},
{1884, 0, 0, 0},
{1885, 0, 0, 0},
{1886, 0, &GE_new1886, 0},
{1887, 0, 0, 0},
{1888, 0, 0, 0},
{1889, 0, &GE_new1889, 0},
{1890, 0, 0, 0},
{1891, 0, &GE_new1891, 0},
{1892, 0, &GE_new1892, 0},
{1893, 0, 0, 0},
{1894, 0, 0, 0},
{1895, 0, &GE_new1895, 0},
{1896, 0, 0, 0},
{1897, 0, 0, 0},
{1898, GE_TYPE_FLAG_SPECIAL, &GE_new1898, 0},
{1899, 0, &GE_new1899, 0},
{1900, 0, &GE_new1900, 0},
{1901, GE_TYPE_FLAG_SPECIAL, &GE_new1901, 0},
{1902, 0, &GE_new1902, 0},
{1903, 0, &GE_new1903, 0},
{1904, GE_TYPE_FLAG_TUPLE, &GE_new1904, 0},
{1905, GE_TYPE_FLAG_TUPLE, &GE_new1905, 0},
{1906, GE_TYPE_FLAG_TUPLE, &GE_new1906, 0},
{1907, GE_TYPE_FLAG_TUPLE, &GE_new1907, 0},
{1908, GE_TYPE_FLAG_TUPLE, &GE_new1908, 0},
{1909, GE_TYPE_FLAG_TUPLE, &GE_new1909, 0},
{1910, GE_TYPE_FLAG_TUPLE, &GE_new1910, 0},
{1911, 0, &GE_new1911, 0},
{1912, 0, 0, 0},
{1913, 0, 0, 0},
{1914, 0, &GE_new1914, 0}
};

int GE_main(int argc, EIF_NATIVE_CHAR** argv)
{
	T0* t1;
	GE_context tc = GE_default_context;
	GE_context* ac = &tc;
	GE_type_info_count = 1914;
	GE_argc = argc;
	GE_argv = argv;
	GE_main_context = ac;
	GE_system_name = "gec";
	GE_root_class_name = "GEC";
	GE_init_gc();
	GE_new_exception_manager = &GE_new19;
	GE_init_exception_manager = &T19f14;
	GE_set_exception_data = &T19f15;
	GE_init_exception(ac);
	GE_init_identified();
	GE_init_const();
	t1 = T22c42(ac);
	return 0;
}


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class ARGUMENTS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
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
EIF_NATIVE_CHAR** GE_argv;

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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_EXCEPTION_C
#define GE_EXCEPTION_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif
#ifdef EIF_WINDOWS
#include <winbase.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Pre-defined exception tags. No restriction on size.
 */
static char* GE_exception_tags[] = {
	(char *) 0,							/* Nothing */
	"Feature call on void target.",		/* GE_EX_VOID */
	"No more memory.",					/* GE_EX_MEM */
	"Precondition violated.",			/* GE_EX_PRE */
	"Postcondition violated.",			/* GE_EX_POST */
	"Floating point exception.",		/* GE_EX_FLOAT */
	"Class invariant violated.",		/* GE_EX_CINV */
	"Assertion violated.",				/* GE_EX_CHECK */
	"Routine failure.",					/* GE_EX_FAIL */
	"Unmatched inspect value.",			/* GE_EX_WHEN */
	"Non-decreasing loop variant or negative value reached.",		/* GE_EX_VAR */
	"Loop invariant violated.",			/* GE_EX_LINV */
	"Operating system signal.",			/* GE_EX_SIG */
	"Eiffel run-time panic.",			/* GE_EX_BYE */
	"Exception in rescue clause.",		/* GE_EX_RESC */
	"Out of memory.",					/* GE_EX_OMEM */
	"Resumption attempt failed.",		/* GE_EX_RES */
	"Create on deferred.",				/* GE_EX_CDEF */
	"External event.",					/* GE_EX_EXT */
	"Void assigned to expanded.",		/* GE_EX_VEXP */
	"Exception in signal handler.",		/* GE_EX_HDLR */
	"I/O error.",						/* GE_EX_IO */
	"Operating system error.",			/* GE_EX_SYS */
	"Retrieval error.",					/* GE_EX_RETR */
	"Developer exception.",				/* GE_EX_PROG */
	"Eiffel run-time fatal error.",		/* GE_EX_FATAL */
	"CECIL cannot call melted code",	/* GE_EX_DOL */
	"Runtime I/O error.",				/* GE_EX_ISE_IO */
	"COM error.",						/* GE_EX_COM */
	"Runtime check violated.",			/* GE_EX_RT_CHECK */
	"Old expression evaluation failed.",/* GE_EX_OLD */
	"Serialization failed."				/* GE_EX_SEL */
	"SCOOP processor dirty."			/* GE_EX_DIRTY */
};

/*
 * Exception tag associated with `code'.
 */
char* GE_exception_tag(long code)
{
	if (code < 0) {
		return "User-defined exception.";
	} else if (code < 1 || code > GE_EX_NEX) {
		return "Unknown exception.";
	} else {
		return GE_exception_tags[code];
	}
}

/*
 * Initialize `a_trace'.
 */
static GE_init_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	a_trace->count = 0;
	a_trace->capacity = 0;
	a_trace->area = (char*) GE_raw_calloc_atomic_uncollectable(4096, 1);
	if (a_trace->area) {
		a_trace->capacity = 4096;
	}
}

/*
 * Append `a_string' to `a_trace'.
 * Resize area if needed.
 */
static GE_append_to_exception_trace_buffer(GE_exception_trace_buffer* a_trace, char* a_string)
{
	int l_length = strlen(a_string);
	uint32_t l_new_capacity;
	char* l_new_area;

	if (a_trace->area) {
		if ((a_trace->capacity - a_trace->count) <= l_length) {
			l_new_capacity = a_trace->capacity + l_length + 512;
			l_new_area = (char*) GE_raw_recalloc(a_trace->area, a_trace->capacity, l_new_capacity, 1);
			if (l_new_area) {
				a_trace->area = l_new_area;
				a_trace->capacity = l_new_capacity;
			}
		}
	} else {
		GE_init_exception_trace_buffer(a_trace);
	}
	if ((a_trace->capacity - a_trace->count) > l_length) {
		strcpy (a_trace->area + a_trace->count, a_string);
		a_trace->count += l_length;
	}
}

/*
 * Wipe out `a_trace'.
 */
static GE_wipe_out_exception_trace_buffer(GE_exception_trace_buffer* a_trace)
{
	char* l_area = a_trace->area;

	if (l_area) {
		memset (l_area, 0, a_trace->count);
		a_trace->count = 0;
	}
}

/*
 * Print first line of exception which contains `a_class_name', `a_feature_name'
 * and `a_tag_name' to `a_trace'.
 */
static void GE_print_class_feature_tag(GE_exception_trace_buffer* a_trace, const char* a_class_name, const char* a_feature_name, const char* a_tag_name)
{
	char buffer[256];
	int l_class_count, l_feature_count, l_tag_count;

		/* We are trying to provide the best format possible so that we can see all the useful
		 * information about the location and the reason of the crash.
		 * Note that the C format `%width[.precision]s' means that we will display `width'
		 * characters on the screen and only `precision' characters from `s' will be displayed,
		 * meaning that if `precision' is smaller than `width' the text is right aligned.
		 *
		 * Note: because `buffer' has a fixed size of 256, we need to use `precision' to avoid
		 * writting more than `buffer' can hold. And for `sprintf', a null character is appended
		 * after the last character written, which should be taken into account.
		 */
	l_class_count = (int) strlen(a_class_name);
	l_feature_count = (int) strlen(a_feature_name);
	l_tag_count = (int) strlen(a_tag_name);

		/* 1 - precision of 211 = 254 - 43, 43 being number of characters written
		 *      for `a_class_name' and `a_feature_name'. */
		/* 2 - precision of 234 = 254 - 20, 20 being number of characters written
		 *      for `a_class_name'.*/
		/* 3 - precision of 254, 254 being number of characters written
		 *      excluding `\n' and null character appended at the end */
		/* 4 - precision of 251, 231 and 208 being number of characters written
		 *      excluding eclipse from above numbers. */
	if (l_class_count > 19) {
		if (l_class_count > 251) {
			sprintf(buffer, "%.251s...\n", a_class_name);
		} else {
			sprintf(buffer, "%*.254s\n", l_class_count, a_class_name);
		}
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		if (l_feature_count > 22) {
			if (l_feature_count > 231) {
				sprintf(buffer, "%.231s...\n", a_feature_name);
			} else {
				sprintf(buffer, "%*.234s\n", 20 + l_feature_count, a_feature_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			if (l_tag_count > 0) {
				if (l_tag_count > 208) {
					sprintf(buffer, "%.208s...\n", a_tag_name);
				} else {
					sprintf(buffer, "%*.211s\n", 43 + l_tag_count, a_tag_name);
				}
				GE_append_to_exception_trace_buffer(a_trace, buffer);
			}
		} else {
			if (l_tag_count > 208) {
				sprintf(buffer, "%*.22s %.208s...\n", 20 + l_feature_count, a_feature_name, a_tag_name);
			} else {
				sprintf(buffer, "%*.22s %*.211s\n", 20 + l_feature_count, a_feature_name, (43 + l_tag_count) - (20 + l_feature_count + 1), a_tag_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	} else {
		if (l_feature_count > 22) {
			if (l_feature_count > 208) {
				sprintf(buffer, "%-19.19s %.208s...\n", a_class_name, a_feature_name);
			} else {
				sprintf(buffer, "%-19.19s %*.211s\n", a_class_name, l_feature_count, a_feature_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			if (l_tag_count > 0) {
				if (l_tag_count > 208) {
					sprintf(buffer, "%.208s...\n", a_tag_name);
				} else {
					sprintf(buffer, "%*.211s\n", 43 + l_tag_count, a_tag_name);
				}
				GE_append_to_exception_trace_buffer(a_trace, buffer);
			}
		} else {
			if (l_tag_count > 208) {
				sprintf(buffer, "%-19.19s %-22.22s %-29.208s...\n", a_class_name, a_feature_name, a_tag_name);
			} else {
				sprintf(buffer, "%-19.19s %-22.22s %-29.211s\n", a_class_name, a_feature_name, a_tag_name);
			}
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	}
}

/*
 * Print second line of exception which contains `a_object_addr', `a_location',
 * `a_reason' and `a_effect' to `a_trace'.
 */
static void GE_print_object_location_reason_effect(GE_exception_trace_buffer* a_trace, void* a_object_addr, char* a_location, char* a_reason, char* a_effect)
{
	char buffer[256];
	int l_location_count, l_reason_count, l_effect_count;

		/* We are trying to provide the best format possible so that we can see all the useful
		 * information about the location and the reason of the crash.
		 * Note that the C format `%width[.precision]s' means that we will display `width'
		 * characters on the screen and only `precision' characters from `s' will be displayed,
		 * meaning that if `precision' is smaller than `width' the text is right aligned.
		 *
		 * Note: because `buffer' has a fixed size of 256, we need to use `precision' to avoid
		 * writting more than `buffer' can hold.
		 */

	l_location_count = (int) strlen(a_location);
	l_reason_count = (int) strlen(a_reason);
	l_effect_count = (int) strlen(a_effect);

		/* 1 - precision of 211 = 254 - 43, 43 being number of characters written
			   for `a_object_addr' and `a_location'.
		 * 2 - precision of 181 = 254 - 73, 73 being number of characters written
			   for `a_object_addr', `a_location' and `a_reason'.
		 * 3 - 22, number of characters written for `a_location'
		 * 4 - 29, number of characters written for `a_reason' */

		/* Check this for formatting using `printf':
		 * http://en.wikipedia.org/wiki/Printf#printf_format_placeholders */

		/* Print object address with 16 digits to be ready when pointers
		 * will be on 64 bits on all platform. */
	sprintf(buffer, "<%016" EIF_POINTER_DISPLAY ">  ", (unsigned long)(intptr_t)a_object_addr);
	GE_append_to_exception_trace_buffer(a_trace, buffer);

	if (l_location_count > 22) {
		sprintf(buffer, "%*.254s\n", l_location_count, a_location);
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		if (l_reason_count > 29) {
			sprintf(buffer, "%*.211s\n", 43 + l_reason_count, a_reason);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			sprintf(buffer, "%*.181s\n", 73 + l_effect_count, a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		} else {
			sprintf(buffer, "%*.29s %*.181s\n", 43 + l_reason_count, a_reason, (73 + l_effect_count) - (43 + l_reason_count + 1), a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	} else {
		if (l_reason_count > 29) {
			sprintf(buffer,"%-22.22s %*.211s\n", a_location, l_reason_count, a_reason);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
			sprintf(buffer, "%*.181s\n", 73 + l_effect_count, a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		} else {
			sprintf(buffer,"%-22.22s %-29.29s %*.181s\n", a_location, a_reason, l_effect_count, a_effect);
			GE_append_to_exception_trace_buffer(a_trace, buffer);
		}
	}
}

/*
 * Print to `a_trace' the exception trace corresponding to `a_context'.
 */
static void GE_print_exception_trace(GE_context* context, long code, const char* tag, GE_exception_trace_buffer* a_trace)
{
	char buffer[1024];
	GE_call* l_call;
	char* l_tag;
	char l_tag_buf[256];
	void* l_object = NULL;
	char* l_location = "";
	char* l_reason;
	char* l_effect;
	char* l_root_class;
	char* l_root_feature = "root's creation";
	const char* l_class_name;
	const char* l_feature_name;

#ifdef EIF_THREADS
	sprintf(buffer, "%s\n", "******************************** Thread exception *****************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	if (context == GE_main_context) {
			/* Main thread. */
		sprintf(buffer,"%-19.19s %-22.22s 0x%" EIF_POINTER_DISPLAY " %s\n", "In thread", "Root thread", (uint64_t) 0, "(thread id)");
	} else {
		sprintf(buffer,"%-19.19s %-22.22s 0x%" EIF_POINTER_DISPLAY " %s\n", "In thread", "Child thread", (uint64_t) context->thread->thread_id, "(thread id)");
	}
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%s\n", "*******************************************************************************");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
#endif
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%-19.19s %-22.22s %-29.29s %-6.6s\n", "Class / Object", "Routine", "Nature of exception", "Effect");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	if (GE_root_class_name) {
		l_root_class = GE_root_class_name;
	} else {
		l_root_class = "ROOT CLASS";
	}
	l_call = context->call;
	if (l_call) {
		l_class_name = l_call->class_name;
		l_feature_name = l_call->feature_name;
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
		l_object = l_call->object;
#endif
	} else {
		l_class_name = l_root_class;
		l_feature_name = l_root_feature;
	}
	if (tag) {
		sprintf(l_tag_buf, "%.254s:", tag);
		l_tag = l_tag_buf;
	} else {
		l_tag = "";
	}
	GE_print_class_feature_tag(a_trace, l_class_name, l_feature_name, l_tag);
	l_reason = GE_exception_tag(code);
	l_effect = "Fail";
	GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
	while (l_call) {
		l_tag = "";
		GE_print_class_feature_tag(a_trace, l_call->class_name, l_call->feature_name, l_tag);
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
		l_object = l_call->object;
#endif
		l_reason = "Routine failure.";
		l_effect = "Fail";
		GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
		sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
		GE_append_to_exception_trace_buffer(a_trace, buffer);
		l_call = l_call->caller;
	}
	l_tag = "";
	GE_print_class_feature_tag(a_trace, l_root_class, l_root_feature, l_tag);
#ifdef EIF_CURRENT_IN_EXCEPTION_TRACE
	l_object = NULL;
#endif
	l_reason = "Routine failure.";
	l_effect = "Exit";
	GE_print_object_location_reason_effect(a_trace, l_object, l_location, l_reason, l_effect);
	sprintf(buffer, "%s\n", "-------------------------------------------------------------------------------");
	GE_append_to_exception_trace_buffer(a_trace, buffer);
}

/*
 * Default initialization for `GE_context'.
 */
GE_context GE_default_context = {0, 0, 0, 0, 0, 0, '\1', 0, 0, {0, 0, 0}, {0, 0, 0}, 1
#ifdef EIF_THREADS
	, 0
#endif
	};

/*
 * Execution context of main thread.
 * Should be used from the main thread only.
 */
GE_context* GE_main_context;

/*
 * Execution context of current thread.
 */
GE_context* GE_current_context()
{
#ifdef EIF_THREADS
	GE_thread_context* volatile ge_thread_context;
	EIF_TSD_GET0(GE_thread_context*, GE_thread_context_key, ge_thread_context);
	return ge_thread_context->context;
#else
	return GE_main_context;
#endif
}

/*
 * Initialization of exception handling.
 */
void GE_init_exception(GE_context* context)
{
	EIF_REFERENCE l_exception_manager;

	GE_init_exception_trace_buffer(&context->exception_trace_buffer);
	GE_init_exception_trace_buffer(&context->last_exception_trace);
	l_exception_manager = GE_new_exception_manager(EIF_TRUE);
	context->exception_manager = l_exception_manager;
	GE_init_exception_manager(context, l_exception_manager);
}

/*
 * Pointer to function to create a new exception manager object.
 */
EIF_REFERENCE (*GE_new_exception_manager)(EIF_BOOLEAN);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.init_exception_manager.
 */
void (*GE_init_exception_manager)(GE_context*, EIF_REFERENCE);

/*
 * Pointer to Eiffel routine EXCEPTION_MANAGER.set_exception_data.
 */
void (*GE_set_exception_data)(GE_context*, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN, EIF_INTEGER_32, EIF_INTEGER_32, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_REFERENCE, EIF_INTEGER_32, EIF_BOOLEAN);

/*
 * Jump to execute the rescue of the last routine with a rescue
 * in the call stack.
 */
static void GE_jump_to_last_rescue(GE_context* context)
{
	char* l_exception_trace;

	GE_rescue* r = context->last_rescue;
	if (r != 0) {
		context->last_rescue = r->previous;
		context->raising_exception = '\0';
		GE_longjmp(r->jb, 1);
	}
	if (context->exception_trace_enabled) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		l_exception_trace = context->last_exception_trace.area;
		if (l_exception_trace) {
			fprintf(stderr, "Following is the set of recorded exceptions:\n\n");
			fprintf(stderr, l_exception_trace);
		} else {
			fprintf(stderr, "No exception trace found.\n");
		}
	}
	exit(1);
}

/*
 * Call feature EXCEPTION_MANAGER.set_exception_data.
 */
static void GE_call_set_exception_data(GE_context* context, long code, int new_obj, int signal_code, int error_code, const char* tag, char* recipient, char* eclass, char* rf_routine, char* rf_class, char* trace, int line_number, int is_invariant_entry)
{
	EIF_REFERENCE l_tag;
	EIF_REFERENCE l_recipient;
	EIF_REFERENCE l_eclass;
	EIF_REFERENCE l_rf_routine;
	EIF_REFERENCE l_rf_class;
	EIF_REFERENCE l_trace;
	EIF_REFERENCE ge_exception_manager;

	ge_exception_manager = context->exception_manager;
	if (!ge_exception_manager) {
		GE_init_exception(context);
		ge_exception_manager = context->exception_manager;
	}
	if (tag) {
		l_tag = GE_str8(tag);
	} else {
		l_tag = GE_ms8("", 0);
	}
	if (recipient) {
		l_recipient = GE_str8(recipient);
	} else {
		l_recipient = GE_ms8("", 0);
	}
	if (eclass) {
		l_eclass = GE_str8(eclass);
	} else {
		l_eclass = GE_ms8("", 0);
	}
	if (rf_routine) {
		l_rf_routine = GE_str8(rf_routine);
	} else {
		l_rf_routine = GE_ms8("", 0);
	}
	if (rf_class) {
		l_rf_class = GE_str8(rf_class);
	} else {
		l_rf_class = GE_ms8("", 0);
	}
	if (trace && context->exception_trace_enabled) {
		l_trace = GE_str8(trace);
	} else {
		l_trace = GE_ms8("", 0);
	}
	GE_set_exception_data(context, ge_exception_manager, (EIF_INTEGER_32) code, EIF_TEST(new_obj), (EIF_INTEGER_32) signal_code, (EIF_INTEGER_32) error_code, l_tag, l_recipient, l_eclass, l_rf_routine, l_rf_class, l_trace, (EIF_INTEGER_32) line_number, EIF_TEST(is_invariant_entry));
}

/*
 * Raise an exception.
 */
static void GE_raise_exception(long code, int new_obj, int signal_code, int error_code, const char* tag, char* recipient, char* eclass, char* rf_routine, char* rf_class, char* trace, int line_number, int is_invariant_entry)
{
	char* l_trace;
	GE_exception_trace_buffer* l_trace_buffer;
	GE_context* context;

	context = GE_current_context();
	if (!context) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		fprintf(stderr, "Panic: No execution context found.\n");
		exit(1);
	} else if (context->raising_exception) {
#ifdef EIF_WINDOWS
		GE_show_console();
#endif
		if (GE_system_name) {
			fprintf(stderr, "\n%s: system execution failed.\n", GE_system_name);
		} else {
			fprintf(stderr, "\nsystem execution failed.\n");
		}
		fprintf(stderr, "Panic: A crash occurred while processing exceptions.\n");
		l_trace = context->last_exception_trace.area;
		if (l_trace) {
			fprintf(stderr, "Following is the set of recorded exceptions\n");
			fprintf(stderr, "NB: The raised panic may have induced completely inconsistent information:\n\n");
			fprintf(stderr, l_trace);
		} else {
			fprintf(stderr, "No exception trace found.\n");
		}
		exit(1);
	} else {
		context->raising_exception = '\1';
		context->exception_code = code;
		context->exception_tag = tag;
		if (code != GE_EX_FAIL) {
			GE_wipe_out_exception_trace_buffer(&context->last_exception_trace);
		}
		l_trace = trace;
		if (context->exception_trace_enabled && !l_trace) {
			l_trace_buffer = &context->exception_trace_buffer;
			GE_wipe_out_exception_trace_buffer(l_trace_buffer);
			GE_print_exception_trace(context, code, tag, l_trace_buffer);
			l_trace = l_trace_buffer->area;
		}
		if (code != GE_EX_FAIL && l_trace) {
			GE_append_to_exception_trace_buffer(&context->last_exception_trace, l_trace);
		}
		GE_call_set_exception_data(context, code, new_obj, signal_code, error_code, tag, recipient, eclass, rf_routine, rf_class, l_trace, line_number, is_invariant_entry);
		GE_jump_to_last_rescue(context);
		context->raising_exception = '\0';
		context->exception_code = 0;
		context->exception_tag = (char*)0;
	}
}

/*
 * Raise an exception with code `code'.
 */
void GE_raise(long code)
{
	GE_raise_with_message(code, NULL);
}

/*
 * Raise an exception with code `code' and message `msg'.
 */
void GE_raise_with_message(long code, const char* msg)
{
	GE_raise_exception(code, 1, -1, -1, msg, NULL, NULL, NULL, NULL, NULL, -1, 0);
}

/*
 * Raise an exception from EXCEPTION_MANAGER.
 */
void GE_developer_raise(long code, char* meaning, char* message)
{
	GE_raise_exception(code, 0, -1, -1, message, NULL, NULL, NULL, NULL, NULL, -1, 0);
}

/*
 * Set `in_assertion' to 'not b'.
 * Return the opposite of previous value.
 */
EIF_BOOLEAN GE_check_assert(EIF_BOOLEAN b)
{
	EIF_BOOLEAN l_old_value;
	GE_context* l_context;

	l_context = GE_current_context();
	l_old_value = EIF_TEST(!(l_context->in_assertion));
	l_context->in_assertion = (b?0:1);
	return l_old_value;
}

/*
 * Check whether the type id of `obj' is not in `type_ids'.
 * If it is, then raise a CAT-call exception. Don't do anything if `obj' is Void.
 * `nb' is the number of ids in `type_ids' and is expected to be >0.
 * `type_ids' is sorted in increasing order.
 * Return `obj'.
 */
EIF_REFERENCE GE_check_catcall(EIF_REFERENCE obj, EIF_TYPE_INDEX type_ids[], int nb)
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
					GE_raise_with_message(GE_EX_PROG, "CAT-call error.");
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
 * Check whether `obj' is Void.
 * If it is, then raise a call-on-void-target exception.
 * Return `obj'.
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
		GE_raise(GE_EX_VOID);
	}
	return (obj);
}

/*
 * Check whether `ptr' is a null pointer.
 * If it is, then raise a no-more-memory exception.
 * Return `ptr'.
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
		GE_raise(GE_EX_MEM);
	}
	return (ptr);
}

#ifdef EIF_WINDOWS
static LONG WINAPI GE_windows_exception_filter(LPEXCEPTION_POINTERS an_exception)
{
		/* In order to be able to catch exceptions that cannot be caught by
		 * just using signals on Windows, we need to set `windows_exception_filter'
		 * as an unhandled exception filter.
		 */

	switch (an_exception->ExceptionRecord->ExceptionCode) {
		case STATUS_STACK_OVERFLOW:
			GE_raise_with_message(GE_EX_EXT, "Stack overflow");
			break;

		case STATUS_INTEGER_DIVIDE_BY_ZERO:
			GE_raise_with_message(GE_EX_FLOAT, "Integer division by Zero");
			break;

		default:
			GE_raise_with_message(GE_EX_EXT, "Unhandled exception");
			break;
	}

		/* Possible return values include:
		 * EXCEPTION_CONTINUE_EXECUTION : Returns to the statement that caused the exception
		 *    and re-executes that statement. (Causes an infinite loop of calling the exception
		 *    handler if the handler does not fix the problem)
		 * EXCEPTION_EXECUTE_HANDLER: Passes the exception to default handler, in our case
		 *    none, since `windows_exception_filter' is the default one now.
		 * EXCEPTION_CONTINUE_SEARCH: Continue to search up the stack for a handle
		 */
	return EXCEPTION_EXECUTE_HANDLER;
}

/*
 * Set default exception handler.
 */
void GE_set_windows_exception_filter()
{
	LPTOP_LEVEL_EXCEPTION_FILTER old_exception_handler = NULL;
	old_exception_handler = SetUnhandledExceptionFilter (GE_windows_exception_filter);
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

		"C functions used to implement type information"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_TYPES_C
#define GE_TYPES_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_TYPES_H
#include "ge_types.h"
#endif
#ifndef GE_EXCEPTION_H
#include "ge_exception.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Number of type infos in `GE_type_infos'.
 * Do not take into account the fake item at index 0.
 */
int GE_type_info_count;

/*
 * Encode a EIF_TYPE into a EIF_ENCODED_TYPE.
 * The lower part of EIF_ENCODED_TYPE contains the .id field,
 * and the upper part the .annotations.
 */
EIF_ENCODED_TYPE GE_encoded_type(EIF_TYPE a_type)
{
	EIF_ENCODED_TYPE l_result;

#if defined(_MSC_VER)
		/* This code below is just optimized as one move by cl on x86 platforms.
		 * The else-part below generates non-optimal code with cl.
		 */
	memcpy(&l_result, &a_type, sizeof(EIF_ENCODED_TYPE));
#else
		/* This code below is just optimized as one move by gcc/clang on x86 platforms. */
	l_result = a_type.annotations;
	l_result = (l_result << 16) | a_type.id;
#endif

	return l_result;
}

/*
 * Decode a EIF_ENCODED_TYPE into a EIF_TYPE.
 * The lower part of EIF_ENCODED_TYPE contains the .id field,
 * and the upper part the .annotations.
 */
EIF_TYPE GE_decoded_type(EIF_ENCODED_TYPE a_type)
{
	EIF_TYPE l_result;

#if defined(_MSC_VER)
		/* This code below is just optimized as one move by cl on x86 platforms.
		 * The else-part below generates non-optimal code with cl.
		 */
	memcpy(&l_result, &a_type, sizeof(EIF_TYPE));
#else
		/* This code below is just optimized as one move by gcc/clang on x86 platforms. */
	l_result.id = a_type & 0x0000FFFF;
	l_result.annotations = a_type >> 16;
#endif

	return l_result;
}

/*
 * Type with `a_id' and `a_annotations'.
 */
EIF_TYPE GE_new_type(EIF_TYPE_INDEX a_id, EIF_TYPE_INDEX a_annotations)
{
	EIF_TYPE l_result;
	l_result.id = a_id;
	l_result.annotations = a_annotations;
	return l_result;
}

/*
 * Associated detachable type of `a_type' if any,
 * otherwise `a_type'.
 */
EIF_TYPE GE_non_attached_type(EIF_TYPE a_type)
{
		/* Since types are by default detachable, we simply remove
		 * all attachment marks. */
	a_type.annotations &= ~(ATTACHED_FLAG | DETACHABLE_FLAG);
	return a_type;
}

/*
 * Associated attached type of `a_type' if any,
 * otherwise `a_type'.
 */
EIF_TYPE GE_attached_type(EIF_TYPE a_type)
{
	a_type.annotations &= ~DETACHABLE_FLAG;
	a_type.annotations |= ATTACHED_FLAG;
	return a_type;
}

/*
 * Is `a_type' a SPECIAL type of user-defined expanded type?
 */
EIF_BOOLEAN GE_is_special_of_expanded_type_index(EIF_TYPE_INDEX a_type)
{
	EIF_BOOLEAN l_result = EIF_FALSE;
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
	EIF_TYPE_INDEX l_generic_parameter;
	uint32_t l_flags;

	if ((GE_type_infos[a_type].flags & GE_TYPE_FLAG_SPECIAL)) {
		l_generic_parameter = GE_decoded_type(GE_type_infos[a_type].generic_parameters[0]).id;
		l_flags = GE_type_infos[l_generic_parameter].flags;
		l_result = EIF_TEST((l_flags & GE_TYPE_FLAG_EXPANDED) && !(l_flags & GE_TYPE_FLAG_BASIC_MASK));
	}
#endif
	return l_result;
}

/*
 * Is `a_type' a SPECIAL type of reference type?
 */
EIF_BOOLEAN GE_is_special_of_reference_type_index(EIF_TYPE_INDEX a_type)
{
	EIF_BOOLEAN l_result = EIF_FALSE;
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
	EIF_TYPE_INDEX l_generic_parameter;
	uint32_t l_flags;

	if ((GE_type_infos[a_type].flags & GE_TYPE_FLAG_SPECIAL)) {
		l_generic_parameter = GE_decoded_type(GE_type_infos[a_type].generic_parameters[0]).id;
		l_flags = GE_type_infos[l_generic_parameter].flags;
		l_result = EIF_TEST(!(l_flags & GE_TYPE_FLAG_EXPANDED));
	}
#endif
	return l_result;
}

/*
 * Is `a_type' a SPECIAL type of reference type or basic expanded type?
 * (Note that user-defined expanded types are excluded.)
 */
EIF_BOOLEAN GE_is_special_of_reference_or_basic_expanded_type_index(EIF_TYPE_INDEX a_type)
{
	EIF_BOOLEAN l_result = EIF_FALSE;
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
	EIF_TYPE_INDEX l_generic_parameter;
	uint32_t l_flags;

	if ((GE_type_infos[a_type].flags & GE_TYPE_FLAG_SPECIAL)) {
		l_generic_parameter = GE_decoded_type(GE_type_infos[a_type].generic_parameters[0]).id;
		l_flags = GE_type_infos[l_generic_parameter].flags;
		l_result = EIF_TEST(!(l_flags & GE_TYPE_FLAG_EXPANDED) || (l_flags & GE_TYPE_FLAG_BASIC_MASK));
	}
#endif
	return l_result;
}

/*
 * Does `i'-th field of `a_object + a_physical_offset' (which is expected to be reference)
 * denote a reference with copy semantics?
 */
EIF_BOOLEAN GE_is_copy_semantics_field(EIF_INTEGER i, EIF_POINTER a_object, EIF_INTEGER a_physical_offset)
{
	EIF_REFERENCE l_object;

	l_object = GE_reference_field(i, a_object, a_physical_offset);
	if (l_object) {
		return GE_is_expanded_object(l_object);
	} else {
		return EIF_FALSE;
	}
}

/*
 * Does `i'-th item of special `a_object' (which is expected to be reference)
 * denote a reference with copy semantics?
 */
EIF_BOOLEAN GE_is_special_copy_semantics_item(EIF_INTEGER i, EIF_POINTER a_object)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_OFFSET)
	EIF_REFERENCE l_object;
	GE_type_info l_type_info;

	l_type_info = GE_type_infos[((EIF_REFERENCE)a_object)->id];
		/* The last pseudo attribute is the item at index 0 in the special object */
	l_object = *(EIF_REFERENCE*)((char*)a_object + l_type_info.attributes[l_type_info.attribute_count - 1]->offset + i * sizeof(EIF_REFERENCE));
	if (l_object) {
		return GE_is_expanded_object(l_object);
	} else {
		return EIF_FALSE;
	}
#else
	return EIF_FALSE;
#endif
}

/*
 * Generator class name of `a_type'.
 */
EIF_REFERENCE GE_generator_of_type_index(EIF_TYPE_INDEX a_type)
{
	const char* l_generator;
#ifdef GE_USE_TYPE_GENERATOR
/* TODO: check that `a_type' is valid. */
	l_generator = GE_type_infos[a_type].generator;
#else
	l_generator = "";
#endif
	return GE_str8(l_generator);
}

/*
 * Full name of `a_type'.
 */
EIF_REFERENCE GE_generating_type_of_encoded_type(EIF_ENCODED_TYPE a_type)
{
	const char* l_name;
#ifdef GE_USE_TYPE_NAME
/* TODO: check that `a_type' is valid. */
/* TODO: handle type annotations. */
	l_name = GE_type_infos[GE_decoded_type(a_type).id].name;
#else
	l_name = "";
#endif
	return GE_str8(l_name);
}

/*
 * Encoded type whose name is `a_name'.
 * -1 if no such type.
 */
EIF_ENCODED_TYPE GE_encoded_type_from_name(EIF_POINTER a_name)
{
#ifdef GE_USE_TYPE_NAME
/* TODO: check that `a_type' is valid. */
/* TODO: handle type annotations. */
	int i;

	for (i = 1; i <= GE_type_info_count; i++) {
		if (strcmp((char*) a_name, GE_type_infos[i].name) == 0) {
			return (EIF_INTEGER)GE_encoded_type(GE_new_type(i, 0x0));
		}
	}
#endif
	return EIF_NO_TYPE;
}

/*
 * Does `a_type_1' conform to `a_type_2'?
 */
EIF_BOOLEAN GE_encoded_type_conforms_to(EIF_ENCODED_TYPE a_type_1, EIF_ENCODED_TYPE a_type_2)
{
#ifdef GE_USE_ANCESTORS
	GE_type_info l_type_info_1;
	GE_ancestor** l_ancestors;
	uint32_t l_ancestor_count, i;
	EIF_TYPE_INDEX l_type_index_1, l_type_index_2, l_ancestor_type_index;

/* TODO: take into account type annotation */
	l_type_index_1 = GE_decoded_type(a_type_1).id;
	l_type_index_2 = GE_decoded_type(a_type_2).id;
	l_type_info_1 = GE_type_infos[l_type_index_1];
	if (l_type_info_1.flags & GE_TYPE_FLAG_NONE) {
			/* NONE */
		uint32_t l_flags = GE_type_infos[l_type_index_2].flags;
		return EIF_TEST(!(l_flags & GE_TYPE_FLAG_EXPANDED));
	} else {
		l_ancestors = l_type_info_1.ancestors;
		l_ancestor_count = l_type_info_1.ancestor_count;
		for (i = 0; i < l_ancestor_count; i++) {
			l_ancestor_type_index = l_ancestors[i]->type_id;
			if (l_ancestor_type_index == l_type_index_2) {
				return EIF_TRUE;
			} else if (l_ancestor_type_index > l_type_index_2) {
				return EIF_FALSE;
			}
		}
	}
#endif
	return EIF_FALSE;
}

/*
 * Number of generic parameters.
 */
EIF_INTEGER GE_generic_parameter_count_of_type_index(EIF_TYPE_INDEX a_type)
{
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
	return (EIF_INTEGER)GE_type_infos[a_type].generic_parameter_count;
#else
	return (EIF_INTEGER)0;
#endif
}

/*
 * Type of `i'-th generic parameter of `a_type'.
 */
EIF_INTEGER GE_generic_parameter_of_type_index(EIF_TYPE_INDEX a_type, EIF_INTEGER i)
{
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
/* TODO: check that `a_type' and `i' are valid. */
	return (EIF_INTEGER)GE_type_infos[a_type].generic_parameters[i - 1];
#else
	return (EIF_INTEGER)0;
#endif
}

/*
 * Number of fields of an object of dynamic type `a_type'.
 */
EIF_INTEGER GE_field_count_of_type_index(EIF_TYPE_INDEX a_type)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_OFFSET)
/* TODO: check that `a_type' is valid. */
	return (EIF_INTEGER)GE_type_infos[a_type].attribute_count;
#else
	return (EIF_INTEGER)0;
#endif
}

/*
 * Physical offset of the `i'-th field for an object of dynamic type `a_type'.
 */
EIF_INTEGER GE_field_offset_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_OFFSET)
/* TODO: check that `a_type' and `i' are valid. */
	return (EIF_INTEGER)GE_type_infos[a_type].attributes[i - 1]->offset;
#else
	return (EIF_INTEGER)0;
#endif
}

/*
 * Name of the `i'-th field for an object of dynamic type `a_type'.
 */
EIF_POINTER GE_field_name_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_NAME)
/* TODO: check that `a_type' and `i' are valid. */
	return (EIF_POINTER)GE_type_infos[a_type].attributes[i - 1]->name;
#else
	return (EIF_POINTER)0;
#endif
}

/*
 * Static type of the `i'-th field for an object of dynamic type `a_type'.
 */
EIF_INTEGER GE_field_static_type_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_TYPE_ID)
/* TODO: check that `a_type' and `i' are valid. */
	return (EIF_INTEGER)GE_type_infos[a_type].attributes[i - 1]->type_id;
#else
	return (EIF_INTEGER)0;
#endif
}

/*
 * Kind of type of the `i'-th field for an object of dynamic type `a_type'.
 */
EIF_INTEGER GE_field_type_kind_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_TYPE_ID)
	uint32_t l_flags = GE_type_infos[GE_decoded_type(GE_type_infos[a_type].attributes[i - 1]->type_id).id].flags;
	if (l_flags & GE_TYPE_FLAG_BASIC_MASK) {
		switch (l_flags & GE_TYPE_FLAG_BASIC_MASK) {
		case GE_TYPE_FLAG_BOOLEAN:
			return (EIF_INTEGER)GE_TYPE_KIND_BOOLEAN;
		case GE_TYPE_FLAG_CHARACTER_8:
			return (EIF_INTEGER)GE_TYPE_KIND_CHARACTER_8;
		case GE_TYPE_FLAG_CHARACTER_32:
			return (EIF_INTEGER)GE_TYPE_KIND_CHARACTER_32;
		case GE_TYPE_FLAG_INTEGER_8:
			return (EIF_INTEGER)GE_TYPE_KIND_INTEGER_8;
		case GE_TYPE_FLAG_INTEGER_16:
			return (EIF_INTEGER)GE_TYPE_KIND_INTEGER_16;
		case GE_TYPE_FLAG_INTEGER_32:
			return (EIF_INTEGER)GE_TYPE_KIND_INTEGER_32;
		case GE_TYPE_FLAG_INTEGER_64:
			return (EIF_INTEGER)GE_TYPE_KIND_INTEGER_64;
		case GE_TYPE_FLAG_NATURAL_8:
			return (EIF_INTEGER)GE_TYPE_KIND_NATURAL_8;
		case GE_TYPE_FLAG_NATURAL_16:
			return (EIF_INTEGER)GE_TYPE_KIND_NATURAL_16;
		case GE_TYPE_FLAG_NATURAL_32:
			return (EIF_INTEGER)GE_TYPE_KIND_NATURAL_32;
		case GE_TYPE_FLAG_NATURAL_64:
			return (EIF_INTEGER)GE_TYPE_KIND_NATURAL_64;
		case GE_TYPE_FLAG_POINTER:
			return (EIF_INTEGER)GE_TYPE_KIND_POINTER;
		case GE_TYPE_FLAG_REAL_32:
			return (EIF_INTEGER)GE_TYPE_KIND_REAL_32;
		case GE_TYPE_FLAG_REAL_64:
			return (EIF_INTEGER)GE_TYPE_KIND_REAL_64;
		default:
			return (EIF_INTEGER)GE_TYPE_KIND_INVALID;
		}
	} else if (l_flags & GE_TYPE_FLAG_EXPANDED) {
		return (EIF_INTEGER)GE_TYPE_KIND_EXPANDED;
	} else {
		return (EIF_INTEGER)GE_TYPE_KIND_REFERENCE;
	}
#else
	return (EIF_INTEGER)GE_TYPE_KIND_INVALID;
#endif
}

/*
 * Physical size of `a_object'.
 */
EIF_NATURAL_64 GE_object_size(EIF_POINTER a_object)
{
#ifdef GE_USE_TYPE_OBJECT_SIZE
	EIF_TYPE_INDEX l_type_index = ((EIF_REFERENCE)(a_object))->id;
	uint64_t l_size = GE_type_infos[l_type_index].object_size;
#ifdef GE_USE_TYPE_GENERIC_PARAMETERS
	if (GE_is_special_type_index (l_type_index)) {
		EIF_TYPE_INDEX l_generic_parameter = GE_decoded_type(GE_type_infos[l_type_index].generic_parameters[0]).id;
		uint32_t l_flags = GE_type_infos[l_generic_parameter].flags;
		EIF_INTEGER l_capacity = ((EIF_SPECIAL*)a_object)->capacity;
		uint64_t l_item_size;

		if (l_flags & GE_TYPE_FLAG_BASIC_MASK) {
			switch (l_flags & GE_TYPE_FLAG_BASIC_MASK) {
			case GE_TYPE_FLAG_BOOLEAN:
				l_item_size = sizeof(EIF_BOOLEAN);
				break;
			case GE_TYPE_FLAG_CHARACTER_8:
				l_item_size = sizeof(EIF_CHARACTER_8);
				break;
			case GE_TYPE_FLAG_CHARACTER_32:
				l_item_size = sizeof(EIF_CHARACTER_32);
				break;
			case GE_TYPE_FLAG_INTEGER_8:
				l_item_size = sizeof(EIF_INTEGER_8);
				break;
			case GE_TYPE_FLAG_INTEGER_16:
				l_item_size = sizeof(EIF_INTEGER_16);
				break;
			case GE_TYPE_FLAG_INTEGER_32:
				l_item_size = sizeof(EIF_INTEGER_32);
				break;
			case GE_TYPE_FLAG_INTEGER_64:
				l_item_size = sizeof(EIF_INTEGER_64);
				break;
			case GE_TYPE_FLAG_NATURAL_8:
				l_item_size = sizeof(EIF_NATURAL_8);
				break;
			case GE_TYPE_FLAG_NATURAL_16:
				l_item_size = sizeof(EIF_NATURAL_16);
				break;
			case GE_TYPE_FLAG_NATURAL_32:
				l_item_size = sizeof(EIF_NATURAL_32);
				break;
			case GE_TYPE_FLAG_NATURAL_64:
				l_item_size = sizeof(EIF_NATURAL_64);
				break;
			case GE_TYPE_FLAG_POINTER:
				l_item_size = sizeof(EIF_POINTER);
				break;
			case GE_TYPE_FLAG_REAL_32:
				l_item_size = sizeof(EIF_REAL_32);
				break;
			case GE_TYPE_FLAG_REAL_64:
				l_item_size = sizeof(EIF_REAL_64);
				break;
			default:
				l_item_size = 0;
			}
		} else if (l_flags & GE_TYPE_FLAG_EXPANDED) {
			l_item_size = GE_type_infos[l_generic_parameter].object_size;
		} else {
			l_item_size = sizeof(EIF_REFERENCE);
		}
		l_size += l_capacity * l_item_size;
	}
#endif
	return (EIF_NATURAL_64)l_size;
#else
	return (EIF_NATURAL_64)0;
#endif
}

/*
 * Is `i'-th field of objects of type `a_type' a user-defined expanded attribute?
 */
EIF_BOOLEAN GE_is_field_expanded_of_type_index(EIF_INTEGER i, EIF_TYPE_INDEX a_type)
{
#if defined(GE_USE_ATTRIBUTES) && defined(GE_USE_ATTRIBUTE_TYPE_ID)
	uint32_t l_flags = GE_type_infos[GE_decoded_type(GE_type_infos[a_type].attributes[i - 1]->type_id).id].flags;
	return EIF_TEST((l_flags & GE_TYPE_FLAG_EXPANDED) && !(l_flags & GE_TYPE_FLAG_BASIC_MASK));
#else
	return EIF_FALSE;
#endif
}

/*
 * Get a lock on `GE_mark_object' and `GE_unmark_object' routines so that
 * 2 threads cannot `GE_mark_object' and `GE_unmark_object' at the same time.
 */
void GE_lock_marking()
{
#ifdef GE_USE_THREADS
/* TODO */
#endif
}

/*
 * Release a lock on `GE_mark_object' and `GE_unmark_object', so that another
 * thread can use `GE_mark_object' and `GE_unmark_object'.
 */
void GE_unlock_marking()
{
#ifdef GE_USE_THREADS
/* TODO */
#endif
}

/*
 * Is `obj' marked?
 */
EIF_BOOLEAN GE_is_object_marked(EIF_POINTER obj)
{
	return EIF_TEST(((EIF_REFERENCE)obj)->flags & GE_OBJECT_FLAG_MARKED);
}

/*
 * Mark `obj'.
 */
void GE_mark_object(EIF_POINTER obj)
{
	((EIF_REFERENCE)obj)->flags |= GE_OBJECT_FLAG_MARKED;
}

/*
 * Unmark `obj'.
 */
void GE_unmark_object(EIF_POINTER obj)
{
	((EIF_REFERENCE)obj)->flags &= ~GE_OBJECT_FLAG_MARKED;
}

/*
 * New instance of dynamic `a_type'.
 * Note: returned object is not initialized and may
 * hence violate its invariant.
 * `a_type' cannot represent a SPECIAL type, use
 * `GE_new_special_instance_of_special_type_index' instead.
 */
EIF_REFERENCE GE_new_instance_of_type_index(EIF_TYPE_INDEX a_type)
{
	EIF_REFERENCE (*l_new)(EIF_BOOLEAN);

	l_new = (EIF_REFERENCE (*)(EIF_BOOLEAN))GE_type_infos[a_type].new_instance;
	if (l_new) {
		return l_new(EIF_TRUE);
	} else {
		return EIF_VOID;
	}
}

/*
 * New instance of dynamic `a_type' that represents
 * a SPECIAL with can contain `a_capacity' element. To create a SPECIAL of
 * basic type, use `SPECIAL'.
 */
EIF_REFERENCE GE_new_special_any_instance_of_type_index(EIF_TYPE_INDEX a_type, EIF_INTEGER a_capacity)
{
	EIF_REFERENCE (*l_new)(EIF_INTEGER,EIF_BOOLEAN);

	l_new = (EIF_REFERENCE (*)(EIF_INTEGER,EIF_BOOLEAN))GE_type_infos[a_type].new_instance;
	if (l_new) {
		return l_new(a_capacity, EIF_TRUE);
	} else {
		return EIF_VOID;
	}
}

/*
 * New instance of TYPE for object of type `a_type'.
 */
EIF_REFERENCE GE_new_type_instance_of_encoded_type(EIF_ENCODED_TYPE a_type)
{
	EIF_TYPE_INDEX l_type_index;
	EIF_REFERENCE l_result;

/* TODO: take into account type annotation. */
	l_type_index = GE_decoded_type(a_type).id;
	l_result = (EIF_REFERENCE)&(GE_types[l_type_index]);
	if (l_result->id == 0) {
		l_result = EIF_VOID;
		GE_raise(GE_EX_PROG);
	}
	return l_result;
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
			GE_raise(GE_EX_PROG);
		}
		hconerr = GetStdHandle(STD_ERROR_HANDLE);
		if (hconerr == INVALID_HANDLE_VALUE) {
			GE_raise(GE_EX_PROG);
		}
		hconin = GetStdHandle(STD_INPUT_HANDLE);
		if (hconin == INVALID_HANDLE_VALUE) {
			GE_raise(GE_EX_PROG);
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_MAIN_C
#define GE_MAIN_C

#ifdef __cplusplus
extern "C" {
#endif

/*
 * System name.
 */
char* GE_system_name = NULL;

/*
 * Root class name.
 */
char* GE_root_class_name = NULL;

#ifdef EIF_WINDOWS

/*
 * Used in WEL.
 */
HINSTANCE eif_hInstance;
HINSTANCE eif_hPrevInstance;
LPWSTR eif_lpCmdLine;
int eif_nCmdShow;

/*
 * Main entry point when compiling a Windows application.
 * See:
 *    http://en.wikipedia.org/wiki/WinMain
 *    http://msdn2.microsoft.com/en-us/library/ms633559.aspx
 */
extern int main(void);
extern void GE_get_argcargv(EIF_NATIVE_CHAR* cmd, int* argc, EIF_NATIVE_CHAR*** argvp);
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nCmdShow)
{
	return main();
}

int main(void)
{
	int code;
	int argc;
	EIF_NATIVE_CHAR** argv;
	EIF_NATIVE_CHAR* cmd;
#ifdef EIF_WINDOWS
	GE_set_windows_exception_filter();
		/* Variables used in WEL. */
	eif_hInstance = GetModuleHandle(NULL);
	eif_hPrevInstance = NULL;
	eif_lpCmdLine = GetCommandLineW();
	eif_nCmdShow = SW_SHOW;
#endif
	cmd = GE_nstrdup(GetCommandLineW());
	GE_get_argcargv(cmd, &argc, &argv);
	code = GE_main(argc, argv);
	free(cmd);
	free(argv);
	return code;
}

/*
 * Break the shell command held in 'cmd', putting each shell word
 * in a separate array entry, hence building an argument
 * suitable for the 'main'. Note that 'cmd' will be altered
 * and 'argvp' will point to some chunks of it.
 */
void GE_get_argcargv(EIF_NATIVE_CHAR* cmd, int* argc, EIF_NATIVE_CHAR*** argvp)
{
	int quoted = 0; /* parsing inside a quoted string? */
	int nbs; /* number of backspaces */
	int i;
	EIF_NATIVE_CHAR *p = NULL, *pe = NULL; /* pointers in `cmd' */
	EIF_NATIVE_CHAR *qb = NULL, *q = NULL; /* pointers in arguments */

	*argc = 0;
	/* Remove leading and trailing white spaces */
	for (p = cmd; *p == L' ' || *p == L'\t'; p++)
		; /* empty */
	for (pe = p + GE_nstrlen(p) - 1; pe >= p && (*pe == L' ' || *pe == L'\t'); pe--)
		; /* empty */
	if (p <= pe) {
		*argc = *argc + 1; /* at least one argument */
		qb = q = malloc((pe - p + 2) * sizeof(EIF_NATIVE_CHAR));
		if (!qb) {
			return;
		}
		do {
			switch(*p) {
				case L' ':
				case L'\t':
					if (quoted) {
						do {
							*q++ = *p++;
						} while(*p == L' ' || *p == L'\t');
					} else {
						do {
							p++;
						} while(*p == L' ' || *p == L'\t');
						*q++ = L'\0';
						*argc = *argc + 1;
					}
					break;
				case L'\"':
					quoted = ! quoted;
					p++;
					break;
				case L'\\':
					for (nbs = 0; *p == L'\\'; nbs++)
						*q++ = *p++;
					if (*p == L'\"') {
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
		*q++ = L'\0';
	}

	if (!argvp) {
		free(qb);
		return;
	}

	*argvp = (EIF_NATIVE_CHAR**)malloc((*argc+1)*sizeof(EIF_NATIVE_CHAR*));
	if (!(*argvp)) {
		free(qb);
		return;
	}

	for (i = 0; i < *argc; i++) {
		(*argvp)[i] = qb;
		qb += GE_nstrlen(qb) + 1;
	}
	(*argvp)[i] = (EIF_NATIVE_CHAR *)0;
}

#else

int main (int argc, char ** argv)
{
	return GE_main (argc, argv);
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
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_GC_C
#define GE_GC_C

/*
 * Allocate memory that does not contain pointers to collectable objects.
 * The allocated memory is zeroed.
 * The allocated object is itself not collectable.
 * Do not raise an exception when no-more-memory.
 */
#ifdef EIF_BOEHM_GC
void* GE_raw_calloc_atomic_uncollectable(size_t nelem, size_t elsize)
{
	void* new_p;

	new_p = GC_malloc_atomic_uncollectable(nelem * elsize);
	if (new_p) {
		memset(new_p, 0, nelem * elsize);
	}
	return new_p;
}
#endif

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Raise an exception when no-more-memory.
 */
void* GE_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize)
{
	void* new_p;
#ifdef EIF_BOEHM_GC
	new_p = GE_null(GC_REALLOC(p, new_nelem * elsize));
#else /* No GC */
	new_p = GE_null(realloc(p, new_nelem * elsize));
#endif
	memset(((char*) new_p) + (old_nelem * elsize), 0, (new_nelem - old_nelem) * elsize);
	return new_p;
}

/*
 * Allocate more memory for the given pointer.
 * The reallocated pointer keeps the same properties (e.g. atomic or not, collectable or not).
 * The extra allocated memory is zeroed.
 * The allocated object is itself collectable.
 * Do not raise an exception when no-more-memory.
 */
void* GE_raw_recalloc(void* p, size_t old_nelem, size_t new_nelem, size_t elsize)
{
	void* new_p;
#ifdef EIF_BOEHM_GC
	new_p = GC_REALLOC(p, new_nelem * elsize);
#else /* No GC */
	new_p = realloc(p, new_nelem * elsize);
#endif
	if (new_p) {
		memset(((char*) new_p) + (old_nelem * elsize), 0, (new_nelem - old_nelem) * elsize);
	}
	return new_p;
}

/*
 * Call dispose routine `disp' on object `C'.
 */
#ifdef EIF_BOEHM_GC
void GE_boehm_dispose(void* C, void* disp) {
	((GE_types[((EIF_REFERENCE)C)->id]).dispose)(GE_current_context(), (EIF_REFERENCE) C);
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

		"C functions used to implement class IDENTIFIED"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_IDENTIFIED_C
#define GE_IDENTIFIED_C

#ifdef __cplusplus
extern "C" {
#endif

/*
	Weak pointers.
*/

/*
 * Weak pointer structure.
 */
typedef struct GE_weak_pointer {
	EIF_REFERENCE object;
} GE_weak_pointer;

/*
 * Create a new weak pointer to `object'.
 */
GE_weak_pointer* GE_new_weak_pointer(EIF_REFERENCE object) {
	GE_weak_pointer* wp;

	if (object == 0) {
		return (GE_weak_pointer*) 0;
	} else {
		wp = (GE_weak_pointer*) GE_malloc_atomic(sizeof(GE_weak_pointer));
		wp->object = object;
#ifdef EIF_BOEHM_GC
		GC_GENERAL_REGISTER_DISAPPEARING_LINK((void**)(&wp->object), GC_base(object));
#endif
		return wp;
	}
}

/*
 * Direct access to the object held in the weak pointer.
 */
EIF_REFERENCE GE_weak_pointer_object_without_lock(GE_weak_pointer* wp) {
	if (wp == 0) {
		return (EIF_REFERENCE) 0;
	} else {
		return (wp->object);
	}
}

/*
 * Access to the object held in the weak pointer.
 */
#ifdef EIF_BOEHM_GC
EIF_REFERENCE GE_weak_pointer_object(GE_weak_pointer* wp) {
	return (EIF_REFERENCE) GC_call_with_alloc_lock((GC_fn_type)GE_weak_pointer_object_without_lock, wp);
}
#else /* No GC */
#define GE_weak_pointer_object(wp) GE_weak_pointer_object_without_lock(wp)
#endif


/*
	Identified data structures and functions.
*/

/*
 * Size of inner arrays in `GE_id_objects'.
 */
#define GE_ID_OBJECT_CHUNK_SIZE 512

/*
 * Number of slots to be added to the outer array of
 * `GE_id_objects' when resizing it.
 */
#define GE_ID_OBJECT_CAPACITY_INCREMENT 512

/*
 * Array of arrays of weak pointers. Each inner array has the same size
 * (GE_ID_OBJECT_CHUNK_SIZE). Given an id, the weak pointer associated
 * the object, if any, is at index (id % GE_ID_OBJECT_CHUNK_SIZE) in the
 * inner array located at index (id / GE_ID_OBJECT_CHUNK_SIZE) in the
 * outer array.
 */
GE_weak_pointer*** GE_id_objects;

/*
 * Capacity of the outer array of `GE_id_objects'.
 */
EIF_INTEGER_32 GE_id_objects_capacity;

/*
 * Last id associated with an object.
 */
EIF_INTEGER_32 GE_last_object_id;

/*
 * Initialize data to keep track of object ids.
 */
void GE_init_identified(void) {
	GE_id_objects = (GE_weak_pointer***) 0;
	GE_id_objects_capacity = 0;
	GE_last_object_id = 0;
}

/*
 * Get a new id for `object', assuming it is NOT in the stack.
 */
EIF_INTEGER_32 GE_object_id(EIF_OBJECT object) {
	GE_weak_pointer** id_object_chunk;
	EIF_INTEGER_32 i;
	EIF_INTEGER_32 l_old_capacity;

	GE_last_object_id++;
	i = GE_last_object_id / GE_ID_OBJECT_CHUNK_SIZE;
	if (i >= GE_id_objects_capacity) {
		l_old_capacity = GE_id_objects_capacity;
		GE_id_objects_capacity = GE_id_objects_capacity + GE_ID_OBJECT_CAPACITY_INCREMENT;
		if (GE_id_objects == 0) {
			GE_id_objects = GE_calloc_atomic_uncollectable(GE_id_objects_capacity, sizeof(GE_weak_pointer**));
		} else {
			GE_id_objects = GE_recalloc(GE_id_objects, l_old_capacity, GE_id_objects_capacity, sizeof(GE_weak_pointer**));
		}
	}
	id_object_chunk = GE_id_objects[i];
	if (id_object_chunk == 0) {
		id_object_chunk = GE_calloc_uncollectable(GE_ID_OBJECT_CHUNK_SIZE, sizeof(GE_weak_pointer*));
		GE_id_objects[i] = id_object_chunk;
	}
	i = GE_last_object_id % GE_ID_OBJECT_CHUNK_SIZE;
	id_object_chunk[i] = GE_new_weak_pointer(object);
	return GE_last_object_id;
}

/*
 * Return the object associated with `id'.
 */
EIF_REFERENCE GE_id_object(EIF_INTEGER_32 id) {
	GE_weak_pointer** id_object_chunk;
	GE_weak_pointer* wp;
	EIF_REFERENCE object;
	EIF_INTEGER_32 i;

	i = id / GE_ID_OBJECT_CHUNK_SIZE;
	if (i >= GE_id_objects_capacity) {
		return (EIF_REFERENCE) 0;
	} else {
		id_object_chunk = GE_id_objects[i];
		if (id_object_chunk == 0) {
			return (EIF_REFERENCE) 0;
		} else {
			i = id % GE_ID_OBJECT_CHUNK_SIZE;
			wp = id_object_chunk[i];
			if (wp == 0) {
				return (EIF_REFERENCE) 0;
			} else {
				object = GE_weak_pointer_object(wp);
				if (object == 0) {
					id_object_chunk[i] = (GE_weak_pointer*) 0;
#ifdef EIF_BOEHM_GC
					GC_unregister_disappearing_link((void**)(&wp->object));
#endif
					GE_free(wp);
					return (EIF_REFERENCE) 0;
				} else {
					return object;
				}
			}
		}
	}
}

/*
 * Remove the object associated with `id' from the stack.
 */
void GE_object_id_free(EIF_INTEGER_32 id) {
	GE_weak_pointer** id_object_chunk;
	GE_weak_pointer* wp;
	EIF_REFERENCE object;
	EIF_INTEGER_32 i;

	i = id / GE_ID_OBJECT_CHUNK_SIZE;
	if (i < GE_id_objects_capacity) {
		id_object_chunk = GE_id_objects[i];
		if (id_object_chunk != 0) {
			i = id % GE_ID_OBJECT_CHUNK_SIZE;
			wp = id_object_chunk[i];
			if (wp != 0) {
				object = GE_weak_pointer_object(wp);
				if (object != 0) {
#ifdef EIF_BOEHM_GC
					GC_unregister_disappearing_link((void**)(&wp->object));
#endif
				}
				id_object_chunk[i] = (GE_weak_pointer*) 0;
				GE_free(wp);
			}
		}
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

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_CECIL_C
#define EIF_CECIL_C

#ifdef __cplusplus
extern "C" {
#endif

EIF_PROCEDURE eif_procedure(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_procedure' in 'eif_cecil.c' not implemented\n");
	return (EIF_PROCEDURE) 0;
}

EIF_INTEGER_FUNCTION eif_integer_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_integer_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_INTEGER_FUNCTION) 0;
}

EIF_REFERENCE_FUNCTION eif_reference_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_reference_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REFERENCE_FUNCTION) 0;
}

EIF_POINTER_FUNCTION eif_pointer_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_pointer_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_POINTER_FUNCTION) 0;
}

EIF_BOOLEAN_FUNCTION eif_boolean_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_boolean_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_BOOLEAN_FUNCTION) 0;
}

EIF_REAL_32_FUNCTION eif_real_32_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_real_32_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REAL_32_FUNCTION) 0;
}

EIF_REAL_64_FUNCTION eif_real_64_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_real_64_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_REAL_64_FUNCTION) 0;
}

EIF_CHARACTER_8_FUNCTION eif_character_8_function(char* rout, EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_character_8_function' in 'eif_cecil.c' not implemented\n");
	return (EIF_CHARACTER_8_FUNCTION) 0;
}

EIF_OBJECT eif_create(EIF_TYPE_ID cid) {
	/* TODO */
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_create' in 'eif_cecil.c' not implemented\n");
	return (EIF_OBJECT) 0;
}

EIF_TYPE_ID eif_type_id(char* type_string) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_type_id' in 'eif_cecil.c' not implemented\n");
	return EIF_NO_TYPE;
}

extern EIF_INTEGER eifaddr_offset(EIF_REFERENCE object, char *name, int * const ret) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eifaddr_offset' in 'eif_cecil.c' not implemented\n");
	return 0;
}

EIF_TYPE_ID eiftype(EIF_OBJECT object) {
		/* Obsolete. Use "eif_type_by_reference" instead.
		 * Return the Type id of the specified object. 
		 */
	return (EIF_TYPE_ID) object->id;
}

EIF_TYPE_ID eif_type_by_reference (EIF_REFERENCE object) {
		/* Return type id of the direct reference "object" */
	return (EIF_TYPE_ID) object->id;
}

EIF_TYPE_INDEX eif_gen_param_id (EIF_TYPE_INDEX dftype, uint32_t pos) {
#ifdef EIF_WINDOWS
	GE_show_console();
#endif
	fprintf(stderr, "'eif_gen_param_id' in 'eif_cecil.c' not implemented\n");
	return 0;
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

		"Part of ISE Eiffel runtime. Needed to compile the EiffelCOM library."

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2010, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_PLUG_C
#define EIF_PLUG_C

#ifdef __cplusplus
extern "C" {
#endif

#ifndef EIF_THREADS
int nstcall = 0;
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

		"C functions used to implement class EXCEPTIONS"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_EXCEPT_C
#define EIF_EXCEPT_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef EIF_EXCEPT_H
#include "eif_except.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Raise an Eiffel exception.
 */
void eraise(const char* name, long code)
{
	GE_raise_with_message(code, name);
}

/*
 * Raise an Eiffel exception of the given code with no associated tag.
 */
void xraise(int code)
{
	GE_raise((long)code);
}

/*
 * Raise an "Operating system error" exception.
 */
void esys(void)
{
	if (errno == 0) {
			/* External event */
		GE_raise(GE_EX_EXT);
	} else {
			/* Operating system error */
		GE_raise(GE_EX_SYS);
	}
}

/*
 * As a special case, an I/O error is raised when a system call which is I/O bound fails.
 */
void eise_io(const char* tag)
{
	GE_raise_with_message(GE_EX_ISE_IO, tag);
}

/*
 * Raise a "No more memory" exception.
 */
 void enomem(void) {
	GE_raise(GE_EX_OMEM);
 }

/*
 * Raise EiffelCOM exception.
 */
void com_eraise(const char* tag, long num)
{
	GE_raise_with_message(num, tag);
}

/*
 * Terminate execution with exit status `code',
 * without triggering an exception.
 */
void esdie(int code)
{
/* TODO: check that the Boehm GC triggers the 'dispose' routines. */
	exit(code);
}

/*
 * Exception tag associated with `code'.
 * This is a duplication from Eiffel classes, but still used for trace printing and in EiffelCom.
 */
EIF_REFERENCE eename(long code)
{
	return GE_str8(GE_exception_tag(code));
}

/*
 * Is exception `ex' defined?
 * Used in EiffelCOM.
 */
char eedefined(long ex)
{
	return (char) ((ex > 0 && ex <= GE_EX_NEX)? 1 : 0);
}

/*
 * Enable/diable printing of the exception trace.
 * Per thead information.
 */
void eetrace(char b) {
	GE_context* context;

	context = GE_current_context();
	context->exception_trace_enabled = b;
}

/*
 * Is current execution during rescue?
 */
EIF_BOOLEAN eif_is_in_rescue(void)
{
	GE_context* context;

	context = GE_current_context();
	return (EIF_TEST(context->in_rescue > 0));
}

#ifdef EIF_WINDOWS
/*
 * Set default exception handler.
 */
void set_windows_exception_filter()
{
	GE_set_windows_exception_filter();
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

		"C functions used to implement class REAL"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_REAL_C
#define GE_REAL_C

#ifdef __cplusplus
extern "C" {
#endif

/*
 * Bit representation of `v'.
 */
EIF_NATURAL_32 GE_real_32_to_bits(EIF_REAL_32 v)
{
	return *(EIF_NATURAL_32 *)&v;
}

/*
 * Bit representation of `v'.
 */
EIF_NATURAL_64 GE_real_64_to_bits(EIF_REAL_64 v)
{
	return *(EIF_NATURAL_64 *)&v;
}

/*
 * Real value with `v' as bit representation.
 */
EIF_REAL_32 GE_real_32_from_bits(EIF_NATURAL_32 v)
{
	return *(EIF_REAL_32 *)&v;
}

/*
 * Real value with `v' as bit representation.
 */
EIF_REAL_64 GE_real_64_from_bits(EIF_NATURAL_64 v)
{
	return *(EIF_REAL_64 *)&v;
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
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

#ifndef FILE_TYPE_MAX
#define FILE_TYPE_MAX 5		/* max size of fopen type string (like "a+b") */
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
#ifndef S_IFMT
#define S_IFMT 0170000
#endif
#ifndef S_ISREG
#define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif
#ifndef S_ISDIR
#define S_ISDIR(m) (((m) & S_IFMT) == S_IFDIR)
#endif
#ifndef S_ISCHR
#define S_ISCHR(m) (((m) & S_IFMT) == S_IFCHR)
#endif
#ifndef S_ISBLK
#define S_ISBLK(m) (((m) & S_IFMT) == S_IFBLK)
#endif
#ifndef S_ISLNK
#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
#endif
#ifndef S_ISFIFO
#define S_ISFIFO(m) (((m) & S_IFMT) == S_IFIFO)
#endif
#ifndef S_ISSOCK
#define S_ISSOCK(m) (((m) & S_IFMT) == S_IFSOCK)
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

#define FS_START	0			/* Beginning of file for `fseek' */
#define FS_CUR		1			/* Current position for `fseek' */
#define FS_END		2			/* End of file for `fseek' */
/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat		_wstat64
#		define rt_fstat		_fstat64
#	else
#		define rt_stat		_wstat64i32
#		define rt_fstat		_fstat64i32
#	endif
#	define rt_access		_waccess
#else
#	define rt_stat			stat
#	define rt_lstat			lstat
#	define rt_fstat			fstat
#	define rt_access		access
#endif

static int rt_mkdir(EIF_FILENAME path, int mode)
{
#ifdef EIF_WINDOWS
	return _wmkdir(path);
#else
	return mkdir(path, mode);
#endif
}

static int rt_rename(EIF_FILENAME from, EIF_FILENAME to)
{
#ifdef EIF_WINDOWS
	return _wrename(from, to);
#else
	return rename(from, to);
#endif
}

static int rt_rmdir(EIF_FILENAME path)
{
#ifdef EIF_WINDOWS
	return _wrmdir(path);
#else
	return rmdir(path);
#endif
}

static int rt_unlink(EIF_FILENAME path)
{
#ifdef EIF_WINDOWS
	return _wunlink(path);
#else
	return unlink(path);
#endif
}

static FILE *rt_file_fopen(EIF_FILENAME name, EIF_FILENAME type)
{
#ifdef EIF_WINDOWS
	return _wfopen(name, type);
#else
	return fopen(name, type);
#endif
}

static FILE *rt_file_fdopen(int fd, EIF_FILENAME type)
{
#ifdef EIF_WINDOWS
	return _wfdopen(fd, type);
#else
	return fdopen(fd, type);
#endif
}

static FILE *rt_file_freopen(EIF_FILENAME name, EIF_FILENAME type, FILE *stream)
{
#ifdef EIF_WINDOWS
	return _wfreopen(name, type, stream);
#else
	return freopen(name, type, stream);
#endif
}

static int rt_utime(EIF_FILENAME path, struct utimbuf *times)
{
#ifdef EIF_WINDOWS
	return _wutime(path, (struct _utimbuf *) times);
#else
	return utime(path, times);
#endif
}

/*
 * Swallow next character if it is a new line.
 */
static void rt_swallow_nl(FILE *f) {
		/* getc() cannot be used as it doesn't set the EOF flag */

	if (f != stdin) {
		if (fscanf (f, "\n") == EOF && ferror(f)) {
			eise_io ("FILE: error during reading the end of the file,");
		}
	} else {
		int c;

		errno = 0;
		c = getc(f);
		if (c == EOF && ferror(f))
			eise_io("FILE: error during reading the end of the file.");

		if (c != '\n' && EOF == ungetc(c, f))
			eise_io("FILE: End of file.");
	}
}

static void rt_file_stat (EIF_FILENAME path, rt_stat_buf *buf)
{
		/* To preserve compatibility we always follow symbolic links and raise an exception upon failure. */
	if (eif_file_stat(path, buf, 1) == -1) {
		esys();
	}
}

/*
 * Given `how' the file is being opened and a `mode' create a platform specific character
 * string (UTF-16 encoding on Windows and a byte sequence otherwise) that can be used by
 * the underlying OS system call to open the mode in the proper mode (e.g. open append,
 * read-write mode, ....).
 */
static EIF_FILENAME rt_file_open_mode(int how, char mode)
{
#ifdef EIF_WINDOWS
	static wchar_t file_type [FILE_TYPE_MAX];
#else
	static char file_type [FILE_TYPE_MAX];
#endif

	file_type[4] = '\0';
	file_type[3] = '\0';
	file_type[2] = '\0';
	if (how >= 10) how -= 10;
	switch (how) {
		case 0:
		case 3: file_type[0] = 'r'; break;
		case 1:
		case 4: file_type[0] = 'w'; break;
		case 2:
		case 5: file_type[0] = 'a'; break;
		default: file_type[0] = 'r'; break;
	}
	file_type[1] = mode;
	switch (how) {
		case 3:
		case 4:
		case 5:
			if (mode == '\0') {
				file_type[1] = '+';
			} else {
				file_type[2] = '+';
			}
	}
#ifdef EIF_WINDOWS
	/* We make sure that files created in Eiffel are not inheritable
	 * by default as otherwise it makes things too complicated for the
	 * end user when spawing child processes. */
	if (file_type [1] == '\0') {
		file_type [1] = 'N';
	} else if (file_type [2] == '\0') {
		file_type [2] = 'N';
	} else {
		file_type [3] = 'N';
	}
#endif
	return file_type;
}

/*
 * Create directory `dirname'.
 */
void eif_file_mkdir(EIF_FILENAME dirname) {
	errno = 0;
	if (rt_mkdir(dirname, 0777) == -1) {
		esys(); /* Raise exception */
	}
}

/*
 * Rename file `from' into `to'.
 */
void eif_file_rename(EIF_FILENAME from, EIF_FILENAME to) {
	for (;;) {
#ifdef EIF_WINDOWS
		if (eif_file_exists(to)) {
				/* To have the same behavior as Unix, we need to remove the destination file if it exists.
				 * Of course we can do this only if `from' and `to' do not represent the same file.
				 * To check this, we use `CreateFile' to open both file, and then using the information
				 * returned by `GetFileInformationByHandle' we can check whether or not they are indeed
				 * the same. */
			BY_HANDLE_FILE_INFORMATION l_to_info, l_from_info;
			HANDLE l_from_file = CreateFileW (from, GENERIC_READ, FILE_SHARE_READ, NULL,
				OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
			HANDLE l_to_file = CreateFileW (to, GENERIC_READ, FILE_SHARE_READ, NULL,
					OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);

			if ((l_from_file == INVALID_HANDLE_VALUE) || (l_to_file == INVALID_HANDLE_VALUE)) {
					/* We do not need the handles anymore, simply close them. Since Microsoft
					 * API accepts INVALID_HANDLE_VALUE we don't check the validity of arguments. */
				CloseHandle(l_from_file);
				CloseHandle(l_to_file);

					/* For some reasons we cannot open the file. This should not happen, maybe the OS has
					 * removed `from' or `to'. In that case, we simply try to remove destination as we were
					 * doing in former revision of `file_rename'. */
				_wremove (to);
			} else {
				BOOL success = GetFileInformationByHandle (l_from_file, &l_from_info);
				if (success) {
					success = GetFileInformationByHandle (l_to_file, &l_to_info);
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
							_wremove (to);
						} else {
								/* Files are identical, nothing to be done apart from */
							break;
						}
					} else {
							/* An error occurred while retrieving the information about `from' and `to'. Like
							 * for the case where `l_from_file' and `l_to_file' are invalid, we try to remove
							 * the file. */
						_wremove (to);
					}
				} else {
						/* We do not need the handles anymore, simply close them. */
					CloseHandle(l_from_file);
					CloseHandle(l_to_file);
						/* An error occurred while retrieving the information about `from' and `to'. Like
						 * for the case where `l_from_file' and `l_to_file' are invalid, we try to remove
						 * the file. */
					_wremove (to);
				}
			}
		}
#endif
		errno = 0;
		if (rt_rename(from, to) == -1) {
			esys(); /* Raise exception */
		}
		break;
	}
}

/*
 * Link file `from' into `to'.
 */
void eif_file_link(EIF_FILENAME from, EIF_FILENAME to) {
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
void eif_file_unlink(EIF_FILENAME name) {
	rt_stat_buf buf;				/* File statistics */
	int status;						/* Status from system call */

	status = eif_file_stat(name, &buf, 0);				/* Side effect: ensure file exists */
	if (status == -1) {				/* An error occurred */
		esys();
	} else {
		for (;;) {
			errno = 0;						/* Reset error condition */
			if (S_ISDIR(buf.st_mode))		/* Directory */
				status = rt_rmdir(name);		/* Remove only if empty */
			else
				status = rt_unlink(name);		/* Not a directory */
			if (status == -1) {				/* An error occurred */
				if (errno == EINTR)			/* Interrupted by signal */
					continue;				/* Re-issue system call */
				else
					esys();					/* Raise exception */
			}
			break;
		}
	}
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER eif_file_open(EIF_FILENAME name, int how) {
	FILE *fp;
	errno = 0;
#if defined EIF_WINDOWS
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how, (how < 10 ? 't' : 'b')));
#else
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how, '\0'));
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER eif_file_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
	fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how, (how < 10 ? 't' : 'b')));
#else
	fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how, '\0'));
#endif
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
EIF_POINTER eif_file_reopen(EIF_FILENAME name, int how, FILE *old) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
	fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how, (how < 10 ? 't' : 'b')), old);
#else
	fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how, '\0'), old);
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Close the file.
 */
void eif_file_close(FILE *fp) {
	errno = 0;
	if (fclose(fp) != 0) {
		esys(); /* Close failed, raise exception */
	}
}

/*
 * Flush data held in stdio buffer.
 */
void eif_file_flush(FILE *fp) {
	errno = 0;
	if (fflush(fp) != 0) {
	    esys(); /* Flush failed, raise exception */
	}
#ifdef EIF_WINDOWS
		/* On Windows, it does not write directly to disk, so we have to force it. See KB66052:
		 * http://support.microsoft.com/kb/66052
		 * We ignore bad file descriptor case, as it is most likely when calling it on one of the standard
		 * input/outputs. */
	if ((0 != _commit(fileno(fp))) && (errno != EBADF)) {
		esys();
	}
#endif
}

/*
 * Return the associated file descriptor.
 */
EIF_INTEGER eif_file_fd(FILE *f) {
	int res;
	if (!f) {
		res = 0;
		eraise("invalid file pointer", EN_EXT);
	} else {
		res = fileno(f);
		if (res == -1) {
			eraise("error occurred", EN_EXT);
		}
	}
	return (EIF_INTEGER) res;
}

/*
 * Get a character from `f'.
 */
EIF_CHARACTER_8 eif_file_gc(FILE *f) {
	int c;
	errno = 0;
	c = getc(f);
	if (c == EOF && ferror(f)) {
		eise_io("FILE: unable to read CHARACTER value.");
	}
	return (EIF_CHARACTER_8)c;
}

/*
 * Get a string from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters.
 */
EIF_INTEGER eif_file_gs(FILE *f, char *s, EIF_INTEGER bound, EIF_INTEGER start) {
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
EIF_INTEGER eif_file_gss(FILE* f, char* s, EIF_INTEGER bound) {
	size_t amount = fread(s, sizeof(char), (size_t) bound, f);

	if (ferror(f)) {	/* An I/O error occurred */
		eise_io("FILE: unable to read stream.");					/* Raise exception */
	}

	return (EIF_INTEGER) amount;	/* Number of characters read */
}

/*
 * Get a word from `f' and fill it into `s' (at most `bound' characters),
 * with `start' being the amount of bytes already stored within s. This
 * means we really have to read (bound - start) characters. Any leading
 * spaces are skipped.
 */
EIF_INTEGER eif_file_gw(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
	EIF_INTEGER amount;	/* Amount of bytes to be read */
	int c = 0;			/* Last char read */

	amount = bound - start;		/* Characters to be read */
	s += start;					/* Where read characters are written */
	errno = 0;					/* No error, a priori */

	if (start == 0)	{			/* First call */
		while ((c = getc(f)) != EOF)
			if (!isspace(c))
				break;
		if (c == EOF && ferror(f))	/* An I/O error occurred */
			eise_io("FILE: unable to read word.");					/* Raise exception */
		if (c == EOF)
			return (EIF_INTEGER) 0;				/* Reached EOF before word */
		else if (EOF == ungetc(c, f))
			eise_io("FILE: unable to read word.");
	}

	while (amount-- > 0) {
		c = getc(f);
		if (c == EOF)
			break;
		if (isspace(c)) {
			if (EOF == ungetc(c, f))
				eise_io("FILE: unable to read word.");
			break;
		}
		*s++ = (char) c;
	}

	if (c == EOF && ferror(f))	/* An I/O error occurred */
		eise_io("FILE: unable to read word.");					/* Raise exception */

	/* If we managed to get the whole string, return the number of characters
	 * read. Otherwise, return (bound - start + 1) to indicate an error
	 * condition.
	 */

	if (c == EOF || isspace(c))
		return bound - start - amount - 1;	/* Number of characters read */

	return bound - start + 1;			/* Error condition */
}

/*
 * Look ahead one character. If EOF, return 0.
 */
EIF_CHARACTER_8 eif_file_lh(FILE *f) {
	int c;

	errno = 0;
	c = getc(f);
	if (c == EOF && ferror(f))
		eise_io("FILE: error when reading a character ahead.");

	if (c != EOF && EOF == ungetc(c, f))
		eise_io("FILE: error when reading a character ahead.");

	return (EIF_CHARACTER_8) (c == EOF ? (char) 0 : (char) c);
}

/*
 * Size of file `fp'.
 */
EIF_INTEGER eif_file_size(FILE *fp) {
	rt_stat_buf buf;

	errno = 0;
	if (fflush (fp) != 0) {
		esys();
	}
	if (rt_fstat (fileno(fp), &buf) == -1)
		esys();		/* An error occurred: raise exception */
		/* FIXME: This code should be upgraded to use 64-bit */
	return (EIF_INTEGER) buf.st_size;
}

/*
 * Read upto next input line.
 */
void eif_file_tnil(FILE *f) {
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
EIF_INTEGER eif_file_tell(FILE *f) {
	long res;

	if (f == (FILE *) 0) {
		eraise("invalid file pointer", EN_EXT);
	}

	res = ftell(f);
	if (res == -1) {
		eraise("error occurred", EN_EXT);
	}
	return (EIF_INTEGER) res;
}

/*
 * Touch file `name' by setting both access and modification time to the
 * current time stamp. This external function exists only because there
 * is no way within UNIX_FILE to get the current time stamp. Otherwise,
 * we could simply call file_utime.
 */
void eif_file_touch(EIF_FILENAME name) {
	eif_file_utime(name, time((time_t *) 0), 2);
}

/*
 * Modify the modification and/or the access time stored in the file's
 * inode. The 'how' parameter tells which attributes should be set.
 */
void eif_file_utime(EIF_FILENAME name, time_t stamp, int how) {
	struct utimbuf tp;	/* Time array */
	rt_stat_buf buf;	/* File statistics */
	int status;			/* System call status */

	if (how < 2) {				/* Need to fetch time from inode */
		rt_file_stat(name, &buf);
		switch (how) {
		case 0:					/* Change only access time */
			tp.actime = stamp;
			tp.modtime = buf.st_mtime;
			break;
		case 1:					/* Change only modification time */
			tp.actime = buf.st_atime;
			tp.modtime = stamp;
			break;
		}
	} else
		tp.actime = tp.modtime = stamp;	/* Change both access and modification times */
	errno = 0;

	if (rt_utime(name, &tp) == -1) {
			/* Raise exception */
		esys();
	}
}

/*
 * This is an encapsulation of the stat() system call. The routine either
 * succeeds and returns or fails and raises the appropriate exception.
 */
int eif_file_stat(EIF_FILENAME path, rt_stat_buf *buf, int follow) {
	int status;			/* System call status */

	for (;;) {
		errno = 0;						/* Reset error condition */
#ifdef HAS_LSTAT
		status = rt_lstat(path, buf);
		if ((status == 0) && (follow) && (S_ISLNK(buf->st_mode))) {
				/* We found a file which is a symbolic link and we are asked to
				 * follow the link to fetch properties on the link location.
				 * We call `rt_stat' to make sure the link is valid. It is going to
				 * slow down current call by stating twice the info, but this
				 * case is quite rare and there is a benefit in using `lstat'
				 * over `rt_stat' the first time as more than 90% of the files
				 * we stat are not symlink. */
			status = rt_stat (path, buf);
		}
#else
		status = rt_stat (path, buf);		/* Get file statistics */
#endif
		if ((status == -1) && (errno == EINTR)) {
				/* Call was interrupted by a signal we re-issue it. */
			continue;
		}
		break;
	}
	return status;
}

/*
 * Change permissions of file `name', using an interface like chmod(1).
 * The flag is true if permissions are to be added, 0 to remove them.
 */
void eif_file_perm(EIF_FILENAME name, char *who, char *what, int flag) {
	int fmode;					/* File mode to be altered */
	rt_stat_buf buf;			/* File statistics */

		/* We need to follow links since `chmod' does follow them to change the permissions. */
	if (eif_file_stat(name, &buf, 1)) {
		esys();
	} else {
		fmode = (int) buf.st_mode;	/* Fetch current file mode */

		switch (*who) {
		case 'u':
			while (*what)
				switch (*what++) {
#ifdef EIF_WINDOWS
				case 's': break;
				case 'r': break;
				case 'w': break;
				case 'x': break;
#else
				case 's':
					if (flag) fmode |= S_ISUID; else fmode &= ~S_ISUID;
					break;
				case 'r':
					if (flag) fmode |= S_IRUSR; else fmode &= ~S_IRUSR;
					break;
				case 'w':
					if (flag) fmode |= S_IWUSR; else fmode &= ~S_IWUSR;
					break;
				case 'x':
					if (flag) fmode |= S_IXUSR; else fmode &= ~S_IXUSR;
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
#ifdef S_ISGID
					if (flag) fmode |= S_ISGID; else fmode &= ~S_ISGID;
#endif
					break;
				case 'r':
#ifdef S_IRGRP
					if (flag) fmode |= S_IRGRP; else fmode &= ~S_IRGRP;
#endif
					break;
				case 'w':
#ifdef S_IWGRP
					if (flag) fmode |= S_IWGRP; else fmode &= ~S_IWGRP;
#endif
					break;
				case 'x':
#ifdef S_IXGRP
					if (flag) fmode |= S_IXGRP; else fmode &= ~S_IXGRP;
#endif
					break;
				default:
					eraise("invalid group permission", EN_EXT);
				}
			break;
		case 'o':
			while (*what)
				switch (*what++) {
				case 't':
#ifdef S_ISVTX
					if (flag) fmode |= S_ISVTX; else fmode &= ~S_ISVTX;
#endif
					break;
				case 'r':
#ifdef S_IROTH
					if (flag) fmode |= S_IROTH; else fmode &= ~S_IROTH;
#endif
					break;
				case 'w':
#ifdef S_IWOTH
					if (flag) fmode |= S_IWOTH; else fmode &= ~S_IWOTH;
#endif
					break;
				case 'x':
#ifdef S_IXOTH
					if (flag) fmode |= S_IXOTH; else fmode &= ~S_IXOTH;
#endif
					break;
				default:
					eraise("invalid other permission", EN_EXT);
				}
			break;
		default:
			eraise("invalid permission target", EN_EXT);
		}
		eif_file_chmod(name, fmode);
	}
}

/*
 * Change permission mode on file `path'.
 */
void eif_file_chmod(EIF_FILENAME path, int mode) {
	errno = 0;
#ifdef EIF_WINDOWS
	if (_wchmod(path, mode) == -1) {
#else
	if (chmod(path, mode) == -1) {
#endif
		esys();
	}
}

/*
 * Change the owner of the file to `uid'.
 */
void eif_file_chown(EIF_FILENAME name, int uid) {
#ifdef HAS_CHOWN
	int gid;
	rt_stat_buf buf;

	rt_file_stat(name, &buf);
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
void eif_file_chgrp(EIF_FILENAME name, int gid) {
#ifdef HAS_CHOWN
	int uid;
	rt_stat_buf buf;

	rt_file_stat(name, &buf);
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
void eif_file_tnwl(FILE *f) {
	errno = 0;
	if (putc('\n', f) == EOF) {
		eise_io("FILE: unable to write new line.");
	}
}

/*
 * Append a copy of `other' to `f'.
 */
void eif_file_append(FILE *f, FILE *other, EIF_INTEGER l) {
	size_t amount;
	char buffer[512];
	int bufsize = 512;

	errno = 0;
	if (fseek(other, 0, FS_START) != 0) {
		esys();
	}
	if (fseek(f, 0, FS_END) != 0) {
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
		l -= (EIF_INTEGER) amount;
		if (amount != fwrite(buffer, sizeof(char), amount, f)) {
			eise_io("FILE: unable to write appended file.");
			break;
		}
	}
}

/*
 * Write string `str' on `f'.
 */
void eif_file_ps(FILE *f, char *str, EIF_INTEGER len) {
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
void eif_file_pc(FILE *f, char c) {
	errno = 0;
	if (putc(c, f) == EOF) {
		eise_io("FILE: unable to write CHARACTER value.");
	}
}

/*
 * Go to absolute position `pos' counted from start.
 */
void eif_file_go(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, FS_START) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from end.
 */
void eif_file_recede(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, -pos, FS_END) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * Go to absolute position `pos' counted from current position.
 */
void eif_file_move(FILE *f, EIF_INTEGER pos) {
	errno = 0;
	if (fseek(f, pos, FS_CUR) != 0) {
		esys();
	}
	clearerr(f);
}

/*
 * End of file.
 */
EIF_BOOLEAN eif_file_feof(FILE *fp) {
	return (EIF_BOOLEAN)(feof(fp) != 0);
}

/*
 * Test whether file exists or not. If `name' represents a symbolic link,
 * it will check that pointed file does exist.
 */
EIF_BOOLEAN eif_file_exists(EIF_FILENAME name) {
	int status;					/* System call status */
	rt_stat_buf buf;			/* Buffer to get file statistics */

	status = eif_file_stat (name, &buf, 1);

#ifdef EOVERFLOW
	if (status == -1) {
			/* If the file is larger than what our file routines can handle
			 * it does not mean that the file does not exist. It does but we
			 * cannot handle it.
			 * This is needed to be able to check existence of file bigger than 2GB.
			 */
		return (errno == EOVERFLOW ? EIF_TRUE : EIF_FALSE);
	} else {
		return EIF_TRUE;
	}
#else
	return (status == -1 ? EIF_FALSE : EIF_TRUE);
#endif
}

/*
 * Test whether file exists or not without following the symbolic link
 * if `name' represents one.
 */
EIF_BOOLEAN eif_file_path_exists(EIF_FILENAME name) {
	int status;					/* System call status */
	rt_stat_buf buf;			/* Buffer to get file statistics */

	status = eif_file_stat (name, &buf, 0);

#ifdef EOVERFLOW
	if (status == -1) {
			/* If the file is larger than what our file routines can handle
			 * it does not mean that the file does not exist. It does but we
			 * cannot handle it.
			 * This is needed to be able to check existence of file bigger than 2GB.
			 */
		return (errno == EOVERFLOW ? EIF_TRUE : EIF_FALSE);
	} else {
		return EIF_TRUE;
	}
#else
	return (status == -1 ? EIF_FALSE : EIF_TRUE);
#endif
}

/*
 * Check whether access permission `op' are possible on file `name' using
 * real UID and real GID. This is probably only useful to setuid or setgid
 * programs.
 */
EIF_BOOLEAN eif_file_access(EIF_FILENAME name, EIF_INTEGER op) {
	switch (op) {
	case 0: /* Does file exist? */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, F_OK)) ? '\01' : '\0');
	case 1: /* Test for search permission */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, X_OK)) ? '\01' : '\0');
	case 2: /* Test for write permission */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, W_OK)) ? '\01' : '\0');
	case 3: /* Test for read permission */
		return (EIF_BOOLEAN) ((-1 != rt_access(name, R_OK)) ? '\01' : '\0');
	default:
		return EIF_FALSE;
	}
}

/*
 * Check whether the file `path' may be created: we need write permissions
 * in the parent directory and there must not be any file bearing that name
 * with no write permissions...
 */
EIF_BOOLEAN eif_file_creatable(EIF_FILENAME path, EIF_INTEGER nbytes) {
	rt_stat_buf buf;			/* Buffer to get parent directory statistics */
	EIF_FILENAME temp = NULL;
	EIF_FILENAME ptr;
	size_t l_extra_bytes;

		/* Allocate one extra character, just to be sure since we might be appending characters. */
#ifdef EIF_WINDOWS
	l_extra_bytes = sizeof(wchar_t);
#else
	l_extra_bytes = sizeof(char);
#endif
	temp = (EIF_FILENAME) malloc (nbytes + l_extra_bytes);
	if (!temp) {
		enomem();
	} else {
			/* Search the directory separator. */
#ifdef EIF_WINDOWS
		memcpy (temp, path, nbytes);
		ptr = wcsrchr (temp, '\\');
		if (!ptr) {
				/* On Windows we can have a forward slash as separator. */
			ptr = wcsrchr (temp, '/');
		}
#else
		strcpy (temp, path);
		ptr = strrchr (temp, '/');
#endif
		if (ptr) {
			*ptr = '\0';
#ifdef EIF_WINDOWS
			if ((ptr == temp) || (*(ptr -1) == ':')) {
					/* path is of the form a:\bbb or \bbb, parent is a:\ or \ */
				wcscat (ptr, L"\\");
			}
#endif
		} else {
#ifdef EIF_WINDOWS
			wcsncpy (temp, L".", 2);
#else
			strcpy (temp, ".");
#endif
		}

			/* Does the parent exist? */
		if (!eif_file_exists(temp)) {
			free (temp);
			return (EIF_BOOLEAN) '\0';
		}

		rt_file_stat(temp, &buf);
		free (temp);

		if (S_ISDIR(buf.st_mode)) {	/* Is parent a directory? */
			if (eif_file_eaccess(&buf, 1)) {	/* Check for write permissions */
					/* Check if a non writable file `path' exists */
				if (eif_file_exists(path)) {
					rt_file_stat(path, &buf);
					if (S_ISDIR(buf.st_mode)) {
							/* File exists and it is already a directory, thus we cannot create a file. */
						return (EIF_BOOLEAN) '\0';
					} else {
						return (eif_file_eaccess(&buf, 1)); /* Check for write permissions to re create it */
					}
				}

				return (EIF_BOOLEAN) '\01';
			}
		}
	}
	return (EIF_BOOLEAN) '\0';
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER eif_file_gi(FILE *f) {
	EIF_INTEGER i;

	errno = 0;
	if (fscanf(f, "%d", &i) < 0) {
		eise_io("FILE: unable to read INTEGER value.");
	}
	rt_swallow_nl(f);
	return i;
}

/*
 * Get a real from `f'.
 */
EIF_REAL_32 eif_file_gr(FILE *f) {
	EIF_REAL_32 r;
	errno = 0;
	if (fscanf(f, "%f", &r) < 0) {
		eise_io("FILE: unable to read REAL value.");
	}
	rt_swallow_nl(f);
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 eif_file_gd(FILE *f) {
	EIF_REAL_64 d;
	errno = 0;
	if (fscanf(f, "%lf", &d) < 0) {
		eise_io("FILE: unable to read DOUBLE value.");
	}
	rt_swallow_nl(f);
	return d;
}

/*
 * Write `number' on `f'.
 */
void eif_file_pi(FILE *f, EIF_INTEGER number) {
	errno = 0;
	if (fprintf(f, "%d", number) < 0) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void eif_file_pr(FILE *f, EIF_REAL_32 number) {
	int res;
	errno = 0;

	if (number != number) {
		res = fprintf (f, "%s", "NaN");
	} else if (GE_real_32_is_negative_infinity(number)) {
		res = fprintf (f, "%s", "-Infinity");
	} else if (GE_real_32_is_positive_infinity(number)) {
		res = fprintf (f, "%s", "Infinity");
	} else {
		res = fprintf (f, "%g", number);
	}
    if (res < 0) {
		eise_io("FILE: unable to write REAL_32 value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void eif_file_pd(FILE *f, EIF_REAL_64 val) {
	int res;
	errno = 0;

	if (val != val) {
		res = fprintf (f, "%s", "NaN");
	} else if (GE_real_64_is_negative_infinity(val)) {
		res = fprintf (f, "%s", "-Infinity");
	} else if (GE_real_64_is_positive_infinity(val)) {
			res = fprintf (f, "%s", "Infinity");
	} else {
		res = fprintf(f, "%.17g", val);
	}

	if (res < 0) {
		eise_io("FILE: unable to write REAL_64 value.");
	}
}

/*
 * Size of the stat structure. This is used by the Eiffel side to create
 * the area (special object) which will play the role of a stat buffer
 * structure.
 */
EIF_INTEGER stat_size(void) {
	return (EIF_INTEGER)sizeof(rt_stat_buf);
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
EIF_BOOLEAN eif_file_eaccess(rt_stat_buf *buf, int op) {
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
EIF_INTEGER eif_file_info(rt_stat_buf *buf, int op) {
	switch (op) {
	case 0:	/* File permission mode */
		return (EIF_INTEGER)(buf->st_mode & ST_MODE);
	case 1:	/* Inode number */
		return (EIF_INTEGER)buf->st_ino;
	case 2:	/* Device inode resides on */
		return (EIF_INTEGER) buf->st_dev;
	case 3:	/* Device type */
		return (EIF_INTEGER) buf->st_rdev;
	case 4:	/* UID of file */
		return (EIF_INTEGER) buf->st_uid;
	case 5:	/* GID of file */
		return (EIF_INTEGER) buf->st_gid;
	case 6:	/* Size of file, in bytes */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_size;
	case 7:	/* Last modification time on file */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_mtime;
	case 8:	/* Last access made on file */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_atime;
	case 9:	/* Last status change */
			/* FIXME: This code should be upgraded to use 64-bit */
		return (EIF_INTEGER) buf->st_ctime;
	case 10: /* Number of links */
		return (EIF_INTEGER) buf->st_nlink;
	case 11: /* File type */
		return (EIF_INTEGER) (buf->st_mode & S_IFMT);
	case 12: /* Is file a directory */
		return (EIF_INTEGER) S_ISDIR(buf->st_mode);
	case 13: /* Is file a regular (plain) one */
		if (S_ISREG(buf->st_mode) || (0 == (buf->st_mode & S_IFMT)))
			return (EIF_INTEGER) EIF_TRUE;
		return (EIF_INTEGER) 0;
	case 14: /* Is file a device, ie character or block device. */
		return (S_ISCHR(buf->st_mode) || S_ISBLK(buf->st_mode));
	case 15: /* Is file a character device */
		return (EIF_INTEGER) S_ISCHR(buf->st_mode);
	case 16: /* Is file a block device */
		return (EIF_INTEGER) S_ISBLK(buf->st_mode);
	case 17: /* Is file a FIFO */
		return (EIF_INTEGER) S_ISFIFO(buf->st_mode);
	case 18: /* Is file a symbolic link */
		return (EIF_INTEGER) S_ISLNK(buf->st_mode);
	case 19: /* Is file a socket */
		return (EIF_INTEGER) S_ISSOCK(buf->st_mode);
	default:
		return (EIF_INTEGER)0;
    }
}

/*
 * Return the Eiffel string filled in with the name associated with `uid'
 * if found in /etc/passwd. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE eif_file_owner(int uid) {
	char str[NAME_MAX];
#ifdef HAS_GETPWUID
	struct passwd *pp;

	pp = getpwuid(uid);
	if (pp == (struct passwd *) 0)
		sprintf(str, "%d", uid);		/* Not available: use UID */
	else
		strcpy(str, pp->pw_name);		/* Available: fetch login name */
#else
	sprintf(str, "%d", uid);			/* Not available: use UID */
#endif
	return GE_str8(str);
}

/*
 * Return the Eiffel string filled in with the name associated with `gid'
 * if found in /etc/group. Otherwise, return fill it in with the numeric
 * value.
 */
EIF_REFERENCE eif_file_group(int gid) {
	char str[NAME_MAX];
#ifdef HAS_GETGRGID
	struct group *gp; /* %%ss moved from above */

	gp = getgrgid(gid);
	if (gp == (struct group *) 0)
		sprintf(str, "%d", gid);		/* Not available: use GID */
	else
		strcpy(str, gp->gr_name);		/* Available: fetch login name */
#else
	sprintf(str, "%d", gid);			/* Not available: use UID */
#endif
	return GE_str8(str);
}

/*
 * Get an integer from `f'.
 */
EIF_INTEGER eif_file_gib(FILE* f) {
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
EIF_REAL_32 eif_file_grb(FILE* f) {
	EIF_REAL_32 r;
	errno = 0;
	if (fread (&r, sizeof (EIF_REAL_32), 1, f) != 1) {
		eise_io("FILE: unable to read REAL_32 value.");
	}
	return r;
}

/*
 * Get a double from `f'.
 */
EIF_REAL_64 eif_file_gdb(FILE* f) {
	EIF_REAL_64 d;
	errno = 0;
	if (fread (&d, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to read REAL_64 value.");
	}
	return d;
}

/*
 * Open file `name' with the corresponding type `how'.
 */
EIF_POINTER eif_file_binary_open(EIF_FILENAME name, int how)
{
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how,'b'));
#else
	fp = (FILE *)rt_file_fopen(name, rt_file_open_mode(how,'\0'));
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;

}

/*
 * Open file `fd' with the corresponding type `how'.
 */
EIF_POINTER eif_file_binary_dopen(int fd, int how) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
		fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how,'b'));
#else
		fp = (FILE *)rt_file_fdopen(fd, rt_file_open_mode(how,'\0'));
#endif
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
EIF_POINTER eif_file_binary_reopen(EIF_FILENAME name, int how, FILE* old) {
	FILE *fp;
	errno = 0;
#ifdef EIF_WINDOWS
		fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how,'b'), old);
#else
		fp = (FILE *)rt_file_freopen(name, rt_file_open_mode(how,'\0'), old);
#endif
	if (fp == (FILE *)0) {
		esys(); /* Open failed, raise exception */
	}
	return (EIF_POINTER)fp;
}

/*
 * Write `number' on `f'.
 */
void eif_file_pib(FILE* f, EIF_INTEGER number) {
	errno = 0;
	if (fwrite(&number, sizeof(EIF_INTEGER),1, f) != 1) {
		eise_io("FILE: unable to write INTEGER value.");
	}
}

/*
 * Write `number' on `f'.
 */
void eif_file_prb(FILE* f, EIF_REAL_32 number) {
	errno = 0;
    if (fwrite(&number, sizeof(EIF_REAL_32),1, f) != 1) {
		eise_io("FILE: unable to write REAL_32 value.");
	}
}

/*
 * Write double `val' onto `f'.
 */
void eif_file_pdb(FILE* f, EIF_REAL_64 val) {
	errno = 0;
	if (fwrite (&val, sizeof(EIF_REAL_64), 1, f) != 1) {
		eise_io("FILE: unable to write REAL_64 value.");
	}
}

/*
 * Access time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 * mode: Mode of operation: non-zero for modification and zero for access time.
 */
static EIF_INTEGER eif_file_date_for (EIF_FILENAME name, int mode)
{
	EIF_INTEGER result = 0;
#ifdef EIF_WINDOWS
		/* On NTFS file system, windows store UTC file stamps in 100 of nanoseconds
		 * starting from January 1st 0. Converted in seconds, this time is greater
		 * than 232 therefore we substract the EPOCH date January 1st 1970 to get
		 * a 32 bits representation of the date.
		 * FIXME: Manu 01/28/2004: On FAT file system, the date is in local time,
		 * meaning that the code below does not compensate if you change your timezone
		 * and will return a different date value for the same stamp just because
		 * you are in different time zone.
		 */

		 /* WARNING: This is using the Ansi version of the Win32 API. Remember
		  * that if you are doing any change below.
		  */

	WIN32_FIND_DATAW l_find_data;
	HANDLE l_file_handle;
	ULARGE_INTEGER l_date;

	l_file_handle = FindFirstFileW (name, &l_find_data);
	if (l_file_handle != INVALID_HANDLE_VALUE) {
			/* We do not need the file handle anymore, so we close it to
			 * avoid handle leak. */
		FindClose (l_file_handle);
		if (mode) {
			l_date.LowPart = l_find_data.ftLastWriteTime.dwLowDateTime;
			l_date.HighPart = l_find_data.ftLastWriteTime.dwHighDateTime;
		} else {
			l_date.LowPart = l_find_data.ftLastAccessTime.dwLowDateTime;
			l_date.HighPart = l_find_data.ftLastAccessTime.dwHighDateTime;
		}
			/* Convert 100-nanosecond intervals to seconds
			 * and ajust "1 Jan 1601" to "1 Jan 1970".
			 * The difference between "1 Jan 1601" and "1 Jan 1970"
			 * can be precomputed using the following code:
			 *	SYSTEMTIME epoch = {1970, 1, 0, 1, 0, 0, 0, 0};
			 *	FILETIME epoch_file;
			 *	ULARGE_INTEGER epoch_date;
			 *	SystemTimeToFileTime (&epoch, &epoch_file);
			 *	epoch_date.LowPart = epoch_file.dwLowDateTime;
			 *	epoch_date.HighPart = epoch_file.dwHighDateTime;
			 * time_shift = epoch_date.QuadPart / 10000000UL; // 11644473600
			 */
		result = (EIF_INTEGER) (l_date.QuadPart / GE_nat64(10000000) - GE_nat64(11644473600));
	}
#else
	rt_stat_buf	info;
	if (-1 != eif_file_stat (name, &info, 1)) {
		result = (mode ?  (EIF_INTEGER) info.st_mtime: (EIF_INTEGER) info.st_atime);
	}
#endif
	return result;
}

/*
 * Modification time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
EIF_INTEGER eif_file_date (EIF_FILENAME  name) {
	return eif_file_date_for (name, 1);
}

/*
 * Access time of a file.
 * Seconds since epoch (01 January 1970) in UTC or 0 if time cannot be retrieved.
 */
EIF_INTEGER eif_file_access_date (EIF_FILENAME  name) {
	return eif_file_date_for (name, 0);
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
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
	return eif_file_feof(fp);
}

EIF_CHARACTER_8 console_separator(FILE *f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_lh(f);
}

void console_ps(FILE* f, char* str, EIF_INTEGER len) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_ps(f, str, len);
}

void console_pr(FILE* f, EIF_REAL_32 number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pr(f, number);
}

void console_pc(FILE* f, EIF_CHARACTER_8 c) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pc(f, c);
}

void console_pd(FILE* f, EIF_REAL_64 val) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pd(f, val);
}

void console_pi(FILE* f, EIF_INTEGER number) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_pi(f, number);
}

void console_tnwl(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	console_pc(f,'\n');
}

EIF_CHARACTER_8 console_readchar(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gc(f);
}

EIF_REAL_32 console_readreal(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gr(f);
}

EIF_INTEGER console_readint(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gi(f);
}

EIF_REAL_64 console_readdouble(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gd(f);
}

EIF_INTEGER console_readword(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gw(f, s, bound, start);
}

EIF_INTEGER console_readline(FILE* f, char* s, EIF_INTEGER bound, EIF_INTEGER start) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gs(f, s, bound, start);
}

void console_next_line(FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_tnil(f);
}

EIF_INTEGER console_readstream(FILE* f, char* s, EIF_INTEGER bound) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	return eif_file_gss(f, s, bound);
}

void console_file_close (FILE* f) {
#ifdef EIF_WINDOWS
	eif_show_console();
#endif
	eif_file_close(f);
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

		"C functions used to access DLLs"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_DLL_C
#define GE_DLL_C

#endif

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif
/*
	description:

		"C functions used to implement class EXECUTION_ENVIRONMENT"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_MISC_C
#define EIF_MISC_C

#include <stdlib.h>
#ifdef WIN32
#include <windows.h>
#include <string.h>
#include <direct.h> /* for 'getcwd' */
#endif

#ifndef PATH_MAX
#define PATH_MAX 1024 /* Maximum length of full path name */
#endif

#ifdef __cplusplus
extern "C" {
#endif

EIF_INTEGER eif_system(EIF_NATIVE_CHAR* s) {
#ifdef EIF_WINDOWS
	return (EIF_INTEGER)_wsystem(s);
#else
	return (EIF_INTEGER)system(s);
#endif
}

void eif_system_asynchronous(EIF_NATIVE_CHAR* cmd) {
#ifdef EIF_WINDOWS
	STARTUPINFOW siStartInfo;
	PROCESS_INFORMATION procinfo;
	wchar_t* current_dir;
	EIF_INTEGER result;

	current_dir = (wchar_t*)_wgetcwd(NULL, PATH_MAX);
	memset(&siStartInfo, 0, sizeof siStartInfo);
	siStartInfo.cb = sizeof(STARTUPINFO);
	siStartInfo.lpTitle = NULL;
	siStartInfo.lpReserved = NULL;
	siStartInfo.lpReserved2 = NULL;
	siStartInfo.cbReserved2 = 0;
	siStartInfo.lpDesktop = NULL;
	siStartInfo.dwFlags = STARTF_FORCEONFEEDBACK;
	result = CreateProcessW(
		NULL,
		cmd,
		NULL,
		NULL,
		TRUE,
		CREATE_NEW_CONSOLE,
		NULL,
		current_dir,
		&siStartInfo,
		&procinfo);
	if (result) {
		CloseHandle(procinfo.hProcess);
		CloseHandle(procinfo.hThread);
	}
	_wchdir(current_dir);
	free(current_dir);
#else
	int status;

	switch (fork()) {
	case -1:
		return;
	case 0:
		break;
	default:
		return;
	}
	status = system(cmd);
	exit(0);
#endif
}

void eif_sleep(EIF_INTEGER_64 nanoseconds)
{
	/*
	 * Suspend thread execution for interval specified by `nanoseconds'.
	 * Use the most precise sleep function if possible.
	 */

#ifdef HAS_NANOSLEEP
	struct timespec req;
	struct timespec rem;
	req.tv_sec = nanoseconds / 1000000000;
	req.tv_nsec = nanoseconds % 1000000000;
	while ((nanosleep (&req, &rem) == -1) && (errno == EINTR)) {
			/* Function is interrupted by a signal.   */
			/* Let's call it again to complete pause. */
		req = rem;
	}
#else
#	ifdef HAS_USLEEP
#		define EIF_SLEEP_PRECISION 1000
#		define EIF_SLEEP_TYPE      unsigned long
#		define EIF_SLEEP_FUNCTION  usleep
#	elif defined EIF_WINDOWS
#		define EIF_SLEEP_PRECISION 1000000
#		define EIF_SLEEP_TYPE      DWORD
#		define EIF_SLEEP_FUNCTION  Sleep
#	else
#		define EIF_SLEEP_PRECISION 1000000000
#		define EIF_SLEEP_TYPE      unsigned int
#		define EIF_SLEEP_FUNCTION  sleep
#	endif
		/* Set total delay time */
	EIF_INTEGER_64 total_time = nanoseconds / EIF_SLEEP_PRECISION;
		/* Set maximum timeout that can be handled by one API call */
	EIF_SLEEP_TYPE timeout = ~((~ (EIF_SLEEP_TYPE) 0) << (sizeof timeout * 8 - 1));
	if ((nanoseconds % EIF_SLEEP_PRECISION) > 0) {
			/* Increase delay to handle underflow */
		total_time++;
	}
	while (total_time > 0) {
			/* Sleep for maximum timeout not exceeding time left */
		if (timeout > total_time) {
			timeout = (EIF_SLEEP_TYPE) total_time;
		}
		EIF_SLEEP_FUNCTION(timeout);
		total_time -= timeout;
	}
#  undef EIF_SLEEP_PRECISION
#  undef EIF_SLEEP_TYPE
#  undef EIF_SLEEP_FUNCTION
#endif
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
	copyright: "Copyright (c) 2006-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef EIF_DIR_C
#define EIF_DIR_C

#ifdef EIF_WINDOWS
#ifdef __cplusplus
extern "C" {
#endif
typedef struct {
	HANDLE handle;
	WIN32_FIND_DATAW last_entry;
	wchar_t	*name;
} GE_directory;
#ifdef __cplusplus
}
#endif
#include <io.h> /* for 'access' */
#include <direct.h> /* (ch|rm)dir */
#include <wchar.h>
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
#ifndef S_IFMT
#define S_IFMT 0170000
#endif
#ifndef S_ISREG
#define S_ISREG(m) (((m) & S_IFMT) == S_IFREG)
#endif
#ifndef S_ISDIR
#define S_ISDIR(m) (((m) & S_IFMT) == S_IFDIR)
#endif
#ifndef S_ISCHR
#define S_ISCHR(m) (((m) & S_IFMT) == S_IFCHR)
#endif
#ifndef S_ISBLK
#define S_ISBLK(m) (((m) & S_IFMT) == S_IFBLK)
#endif
#ifndef S_ISLNK
#define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
#endif
#ifndef S_ISFIFO
#define S_ISFIFO(m) (((m) & S_IFMT) == S_IFIFO)
#endif

/* Keep only permission mode */
#ifndef ST_MODE
#define ST_MODE 0x0fff
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

#ifdef __cplusplus
extern "C" {
#endif

#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat_buf	struct _stat64
#	else
#		define rt_stat_buf	struct _stat64i32
#	endif
#else
#	define rt_stat_buf		struct stat
#endif

#ifdef EIF_WINDOWS
#	ifdef EIF_64_BITS
#		define rt_stat		_wstat64
#		define rt_fstat		_fstat64
#	else
#		define rt_stat		_wstat64i32
#		define rt_fstat		_fstat64i32
#	endif
#	define rt_access		_waccess
#else
#	define rt_stat			stat
#	define rt_lstat			lstat
#	define rt_fstat			fstat
#	define rt_access		access
#endif

EIF_POINTER eif_dir_open(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	GE_directory* result = (GE_directory*)malloc(sizeof(GE_directory));
	result->name = dirname;
	result->handle = 0;
	return result;
#else
	return (opendir(((char*)dirname)));
#endif
}

EIF_POINTER eif_dir_next(EIF_POINTER dir) {
#ifdef EIF_WINDOWS
	BOOL r;
	size_t a_name_length;
	wchar_t * wname;
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		r = FindNextFileW(h, &(GE_dir->last_entry));
	} else {
		r = EIF_FALSE;
			/* Allocate additional space for "\\*": 2 characters + terminating zero */
		a_name_length = wcslen(GE_dir->name);
		wname = (wchar_t *)malloc((a_name_length + 3) * sizeof(wchar_t));
		if (!wname) {
			enomem();
		} else {
			wcscpy(wname, GE_dir->name);
			if (wname[a_name_length - 1] == '\\') {
				wcscat(wname, L"*");
			} else {
				wcscat(wname , L"\\*");
			}
			h = FindFirstFileW(wname, &(GE_dir->last_entry));
			free (wname);
			if (h != INVALID_HANDLE_VALUE) {
				GE_dir->handle = h;
				r = EIF_TRUE;
			}
		}
	}
	if (r) {
		return GE_dir->last_entry.cFileName;
	} else {
		return NULL;
	}
#else
	struct dirent* p = readdir((DIR*)dir);
	if (p) {
		return p->d_name;
	} else {
		return NULL;
	}
#endif
}

EIF_POINTER eif_dir_rewind(EIF_POINTER dir, EIF_FILENAME a_name) {
#ifdef EIF_WINDOWS
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
	return GE_dir;
}

void eif_dir_close(EIF_POINTER dir) {
#ifdef EIF_WINDOWS
	GE_directory* GE_dir = (GE_directory*)dir;
	HANDLE h = GE_dir->handle;

	if (h) {
		FindClose(h);
	}
	GE_dir->handle = 0;
	free(GE_dir);
#else
	closedir((DIR*)dir);
#endif
}

EIF_BOOLEAN eif_dir_exists(EIF_FILENAME dirname) {
	rt_stat_buf buf;

	return (EIF_BOOLEAN) ((!rt_stat (dirname, &buf) && S_ISDIR(buf.st_mode)) ? EIF_TRUE : EIF_FALSE);
}

EIF_BOOLEAN eif_dir_is_readable(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN) (_waccess (dirname, R_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return (EIF_BOOLEAN) ((mode & S_IRGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IROTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_executable(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN) (_waccess (dirname, F_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return (EIF_BOOLEAN) ((mode & S_IXGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IXOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_writable(EIF_FILENAME dirname) {
#ifdef EIF_WINDOWS
	return (EIF_BOOLEAN) (_waccess (dirname, W_OK) != -1);
#else
	int uid, gid;
	int euid, egid;
	int mode;
	rt_stat_buf buf;

	rt_stat(dirname, &buf);
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
#ifdef HAS_GETGROUPS
	else if (eif_group_in_list(gid))
		return (EIF_BOOLEAN) ((mode & S_IWGRP) ? EIF_TRUE : EIF_FALSE);
#endif
	else
		return ((mode & S_IWOTH) ? EIF_TRUE : EIF_FALSE);
#endif
}

EIF_BOOLEAN eif_dir_is_deletable (EIF_FILENAME name)
{
	return eif_dir_is_writable (name);
}

EIF_CHARACTER_8 eif_dir_separator(void) {
#ifdef EIF_WINDOWS
	return (EIF_CHARACTER_8)'\\';
#else
	return (EIF_CHARACTER_8)'/';
#endif
}

EIF_INTEGER eif_dir_current (EIF_FILENAME a_buffer, EIF_INTEGER a_count) {
	EIF_INTEGER l_nbytes;

#ifdef EIF_WINDOWS
	wchar_t *subpart;
	wchar_t drive[2];
	drive [0] = '.';
	drive [1] = '\0';
		/* First calculate the length of the buffer we need to hold the current working directory. */
	l_nbytes = (GetFullPathNameW (drive, 0, NULL, &subpart) + 1) * sizeof(wchar_t) ;

	if (l_nbytes == 0) {
			/* Failure: we cannot retrieve our current directory. */
		l_nbytes = -1;
	} else {
		if (a_buffer && (a_count >= l_nbytes)) {
			l_nbytes = (GetFullPathNameW (drive, l_nbytes / sizeof(wchar_t), a_buffer, &subpart) + 1) * sizeof(wchar_t);
		}
	}
	return l_nbytes;

#else
	char *cwd;
	cwd = getcwd (NULL, PATH_MAX);

	if (cwd) {
		l_nbytes = (strlen(cwd) + 1) * sizeof(char);
		if (a_buffer && (a_count >= l_nbytes)) {
			memcpy (a_buffer, cwd, l_nbytes);
		}
		free(cwd);	/* Not `eif_free', getcwd() call malloc in POSIX.1 */
	} else {
		l_nbytes = -1;
	}

	return l_nbytes;

#endif
}

EIF_INTEGER eif_chdir(EIF_FILENAME path) {
#ifdef EIF_WINDOWS
	return _wchdir (path);
#else
	return chdir (path);
#endif
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

		"C functions used to implement class COM_FAILURE"

	system: "Gobo Eiffel Compiler"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"
*/

#ifndef GE_COM_FAILURE_C
#define GE_COM_FAILURE_C
#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

#ifndef GE_COM_FAILURE_H
#include "ge_com_failure.h"
#endif
#include <winerror.h>
#include <tchar.h>

#ifdef __cplusplus
extern "C" {
#endif

EIF_INTEGER GE_ccom_hresult(EIF_POINTER an_exception_code)
{
#ifdef EIF_WINDOWS
	char *stopstring = NULL;
	long result = 0, high_bits = 0, low_bits = 0;
	char high_str [7];
	char *exception_code = (char *)(an_exception_code);

	if (exception_code != NULL) {
		strncpy (high_str, exception_code, 6);
		high_str [6] = '\0';

		high_bits = strtol (high_str, &stopstring, 16);
		low_bits = strtol (exception_code + 6, &stopstring, 16);
		result = (high_bits << 16) + low_bits;
	}
	return (EIF_INTEGER)result;
#else
	return 0;
#endif
}

EIF_INTEGER GE_ccom_hresult_code(EIF_INTEGER an_hresult)
{
#ifdef EIF_WINDOWS
	return HRESULT_CODE(an_hresult);
#else
	return 0;
#endif
}

EIF_INTEGER GE_ccom_hresult_facility(EIF_INTEGER an_hresult)
{
#ifdef EIF_WINDOWS
	return HRESULT_FACILITY(an_hresult);
#else
	return 0;
#endif
}

/*
 * Get text from error `a_code'. It is up to the caller to free
 * the returned buffer using `GE_ccom_local_free'.
 */
EIF_POINTER GE_ccom_error_text(EIF_INTEGER a_code)
{
#ifdef EIF_WINDOWS
	LPVOID result;
	FormatMessage(
		FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL,
		a_code,
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), // Default language
		(LPTSTR) &result,
		0,
		NULL
		);
	return result;
#else
	return 0;
#endif
}

/*
 * Number of characters in `ptr'.
 */
EIF_INTEGER_32 GE_ccom_strlen(EIF_POINTER ptr)
{
#ifdef EIF_WINDOWS
	return (EIF_INTEGER_32) _tcslen ((TCHAR *) ptr);
#else
	return 0;
#endif
}

/*
 * Number of bytes occupied by a TCHAR.
 */
EIF_INTEGER_32 GE_ccom_character_size()
{
#ifdef EIF_WINDOWS
	return sizeof(TCHAR);
#else
	return 0;
#endif
}

/*
 * Free `a_ptr' using LocalFree.
 */
void GE_ccom_local_free(EIF_POINTER a_ptr)
{
#ifdef EIF_WINDOWS
	LocalFree((HLOCAL) a_ptr);
#endif
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
