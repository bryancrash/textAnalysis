package analysis.service.impl;

import analysis.mapper.DocumentMapper;
import analysis.model.Document;
import analysis.model.DocumentExample;
import analysis.service.IDocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/3/24.
 */
@Service("docServiceImpl")
public class DocServiceImpl implements IDocService {
    @Autowired
    private DocumentMapper docDao;

    public int addDoc(Document document) {

        return docDao.insert(document);
    }

    public Document getDoc(String id){
        return docDao.selectByPrimaryKey(id);
    }

    public int updateDoc(Document document){
        return docDao.updateByPrimaryKey(document);
    }

    public int updateDocIndSys(Document document){
        return docDao.updateByPrimaryKeySelective(document);
    }

    public int deleteDoc(String id){
        return docDao.deleteByPrimaryKey(id);
    }

    public List<Document> findList(){
        DocumentExample docexample=new DocumentExample();
        docexample.createCriteria();
        return docDao.selectByExample(docexample);
    }

    public List<Document> findDoc(String docName){
        DocumentExample docexample=new DocumentExample();
        docexample.createCriteria().andDocnameLike(docName);
        return docDao.selectByExample(docexample);
    }

    public List<Document> findByDocSetId(String docsetId){
        DocumentExample docexample=new DocumentExample();
        docexample.createCriteria().andDocsetidEqualTo(docsetId);
        return docDao.selectByExample(docexample);
    }

    public Document toMark(String id){
        return docDao.selectAllByPrimaryKey(id);
    }

    public Document getAllByPrimaryKey(String id){
        return docDao.selectAllByPrimaryKey(id);
    }
}
