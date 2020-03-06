package jp.groupsession.v2.newplugint.helloworldt;

  import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.struts.AbstractGsAction;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

  import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.*;
import java.text.*;







import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;



  public class HelloWorldActiont extends AbstractGsAction {
//*****************クラス内で使う関数******************
	  public static String ZtoH(String s) {
		    StringBuffer sb = new StringBuffer(s);
		    for (int i = 0; i < sb.length(); i++) {
		      char c = sb.charAt(i);
		      if (c >= '０' && c <= '９') {
		        sb.setCharAt(i, (char)(c - '０' + '0'));
		      }
		    }
		    return sb.toString();
		  }

	  public static String HtoZ(String str) {
	        if (str == null){
	            throw new IllegalArgumentException();
	        }
	        StringBuffer sb = new StringBuffer(str);
	        for (int i = 0; i < str.length(); i++) {
	            char c = str.charAt(i);
	            if ('0' <= c && c <= '9') {
	                sb.setCharAt(i, (char) (c - '0' + '０'));
	            }
	        }
	        return sb.toString();
	    }

	  //*************************************************
      public ActionForward executeAction(ActionMapping map,
                                          ActionForm form,
                                          HttpServletRequest req,
                                          HttpServletResponse res,
                                          Connection con)
          throws Exception {

     	 HelloWorldFormt helloworldFormt = (HelloWorldFormt)form;
        // String tmp=yoteiForm.getText();
     	 String tmp="";
 //******************************************hyoji bu shori****************


     	   GregorianCalendar cal = new GregorianCalendar();
     	SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd");

     	String datestr_s = format2.format(cal.getTime());

     	String hiduke=datestr_s;



 		    String sfiltermoji= "";
 		    String freset="false";


		    String[] w = {"日","月","火","水","木","金","土"};

			 Calendar calendar = Calendar.getInstance();
			    int hour = calendar.get(Calendar.HOUR_OF_DAY);
			    int minute = calendar.get(Calendar.MINUTE);
			    int cmin=hour*60+minute;//現在時刻　整数値



try	{
String pst="0000/00/00";
String path3 = this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_path.txt");
String path4k = this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_komoku.txt");


String str3 = null;String str4k = null;	String tmp3=null;String tmp4k=null;


BufferedReader in3=new BufferedReader(new FileReader(path3));
while((str3=in3.readLine())!=null) {
tmp3=str3;
	//System.out.println("/"+tmp3+"/"+"/");
}
in3.close();


BufferedReader in4k=new BufferedReader(new FileReader(path4k));
while((str4k=in4k.readLine())!=null) {
tmp4k=str4k;

}
in4k.close();

		String kname = tmp4k;
//******************************************************

		File fl =new File(tmp3);
		if (fl.exists()){
			 InputStream inp = new FileInputStream(tmp3);

			    //（2）入力ファイルを表すワークブックオブジェクトの生成
			    Workbook wb;

			    String tuki,hi[];


			    Calendar ffday  = new GregorianCalendar();
			    int fyear=ffday.get(Calendar.YEAR);

			    int fmonth=ffday.get(Calendar.MONTH)+1;//今月


			    //9日後の年、月も算出しておく
			    ffday.add(Calendar.DATE,9);

			  String sfdate=hiduke;


			   Calendar today = new GregorianCalendar();

			   today.add(Calendar.DATE,-1);

				    String gyo="";String gatu="";String dt="";String st[];String knm[];String nen;String his;
				    String mae,ato;

//				    Matcher m;
					wb = WorkbookFactory.create(inp);

					Integer sm;//シート読み取り開始

					sm=fmonth-4;

					if(fmonth>0 && fmonth<=3){
						sm=fmonth+8;

					}


				        Sheet sheet = wb.getSheetAt(sm);//今月のシート
				        gatu=wb.getSheetName(sm);//シート名は　○月の形式だとする
			         	tuki="00"+ZtoH(gatu).replace("月","");
		            	 tuki = tuki.substring(tuki.length()-2,tuki.length());



            //TOPページ予定表示はこちら***********************************************
	            		  // 行数分繰返す
					        for (Row row : sheet) {
					           // out.print("<" + row.getRowNum()+"> ");
                                gyo="";
					            for (Cell cell : row) {
					                String cellValue = null;
					                int cellType = cell.getCellType();

					                switch (cellType) {
					                case Cell.CELL_TYPE_NUMERIC:
					                    double dValue = cell.getNumericCellValue();
					                    cellValue = String.valueOf(dValue);
					                    break;
					                case Cell.CELL_TYPE_STRING:
					                    cellValue = cell.getStringCellValue();
					                    break;
					                default:
					                	 cellValue="";
					                    break;
					                }
					                gyo=gyo+cellValue.replace(",","、")+",";
					            }
					            //月日がそろっているかチェック	 *************************************



				            	dt=tuki+"/"+gyo;

				            	st=dt.split(",",-1);
				            	st[0]=st[0].replace(".0", "");//  MM/D

				            	hi=st[0].split("/");
				            	if(hi.length>1)	{
				            	 hi[1]="00"+hi[1];//日付がないとエラーになる

			            		 hi[1]=hi[1].substring(hi[1].length()-2,hi[1].length());

				            	  his=hi[1];
				            	}else{
				            	  his="00";
				            	}

				            	    nen=Integer.toString(fyear);
					               	st[0]=nen+"/"+tuki+"/"+his; // YYYY/MM/DD に整形　エクセルからの日付
					            	knm=kname.split(",");

					           	if(st[0].compareTo(sfdate)==0){//該当日だけ処理
					            	 //out.print(gatu+gyo+"<br>");
					            	  gyo="";

						            	for (int j=0;j<knm.length;j++){
						            		if (j<st.length){// 項目か、データの少ない方にあわせて表示
						            			if (st[j].equals("") || knm[j].equals("") || sfiltermoji.indexOf(knm[j])!=-1){}else{

							 	            		gyo=gyo+"<span style=font-size:80%;>"+knm[j]+st[j]+"</span><br>";
							 	            		gyo=gyo.replaceAll("\n","<br>");
							            		}//if owari
						            		}

						            	}// for owari


						            	if(st[1].length()<1){
						            		//曜日が取得できないときは、ここで計算
						            		today.add(Calendar.DATE, 1);
						            		int dayOfWeek = today.get(Calendar.DAY_OF_WEEK);
						            		st[1]=w[dayOfWeek-1];
						            	}


					                		    mae="";ato="\t";


						            	tmp=tmp+"<tt>"+mae+gyo+"<br>"+ato+"</tt>";

					           	 }//該当日チェック

					            } //1gyo owari


			       inp.close();

		}else{
			 //System.out.println(path3+":見つかりません！");

		 tmp=tmp+"<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です.「予定の設定」を再確認してください。</tt>";
		}


	} catch (Exception e) {
		//System.out.println("エラー！予定ファイルの項目の設定は、実際のファイルと対応していますか？");
         tmp=tmp+"<tt>読み取りエラー。エクセル形式が違う可能性があります。シート数が13か確認してください。</tt>";
		//e.printStackTrace();
	}



//*********************************************hyojibu shori owari***************
       helloworldFormt.setText(tmp);
        // System.out.println(tmp);

        return map.getInputForward();

}


  }