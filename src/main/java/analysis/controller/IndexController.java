package analysis.controller;

import analysis.model.Docset;
import analysis.model.Document;
import analysis.model.SysUser;
import analysis.service.impl.DocServiceImpl;
import analysis.service.impl.DocSetServiceImpl;
import analysis.service.impl.MarkResultServiceImpl;
import analysis.service.impl.UserServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by ${tianlin} on 2017/6/1.
 */
@Controller
public class IndexController {
    private static Logger logger = Logger.getLogger(IndexController.class);

    @Autowired
    private DocSetServiceImpl docsetService;
    @Autowired
    private DocServiceImpl docService;
    @Autowired
    private MarkResultServiceImpl markResultService;

    /**
     * 显示首页文本部分
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(Model model){
        List<Docset> docsetList=docsetService.findList();
        logger.info("一共有===="+docsetList.size()+"个文本集");
        for (Docset docset:docsetList) {
            System.out.println(docset.getDocsetName()+"一共有"+docset.getDocuments().size()+"个文本");
            for(Document document:docset.getDocuments()){
                System.out.println(document.getDocname());
            }
        }
        model.addAttribute("docsetList",docsetList);
        return "main";
    }

    /**
     * 文本打分界面
     * @param id 文本id
     * @param user_id 用户id
     * @param model
     * @return
     */
    @RequestMapping("/toMark")
    public String toMark(@RequestParam("id") String id, @RequestParam("user_id") String user_id, Model model){
        int docUseranswerNum=markResultService.getAnswerByDocIdAndUserId(id,user_id);
        Boolean isMarked=false;
        if(docUseranswerNum>0){
            isMarked=true;
        }

        Document document=docService.toMark(id);
        model.addAttribute("isMarked",isMarked);
        model.addAttribute("document",document);
        return "mark";
    }

    /**
     * 阅读文本
     * @param filePath
     * @param model
     * @return
     */
    @RequestMapping("/readOnline")
    public String readOnline(@RequestParam("filePath") String filePath, Model model){
        logger.info("进入阅读器======");
        logger.info(filePath);
        model.addAttribute("filePath",filePath);
        return "readonline";
    }

    /**
     * 首页欢迎部分
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome(){
        return "welcome";
    }

}
