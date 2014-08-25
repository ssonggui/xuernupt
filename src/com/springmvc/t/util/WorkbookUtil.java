package com.springmvc.t.util;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;


import jxl.Workbook;
import jxl.read.biff.BiffException;

import com.springmvc.t.model.UserInfo;

public class WorkbookUtil {
	private static Workbook book;
	public static Workbook getWbook(MultipartFile file){
		try {
			book = Workbook.getWorkbook(file.getInputStream());
		} catch (BiffException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return book;
	}
	
	public static List<UserInfo> getUserinfo(Workbook book){
		
		List<UserInfo> list = new ArrayList<UserInfo>();
		
		for(int i=0;i<book.getNumberOfSheets();i++){
			
			for(int j=1;j<book.getSheet(i).getRows();j++){
				UserInfo ui = new UserInfo();
				ui.setName(book.getSheet(i).getCell(0, j).getContents());
				ui.setPasswd(book.getSheet(i).getCell(1, j).getContents());
				ui.setEmail(book.getSheet(i).getCell(2, j).getContents());
				ui.setIdcard(book.getSheet(i).getCell(3, j).getContents());
				ui.setTelephone(book.getSheet(i).getCell(4, j).getContents());
				list.add(ui);
				
		}}
		return list;
	}
}
