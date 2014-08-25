package com.springmvc.t.util;

import java.util.regex.Pattern;

import jxl.Cell;
import jxl.Workbook;

import org.springframework.web.multipart.MultipartFile;

public class ExlMsgUtil {
	public static String exlerrormsg;
	public static String success="成功导入！";
	public static boolean valid = true;
	public static int line = 0;
	
	public static boolean isExist(MultipartFile file){
		return null==file;
	}
	
	public static boolean isEmpty(MultipartFile file){
		return file.isEmpty();
	}
	
	public static boolean isType(MultipartFile file){
		String name = file.getOriginalFilename();
		String type = name.substring(name.indexOf(".")+1);
		return "xls".equals(type) && "xls".equals(FileTools.getFileByFile(file));
	}
	
	public static boolean hasContent(Workbook book){
		if(book.getSheet(0).getRows()>1)
			return true;
		else
			return false;
	}
	
	public static boolean hasSameName(Workbook book){
		Cell cells[] = book.getSheet(0).getColumn(0);
		int len = cells.length;
		String src[] = new String[len-1];
		for(int i=1;i<len;i++)
			src[i-1] = cells[i].getContents();
		for(int i=0;i<len-1;i++){
			for(int j=i+1;j<len-1;j++){
				if(src[j].equals(src[i])){
					line = j+1;
					return true;
				}
			}
		}
		return false;
			
	}
	
	public static boolean hasSamecell(Cell[] c){
		int len = c.length;
		String cellcontent[] = new String[len];
		for(int i=0;i<len;i++){
			cellcontent[i] = c[i].getContents();
		}
		for(int i=0;i<len;i++){
			for(int j=i+1;j<len;j++){
				if(cellcontent[j].equals(cellcontent[i]))
					return true;
			}
		}
		return false;
	}
	
	public static boolean cellIsEmpty(Cell c){
		if(null==c||"".equals(c.getContents())||null==c.getContents())
			return true;
		return false;
	}
	
	public static boolean nameIsLegal(String name){
		int len = name.trim().getBytes().length;
		String regex = "[^\\s]{1,}";
		Pattern pat = Pattern.compile(regex);
		if(pat.matcher(name).matches())
			if(len>4&&len<19)
			return true;
		return false;
	}
	
	public static boolean passwdIslegal(String passwd){
		String regex = "[^\u4e00-\u9fa5]{6,}";
		Pattern pat = Pattern.compile(regex);
		if(pat.matcher(passwd).matches())
			return true;
		return false;
	}
	
	public static boolean emailIslegal(String email){
		String regex = "\\w+@(\\w+.)+[a-z]{2,3}";
		Pattern pat = Pattern.compile(regex);
		if(pat.matcher(email).matches())
			return true;
		return false;
	}
	
	public static boolean idcardIslegal(String idcard){
		CheckIdcard cid = new CheckIdcard();
		cid.setId(idcard);
		return cid.valid();
	}
	
	public static boolean telephoneIslegal(String telephone){
		String regex = "1[0-9]{10}";
		Pattern pat = Pattern.compile(regex);
		if(pat.matcher(telephone).matches())
			return true;
		return false;
	}
	
	public static boolean valid(){
		return valid;
	}
	public static void setMsg(MultipartFile file){
		
		if(isExist(file)||isEmpty(file)){
			valid = false;
			exlerrormsg="没有选择文件或文件不存在\n";
		}else{
				
			if(!isType(file)){
				valid = false;
				exlerrormsg="文件格式不正确，选择xls文件\n";
			}else{
				Workbook book = WorkbookUtil.getWbook(file);
				Cell c[] = null;
				if(!hasContent(book)){
					valid = false;
					exlerrormsg="文件中没有可添加的账户\n";
					return;
				}
				
				for(int i =0;i<4;i++){
					for(Cell cc:book.getSheet(0).getColumn(i)){
						if(cellIsEmpty(cc)){
							valid = false;
							exlerrormsg="账户名，密码，邮箱或身份证不能为空\n";
							return;
						}
					}
				}
				if(hasSameName(book)){
					valid = false;
					exlerrormsg="文件第"+line+"行账户名与其他账户名相同\n";
					return;
				}
				 c = book.getSheet(0).getColumn(0);
				for(int i =1;i<book.getSheet(0).getColumn(0).length;i++){
				if(!nameIsLegal(c[i].getContents())){
						valid = false;
						line = i+1;
						exlerrormsg="文件第"+line+"行账户名格式非法\n";
						return;
						}			
				}
				c = book.getSheet(0).getColumn(1);
				for(int i =1;i<book.getSheet(0).getColumn(1).length;i++){
					if(!passwdIslegal(c[i].getContents()))
						{line = i+1;
						valid = false;exlerrormsg="文件第"+line+"行密码格式非法\n";return;	}		
				}
				
				c = book.getSheet(0).getColumn(2);
				for(int i =1;i<book.getSheet(0).getColumn(2).length;i++){
					if(!emailIslegal(c[i].getContents()))
						{ line = i+1;
						valid = false;exlerrormsg="文件第"+line+"行邮箱格式非法\n";return;}			
				}
				
				c = book.getSheet(0).getColumn(3);
				for(int i =1;i<book.getSheet(0).getColumn(3).length;i++){
					if(!idcardIslegal(c[i].getContents()))
						{line = i+1;
						valid = false;exlerrormsg="文件第"+line+"行身份证格式非法\n";return;}			
				}
				
				c = book.getSheet(0).getColumn(4);
				for(int i =1;i<book.getSheet(0).getColumn(4).length;i++){
					if(!cellIsEmpty(c[i])){
						if(!telephoneIslegal(c[i].getContents()))
							{
								line = i+1;
								valid = false;exlerrormsg="文件第"+line+"行手机号码格式非法\n";return;
							}else 
								valid=true;			
				
					}
				}
			}
		}
	}
}
