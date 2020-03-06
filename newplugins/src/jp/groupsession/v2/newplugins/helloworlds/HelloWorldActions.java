package jp.groupsession.v2.newplugins.helloworlds;

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



  public class HelloWorldActions extends AbstractGsAction {

  String tmp;
  Integer nichi;

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

	   private void sheetshori(int i,Workbook wb,String sfdate,String sfdate2,int fyear,int fmonth,String kname){
		    String tuki,hi[];
		    String gyo="";String gatu="";String dt="";String st[];String knm[];String nen;String his;
		    String mae,ato;
		    String[] w = {"日","月","火","水","木","金","土"};

		   Calendar today = new GregorianCalendar();
		   today.add(Calendar.DATE,-1);


		     Sheet sheet = wb.getSheetAt(i);
		        gatu=wb.getSheetName(i);//シート名は　○月の形式だとする
	      	tuki="00"+ZtoH(gatu).replace("月","");
	     	 tuki = tuki.substring(tuki.length()-2,tuki.length());


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
			                // セル値の出力
			                //out.print(cellValue+",");
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
		            		// System.out.print("("+hi[1]+")");
		            	// }

		            	  his=hi[1];
		            	}else{
		            	  his="00";
		            	}

			            if (tuki.matches("[0-9][0-9]") && his.matches("[0-9][0-9]") && !(his.equals("00"))){ //月のシートで日付が０でないとき



			            		if (tuki.matches("[0-9][0-9]")){
			            			//今が４月～１１月、１月～３月であれば問題なし、スタート月１２月のときのみカレント月が１月は＋１年に
			            			if(fmonth==12 && Integer.parseInt(tuki)==1){
			            				nen=Integer.toString(fyear+1);
			            			}else {
			            				nen=Integer.toString(fyear);
			            			}
			            		}else{
			            			nen="0000";
			            			tuki="00";
			            			his="00";
			            		}



	                     //***********************************************************:
				            st[0]=nen+"/"+tuki+"/"+his; // YYYY/MM/DD に整形 エクセルから抽出したデータの日付

	                 	knm=kname.split(",");

			              if((st[0].compareTo(sfdate)>=0) && (st[0].compareTo(sfdate2)<=0) ){

			            	 //out.print(gatu+gyo+"<br>");
			            	  gyo="";

				            	for (int j=0;j<knm.length;j++){
				            	  if (j<st.length){// 項目か、データの少ない方にあわせて表示
				            		if (st[j].equals("") || knm[j].equals("") ){}else{

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
				            	 nichi=nichi+1;


				                switch(nichi){
				                   	case 1:
				                		mae="<b>明日　　";ato="";
				                		gyo=st[0].substring(st[0].length()-5,st[0].length())+"("+st[1]+")</b><br>"+gyo;
				                		break;
				                	case 2:
				                		mae="<b>明後日　";ato="";
				                		gyo=st[0].substring(st[0].length()-5,st[0].length())+"("+st[1]+")</b><br>"+gyo;
				                		break;
				                	default:
				                    	mae="<b>"+HtoZ(Integer.toString(nichi))+"日後　";ato="";
				                    	gyo=st[0].substring(st[0].length()-5,st[0].length())+"("+st[1]+")</b><br>"+gyo;
				                    	break;
				                }

				            	tmp=tmp+"<tt>"+mae+gyo+"<br>"+ato+"</tt>";

			              }// if owari hiduke kakunin
			            } //1gyo owari  日付がはいっているかチェックして実行

	 	       }// 1sheet owari


	   }

	 //****************************



	  //*************************************************
      public ActionForward executeAction(ActionMapping map,
                                          ActionForm form,
                                          HttpServletRequest req,
                                          HttpServletResponse res,
                                          Connection con)
          throws Exception {

     	 HelloWorldForms helloworldForms = (HelloWorldForms)form;
        // String tmp=yoteiForm.getText();

 //******************************************hyoji bu shori****************




     	   GregorianCalendar cal = new GregorianCalendar();

         SimpleDateFormat format2 = new SimpleDateFormat("yyyy/MM/dd");

         String datestr_s = format2.format(cal.getTime());
         cal.add(Calendar.DATE,1);
         String datestr_s2 =format2.format(cal.getTime());
         cal.add(Calendar.DATE,8);
         String datestr_e = format2.format(cal.getTime());


 		    String freset="false";




			 Calendar calendar = Calendar.getInstance();
			    int hour = calendar.get(Calendar.HOUR_OF_DAY);
			    int minute = calendar.get(Calendar.MINUTE);
			    int cmin=hour*60+minute;//現在時刻　整数値




try	{


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

	//out.println("/"+"/"+tmp4+"/");
}
in4k.close();


		String kname = tmp4k;
//******************************************************

		File fl =new File(tmp3);
		if (fl.exists()){
			 InputStream inp = new FileInputStream(tmp3);

			    //（2）入力ファイルを表すワークブックオブジェクトの生成
			    Workbook wb;

			    Calendar ffday  = new GregorianCalendar();
			    int fyear=ffday.get(Calendar.YEAR);
			    int fmonth=ffday.get(Calendar.MONTH)+1;//今月

					wb = WorkbookFactory.create(inp);

					//高速化のため、今月、１０日分表示では、今月と来月しか読み込まない
					//************シートは４月から順に並んでいる必要あり
					Integer sm;//シート読み取り開始
					Integer em;//シート読み取り終了
					sm=fmonth-4;
					em=fmonth-3;
					if(fmonth>0 && fmonth<=3){
						sm=fmonth+8;
						em=fmonth+9;
					}

					  tmp="";
					  nichi=0;
				    for (int i = 0; i <= 12; i++) {
                       if (i==sm||i==em){
 				     	  sheetshori(i % 12,wb,datestr_s2,datestr_e,fyear,fmonth,kname);
                       }
				    }// all sheet owari



			       inp.close();

		}else{
			 //System.out.println(path3+":見つかりません！");
			 //out.print("<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です</tt>");
		 tmp=tmp+"<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です。「予定の設定」を再確認してください。</tt>";
		}


	} catch (Exception e) {
		//System.out.println("エラー！予定ファイルの項目の設定は、実際のファイルと対応していますか？");
		//out.print("<tt>読み取りエラー。エクセル形式が違います。シート数が13か確認してください。</tt>");
         tmp=tmp+"<tt>読み取りエラー。エクセル形式が違う可能性があります。シートの順序、数なども確認してください</tt>";
		//e.printStackTrace();
	}





//*********************************************hyojibu shori owari***************
       helloworldForms.setText(tmp);





        return map.getInputForward();

}


  }