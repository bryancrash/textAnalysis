package analysis.service.impl;

import analysis.mapper.IndicatorSysMapper;
import analysis.model.IndicatorSys;
import analysis.model.IndicatorSysExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/4/6.
 */
@Service
public class IndSysServiceImpl {
    @Autowired
    private IndicatorSysMapper indicatorSysDao;

    public List<IndicatorSys> findList(){
        IndicatorSysExample indicatorSysExample=new IndicatorSysExample();
        indicatorSysExample.createCriteria();
        return indicatorSysDao.selectByExample(indicatorSysExample);
    }

    public List<IndicatorSys> findIndSys(String indicatorTitle){
        IndicatorSysExample indicatorSysExample=new IndicatorSysExample();
        indicatorSysExample.createCriteria().andIndicatorTitleLike(indicatorTitle);
        return this.indicatorSysDao.selectByExample(indicatorSysExample);
    }

    public int saveIndSys(IndicatorSys indicatorSys){
        return this.indicatorSysDao.insert(indicatorSys);
    }

    public int deleteIndSys(String id){
        return this.indicatorSysDao.deleteByPrimaryKey(id);
    }

    public IndicatorSys getIndSys(String id){
        return this.indicatorSysDao.selectByPrimaryKey(id);
    }

    public int updateIndSys(IndicatorSys indicatorSys){
        return this.indicatorSysDao.updateByPrimaryKey(indicatorSys);
    }
}
