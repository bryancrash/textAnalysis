package analysis.service.impl;

import analysis.mapper.DocsetMapper;
import analysis.model.Docset;
import analysis.model.DocsetExample;
import analysis.service.IDocSetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/3/27.
 */
@Service
public class DocSetServiceImpl implements IDocSetService {
    @Autowired
    private DocsetMapper docsetDao;

    public Docset get(String id){
        return docsetDao.selectByPrimaryKey(id);
    }

    public List<Docset> findList(){
        DocsetExample docsetExample=new DocsetExample();
        docsetExample.createCriteria();
        return docsetDao.selectByExample(docsetExample);
    }

    public int saveDocSet(Docset docset){
        return this.docsetDao.insert(docset);
    }

    public int deleteDocSet(String id){
        return this.docsetDao.deleteByPrimaryKey(id);
    }

    public int updateDocSet(Docset docset){
        return this.docsetDao.updateByPrimaryKey(docset);
    }

    public List<Docset> findDocSet(String docSetName){
        DocsetExample docsetExample=new DocsetExample();
        docsetExample.createCriteria().andDocsetNameLike(docSetName);
        return docsetDao.selectByExample(docsetExample);
    }
}
