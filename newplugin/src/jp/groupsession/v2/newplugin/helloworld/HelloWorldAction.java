package jp.groupsession.v2.newplugin.helloworld;

  import java.sql.Connection;


import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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
import java.util.*;
import java.text.*;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;



  public class HelloWorldAction extends AbstractGsAction {
//*****************クラス内で使う関数******************test
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

     	 HelloWorldForm helloworldForm = (HelloWorldForm)form;



     	  GregorianCalendar cal = new GregorianCalendar();
          SimpleDateFormat format2 = new SimpleDateFormat("MM");
          String datestr_s = format2.format(cal.getTime());
          String hget=helloworldForm.getOpt();
//System.out.print("1:"+datestr_s);
//System.out.print("2:"+ helloworldForm.getOpt());

          String month="00";
          if(hget==null||hget.length()==0)
          {
        	  month=datestr_s;
          }else{
        	  month=hget;
          }



     //	 try{
     	//     month = helloworldForm.getOpt();
     //	 }catch(Exception e){
     //		month=datestr_s;
     //	 }


     	 String tmp= helloworldForm.getText();
 //******************************************hyoji bu shori****************


     	    String hiduke ="2017/06/21";//yyyy/mm/dd
 		    String hiduke2 = "2017/07/03";



 		    String sfiltermoji= "";
 		    String freset="false";


		    String[] w = {"日","月","火","水","木","金","土"};

			 Calendar calendar = Calendar.getInstance();
			    int hour = calendar.get(Calendar.HOUR_OF_DAY);
			    int minute = calendar.get(Calendar.MINUTE);
			    int cmin=hour*60+minute;//現在時刻　整数値
//try{
// ServletContext sc = getServletContext();
// String ptime = (String)sc.getAttribute("time");//前回のキャッシュ時の時刻
// String Cachex=(String)sc.getAttribute("cache");

// if(freset.equals("false")&&month.equals("00") && cmin>=Integer.parseInt(ptime)&&cmin<=1+Integer.parseInt(ptime) && Cachex!=null){
 	//１０日以内表示で、もし、前回のキャッシュ作成から5分以上経過してないときは、キャッシュ利用
//通常は　fresetはfalseでリセットしない
 	//out.print(Cachex);
//	 tmp=tmp+Cachex;
  //   return;

//	 }else{
		 //fresetをTrueにすると、強制的にリセット

	// }
//}catch(Exception e){
	//System.out.println(e.getMessage()+":error");
//}






try	{
String pst="0000/00/00";
			//String path3 = getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_path.txt");
            String path3 = this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_path.txt");
			String path4k = this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_komoku.txt");
   //path3:"\\\\172.16.129.212\\tenpu\\yoteix.xlsx";
//path3:"D:\\tool\\eclipse\\pleiades\\tomcat\\7\\webapps\\gsession\\WEB-INF\\plugin\\newplugin\\yotei.xlsx";
   //4k:",,<b>[全校行事会議等]</b>,<b>[聴幼]</b>,<b>[聴小]</b>,<b>[聴中]</b>,<b>[聴日番]</b>,<b>[知小]</b>,<b>[知中]</b>,<b>[知高]</b>,<b>[知日番]</b>,<b>[出張]</b>,<b>[年休等]</b>,[仮予定],[仮予定],[仮予定],[仮予定]";


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

		//tmp3="D:\\users\\hgoto\\Documents\\soft\\pleiades\\tomcat\\7\\webapps\\gsession\\WEB-INF\\plugin\\newplugin\\yotei.xlsx";
		//tmp3="\\\\192.168.1.1\\HomeICT\\yotei.xlsx";
		//tmp4k=",,<b>[全校行事会議等]</b>,<b>[聴幼]</b>,<b>[聴小]</b>,<b>[聴中]</b>,<b>[聴日番]</b>,<b>[知小]</b>,<b>[知中]</b>,<b>[知高]</b>,<b>[知日番]</b>,<b>[出張]</b>,<b>[年休等]</b>,[仮予定],[仮予定],[仮予定],[仮予定]";

		String kname = tmp4k;
//******************************************************

		File fl =new File(tmp3);
		if (fl.exists()){
			 InputStream inp = new FileInputStream(tmp3);

			    //（2）入力ファイルを表すワークブックオブジェクトの生成
			    Workbook wb;

			    String tuki,hi[];
			    Integer konnendo;

			    Calendar ffday  = new GregorianCalendar();
			    int fyear=ffday.get(Calendar.YEAR);
			    konnendo=fyear;
			    int fmonth=ffday.get(Calendar.MONTH)+1;//今月
			    if (fmonth<=3) konnendo=konnendo-1;

			    //9日後の年、月も算出しておく
			    ffday.add(Calendar.DATE,9);

			  String sfdate=hiduke;
			   String sfdate2=hiduke2;
			  //  out.println(sfdate+"~"+sfdate2+"<br>");

			   Calendar today = new GregorianCalendar();

			   today.add(Calendar.DATE,-1);

				    String gyo="";String gatu="";String dt="";String st[];String knm[];String nen;String his;
				    Integer nichi=0;String mae,ato;
String Cache="";
//				    Matcher m;
					wb = WorkbookFactory.create(inp);




					//高速化のため、今月、１０日分表示では、今月と来月しか読み込まない
					//************シートは４月から順に並んでいる必要あり
					Integer sm;//シート読み取り開始
					Integer em;//シート読み取り終了
					sm=fmonth-4;
					em=fmonth-2;
					if(fmonth>0 && fmonth<=3){
						sm=fmonth+8;
						em=fmonth+10;
					}
					if (!month.equals("00")){//月指定の場合
						//sm=0;
						//em=wb.getNumberOfSheets();
						sm=Integer.parseInt(month)-4;
						em=Integer.parseInt(month)-3;
						if(Integer.parseInt(month)>0 && Integer.parseInt(month)<=3){
							sm=Integer.parseInt(month)+8;
							em=Integer.parseInt(month)+9;
						}

						if (Integer.parseInt(month)==4 && fmonth==3){//３月に次の４月シートを表示させるため
							sm=12;
							em=13;
						}
					}

					// シート数分繰返す
				    for (int i = sm; i < em; i++) {
				        Sheet sheet = wb.getSheetAt(i);
				        gatu=wb.getSheetName(i);//シート名は　○月の形式だとする
			         	tuki="00"+ZtoH(gatu).replace("月","");
		            	 tuki = tuki.substring(tuki.length()-2,tuki.length());

		            	 //out.print("<tt>"+tuki+" "+month+"　月予定表示 emNo="+Integer.toString(em)+"</tt>");

	            	  if(tuki.equals("00")) {
	            		  continue;//月シート以外はスキップ
	            	  }

	            	  if(fmonth==3 && i==0){
	            		//当月が３月のときだけ、最初の月（４月）はとばして、最後のタブ「４」を読むようにする

	            		  continue;
	            	  }

	            	  if(fmonth==4 && i>0 && tuki.equals("04")){
		            		//当月が4月のときだけ、最後の月（４）はとばして、最初のタブ「４月」を読むようにする
		            		  continue;
		            	  }



	            	  if(!month.equals("00")){
	            		  //月指定していたら　ここで実行し　break******************************************************


	            		  if(month.equals(tuki)){

	            			  //out.print("<div><table id=hyo width=95% border=1 style='font-size:12px;border-collapse:collapse;'>");
	                           tmp=tmp+"<div><table id=hyo width=95% border=1 style='font-size:12px;border-collapse:collapse;'>";
	            			  boolean sento=true;
	            			  for (Row row : sheet) {//各行移動
						       //out.print("<tr>");
						      tmp=tmp+"<tr>";
	            				  int cct=0;
						            for (Cell cell : row) {//各セル移動
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
						                cellValue=cellValue.replace(".0","").replace(",","、");
						                if (sento) {
						                	String width="";
						                	switch (cct){
						                	case 0:
						                		width="width=25";
						                		break;
						                	case 1:
						                		width="width=15";
						                		break;

						                	default:
						                		width="";
						                		break;

						                	}
						                	//out.print("<td "+width+" align=left>"+cellValue+"</td>");
						                   tmp=tmp+"<td "+width+" align=left>"+cellValue+"</td>";

						                }else{
						                	//out.print("<td align=left>"+cellValue+"</td>");
						                	tmp=tmp+"<td align=left>"+cellValue+"</td>";
						                }
						                cct=cct+1;
						            }
						            //out.print("</tr>");
						            tmp=tmp+"</tr>";
						            sento=false;
		            	       }
	            		   //out.print("</table><div>");
	            		   tmp=tmp+"</table><div>";
	            		  }


	            	  }else{//TOPページに、１０日間の予定表示はこちら***********************************************
	            		  // 行数分繰返す
					        for (Row row : sheet) {
					           // out.print("<" + row.getRowNum()+"> ");

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
				            	// if(Integer.parseInt(hi[1])>9){//10以上だと　修正
				            	//	 hi[1]=hi[1].substring(hi[1].length()-1,hi[1].length());
				            	// }else{
				            	 //System.out.print(hi[1]+">>");
				            		 hi[1]=hi[1].substring(hi[1].length()-2,hi[1].length());
				            		// System.out.print("("+hi[1]+")");
				            	// }

				            	  his=hi[1];
				            	}else{
				            	  his="00";
				            	}

					          //   m = p.matcher(gatu+gyo);
					          //  if(m.find()) {
					            if (tuki.matches("[0-9][0-9]") && his.matches("[0-9][0-9]") && !(his.equals("00"))){ //月のシートで日付が０でないとき
					            	 //  System.out.println(gatu+"月"+gyo+"<br>");
if(fmonth==3 && i==0){
	//当月が３月のときだけ、最初の月（４月）はとばして、最後のタブ「４」を読むようにする
	nen="0000";
	tuki="00";
	his="00";

}else{

	 if (tuki.matches("[0-9][0-9]")){
 	 if(Integer.parseInt(tuki)<=3 && Integer.parseInt(tuki)>0){
  		nen=Integer.toString(konnendo+1);
  	 }else if( Integer.parseInt(tuki)>=4 ){
  		nen=Integer.toString(konnendo);
  	 }else {
  		 nen=Integer.toString(konnendo);
  	 }
 }else{
 	nen="0000";
 	tuki="00";
 	his="00";
 }


  //当月が３月で、予定表示したいものが４月の時だけ、次年度の４月を表示させる
  if (fmonth==3 && Integer.parseInt(tuki)==4) nen=Integer.toString(konnendo+1);


}




						                	st[0]=nen+"/"+tuki+"/"+his; // YYYY/MM/DD に整形


						                //	System.out.println(sfdate+"cmp"+st[0]+"cmp"+sfdate2);

					            	//out.print(st[0]+"<br>");
				                      //

					            	//ServletContext scc = getServletContext();
					            	//String kname = (String)scc.getInitParameter("excelkomoku");
					            	//kname=",,,,,,,,[全],[公用車],,,,,,,,,,,,[出張],,,,,,,,,,[日番],[日番],[舎監],[舎監],,,,,,,,,,";
					            	knm=kname.split(",");

					              if((st[0].compareTo(sfdate)>=0) && (st[0].compareTo(sfdate2)<=0) && (pst.compareTo(st[0])<0)){
					            	  //pst前の日付よりCurrentの日付が大きくなっていないと表示しないようにした
					            	  pst=st[0];
					            	 //out.print(gatu+gyo+"<br>");
					            	  gyo="";

						            	for (int j=0;j<st.length;j++){
						            		if (st[j].equals("") || knm[j].equals("") || sfiltermoji.indexOf(knm[j])!=-1){}else{
						            			//out.println(st[j]+"<br>");
						            			//out.println(sfiltermoji+" "+knm[j]+"<br>");
						 	            		gyo=gyo+"<span style=font-size:80%;>"+knm[j]+st[j]+"</span><br>";
						 	            		gyo=gyo.replaceAll("\n","<br>");
						            		}//if owari
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
					                		    mae="";ato="\t";

					                		    break;
						                	case 2:
						                		mae="<b>明日　　";ato="";
						                		gyo=st[0].substring(st[0].length()-5,st[0].length())+"("+st[1]+")</b><br>"+gyo;
						                		break;
						                	case 3:
						                		mae="<b>明後日　";ato="";
						                		gyo=st[0].substring(st[0].length()-5,st[0].length())+"("+st[1]+")</b><br>"+gyo;
						                		break;
						                	default:
						                    	mae="<b>"+HtoZ(Integer.toString(nichi-1))+"日後　";ato="";
						                    	gyo=st[0].substring(st[0].length()-5,st[0].length())+"("+st[1]+")</b><br>"+gyo;
						                    	break;
						                }

						            	//out.print("<tt>"+mae+gyo+"<br>"+ato+"</tt>");//kaigyo
						            	tmp=tmp+"<tt>"+mae+gyo+"<br>"+ato+"</tt>";
						            	Cache=Cache+"<tt>"+mae+gyo+"<br>"+ato+"</tt>";//ここで、高速化のためのキャッシュ作成

					              }// if owari hiduke kakunin
					            } //1gyo owari
					            gyo="";
	            	       }// 1sheet owari


				        } //top page

				    }// all sheet owari

				    if(month.equals("00")){
				    	// ServletContext scc = getServletContext();
						 //   scc.setAttribute("cache", Cache);
						  //  String pptime="";
						  //  pptime=Integer.toString(cmin);//hhmm形式の時刻記録
						 //   scc.setAttribute("time",pptime);
				    }


			       inp.close();

		}else{
			 //System.out.println(path3+":見つかりません！");
			 //out.print("<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です</tt>");
		 tmp=tmp+"<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です</tt>";
		}


	} catch (Exception e) {
		//System.out.println("エラー！予定ファイルの項目の設定は、実際のファイルと対応していますか？");
		//out.print("<tt>読み取りエラー。エクセル形式が違います。シート数が13か確認してください。</tt>");
         tmp=tmp+"<tt>読み取りエラー。エクセル形式が違います。シート数が13か確認してください。</tt>";
		//e.printStackTrace();
	}



//*********************************************hyojibu shori owari***************
       helloworldForm.setText(tmp);
       helloworldForm.setOpt(month);


        return map.getInputForward();

}


  }