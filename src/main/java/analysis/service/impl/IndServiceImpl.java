package analysis.service.impl;

import analysis.mapper.IndicatorMapper;
import analysis.model.Indicator;
import analysis.model.IndicatorExample;
import analysis.model.Options;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Created by ${tianlin} on 2017/4/14.
 */
@Service
public class IndServiceImpl {
    @Autowired
    private IndicatorMapper indicatorDao;
    @Autowired
    private OptionServiceImpl optionService;

    public List<Indicator> findList(String indSysId){
        IndicatorExample indicatorExample=new IndicatorExample();
        indicatorExample.setOrderByClause("id");
        indicatorExample.createCriteria().andIndicatorSysIdEqualTo(indSysId);
        return indicatorDao.selectByExample(indicatorExample);
    }

    public void saveInd(Indicator indicator){
        UUID uuid= UUID.randomUUID();
        indicator.setId(uuid.toString());
        indicatorDao.insert(indicator);

        for (Options option : indicator.getOptionsList()){
            option.setIndicatorId(uuid.toString());
            optionService.saveOptions(option);
        }
    }

    public Indicator getIndById(String id){
        return indicatorDao.selectByPrimaryKey(id);
    }

    public int deleteIndicatorById(String indicator_id) {
        return this.indicatorDao.deleteByPrimaryKey(indicator_id);
    }
}
