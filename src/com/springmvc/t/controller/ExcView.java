package com.springmvc.t.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.springframework.web.servlet.view.document.AbstractJExcelView;



public class ExcView extends AbstractJExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> m,
			WritableWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		WritableSheet sheet = workbook.createSheet("ʾ��", 0);
		sheet.addCell(new Label(0,0,"�˻�"));
		sheet.addCell(new Label(1,0,"����"));
		sheet.addCell(new Label(2,0,"����"));
		sheet.addCell(new Label(3,0,"���֤"));
		sheet.addCell(new Label(4,0,"�ֻ��ţ��ɲ��"));
		
		sheet.addCell(new Label(0,1,"wangyi"));
		sheet.addCell(new Label(1,1,"123456"));
		sheet.addCell(new Label(2,1,"123456789@qq.com"));
		sheet.addCell(new Label(3,1,"412721198803025471"));
		sheet.addCell(new Label(4,1,"15050527863"));
		
		sheet.addCell(new Label(0,2,"wanger"));
		sheet.addCell(new Label(1,2,"123123"));
		sheet.addCell(new Label(2,2,"987654321@qq.com"));
		sheet.addCell(new Label(3,2,"412721198803025472"));
		sheet.addCell(new Label(4,2,""));
		
	}


}
