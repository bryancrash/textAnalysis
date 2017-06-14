package analysis.controller.admin;

import analysis.model.Indicator;
import analysis.model.IndicatorSys;
import analysis.service.impl.IndServiceImpl;
import analysis.service.impl.IndSysServiceImpl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/4/6.
 */
@Controller
@RequestMapping("admin/indSys")
public class IndSysController {
    private static Logger logger = Logger.getLogger(IndSysController.class);
    @Autowired
    private IndSysServiceImpl indSysService;
    @Autowired
    private IndServiceImpl indService;


    @RequestMapping("/list")
    public String list(Model model){
        List<IndicatorSys> indsyslist=indSysService.findList();
        model.addAttribute("indsyslist",indsyslist);
        return "admin/indicatorSysList";
    }

    @RequestMapping("/save")
    public String save(IndicatorSys indicatorSys){
        indSysService.saveIndSys(indicatorSys);
        return "redirect:/admin/indSys/list";
    }

    @RequestMapping("/search")
    public String search(@RequestParam("indicatorTitle") String indicatorTitle,Model model){
        List<IndicatorSys> indsyslist=indSysService.findIndSys(indicatorTitle);
        model.addAttribute("indsyslist",indsyslist);
        return "admin/indicatorSysList";
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") String id){
        indSysService.deleteIndSys(id);
        return "redirect:/admin/indSys/list";
    }

    @RequestMapping("/get")
    public String get(@RequestParam("flg") String flg,@RequestParam("id") String id,Model model){
        IndicatorSys indSys=indSysService.getIndSys(id);
        model.addAttribute("indSys",indSys);
        if("view".equals(flg)){
            return "admin/indSysView";
        }
        return "admin/indSysUpdate";
    }

    @RequestMapping("/update")
    public String update(IndicatorSys indicatorSys){
        indSysService.updateIndSys(indicatorSys);
        return "redirect:/admin/indSys/list";
    }

    @RequestMapping("/addIndicators")
    public String addIndicators(@RequestParam("id") String id,Model model){
        List<Indicator> indicatorList=indService.findList(id);
        IndicatorSys indicatorSys=indSysService.getIndSys(id);
        logger.info("indicatorList的大小为====="+indicatorList.size());
        model.addAttribute("indicatorList",indicatorList);
        logger.info("指标体系的id为====="+id);
        model.addAttribute("indicatorSys",indicatorSys);
        return "admin/addIndicators";
    }

}
