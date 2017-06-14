package analysis.controller;

import analysis.model.AnswerValue;
import analysis.model.DocUseranswer;
import analysis.model.Document;
import analysis.model.Indicator;
import analysis.service.impl.DocServiceImpl;
import analysis.service.impl.MarkResultServiceImpl;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.Region;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by ${tianlin} on 2017/5/15.
 */
@Controller
@RequestMapping("/mark")
public class MarkResultController {
    private static Logger logger = Logger.getLogger(MarkResultController.class);
    @Autowired
    private MarkResultServiceImpl markResultService;
    @Autowired
    private DocServiceImpl docService;

    @ResponseBody
    @RequestMapping(value="/saveMark",produces="application/json")
    public Map<String,Object> saveMark(@RequestParam("user_id") String user_id,
                                       @RequestParam("doc_id") String doc_id,

                                       @RequestParam("indicator_ids") String[] indicator_ids,
                                       @RequestParam("values") String[] values){

        Boolean result=true;
        Map<String,Object> map=new HashMap<String,Object>();

        UUID uuid= UUID.randomUUID();
        DocUseranswer docUseranswer=new DocUseranswer();
        docUseranswer.setId(uuid.toString());
        docUseranswer.setDocId(doc_id);
        docUseranswer.setUserId(user_id);
        int usernum=markResultService.saveUserMark(docUseranswer);
        if(usernum<1){
            result=false;
            map.put("result",result);
            return map;
        }

        int num=1;
        for(int i=0;i<values.length;i++){
            AnswerValue answerValue=new AnswerValue();
            answerValue.setIndicatorId(indicator_ids[i]);
            answerValue.setOptionId(values[i]);
            answerValue.setAnswerId(uuid.toString());
            num=markResultService.saveAnswerValue(answerValue);
            if(num<1){
                result=false;
                map.put("result",result);
                return map;
            }
        }
        map.put("result",result);
        return map;
    }

    @RequestMapping("/getStatistics")
    public String getStatistics(@RequestParam("doc_id") String doc_id,Model model){
        Document document=docService.getAllByPrimaryKey(doc_id);
        List<DocUseranswer> docUseranswerList=markResultService.getDocUseranswersByDocId(doc_id);
        model.addAttribute("document",document);
        model.addAttribute("docUseranswerList",docUseranswerList);
        return "resultTable";
    }

    @RequestMapping(value="/OutputExcel")
    public void OutputExcel(@RequestParam("doc_id") String doc_id,
                            HttpServletRequest request,
                            HttpServletResponse response,
                            Model model) throws IOException{
        logger.info("doc_id===="+doc_id);
        Document document=docService.getAllByPrimaryKey(doc_id);
        List<DocUseranswer> docUseranswerList=markResultService.getDocUseranswersByDocId(doc_id);

        try{
        String fileName="《"+document.getDocname()+"》打分统计表.xls";
        fileName=new String(fileName.getBytes("GBK"),"iso8859-1");
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setHeader("Content-Disposition", "attachment;filename="
                + fileName);// 指定下载的文件名
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        OutputStream output = response.getOutputStream();
        BufferedOutputStream bufferedOutPut = new BufferedOutputStream(
                output);

        String worksheetTitle = document.getDocname();


        HSSFWorkbook wb=new HSSFWorkbook();
        HSSFSheet sheet = wb.createSheet();

            // 指定合并区域
            sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) document.getIndicatorSys().getIndicators().size()));
            // 定义单元格格式，添加单元格表样式，并添加到工作簿
            HSSFCellStyle cellStyle1 = wb.createCellStyle();
            // 设置单元格水平对齐类型
            cellStyle1.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            cellStyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            cellStyle1.setWrapText(true);// 指定单元格自动换行
            HSSFFont font1 = wb.createFont();
            font1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            font1.setFontName("宋体");
            font1.setFontHeightInPoints((short)20);
            cellStyle1.setFont(font1);

        //创建表头样式
        HSSFCellStyle cellStyleTitle=wb.createCellStyle();
        //指定单元格居中对齐
        cellStyleTitle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //指定单元格垂直居中对齐
        cellStyleTitle.setWrapText(true);
        // 设置单元格字体
        HSSFFont font = wb.createFont();
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        font.setFontName("宋体");
        font.setFontHeight((short) 200);
        cellStyleTitle.setFont(font);


        //创建内容表格样式
        HSSFCellStyle cellStyle = wb.createCellStyle();
        // 指定单元格居中对齐
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        // 指定单元格垂直居中对齐
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        // 指定当单元格内容显示不下时自动换行
        cellStyle.setWrapText(true);

            HSSFRow rowHead = sheet.createRow(0);
            rowHead.setHeight((short)800);

            // 设置第一行
            HSSFCell cellHead = rowHead.createCell(0);

            // 定义单元格为字符串类型
            cellHead.setCellStyle(cellStyle1);
            cellHead.setCellValue(new HSSFRichTextString(worksheetTitle));


        // 定义第一行
        HSSFRow row1 = sheet.createRow(1);
        row1.setHeightInPoints(25);

        // 第一行第一列
        HSSFCell cell1 = row1.createCell( 0);
        cell1.setCellStyle(cellStyleTitle);
        cell1.setCellValue(new HSSFRichTextString(""));
        List<Indicator> indicatorList=document.getIndicatorSys().getIndicators();
            logger.info("开始记录头信息====");
        for(int i=0;i<indicatorList.size();i++){
            cell1 = row1.createCell(i+1);
            cell1.setCellStyle(cellStyleTitle);
            cell1.setCellValue(new HSSFRichTextString(indicatorList.get(i).getTitle()));
        }

        //从第二行开始
            logger.info("开始记录详细信息====");
        for(int m=0;m<docUseranswerList.size();m++){
            HSSFRow row = sheet.createRow(m+2);
            HSSFCell cell = row.createCell( 0);
            cell.setCellStyle(cellStyle);
            cell.setCellValue(new HSSFRichTextString(docUseranswerList.get(m).getSysUser().getUsername()));
            for(int n=0;n<docUseranswerList.get(m).getUserAnswers().size();n++){
                cell = row.createCell(n+1);
                cell.setCellStyle(cellStyle);
                cell.setCellValue(new HSSFRichTextString(docUseranswerList.get(m).getUserAnswers().get(n).getOption().getValue()));
            }
        }

            bufferedOutPut.flush();
            wb.write(bufferedOutPut);
            bufferedOutPut.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
