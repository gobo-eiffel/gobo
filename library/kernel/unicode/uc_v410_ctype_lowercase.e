indexing

	description:

		"Database for simple mapping to lower case"

	generator: "geuc"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_V410_CTYPE_LOWERCASE

inherit

	ANY

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end


feature -- Access

	major_version: INTEGER is
			-- Major version number of Unicode
		once
			Result := 4
		end

	minor_version: INTEGER is
			-- Minor version number of Unicode
		once
			Result := 1
		end

	update_version: INTEGER is
			-- Update version number of Unicode
		once
			Result := 0
		end

feature {NONE} -- Implementation

	lower_code_plane_0_segment_0: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,97,98,99,100,101,102,
			103,104,105,106,107,108,109,110,111,112,
			113,114,115,116,117,118,119,120,121,122,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,224,225,226,227,228,229,230,231,232,
			233,234,235,236,237,238,239,240,241,242,
			243,244,245,246,-1,248,249,250,251,252,
			253,254,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_1: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (257),
			-1,259,-1,261,-1,263,-1,265,-1,267,
			-1,269,-1,271,-1,273,-1,275,-1,277,
			-1,279,-1,281,-1,283,-1,285,-1,287,
			-1,289,-1,291,-1,293,-1,295,-1,297,
			-1,299,-1,301,-1,303,-1,105,-1,307,
			-1,309,-1,311,-1,-1,314,-1,316,-1,
			318,-1,320,-1,322,-1,324,-1,326,-1,
			328,-1,-1,331,-1,333,-1,335,-1,337,
			-1,339,-1,341,-1,343,-1,345,-1,347,
			-1,349,-1,351,-1,353,-1,355,-1,357,
			-1,359,-1,361,-1,363,-1,365,-1,367,
			-1,369,-1,371,-1,373,-1,375,-1,255,
			378,-1,380,-1,382,-1,-1,-1,595,387,
			-1,389,-1,596,392,-1,598,599,396,-1,
			-1,477,601,603,402,-1,608,611,-1,617,
			616,409,-1,-1,-1,623,626,-1,629,417,
			-1,419,-1,421,-1,640,424,-1,643,-1,
			-1,429,-1,648,432,-1,650,651,436,-1,
			438,-1,658,441,-1,-1,-1,445,-1,-1,
			-1,-1,-1,-1,-1,454,454,-1,457,457,
			-1,460,460,-1,462,-1,464,-1,466,-1,
			468,-1,470,-1,472,-1,474,-1,476,-1,
			-1,479,-1,481,-1,483,-1,485,-1,487,
			-1,489,-1,491,-1,493,-1,495,-1,-1,
			499,499,-1,501,-1,405,447,505,-1,507,
			-1,509,-1,511,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_2: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (513),
			-1,515,-1,517,-1,519,-1,521,-1,523,
			-1,525,-1,527,-1,529,-1,531,-1,533,
			-1,535,-1,537,-1,539,-1,541,-1,543,
			-1,414,-1,547,-1,549,-1,551,-1,553,
			-1,555,-1,557,-1,559,-1,561,-1,563,
			-1,-1,-1,-1,-1,-1,-1,-1,572,-1,
			410,-1,-1,-1,660,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_3: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,940,-1,941,942,943,-1,972,
			-1,973,974,-1,945,946,947,948,949,950,
			951,952,953,954,955,956,957,958,959,960,
			961,-1,963,964,965,966,967,968,969,970,
			971,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,985,-1,987,-1,989,
			-1,991,-1,993,-1,995,-1,997,-1,999,
			-1,1001,-1,1003,-1,1005,-1,1007,-1,-1,
			-1,-1,-1,952,-1,-1,1016,-1,1010,1019,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_4: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (1104),
			1105,1106,1107,1108,1109,1110,1111,1112,1113,1114,
			1115,1116,1117,1118,1119,1072,1073,1074,1075,1076,
			1077,1078,1079,1080,1081,1082,1083,1084,1085,1086,
			1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,
			1097,1098,1099,1100,1101,1102,1103,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,1121,-1,1123,-1,1125,
			-1,1127,-1,1129,-1,1131,-1,1133,-1,1135,
			-1,1137,-1,1139,-1,1141,-1,1143,-1,1145,
			-1,1147,-1,1149,-1,1151,-1,1153,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,1163,-1,1165,
			-1,1167,-1,1169,-1,1171,-1,1173,-1,1175,
			-1,1177,-1,1179,-1,1181,-1,1183,-1,1185,
			-1,1187,-1,1189,-1,1191,-1,1193,-1,1195,
			-1,1197,-1,1199,-1,1201,-1,1203,-1,1205,
			-1,1207,-1,1209,-1,1211,-1,1213,-1,1215,
			-1,-1,1218,-1,1220,-1,1222,-1,1224,-1,
			1226,-1,1228,-1,1230,-1,-1,1233,-1,1235,
			-1,1237,-1,1239,-1,1241,-1,1243,-1,1245,
			-1,1247,-1,1249,-1,1251,-1,1253,-1,1255,
			-1,1257,-1,1259,-1,1261,-1,1263,-1,1265,
			-1,1267,-1,1269,-1,1271,-1,1273,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_5: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (1281),
			-1,1283,-1,1285,-1,1287,-1,1289,-1,1291,
			-1,1293,-1,1295,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,1377,1378,
			1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,
			1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,
			1399,1400,1401,1402,1403,1404,1405,1406,1407,1408,
			1409,1410,1411,1412,1413,1414,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	empty_lower_code_segment: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_16: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,11520,
			11521,11522,11523,11524,11525,11526,11527,11528,11529,11530,
			11531,11532,11533,11534,11535,11536,11537,11538,11539,11540,
			11541,11542,11543,11544,11545,11546,11547,11548,11549,11550,
			11551,11552,11553,11554,11555,11556,11557,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_30: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (7681),
			-1,7683,-1,7685,-1,7687,-1,7689,-1,7691,
			-1,7693,-1,7695,-1,7697,-1,7699,-1,7701,
			-1,7703,-1,7705,-1,7707,-1,7709,-1,7711,
			-1,7713,-1,7715,-1,7717,-1,7719,-1,7721,
			-1,7723,-1,7725,-1,7727,-1,7729,-1,7731,
			-1,7733,-1,7735,-1,7737,-1,7739,-1,7741,
			-1,7743,-1,7745,-1,7747,-1,7749,-1,7751,
			-1,7753,-1,7755,-1,7757,-1,7759,-1,7761,
			-1,7763,-1,7765,-1,7767,-1,7769,-1,7771,
			-1,7773,-1,7775,-1,7777,-1,7779,-1,7781,
			-1,7783,-1,7785,-1,7787,-1,7789,-1,7791,
			-1,7793,-1,7795,-1,7797,-1,7799,-1,7801,
			-1,7803,-1,7805,-1,7807,-1,7809,-1,7811,
			-1,7813,-1,7815,-1,7817,-1,7819,-1,7821,
			-1,7823,-1,7825,-1,7827,-1,7829,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,7841,
			-1,7843,-1,7845,-1,7847,-1,7849,-1,7851,
			-1,7853,-1,7855,-1,7857,-1,7859,-1,7861,
			-1,7863,-1,7865,-1,7867,-1,7869,-1,7871,
			-1,7873,-1,7875,-1,7877,-1,7879,-1,7881,
			-1,7883,-1,7885,-1,7887,-1,7889,-1,7891,
			-1,7893,-1,7895,-1,7897,-1,7899,-1,7901,
			-1,7903,-1,7905,-1,7907,-1,7909,-1,7911,
			-1,7913,-1,7915,-1,7917,-1,7919,-1,7921,
			-1,7923,-1,7925,-1,7927,-1,7929,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_31: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,7936,7937,7938,
			7939,7940,7941,7942,7943,-1,-1,-1,-1,-1,
			-1,-1,-1,7952,7953,7954,7955,7956,7957,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,7968,
			7969,7970,7971,7972,7973,7974,7975,-1,-1,-1,
			-1,-1,-1,-1,-1,7984,7985,7986,7987,7988,
			7989,7990,7991,-1,-1,-1,-1,-1,-1,-1,
			-1,8000,8001,8002,8003,8004,8005,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,8017,-1,
			8019,-1,8021,-1,8023,-1,-1,-1,-1,-1,
			-1,-1,-1,8032,8033,8034,8035,8036,8037,8038,
			8039,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,8064,8065,8066,8067,8068,
			8069,8070,8071,-1,-1,-1,-1,-1,-1,-1,
			-1,8080,8081,8082,8083,8084,8085,8086,8087,-1,
			-1,-1,-1,-1,-1,-1,-1,8096,8097,8098,
			8099,8100,8101,8102,8103,-1,-1,-1,-1,-1,
			-1,-1,-1,8112,8113,8048,8049,8115,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,8050,
			8051,8052,8053,8131,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,8144,8145,8054,8055,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,8160,8161,8058,8059,8165,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,8056,8057,8060,
			8061,8179,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_33: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,969,-1,-1,
			-1,107,229,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,8560,8561,8562,8563,8564,
			8565,8566,8567,8568,8569,8570,8571,8572,8573,8574,
			8575,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_36: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,9424,9425,9426,9427,9428,9429,9430,9431,9432,
			9433,9434,9435,9436,9437,9438,9439,9440,9441,9442,
			9443,9444,9445,9446,9447,9448,9449,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_44: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (11312),
			11313,11314,11315,11316,11317,11318,11319,11320,11321,11322,
			11323,11324,11325,11326,11327,11328,11329,11330,11331,11332,
			11333,11334,11335,11336,11337,11338,11339,11340,11341,11342,
			11343,11344,11345,11346,11347,11348,11349,11350,11351,11352,
			11353,11354,11355,11356,11357,11358,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,11393,-1,11395,
			-1,11397,-1,11399,-1,11401,-1,11403,-1,11405,
			-1,11407,-1,11409,-1,11411,-1,11413,-1,11415,
			-1,11417,-1,11419,-1,11421,-1,11423,-1,11425,
			-1,11427,-1,11429,-1,11431,-1,11433,-1,11435,
			-1,11437,-1,11439,-1,11441,-1,11443,-1,11445,
			-1,11447,-1,11449,-1,11451,-1,11453,-1,11455,
			-1,11457,-1,11459,-1,11461,-1,11463,-1,11465,
			-1,11467,-1,11469,-1,11471,-1,11473,-1,11475,
			-1,11477,-1,11479,-1,11481,-1,11483,-1,11485,
			-1,11487,-1,11489,-1,11491,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0_segment_255: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (-1),
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,65345,65346,65347,65348,65349,65350,65351,65352,
			65353,65354,65355,65356,65357,65358,65359,65360,65361,65362,
			65363,65364,65365,65366,65367,65368,65369,65370,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_0: SPECIAL [ARRAY [INTEGER]] is
			-- Generated array plane
		once
			create Result.make_filled (Void, 256)
			Result.put (lower_code_plane_0_segment_0, 0)
			Result.put (lower_code_plane_0_segment_1, 1)
			Result.put (lower_code_plane_0_segment_2, 2)
			Result.put (lower_code_plane_0_segment_3, 3)
			Result.put (lower_code_plane_0_segment_4, 4)
			Result.put (lower_code_plane_0_segment_5, 5)
			Result.put (empty_lower_code_segment, 6)
			Result.put (empty_lower_code_segment, 7)
			Result.put (empty_lower_code_segment, 8)
			Result.put (empty_lower_code_segment, 9)
			Result.put (empty_lower_code_segment, 10)
			Result.put (empty_lower_code_segment, 11)
			Result.put (empty_lower_code_segment, 12)
			Result.put (empty_lower_code_segment, 13)
			Result.put (empty_lower_code_segment, 14)
			Result.put (empty_lower_code_segment, 15)
			Result.put (lower_code_plane_0_segment_16, 16)
			Result.put (empty_lower_code_segment, 17)
			Result.put (empty_lower_code_segment, 18)
			Result.put (empty_lower_code_segment, 19)
			Result.put (empty_lower_code_segment, 20)
			Result.put (empty_lower_code_segment, 21)
			Result.put (empty_lower_code_segment, 22)
			Result.put (empty_lower_code_segment, 23)
			Result.put (empty_lower_code_segment, 24)
			Result.put (empty_lower_code_segment, 25)
			Result.put (empty_lower_code_segment, 26)
			Result.put (empty_lower_code_segment, 27)
			Result.put (empty_lower_code_segment, 28)
			Result.put (empty_lower_code_segment, 29)
			Result.put (lower_code_plane_0_segment_30, 30)
			Result.put (lower_code_plane_0_segment_31, 31)
			Result.put (empty_lower_code_segment, 32)
			Result.put (lower_code_plane_0_segment_33, 33)
			Result.put (empty_lower_code_segment, 34)
			Result.put (empty_lower_code_segment, 35)
			Result.put (lower_code_plane_0_segment_36, 36)
			Result.put (empty_lower_code_segment, 37)
			Result.put (empty_lower_code_segment, 38)
			Result.put (empty_lower_code_segment, 39)
			Result.put (empty_lower_code_segment, 40)
			Result.put (empty_lower_code_segment, 41)
			Result.put (empty_lower_code_segment, 42)
			Result.put (empty_lower_code_segment, 43)
			Result.put (lower_code_plane_0_segment_44, 44)
			Result.put (empty_lower_code_segment, 45)
			Result.put (empty_lower_code_segment, 46)
			Result.put (empty_lower_code_segment, 47)
			Result.put (empty_lower_code_segment, 48)
			Result.put (empty_lower_code_segment, 49)
			Result.put (empty_lower_code_segment, 50)
			Result.put (empty_lower_code_segment, 51)
			Result.put (empty_lower_code_segment, 52)
			Result.put (empty_lower_code_segment, 53)
			Result.put (empty_lower_code_segment, 54)
			Result.put (empty_lower_code_segment, 55)
			Result.put (empty_lower_code_segment, 56)
			Result.put (empty_lower_code_segment, 57)
			Result.put (empty_lower_code_segment, 58)
			Result.put (empty_lower_code_segment, 59)
			Result.put (empty_lower_code_segment, 60)
			Result.put (empty_lower_code_segment, 61)
			Result.put (empty_lower_code_segment, 62)
			Result.put (empty_lower_code_segment, 63)
			Result.put (empty_lower_code_segment, 64)
			Result.put (empty_lower_code_segment, 65)
			Result.put (empty_lower_code_segment, 66)
			Result.put (empty_lower_code_segment, 67)
			Result.put (empty_lower_code_segment, 68)
			Result.put (empty_lower_code_segment, 69)
			Result.put (empty_lower_code_segment, 70)
			Result.put (empty_lower_code_segment, 71)
			Result.put (empty_lower_code_segment, 72)
			Result.put (empty_lower_code_segment, 73)
			Result.put (empty_lower_code_segment, 74)
			Result.put (empty_lower_code_segment, 75)
			Result.put (empty_lower_code_segment, 76)
			Result.put (empty_lower_code_segment, 77)
			Result.put (empty_lower_code_segment, 78)
			Result.put (empty_lower_code_segment, 79)
			Result.put (empty_lower_code_segment, 80)
			Result.put (empty_lower_code_segment, 81)
			Result.put (empty_lower_code_segment, 82)
			Result.put (empty_lower_code_segment, 83)
			Result.put (empty_lower_code_segment, 84)
			Result.put (empty_lower_code_segment, 85)
			Result.put (empty_lower_code_segment, 86)
			Result.put (empty_lower_code_segment, 87)
			Result.put (empty_lower_code_segment, 88)
			Result.put (empty_lower_code_segment, 89)
			Result.put (empty_lower_code_segment, 90)
			Result.put (empty_lower_code_segment, 91)
			Result.put (empty_lower_code_segment, 92)
			Result.put (empty_lower_code_segment, 93)
			Result.put (empty_lower_code_segment, 94)
			Result.put (empty_lower_code_segment, 95)
			Result.put (empty_lower_code_segment, 96)
			Result.put (empty_lower_code_segment, 97)
			Result.put (empty_lower_code_segment, 98)
			Result.put (empty_lower_code_segment, 99)
			Result.put (empty_lower_code_segment, 100)
			Result.put (empty_lower_code_segment, 101)
			Result.put (empty_lower_code_segment, 102)
			Result.put (empty_lower_code_segment, 103)
			Result.put (empty_lower_code_segment, 104)
			Result.put (empty_lower_code_segment, 105)
			Result.put (empty_lower_code_segment, 106)
			Result.put (empty_lower_code_segment, 107)
			Result.put (empty_lower_code_segment, 108)
			Result.put (empty_lower_code_segment, 109)
			Result.put (empty_lower_code_segment, 110)
			Result.put (empty_lower_code_segment, 111)
			Result.put (empty_lower_code_segment, 112)
			Result.put (empty_lower_code_segment, 113)
			Result.put (empty_lower_code_segment, 114)
			Result.put (empty_lower_code_segment, 115)
			Result.put (empty_lower_code_segment, 116)
			Result.put (empty_lower_code_segment, 117)
			Result.put (empty_lower_code_segment, 118)
			Result.put (empty_lower_code_segment, 119)
			Result.put (empty_lower_code_segment, 120)
			Result.put (empty_lower_code_segment, 121)
			Result.put (empty_lower_code_segment, 122)
			Result.put (empty_lower_code_segment, 123)
			Result.put (empty_lower_code_segment, 124)
			Result.put (empty_lower_code_segment, 125)
			Result.put (empty_lower_code_segment, 126)
			Result.put (empty_lower_code_segment, 127)
			Result.put (empty_lower_code_segment, 128)
			Result.put (empty_lower_code_segment, 129)
			Result.put (empty_lower_code_segment, 130)
			Result.put (empty_lower_code_segment, 131)
			Result.put (empty_lower_code_segment, 132)
			Result.put (empty_lower_code_segment, 133)
			Result.put (empty_lower_code_segment, 134)
			Result.put (empty_lower_code_segment, 135)
			Result.put (empty_lower_code_segment, 136)
			Result.put (empty_lower_code_segment, 137)
			Result.put (empty_lower_code_segment, 138)
			Result.put (empty_lower_code_segment, 139)
			Result.put (empty_lower_code_segment, 140)
			Result.put (empty_lower_code_segment, 141)
			Result.put (empty_lower_code_segment, 142)
			Result.put (empty_lower_code_segment, 143)
			Result.put (empty_lower_code_segment, 144)
			Result.put (empty_lower_code_segment, 145)
			Result.put (empty_lower_code_segment, 146)
			Result.put (empty_lower_code_segment, 147)
			Result.put (empty_lower_code_segment, 148)
			Result.put (empty_lower_code_segment, 149)
			Result.put (empty_lower_code_segment, 150)
			Result.put (empty_lower_code_segment, 151)
			Result.put (empty_lower_code_segment, 152)
			Result.put (empty_lower_code_segment, 153)
			Result.put (empty_lower_code_segment, 154)
			Result.put (empty_lower_code_segment, 155)
			Result.put (empty_lower_code_segment, 156)
			Result.put (empty_lower_code_segment, 157)
			Result.put (empty_lower_code_segment, 158)
			Result.put (empty_lower_code_segment, 159)
			Result.put (empty_lower_code_segment, 160)
			Result.put (empty_lower_code_segment, 161)
			Result.put (empty_lower_code_segment, 162)
			Result.put (empty_lower_code_segment, 163)
			Result.put (empty_lower_code_segment, 164)
			Result.put (empty_lower_code_segment, 165)
			Result.put (empty_lower_code_segment, 166)
			Result.put (empty_lower_code_segment, 167)
			Result.put (empty_lower_code_segment, 168)
			Result.put (empty_lower_code_segment, 169)
			Result.put (empty_lower_code_segment, 170)
			Result.put (empty_lower_code_segment, 171)
			Result.put (empty_lower_code_segment, 172)
			Result.put (empty_lower_code_segment, 173)
			Result.put (empty_lower_code_segment, 174)
			Result.put (empty_lower_code_segment, 175)
			Result.put (empty_lower_code_segment, 176)
			Result.put (empty_lower_code_segment, 177)
			Result.put (empty_lower_code_segment, 178)
			Result.put (empty_lower_code_segment, 179)
			Result.put (empty_lower_code_segment, 180)
			Result.put (empty_lower_code_segment, 181)
			Result.put (empty_lower_code_segment, 182)
			Result.put (empty_lower_code_segment, 183)
			Result.put (empty_lower_code_segment, 184)
			Result.put (empty_lower_code_segment, 185)
			Result.put (empty_lower_code_segment, 186)
			Result.put (empty_lower_code_segment, 187)
			Result.put (empty_lower_code_segment, 188)
			Result.put (empty_lower_code_segment, 189)
			Result.put (empty_lower_code_segment, 190)
			Result.put (empty_lower_code_segment, 191)
			Result.put (empty_lower_code_segment, 192)
			Result.put (empty_lower_code_segment, 193)
			Result.put (empty_lower_code_segment, 194)
			Result.put (empty_lower_code_segment, 195)
			Result.put (empty_lower_code_segment, 196)
			Result.put (empty_lower_code_segment, 197)
			Result.put (empty_lower_code_segment, 198)
			Result.put (empty_lower_code_segment, 199)
			Result.put (empty_lower_code_segment, 200)
			Result.put (empty_lower_code_segment, 201)
			Result.put (empty_lower_code_segment, 202)
			Result.put (empty_lower_code_segment, 203)
			Result.put (empty_lower_code_segment, 204)
			Result.put (empty_lower_code_segment, 205)
			Result.put (empty_lower_code_segment, 206)
			Result.put (empty_lower_code_segment, 207)
			Result.put (empty_lower_code_segment, 208)
			Result.put (empty_lower_code_segment, 209)
			Result.put (empty_lower_code_segment, 210)
			Result.put (empty_lower_code_segment, 211)
			Result.put (empty_lower_code_segment, 212)
			Result.put (empty_lower_code_segment, 213)
			Result.put (empty_lower_code_segment, 214)
			Result.put (empty_lower_code_segment, 215)
			Result.put (empty_lower_code_segment, 216)
			Result.put (empty_lower_code_segment, 217)
			Result.put (empty_lower_code_segment, 218)
			Result.put (empty_lower_code_segment, 219)
			Result.put (empty_lower_code_segment, 220)
			Result.put (empty_lower_code_segment, 221)
			Result.put (empty_lower_code_segment, 222)
			Result.put (empty_lower_code_segment, 223)
			Result.put (empty_lower_code_segment, 224)
			Result.put (empty_lower_code_segment, 225)
			Result.put (empty_lower_code_segment, 226)
			Result.put (empty_lower_code_segment, 227)
			Result.put (empty_lower_code_segment, 228)
			Result.put (empty_lower_code_segment, 229)
			Result.put (empty_lower_code_segment, 230)
			Result.put (empty_lower_code_segment, 231)
			Result.put (empty_lower_code_segment, 232)
			Result.put (empty_lower_code_segment, 233)
			Result.put (empty_lower_code_segment, 234)
			Result.put (empty_lower_code_segment, 235)
			Result.put (empty_lower_code_segment, 236)
			Result.put (empty_lower_code_segment, 237)
			Result.put (empty_lower_code_segment, 238)
			Result.put (empty_lower_code_segment, 239)
			Result.put (empty_lower_code_segment, 240)
			Result.put (empty_lower_code_segment, 241)
			Result.put (empty_lower_code_segment, 242)
			Result.put (empty_lower_code_segment, 243)
			Result.put (empty_lower_code_segment, 244)
			Result.put (empty_lower_code_segment, 245)
			Result.put (empty_lower_code_segment, 246)
			Result.put (empty_lower_code_segment, 247)
			Result.put (empty_lower_code_segment, 248)
			Result.put (empty_lower_code_segment, 249)
			Result.put (empty_lower_code_segment, 250)
			Result.put (empty_lower_code_segment, 251)
			Result.put (empty_lower_code_segment, 252)
			Result.put (empty_lower_code_segment, 253)
			Result.put (empty_lower_code_segment, 254)
			Result.put (lower_code_plane_0_segment_255, 255)
		ensure
			result_not_void: Result /= Void
			sub_arrays_not_void: True --not Result.has (Void)
		end

	lower_code_plane_1_segment_4: ARRAY [INTEGER] is
			-- Generated array segment
		once
			Result := <<
			INTEGER_.to_integer (66600),
			66601,66602,66603,66604,66605,66606,66607,66608,66609,66610,
			66611,66612,66613,66614,66615,66616,66617,66618,66619,66620,
			66621,66622,66623,66624,66625,66626,66627,66628,66629,66630,
			66631,66632,66633,66634,66635,66636,66637,66638,66639,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
			-1,-1,-1,-1,-1>>
		ensure
			result_not_void: Result /= Void
		end

	lower_code_plane_1: SPECIAL [ARRAY [INTEGER]] is
			-- Generated array plane
		once
			create Result.make_filled (Void, 256)
			Result.put (empty_lower_code_segment, 0)
			Result.put (empty_lower_code_segment, 1)
			Result.put (empty_lower_code_segment, 2)
			Result.put (empty_lower_code_segment, 3)
			Result.put (lower_code_plane_1_segment_4, 4)
			Result.put (empty_lower_code_segment, 5)
			Result.put (empty_lower_code_segment, 6)
			Result.put (empty_lower_code_segment, 7)
			Result.put (empty_lower_code_segment, 8)
			Result.put (empty_lower_code_segment, 9)
			Result.put (empty_lower_code_segment, 10)
			Result.put (empty_lower_code_segment, 11)
			Result.put (empty_lower_code_segment, 12)
			Result.put (empty_lower_code_segment, 13)
			Result.put (empty_lower_code_segment, 14)
			Result.put (empty_lower_code_segment, 15)
			Result.put (empty_lower_code_segment, 16)
			Result.put (empty_lower_code_segment, 17)
			Result.put (empty_lower_code_segment, 18)
			Result.put (empty_lower_code_segment, 19)
			Result.put (empty_lower_code_segment, 20)
			Result.put (empty_lower_code_segment, 21)
			Result.put (empty_lower_code_segment, 22)
			Result.put (empty_lower_code_segment, 23)
			Result.put (empty_lower_code_segment, 24)
			Result.put (empty_lower_code_segment, 25)
			Result.put (empty_lower_code_segment, 26)
			Result.put (empty_lower_code_segment, 27)
			Result.put (empty_lower_code_segment, 28)
			Result.put (empty_lower_code_segment, 29)
			Result.put (empty_lower_code_segment, 30)
			Result.put (empty_lower_code_segment, 31)
			Result.put (empty_lower_code_segment, 32)
			Result.put (empty_lower_code_segment, 33)
			Result.put (empty_lower_code_segment, 34)
			Result.put (empty_lower_code_segment, 35)
			Result.put (empty_lower_code_segment, 36)
			Result.put (empty_lower_code_segment, 37)
			Result.put (empty_lower_code_segment, 38)
			Result.put (empty_lower_code_segment, 39)
			Result.put (empty_lower_code_segment, 40)
			Result.put (empty_lower_code_segment, 41)
			Result.put (empty_lower_code_segment, 42)
			Result.put (empty_lower_code_segment, 43)
			Result.put (empty_lower_code_segment, 44)
			Result.put (empty_lower_code_segment, 45)
			Result.put (empty_lower_code_segment, 46)
			Result.put (empty_lower_code_segment, 47)
			Result.put (empty_lower_code_segment, 48)
			Result.put (empty_lower_code_segment, 49)
			Result.put (empty_lower_code_segment, 50)
			Result.put (empty_lower_code_segment, 51)
			Result.put (empty_lower_code_segment, 52)
			Result.put (empty_lower_code_segment, 53)
			Result.put (empty_lower_code_segment, 54)
			Result.put (empty_lower_code_segment, 55)
			Result.put (empty_lower_code_segment, 56)
			Result.put (empty_lower_code_segment, 57)
			Result.put (empty_lower_code_segment, 58)
			Result.put (empty_lower_code_segment, 59)
			Result.put (empty_lower_code_segment, 60)
			Result.put (empty_lower_code_segment, 61)
			Result.put (empty_lower_code_segment, 62)
			Result.put (empty_lower_code_segment, 63)
			Result.put (empty_lower_code_segment, 64)
			Result.put (empty_lower_code_segment, 65)
			Result.put (empty_lower_code_segment, 66)
			Result.put (empty_lower_code_segment, 67)
			Result.put (empty_lower_code_segment, 68)
			Result.put (empty_lower_code_segment, 69)
			Result.put (empty_lower_code_segment, 70)
			Result.put (empty_lower_code_segment, 71)
			Result.put (empty_lower_code_segment, 72)
			Result.put (empty_lower_code_segment, 73)
			Result.put (empty_lower_code_segment, 74)
			Result.put (empty_lower_code_segment, 75)
			Result.put (empty_lower_code_segment, 76)
			Result.put (empty_lower_code_segment, 77)
			Result.put (empty_lower_code_segment, 78)
			Result.put (empty_lower_code_segment, 79)
			Result.put (empty_lower_code_segment, 80)
			Result.put (empty_lower_code_segment, 81)
			Result.put (empty_lower_code_segment, 82)
			Result.put (empty_lower_code_segment, 83)
			Result.put (empty_lower_code_segment, 84)
			Result.put (empty_lower_code_segment, 85)
			Result.put (empty_lower_code_segment, 86)
			Result.put (empty_lower_code_segment, 87)
			Result.put (empty_lower_code_segment, 88)
			Result.put (empty_lower_code_segment, 89)
			Result.put (empty_lower_code_segment, 90)
			Result.put (empty_lower_code_segment, 91)
			Result.put (empty_lower_code_segment, 92)
			Result.put (empty_lower_code_segment, 93)
			Result.put (empty_lower_code_segment, 94)
			Result.put (empty_lower_code_segment, 95)
			Result.put (empty_lower_code_segment, 96)
			Result.put (empty_lower_code_segment, 97)
			Result.put (empty_lower_code_segment, 98)
			Result.put (empty_lower_code_segment, 99)
			Result.put (empty_lower_code_segment, 100)
			Result.put (empty_lower_code_segment, 101)
			Result.put (empty_lower_code_segment, 102)
			Result.put (empty_lower_code_segment, 103)
			Result.put (empty_lower_code_segment, 104)
			Result.put (empty_lower_code_segment, 105)
			Result.put (empty_lower_code_segment, 106)
			Result.put (empty_lower_code_segment, 107)
			Result.put (empty_lower_code_segment, 108)
			Result.put (empty_lower_code_segment, 109)
			Result.put (empty_lower_code_segment, 110)
			Result.put (empty_lower_code_segment, 111)
			Result.put (empty_lower_code_segment, 112)
			Result.put (empty_lower_code_segment, 113)
			Result.put (empty_lower_code_segment, 114)
			Result.put (empty_lower_code_segment, 115)
			Result.put (empty_lower_code_segment, 116)
			Result.put (empty_lower_code_segment, 117)
			Result.put (empty_lower_code_segment, 118)
			Result.put (empty_lower_code_segment, 119)
			Result.put (empty_lower_code_segment, 120)
			Result.put (empty_lower_code_segment, 121)
			Result.put (empty_lower_code_segment, 122)
			Result.put (empty_lower_code_segment, 123)
			Result.put (empty_lower_code_segment, 124)
			Result.put (empty_lower_code_segment, 125)
			Result.put (empty_lower_code_segment, 126)
			Result.put (empty_lower_code_segment, 127)
			Result.put (empty_lower_code_segment, 128)
			Result.put (empty_lower_code_segment, 129)
			Result.put (empty_lower_code_segment, 130)
			Result.put (empty_lower_code_segment, 131)
			Result.put (empty_lower_code_segment, 132)
			Result.put (empty_lower_code_segment, 133)
			Result.put (empty_lower_code_segment, 134)
			Result.put (empty_lower_code_segment, 135)
			Result.put (empty_lower_code_segment, 136)
			Result.put (empty_lower_code_segment, 137)
			Result.put (empty_lower_code_segment, 138)
			Result.put (empty_lower_code_segment, 139)
			Result.put (empty_lower_code_segment, 140)
			Result.put (empty_lower_code_segment, 141)
			Result.put (empty_lower_code_segment, 142)
			Result.put (empty_lower_code_segment, 143)
			Result.put (empty_lower_code_segment, 144)
			Result.put (empty_lower_code_segment, 145)
			Result.put (empty_lower_code_segment, 146)
			Result.put (empty_lower_code_segment, 147)
			Result.put (empty_lower_code_segment, 148)
			Result.put (empty_lower_code_segment, 149)
			Result.put (empty_lower_code_segment, 150)
			Result.put (empty_lower_code_segment, 151)
			Result.put (empty_lower_code_segment, 152)
			Result.put (empty_lower_code_segment, 153)
			Result.put (empty_lower_code_segment, 154)
			Result.put (empty_lower_code_segment, 155)
			Result.put (empty_lower_code_segment, 156)
			Result.put (empty_lower_code_segment, 157)
			Result.put (empty_lower_code_segment, 158)
			Result.put (empty_lower_code_segment, 159)
			Result.put (empty_lower_code_segment, 160)
			Result.put (empty_lower_code_segment, 161)
			Result.put (empty_lower_code_segment, 162)
			Result.put (empty_lower_code_segment, 163)
			Result.put (empty_lower_code_segment, 164)
			Result.put (empty_lower_code_segment, 165)
			Result.put (empty_lower_code_segment, 166)
			Result.put (empty_lower_code_segment, 167)
			Result.put (empty_lower_code_segment, 168)
			Result.put (empty_lower_code_segment, 169)
			Result.put (empty_lower_code_segment, 170)
			Result.put (empty_lower_code_segment, 171)
			Result.put (empty_lower_code_segment, 172)
			Result.put (empty_lower_code_segment, 173)
			Result.put (empty_lower_code_segment, 174)
			Result.put (empty_lower_code_segment, 175)
			Result.put (empty_lower_code_segment, 176)
			Result.put (empty_lower_code_segment, 177)
			Result.put (empty_lower_code_segment, 178)
			Result.put (empty_lower_code_segment, 179)
			Result.put (empty_lower_code_segment, 180)
			Result.put (empty_lower_code_segment, 181)
			Result.put (empty_lower_code_segment, 182)
			Result.put (empty_lower_code_segment, 183)
			Result.put (empty_lower_code_segment, 184)
			Result.put (empty_lower_code_segment, 185)
			Result.put (empty_lower_code_segment, 186)
			Result.put (empty_lower_code_segment, 187)
			Result.put (empty_lower_code_segment, 188)
			Result.put (empty_lower_code_segment, 189)
			Result.put (empty_lower_code_segment, 190)
			Result.put (empty_lower_code_segment, 191)
			Result.put (empty_lower_code_segment, 192)
			Result.put (empty_lower_code_segment, 193)
			Result.put (empty_lower_code_segment, 194)
			Result.put (empty_lower_code_segment, 195)
			Result.put (empty_lower_code_segment, 196)
			Result.put (empty_lower_code_segment, 197)
			Result.put (empty_lower_code_segment, 198)
			Result.put (empty_lower_code_segment, 199)
			Result.put (empty_lower_code_segment, 200)
			Result.put (empty_lower_code_segment, 201)
			Result.put (empty_lower_code_segment, 202)
			Result.put (empty_lower_code_segment, 203)
			Result.put (empty_lower_code_segment, 204)
			Result.put (empty_lower_code_segment, 205)
			Result.put (empty_lower_code_segment, 206)
			Result.put (empty_lower_code_segment, 207)
			Result.put (empty_lower_code_segment, 208)
			Result.put (empty_lower_code_segment, 209)
			Result.put (empty_lower_code_segment, 210)
			Result.put (empty_lower_code_segment, 211)
			Result.put (empty_lower_code_segment, 212)
			Result.put (empty_lower_code_segment, 213)
			Result.put (empty_lower_code_segment, 214)
			Result.put (empty_lower_code_segment, 215)
			Result.put (empty_lower_code_segment, 216)
			Result.put (empty_lower_code_segment, 217)
			Result.put (empty_lower_code_segment, 218)
			Result.put (empty_lower_code_segment, 219)
			Result.put (empty_lower_code_segment, 220)
			Result.put (empty_lower_code_segment, 221)
			Result.put (empty_lower_code_segment, 222)
			Result.put (empty_lower_code_segment, 223)
			Result.put (empty_lower_code_segment, 224)
			Result.put (empty_lower_code_segment, 225)
			Result.put (empty_lower_code_segment, 226)
			Result.put (empty_lower_code_segment, 227)
			Result.put (empty_lower_code_segment, 228)
			Result.put (empty_lower_code_segment, 229)
			Result.put (empty_lower_code_segment, 230)
			Result.put (empty_lower_code_segment, 231)
			Result.put (empty_lower_code_segment, 232)
			Result.put (empty_lower_code_segment, 233)
			Result.put (empty_lower_code_segment, 234)
			Result.put (empty_lower_code_segment, 235)
			Result.put (empty_lower_code_segment, 236)
			Result.put (empty_lower_code_segment, 237)
			Result.put (empty_lower_code_segment, 238)
			Result.put (empty_lower_code_segment, 239)
			Result.put (empty_lower_code_segment, 240)
			Result.put (empty_lower_code_segment, 241)
			Result.put (empty_lower_code_segment, 242)
			Result.put (empty_lower_code_segment, 243)
			Result.put (empty_lower_code_segment, 244)
			Result.put (empty_lower_code_segment, 245)
			Result.put (empty_lower_code_segment, 246)
			Result.put (empty_lower_code_segment, 247)
			Result.put (empty_lower_code_segment, 248)
			Result.put (empty_lower_code_segment, 249)
			Result.put (empty_lower_code_segment, 250)
			Result.put (empty_lower_code_segment, 251)
			Result.put (empty_lower_code_segment, 252)
			Result.put (empty_lower_code_segment, 253)
			Result.put (empty_lower_code_segment, 254)
			Result.put (empty_lower_code_segment, 255)
		ensure
			result_not_void: Result /= Void
			sub_arrays_not_void: True --not Result.has (Void)
		end

	empty_lower_code_plane: SPECIAL [ARRAY [INTEGER]] is
			-- Generated array plane
		once
			create Result.make_filled (Void, 256)
			Result.put (empty_lower_code_segment, 0)
			Result.put (empty_lower_code_segment, 1)
			Result.put (empty_lower_code_segment, 2)
			Result.put (empty_lower_code_segment, 3)
			Result.put (empty_lower_code_segment, 4)
			Result.put (empty_lower_code_segment, 5)
			Result.put (empty_lower_code_segment, 6)
			Result.put (empty_lower_code_segment, 7)
			Result.put (empty_lower_code_segment, 8)
			Result.put (empty_lower_code_segment, 9)
			Result.put (empty_lower_code_segment, 10)
			Result.put (empty_lower_code_segment, 11)
			Result.put (empty_lower_code_segment, 12)
			Result.put (empty_lower_code_segment, 13)
			Result.put (empty_lower_code_segment, 14)
			Result.put (empty_lower_code_segment, 15)
			Result.put (empty_lower_code_segment, 16)
			Result.put (empty_lower_code_segment, 17)
			Result.put (empty_lower_code_segment, 18)
			Result.put (empty_lower_code_segment, 19)
			Result.put (empty_lower_code_segment, 20)
			Result.put (empty_lower_code_segment, 21)
			Result.put (empty_lower_code_segment, 22)
			Result.put (empty_lower_code_segment, 23)
			Result.put (empty_lower_code_segment, 24)
			Result.put (empty_lower_code_segment, 25)
			Result.put (empty_lower_code_segment, 26)
			Result.put (empty_lower_code_segment, 27)
			Result.put (empty_lower_code_segment, 28)
			Result.put (empty_lower_code_segment, 29)
			Result.put (empty_lower_code_segment, 30)
			Result.put (empty_lower_code_segment, 31)
			Result.put (empty_lower_code_segment, 32)
			Result.put (empty_lower_code_segment, 33)
			Result.put (empty_lower_code_segment, 34)
			Result.put (empty_lower_code_segment, 35)
			Result.put (empty_lower_code_segment, 36)
			Result.put (empty_lower_code_segment, 37)
			Result.put (empty_lower_code_segment, 38)
			Result.put (empty_lower_code_segment, 39)
			Result.put (empty_lower_code_segment, 40)
			Result.put (empty_lower_code_segment, 41)
			Result.put (empty_lower_code_segment, 42)
			Result.put (empty_lower_code_segment, 43)
			Result.put (empty_lower_code_segment, 44)
			Result.put (empty_lower_code_segment, 45)
			Result.put (empty_lower_code_segment, 46)
			Result.put (empty_lower_code_segment, 47)
			Result.put (empty_lower_code_segment, 48)
			Result.put (empty_lower_code_segment, 49)
			Result.put (empty_lower_code_segment, 50)
			Result.put (empty_lower_code_segment, 51)
			Result.put (empty_lower_code_segment, 52)
			Result.put (empty_lower_code_segment, 53)
			Result.put (empty_lower_code_segment, 54)
			Result.put (empty_lower_code_segment, 55)
			Result.put (empty_lower_code_segment, 56)
			Result.put (empty_lower_code_segment, 57)
			Result.put (empty_lower_code_segment, 58)
			Result.put (empty_lower_code_segment, 59)
			Result.put (empty_lower_code_segment, 60)
			Result.put (empty_lower_code_segment, 61)
			Result.put (empty_lower_code_segment, 62)
			Result.put (empty_lower_code_segment, 63)
			Result.put (empty_lower_code_segment, 64)
			Result.put (empty_lower_code_segment, 65)
			Result.put (empty_lower_code_segment, 66)
			Result.put (empty_lower_code_segment, 67)
			Result.put (empty_lower_code_segment, 68)
			Result.put (empty_lower_code_segment, 69)
			Result.put (empty_lower_code_segment, 70)
			Result.put (empty_lower_code_segment, 71)
			Result.put (empty_lower_code_segment, 72)
			Result.put (empty_lower_code_segment, 73)
			Result.put (empty_lower_code_segment, 74)
			Result.put (empty_lower_code_segment, 75)
			Result.put (empty_lower_code_segment, 76)
			Result.put (empty_lower_code_segment, 77)
			Result.put (empty_lower_code_segment, 78)
			Result.put (empty_lower_code_segment, 79)
			Result.put (empty_lower_code_segment, 80)
			Result.put (empty_lower_code_segment, 81)
			Result.put (empty_lower_code_segment, 82)
			Result.put (empty_lower_code_segment, 83)
			Result.put (empty_lower_code_segment, 84)
			Result.put (empty_lower_code_segment, 85)
			Result.put (empty_lower_code_segment, 86)
			Result.put (empty_lower_code_segment, 87)
			Result.put (empty_lower_code_segment, 88)
			Result.put (empty_lower_code_segment, 89)
			Result.put (empty_lower_code_segment, 90)
			Result.put (empty_lower_code_segment, 91)
			Result.put (empty_lower_code_segment, 92)
			Result.put (empty_lower_code_segment, 93)
			Result.put (empty_lower_code_segment, 94)
			Result.put (empty_lower_code_segment, 95)
			Result.put (empty_lower_code_segment, 96)
			Result.put (empty_lower_code_segment, 97)
			Result.put (empty_lower_code_segment, 98)
			Result.put (empty_lower_code_segment, 99)
			Result.put (empty_lower_code_segment, 100)
			Result.put (empty_lower_code_segment, 101)
			Result.put (empty_lower_code_segment, 102)
			Result.put (empty_lower_code_segment, 103)
			Result.put (empty_lower_code_segment, 104)
			Result.put (empty_lower_code_segment, 105)
			Result.put (empty_lower_code_segment, 106)
			Result.put (empty_lower_code_segment, 107)
			Result.put (empty_lower_code_segment, 108)
			Result.put (empty_lower_code_segment, 109)
			Result.put (empty_lower_code_segment, 110)
			Result.put (empty_lower_code_segment, 111)
			Result.put (empty_lower_code_segment, 112)
			Result.put (empty_lower_code_segment, 113)
			Result.put (empty_lower_code_segment, 114)
			Result.put (empty_lower_code_segment, 115)
			Result.put (empty_lower_code_segment, 116)
			Result.put (empty_lower_code_segment, 117)
			Result.put (empty_lower_code_segment, 118)
			Result.put (empty_lower_code_segment, 119)
			Result.put (empty_lower_code_segment, 120)
			Result.put (empty_lower_code_segment, 121)
			Result.put (empty_lower_code_segment, 122)
			Result.put (empty_lower_code_segment, 123)
			Result.put (empty_lower_code_segment, 124)
			Result.put (empty_lower_code_segment, 125)
			Result.put (empty_lower_code_segment, 126)
			Result.put (empty_lower_code_segment, 127)
			Result.put (empty_lower_code_segment, 128)
			Result.put (empty_lower_code_segment, 129)
			Result.put (empty_lower_code_segment, 130)
			Result.put (empty_lower_code_segment, 131)
			Result.put (empty_lower_code_segment, 132)
			Result.put (empty_lower_code_segment, 133)
			Result.put (empty_lower_code_segment, 134)
			Result.put (empty_lower_code_segment, 135)
			Result.put (empty_lower_code_segment, 136)
			Result.put (empty_lower_code_segment, 137)
			Result.put (empty_lower_code_segment, 138)
			Result.put (empty_lower_code_segment, 139)
			Result.put (empty_lower_code_segment, 140)
			Result.put (empty_lower_code_segment, 141)
			Result.put (empty_lower_code_segment, 142)
			Result.put (empty_lower_code_segment, 143)
			Result.put (empty_lower_code_segment, 144)
			Result.put (empty_lower_code_segment, 145)
			Result.put (empty_lower_code_segment, 146)
			Result.put (empty_lower_code_segment, 147)
			Result.put (empty_lower_code_segment, 148)
			Result.put (empty_lower_code_segment, 149)
			Result.put (empty_lower_code_segment, 150)
			Result.put (empty_lower_code_segment, 151)
			Result.put (empty_lower_code_segment, 152)
			Result.put (empty_lower_code_segment, 153)
			Result.put (empty_lower_code_segment, 154)
			Result.put (empty_lower_code_segment, 155)
			Result.put (empty_lower_code_segment, 156)
			Result.put (empty_lower_code_segment, 157)
			Result.put (empty_lower_code_segment, 158)
			Result.put (empty_lower_code_segment, 159)
			Result.put (empty_lower_code_segment, 160)
			Result.put (empty_lower_code_segment, 161)
			Result.put (empty_lower_code_segment, 162)
			Result.put (empty_lower_code_segment, 163)
			Result.put (empty_lower_code_segment, 164)
			Result.put (empty_lower_code_segment, 165)
			Result.put (empty_lower_code_segment, 166)
			Result.put (empty_lower_code_segment, 167)
			Result.put (empty_lower_code_segment, 168)
			Result.put (empty_lower_code_segment, 169)
			Result.put (empty_lower_code_segment, 170)
			Result.put (empty_lower_code_segment, 171)
			Result.put (empty_lower_code_segment, 172)
			Result.put (empty_lower_code_segment, 173)
			Result.put (empty_lower_code_segment, 174)
			Result.put (empty_lower_code_segment, 175)
			Result.put (empty_lower_code_segment, 176)
			Result.put (empty_lower_code_segment, 177)
			Result.put (empty_lower_code_segment, 178)
			Result.put (empty_lower_code_segment, 179)
			Result.put (empty_lower_code_segment, 180)
			Result.put (empty_lower_code_segment, 181)
			Result.put (empty_lower_code_segment, 182)
			Result.put (empty_lower_code_segment, 183)
			Result.put (empty_lower_code_segment, 184)
			Result.put (empty_lower_code_segment, 185)
			Result.put (empty_lower_code_segment, 186)
			Result.put (empty_lower_code_segment, 187)
			Result.put (empty_lower_code_segment, 188)
			Result.put (empty_lower_code_segment, 189)
			Result.put (empty_lower_code_segment, 190)
			Result.put (empty_lower_code_segment, 191)
			Result.put (empty_lower_code_segment, 192)
			Result.put (empty_lower_code_segment, 193)
			Result.put (empty_lower_code_segment, 194)
			Result.put (empty_lower_code_segment, 195)
			Result.put (empty_lower_code_segment, 196)
			Result.put (empty_lower_code_segment, 197)
			Result.put (empty_lower_code_segment, 198)
			Result.put (empty_lower_code_segment, 199)
			Result.put (empty_lower_code_segment, 200)
			Result.put (empty_lower_code_segment, 201)
			Result.put (empty_lower_code_segment, 202)
			Result.put (empty_lower_code_segment, 203)
			Result.put (empty_lower_code_segment, 204)
			Result.put (empty_lower_code_segment, 205)
			Result.put (empty_lower_code_segment, 206)
			Result.put (empty_lower_code_segment, 207)
			Result.put (empty_lower_code_segment, 208)
			Result.put (empty_lower_code_segment, 209)
			Result.put (empty_lower_code_segment, 210)
			Result.put (empty_lower_code_segment, 211)
			Result.put (empty_lower_code_segment, 212)
			Result.put (empty_lower_code_segment, 213)
			Result.put (empty_lower_code_segment, 214)
			Result.put (empty_lower_code_segment, 215)
			Result.put (empty_lower_code_segment, 216)
			Result.put (empty_lower_code_segment, 217)
			Result.put (empty_lower_code_segment, 218)
			Result.put (empty_lower_code_segment, 219)
			Result.put (empty_lower_code_segment, 220)
			Result.put (empty_lower_code_segment, 221)
			Result.put (empty_lower_code_segment, 222)
			Result.put (empty_lower_code_segment, 223)
			Result.put (empty_lower_code_segment, 224)
			Result.put (empty_lower_code_segment, 225)
			Result.put (empty_lower_code_segment, 226)
			Result.put (empty_lower_code_segment, 227)
			Result.put (empty_lower_code_segment, 228)
			Result.put (empty_lower_code_segment, 229)
			Result.put (empty_lower_code_segment, 230)
			Result.put (empty_lower_code_segment, 231)
			Result.put (empty_lower_code_segment, 232)
			Result.put (empty_lower_code_segment, 233)
			Result.put (empty_lower_code_segment, 234)
			Result.put (empty_lower_code_segment, 235)
			Result.put (empty_lower_code_segment, 236)
			Result.put (empty_lower_code_segment, 237)
			Result.put (empty_lower_code_segment, 238)
			Result.put (empty_lower_code_segment, 239)
			Result.put (empty_lower_code_segment, 240)
			Result.put (empty_lower_code_segment, 241)
			Result.put (empty_lower_code_segment, 242)
			Result.put (empty_lower_code_segment, 243)
			Result.put (empty_lower_code_segment, 244)
			Result.put (empty_lower_code_segment, 245)
			Result.put (empty_lower_code_segment, 246)
			Result.put (empty_lower_code_segment, 247)
			Result.put (empty_lower_code_segment, 248)
			Result.put (empty_lower_code_segment, 249)
			Result.put (empty_lower_code_segment, 250)
			Result.put (empty_lower_code_segment, 251)
			Result.put (empty_lower_code_segment, 252)
			Result.put (empty_lower_code_segment, 253)
			Result.put (empty_lower_code_segment, 254)
			Result.put (empty_lower_code_segment, 255)
		ensure
			result_not_void: Result /= Void
			sub_arrays_not_void: True --not Result.has (Void)
		end

	lower_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]] is
			-- Lower case code points for each code point
		once
			create Result.make_filled (Void, 17)
			Result.put (lower_code_plane_0, 0)
			Result.put (lower_code_plane_1, 1)
			Result.put (empty_lower_code_plane, 2)
			Result.put (empty_lower_code_plane, 3)
			Result.put (empty_lower_code_plane, 4)
			Result.put (empty_lower_code_plane, 5)
			Result.put (empty_lower_code_plane, 6)
			Result.put (empty_lower_code_plane, 7)
			Result.put (empty_lower_code_plane, 8)
			Result.put (empty_lower_code_plane, 9)
			Result.put (empty_lower_code_plane, 10)
			Result.put (empty_lower_code_plane, 11)
			Result.put (empty_lower_code_plane, 12)
			Result.put (empty_lower_code_plane, 13)
			Result.put (empty_lower_code_plane, 14)
			Result.put (empty_lower_code_plane, 15)
			Result.put (empty_lower_code_plane, 16)
		end

end
