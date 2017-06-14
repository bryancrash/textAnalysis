package analysis.controller.admin;

import analysis.model.*;
import analysis.service.impl.*;
import analysis.utils.Office2Swf;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by ${tianlin} on 2017/3/23.
 */
@Controller
@RequestMapping("admin/doc")
public class DocController {
    private static Logger logger = Logger.getLogger(DocController.class);
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private HttpSession session;
    @Autowired
    private DocServiceImpl docService;
    @Autowired
    private DocSetServiceImpl docsetService;
    @Autowired
    private IndSysServiceImpl indSysService;
    @Autowired
    private IndScoreServiceImpl indScoreService;
    @Autowired
    private MarkResultServiceImpl markResultService;

    @RequestMapping("/docUpload")
    public String docUpload(@RequestParam("docfile") MultipartFile file,@RequestParam("docsetid") String docsetid,@RequestParam("remarks") String remark,Model model){
        // 判断文件是否为空
        logger.info("开始转换文本========");
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                String filePath = request.getSession().getServletContext().getRealPath("fileUpload");

                String fileName = file.getOriginalFilename();
                // 转存文件
                File targetFile = new File(filePath, fileName);
                //目录不存在，则创建目录
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }
                //保存
                try {
                    file.transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                String uploadFilePath=filePath+File.separator + fileName;
                String uploadFileName=new File(uploadFilePath).getName();
                String fileFixName=uploadFileName.split("\\.")[0];
                String fileNewName= UUID.randomUUID().toString();
                String outFilePath = uploadFilePath.replace(uploadFileName, fileNewName+".swf");
                logger.info("转换后的文件名称为======"+outFilePath);
                outFilePath = Office2Swf.office2Swf(uploadFilePath, outFilePath);

                //保存文档
                Document document=new Document();
                Date date=new Date();
                String outFilefixPath=request.getContextPath()+"/fileUpload/"+fileNewName+".swf";
                logger.info("outFilefixPath======="+outFilefixPath);
                document.setDocname(fileFixName);
                document.setDocpath(outFilefixPath);
                document.setAddtime(date);
                document.setRemarks(remark);
                document.setDocsetid(docsetid);
                docService.addDoc(document);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/admin/doc/list";
    }

    @RequestMapping("/getDoc")
    public String getDoc(@RequestParam("flg") String flg,@RequestParam("id") String id,Model model){
        Document document=docService.getDoc(id);
        model.addAttribute("document",document);
        if("update".equals(flg)){
            return "admin/docUpdate";
        }
        return "admin/docView";
    }


    @RequestMapping("/updateDoc")
    public String updateDoc(Document document){
        docService.updateDoc(document);
        return "redirect:/admin/doc/list";
    }

    @RequestMapping("/deleteDoc")
    public String deleteDoc(@RequestParam("id") String id){
        docService.deleteDoc(id);
        return "redirect:/admin/doc/list";
    }

    @RequestMapping("/searchDoc")
    public String searchDoc(@RequestParam("docName") String docName,Model model){
        List<Document> docList=docService.findDoc(docName);
        model.addAttribute("docList",docList);
        return "admin/docList";
    }

    @RequestMapping("/list")
    public String list(Model model){
        List<Document> docList=docService.findList();
        logger.info("一共查询到===="+docList.size());
        model.addAttribute("docList",docList);
        return "admin/docList";
    }

    @RequestMapping("/assIndSys")
    public String assIndSys(@RequestParam("id") String id,Model model){
        List<IndicatorSys> indicatorSysList=indSysService.findList();
        model.addAttribute("indicatorSysList",indicatorSysList);
        model.addAttribute("id",id);
        return "admin/assIndSys";
    }

    @RequestMapping("/updateIndSys")
    public String updateIndSys(Document document){
        docService.updateDocIndSys(document);
        return "redirect:/admin/doc/list";
    }

    @RequestMapping("/addDoc")
    public String addDoc(Model model){
        List<Docset> docsetList=docsetService.findList();
        model.addAttribute("docsetList",docsetList);
        return "admin/addDoc";
    }

    @RequestMapping("/getDocSet")
    public String getDocSet(@RequestParam("flg") String flg,@RequestParam("id") String id,Model model){
        Docset docset=docsetService.get(id);
        List<Document> documentList=docService.findByDocSetId(id);
        logger.info("documentList的大小为===="+documentList.size());
        model.addAttribute("documentList",documentList);
        model.addAttribute("docset",docset);
        if("view".equals(flg)){
            return "admin/docSetView";
        }
        return "admin/docSetUpdate";
    }

    @RequestMapping("/addDocSet")
    public String addDocSet(){
        return "admin/addDocSet";
    }

    @RequestMapping("/docsetSave")
    public String docSetSave(Docset docset){
        docsetService.saveDocSet(docset);
        return "redirect:/admin/doc/docSetList";
    }

    @RequestMapping("/docSetList")
    public String docSetList(Model model){
        List<Docset> docsetList=docsetService.findList();
        logger.info("一共有===="+docsetList.size()+"个文本集");
        for (Docset docset:docsetList) {
            System.out.println(docset.getDocsetName()+"一共有"+docset.getDocuments().size()+"个文本");
            for(Document document:docset.getDocuments()){
                System.out.println(document.getDocname());
            }
        }
        model.addAttribute("docsetList",docsetList);
        return "admin/docSetList";
    }

    @RequestMapping("/deleteDocSet")
    public String deleteDocSet(@RequestParam("id") String id){
        docsetService.deleteDocSet(id);
        return "redirect:/admin/doc/docSetList";
    }

    @RequestMapping("/updateDocSet")
    public String updateDocSet(Docset docset){
        docsetService.updateDocSet(docset);
        return "redirect:/admin/doc/docSetList";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("docSetName") String docSetName,Model model){
        List<Docset> docsetList=docsetService.findDocSet(docSetName);
        model.addAttribute("docsetList",docsetList);
        return "admin/docSetList";
    }
}
