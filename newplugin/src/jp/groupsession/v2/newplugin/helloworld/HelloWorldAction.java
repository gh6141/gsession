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



 		    String sfiltermoji= "";
 		    String freset="false";


		    String[] w = {"日","月","火","水","木","金","土"};

		    List<String> TkStLst;


try	{
String pst="0000/00/00";


String str3 = null;String str4k = null;	String tmp3=null;String tmp4k=null;

		BufferedReader in3=new BufferedReader(new FileReader(this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_path.txt")));
		while((str3=in3.readLine())!=null) {
			tmp3=str3;
			//System.out.println("/"+tmp3+"/"+"/");
		}
		in3.close();

		//tmp3: xlsx file path;


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


			   Calendar today = new GregorianCalendar();

			   today.add(Calendar.DATE,-1);

				    String gyo="";String gatu="";String dt="";String st[];String knm[];String nen;String his;
				    Integer nichi=0;String mae,ato;

//				    Matcher m;
					wb = WorkbookFactory.create(inp);


					//高速化のため、今月、１０日分表示では、今月と来月しか読み込まない
					//************シートは４月から順に並んでいる必要あり
					Integer sm=0;//シート読み取り開始
					Integer em=0;//シート読み取り終了

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


				    }// all sheet owari


			       inp.close();

			       TkStLst= List.of("04","05","06","07","08","09","10","11","12","01","02","03");

		}else{
			 //System.out.println(path3+":見つかりません！");
			 //out.print("<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です</tt>");
		 tmp=tmp+"<tt>*****</tt>\t<tt>予定表示のためには["+tmp3+"]のファイルが必要です</tt>";
		}


	} catch (Exception e) {
       //  tmp=tmp+"<tt>読み取りエラー。エクセル形式が違います。シート数が13か確認してください。</tt>";
		//　１３以外のシートのときこちらで処理





	}



//*********************************************hyojibu shori owari***************
String opts=TkStLst.stream()
.map(x -> "<option value=\""+x+"\">"+x+"月</option>")
.collect(Collectors.joining());


  tmp=""
	  		+ "<form method=\"post\" action=\"#\">\r\n" +
	  		"<select property=\"opt\" name=\"opt\" onchange=\"submit(this.form)\">"+
				opts+
				"</select>"

				+ "</form>"+tmp;


       helloworldForm.setText(tmp);
       helloworldForm.setOpt(month);


        return map.getInputForward();

}


  }