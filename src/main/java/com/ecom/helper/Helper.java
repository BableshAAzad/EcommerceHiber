package com.ecom.helper;

public class Helper {
	public static String get10Words(String desc) {
		String[] str = desc.split(" ");
		if (str.length > 10) {
			String temp = "";
			for (int i = 0; i < 10; i++) {
				temp = temp +" "+ str[i];
			}
			return (temp + "...");
		} else {
			return (desc + "...");
		}
	}
}
