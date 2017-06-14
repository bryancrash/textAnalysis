package analysis.service.impl;

import analysis.mapper.OptionsMapper;
import analysis.model.Options;
import analysis.model.OptionsExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/4/14.
 */
@Service
public class OptionServiceImpl {
    @Autowired
    private OptionsMapper optionsDao;

    public int  saveOptions(Options options){
        return this.optionsDao.insert(options);
    }

    public List<Options> getOptionsByIndId(String id){
        OptionsExample optionsExample=new OptionsExample();
        optionsExample.createCriteria().andIndicatorIdEqualTo(id);
        List<Options> optionsList=optionsDao.selectByExample(optionsExample);
        return optionsList;
    }

    public int deleteOptionsByIndId(String indicator_id) {
        OptionsExample optionsExample=new OptionsExample();
        optionsExample.createCriteria().andIndicatorIdEqualTo(indicator_id);
        return this.optionsDao.deleteByExample(optionsExample);
    }
}
