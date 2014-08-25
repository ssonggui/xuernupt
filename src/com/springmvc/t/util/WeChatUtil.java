package com.springmvc.t.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import java.io.Writer;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSON;
import com.springmvc.t.model.TulingList;
import com.springmvc.t.model.WeChatArticle;
import com.springmvc.t.model.WeChatNews;
import com.springmvc.t.model.WeChatReplyText;
import com.springmvc.t.model.WeChatText;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class WeChatUtil {
	public static final String Token ="xuernuptWC";
	public static final String TEXT = "text";
	public static final String IMAGE = "image";
	public static final String LOCATION = "location";
	public static final String LINK = "link";
	public static final String NEWS = "news";
	public static final String EVENT = "event";
	public static final String WEL = "谢谢关注xuernupt\n\n1 查询好友---“用户名:f”\n2 查询微博---“用户名:s”\n3 查询好友微博---"
			+ "“用户名:fs”\n4 查看本站作者---“本站”\n5 跟小耳哥聊天---非1234格式即可\n";
	public static final String TEST = "测试ing\n敬请期待";
	
	public static final String TULING = "http://www.tuling123.com/openapi/api?key=f77934c9ff3f2e3be4997318b7117adc&info=";
	
	public static final int ERRCODE = 400;
	public static boolean checkSignature(String signature,String timestamp,String nonce ){
		if(null==signature||null==timestamp||null==nonce)
			return false;
		String [] checkstr = {Token,timestamp,nonce};
		Arrays.sort(checkstr);
		String sortedstr = "";
		for(String s:checkstr){
			sortedstr += s;
		}
		return wechaSHA(sortedstr).equals(signature);
	}
	
	public static String wechaSHA(String sortedstr){
		String str = "";
		try {
			MessageDigest md = MessageDigest.getInstance("SHA1");
			md.update(sortedstr.getBytes());
			str = new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	public static Map<String,String> ParseXmlToMap(HttpServletRequest request){
		Map<String,String> map = new HashMap<String,String>();
		try {
			InputStream is = request.getInputStream();
			SAXReader reader = new SAXReader();
			Document doc = reader.read(is);
			Element root = doc.getRootElement();
			@SuppressWarnings("unchecked")
			List<Element> list = root.elements();
			for(Element e:list){
				map.put(e.getName(), e.getText());
			}
			is.close();
			is = null; 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
		
	}
	
	public static WeChatText MapToWCMsg(Map<String,String> map){
		
			if(map == null) return null;
			String msgType = map.get("MsgType");
			WeChatText message = new WeChatText();
			message.setToUserName(map.get("ToUserName"));
			message.setFromUserName(map.get("FromUserName"));
			message.setCreateTime(new Date(Long.parseLong(map.get("CreateTime"))));
			message.setMsgType(msgType);
			message.setMsgId(map.get("MsgId"));
			if(msgType.equals(TEXT)){
				message.setContent(map.get("Content"));			
			}
			return message;
	}
	private static XStream xstream = new XStream(new XppDriver() {  
        public HierarchicalStreamWriter createWriter(Writer out) {  
            return new PrettyPrintWriter(out) {  
                // 对所有xml节点的转换都增加CDATA标记  
                boolean cdata = true;  
                @SuppressWarnings("unchecked")  
                public void startNode(String name, Class clazz) {  
                    super.startNode(name, clazz);  
                }  
                protected void writeText(QuickWriter writer, String text) {  
                    if (cdata) {  
                        writer.write("<![CDATA[");  
                        writer.write(text);  
                        writer.write("]]>");  
                    } else {  
                        writer.write(text);  
                    }  
                }  
            };  
        }  
    }); 
	
	public static String replyToXml(WeChatReplyText reply){
		String type = reply.getMsgType();
		if(TEXT.equals(type)){

		}
		xstream.autodetectAnnotations(true);  
		xstream.alias("xml", reply.getClass());
		return xstream.toXML(reply);
	}
	
	public static String replyToXml(WeChatNews reply){
		String type = reply.getMsgType();
		if(NEWS.equals(type)){

		}
		xstream.autodetectAnnotations(true);  
		xstream.alias("xml", reply.getClass());
		xstream.autodetectAnnotations(true);  
		xstream.alias("item", new WeChatArticle().getClass());
		return xstream.toXML(reply);
	}
	
//	public static String creatHttp(String info){
//		String jsonstr = null;
//		String Tulingurl = TULING;
//		try {
//			Tulingurl += URLEncoder.encode(info,"utf-8");
//		} catch (UnsupportedEncodingException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
//		HttpGet request = new HttpGet(Tulingurl);
//		try {
//			HttpResponse response = HttpClients.createDefault().execute(request);
//			if(response.getStatusLine().getStatusCode()==200){
//				jsonstr = EntityUtils.toString(response.getEntity());
//				
//			}
//		} catch (ClientProtocolException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return jsonstr;
//	}
	
	public static String creatGetHttp(String info){
		String Tulingurl = TULING;
		StringBuffer jsonstr = new StringBuffer();  
	        try {
	        	Tulingurl += info;
	        	Tulingurl += "&userid=0010972076";
	            URL url = new URL(Tulingurl);  
	            HttpURLConnection httpUrlConn = (HttpURLConnection) url.openConnection();  
	            httpUrlConn.setDoInput(true);  
	            httpUrlConn.setRequestMethod("GET");  
	            httpUrlConn.connect();  
	            // 将返回的输入流转换成字符串  
	            InputStream inputStream = httpUrlConn.getInputStream();  
	            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
	            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
	  
	            String str = null;  
	            while ((str = bufferedReader.readLine()) != null) {  
	            	jsonstr.append(str);  
	            }  
	            bufferedReader.close();  
	            inputStreamReader.close();  
	            // 释放资源  
	            inputStream.close();  
	            inputStream = null;  
	            httpUrlConn.disconnect();  
	  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	        return jsonstr.toString();
	}
	
	public static <T>T JsonToObj(String jsonstr,Class<T> clazz){
	        T tmodel = JSON.parseObject(jsonstr, clazz);
	        return tmodel;
	}
	
	public static int getTulingcode(String jsonstr){
		
		int code = 200;
		if(jsonstr.contains(":4000"))
			return ERRCODE;
		
		return code;
	}
	
	public static String constrTuling(TulingList tuling){
		StringBuffer sb = new StringBuffer();
		sb.append(tuling.getName()==null?" ":tuling.getName());
		sb.append(tuling.getArticle()==null?" ":tuling.getArticle());
		
		sb.append(tuling.getInfo()==null?" ":tuling.getInfo());
		sb.append(tuling.getSatisfaction()==null?" ":tuling.getSatisfaction());
		return sb.toString();

	}
}
