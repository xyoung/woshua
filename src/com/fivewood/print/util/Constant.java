package com.fivewood.print.util;

import java.util.HashMap;
import java.util.Map;

public class Constant {
	
	public static  Map<Integer, String> TYPEMAP;
	static {
		TYPEMAP = new HashMap<Integer, String>();
		TYPEMAP.put(0, "普通");
		TYPEMAP.put(1, "加急");
	}
	
	public static Map<Integer, String> STATEMAP;
	static {
		STATEMAP = new HashMap<Integer, String>();
		STATEMAP.put(0, "待审核");
		STATEMAP.put(1, "已审核");
		STATEMAP.put(2, "生产");
		STATEMAP.put(3, "配送");
		STATEMAP.put(4, "完成");
	}

}
