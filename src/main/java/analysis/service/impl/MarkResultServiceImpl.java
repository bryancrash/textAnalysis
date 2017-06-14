package analysis.service.impl;

import analysis.mapper.AnswerValueMapper;
import analysis.mapper.DocUseranswerMapper;
import analysis.model.AnswerValue;
import analysis.model.DocUseranswer;
import analysis.model.DocUseranswerExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/5/15.
 */
@Service
public class MarkResultServiceImpl {
    @Autowired
    private DocUseranswerMapper docUseranswerDao;
    @Autowired
    private AnswerValueMapper answerValueDao;

    public int saveUserMark(DocUseranswer docUseranswer){
        return this.docUseranswerDao.insert(docUseranswer);
    }

    public int saveAnswerValue(AnswerValue answerValue) {
        return this.answerValueDao.insert(answerValue);
    }

    public int getAnswerByDocIdAndUserId(String doc_id, String user_id ){
        DocUseranswerExample docUseranswerExample=new DocUseranswerExample();
        DocUseranswerExample.Criteria  criteria=docUseranswerExample.createCriteria();
        criteria.andDocIdEqualTo(doc_id);
        criteria.andUserIdEqualTo(user_id);
        int num=docUseranswerDao.countByExample(docUseranswerExample);
        return num;
    }

    public List<DocUseranswer> getDocUseranswersByDocId(String doc_id){
        return docUseranswerDao.selectAllByDocId(doc_id);
    }
}
