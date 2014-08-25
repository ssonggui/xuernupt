package com.springmvc.t.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.springmvc.t.model.Dailyrecord;

public class SearchUtil {
	public static void creatIndex(String path,List<Dailyrecord> list){
		File file = null;
		
		IndexWriter iw = null;
		try {
			file = new File(path);
		
			Directory dir = FSDirectory.open(file);
			System.out.println(file.getParent());
			File directory = new File("");//²ÎÊýÎª¿Õ 
			String courseFile = directory.getCanonicalPath() ; 
			System.out.println(courseFile);
			IndexWriterConfig iwc =new IndexWriterConfig(Version.LUCENE_35, new StandardAnalyzer(Version.LUCENE_35));
			iw = new IndexWriter(dir,iwc);
			Document doc = null;
			for(Dailyrecord dr:list){
				doc = new Document();
				doc.add(new Field("id",dr.getId(),Field.Store.YES,Field.Index.ANALYZED));
				doc.add(new Field("content",dr.getContent(),Field.Store.YES,Field.Index.ANALYZED));
				iw.addDocument(doc);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(iw!=null){    
                try {  
                	iw.commit();
                	iw.close();    
                }  catch (IOException e) {        
                    e.printStackTrace();    
                }    
            }    
		}
	}
	
	public static String[] creatSearch(String path,String key){
		String[] ids = null;
		Directory dir = null;
		IndexReader ir = null;
		IndexSearcher is = null;
		File file = null;
		String[] fields = {"content"};
		try {
			 file = new File(path);
			 
			 dir = FSDirectory.open(file);
			 ir = IndexReader.open(dir);
			 is = new IndexSearcher(ir);
			 MultiFieldQueryParser mfqp = new MultiFieldQueryParser(Version.LUCENE_35,fields , new StandardAnalyzer(Version.LUCENE_35));
			 Query qy = mfqp.parse(key);
			 TopDocs tds =  is.search(qy, 10);
			 
			 ScoreDoc[] scoredocs = tds.scoreDocs;
			 ids = new String[scoredocs.length];
			 for(int i=0;i<scoredocs.length;i++){
				 Document doc = is.doc(scoredocs[i].doc);
				 ids[i] = doc.get("id");
			 }
			 
		
					
		}catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (CorruptIndexException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ir.close();
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		for(File f:file.listFiles()){
			f.delete();
		}
		
		return ids;
	}
	
	
}
