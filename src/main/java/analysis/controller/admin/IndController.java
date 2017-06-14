package analysis.controller.admin;

import analysis.model.Indicator;
import analysis.model.Options;
import analysis.service.impl.IndServiceImpl;
import analysis.service.impl.OptionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/4/14.
 */
@Controller
@RequestMapping("admin/ind")
public class IndController {
    @Autowired
    private IndServiceImpl indService;
    @Autowired
    private OptionServiceImpl optionService;

    @RequestMapping("/save")
    public String save(Indicator indicator){
        indService.saveInd(indicator);
        return "redirect:/admin/indSys/addIndicators?id="+indicator.getIndicatorSysId();
    }

    @RequestMapping("/indicatorform")
    public String indicatorform(@RequestParam("id") String id,Model model){
        model.addAttribute("indSys_id",id);
        return "admin/indicatorForm";
    }

    @RequestMapping("/getOptions")
    public String getOptions(@RequestParam("indicator_id") String indicator_id,Model model){
        Indicator indicator=indService.getIndById(indicator_id);
        List<Options> optionsList=optionService.getOptionsByIndId(indicator_id);
        model.addAttribute("indicator",indicator);
        model.addAttribute("optionsList",optionsList);
        return "admin/indicatorView";
    }

    @RequestMapping("/deleteOptions")
    public String deleteIndicator(@RequestParam("indSys_id") String indSys_id,@RequestParam("indicator_id") String indicator_id){
        indService.deleteIndicatorById(indicator_id);
        optionService.deleteOptionsByIndId(indicator_id);
        return "redirect:/admin/indSys/addIndicators?id="+indSys_id;
    }


}
