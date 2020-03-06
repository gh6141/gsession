package jp.groupsession.v2.gyoji.yotei;

  import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

  import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.sjts.util.date.UDate;
import jp.groupsession.v2.cmn.GSConst;
import jp.groupsession.v2.cmn.dao.BaseUserModel;
import jp.groupsession.v2.cmn.dao.GroupModel;
import jp.groupsession.v2.cmn.dao.UsidSelectGrpNameDao;
import jp.groupsession.v2.sch.dao.SchDataDao;
import jp.groupsession.v2.sch.model.SchDataModel;
import jp.groupsession.v2.struts.AbstractGsAction;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.*;
import java.text.*;


  public class YoteiAction extends AbstractGsAction {

      /**
       * <br>[機  能] アクションを実行する
       * <br>[解  説]
       * <br>[備  考]
       * @param map ActionMapping
       * @param form ActionForm
       * @param req HttpServletRequest
       * @param res HttpServletResponse
       * @param con DB Connection
       * @return ActionForward
       * @throws Exception 実行時例外
       */
      public ActionForward executeAction(ActionMapping map,
                                          ActionForm form,
                                          HttpServletRequest req,
                                          HttpServletResponse res,
                                          Connection con)
          throws Exception {

     //     SchDataDao sDao = new SchDataDao(con);
           //  int cc=sDao.delete(3);
           //  System.out.print("sakujosu:"+cc);


    	 YoteiForm yoteiForm = (YoteiForm)form;

    	String t3= yoteiForm.getText();
        String t4= yoteiForm.getText4();

         String path3="";
         String path4k="";
     	String tmp3=null;

         try{
        	  path3 = this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_path.txt");
        	  path4k = this.getServlet().getServletContext().getRealPath("/WEB-INF/plugin/newplugin/excel_komoku.txt");

           	 if (t3!=null && t3.length()!=0){
        		 FileWriter filewriter = new FileWriter(path3);
                 filewriter.write(t3);
                 filewriter.close();
        	 }


           	 if (t4!=null && t4.length()!=0){
             FileWriter filewriter2 = new FileWriter(path4k);
             filewriter2.write(t4);
             filewriter2.close();
           	 }

         }catch(Exception e){
        	 tmp3="Err:/WEB-INF/plugin/newplugin/excel_path.txtやexcel_komoku.txtがありません";



         }





    	 String str3 = null;String str4k = null;String tmp4k=null;
    	 try{

        	 BufferedReader in3=new BufferedReader(new FileReader(path3));
        	 while((str3=in3.readLine())!=null) {
        	 tmp3=str3;
        	 }
        	 in3.close();

        	 BufferedReader in4k=new BufferedReader(new FileReader(path4k));
        	 while((str4k=in4k.readLine())!=null) {
        	 tmp4k=str4k;
        	 }
        	 in4k.close();
    	 }catch(Exception e){

    	 }


          yoteiForm.setText(tmp3);
          yoteiForm.setText4(tmp4k);

          /**

         // return (map.findForward("sucsess"));

          //db***********************************
          //HttpServletRequestからHttpSessionを取得します。
          HttpSession session = req.getSession();
          //セッション情報からログインユーザの情報を取得します。
          BaseUserModel usModel =
             (BaseUserModel) session.getAttribute(GSConst.SESSION_KEY);

          //セッション情報からユーザSIDを取得
          int usrSid = usModel.getUsrsid();
          //データアクセスオブジェクトを生成

         List<Integer> usrSidList = new ArrayList<Integer>();


          usrSidList.add(usrSid);

          int schSid=-1;
          UDate crnt = new UDate();

          int y=crnt.getYear();
          int m=crnt.getMonth();
          int yt=0;
          if (m>=4) {yt=y; }else{ yt=y-1;}

          UDate frDate=new UDate();
          frDate.setDate( yt, 4, 1);


          UDate toDate=new UDate();
          toDate.setDate(yt+1,3,31);

          int schGrpSid=-1;
          String copyFlg="0";


          SchDataModel sDM= new SchDataModel();
         // sDM.setScdSid(16);
          sDM.setScdUsrSid(101);
          sDM.setScdValue("naiyo");
          sDM.setScdTitle("title");
          UDate tD=new UDate();
          tD.setTimeStamp(yt,7,5,9,10,0);
          sDM.setScdFrDate(tD);
          UDate t2D=new UDate();
          t2D.setTimeStamp(yt,7,5,10,0,0);
          sDM.setScdToDate(t2D);

          sDM.setScdUsrKbn(0);//0user 1group
          sDM.setScdDaily(0);//0 jikansitei  1 siteinasi


          sDM.setScdGrpSid(-1);


          sDM.setScdBgcolor(1);//10水色、
          sDM.setScdBiko("");
          sDM.setScdPublic(0);
          sDM.setScdAuid(101);
          sDM.setScdAdate( tD);
          sDM.setScdEuid(101);
          sDM.setScdEdate( tD);
          sDM.setSceSid(-1);
          sDM.setScdEdit(0);
          sDM.setScdRsSid(-1);
          sDM.setScdAttendKbn(0);
          sDM.setScdAttendAns(0);
          sDM.setScdAttendAuKbn(1);

          sDao.insert(sDM);

          con.commit();
          List<SchDataModel> schList= sDao.getSchDataEx(usrSidList, schSid, frDate, toDate, schGrpSid) ;
          //SchDataModel schListx= sDao.getSchData(1) ;
         // System.out.println(schList.get(0).getScdTitle());
          *
          *
          *

          yoteiForm.setSchList(schList);
 **/
          //*************************************
             return map.getInputForward();

         }








  }