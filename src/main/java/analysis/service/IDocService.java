package analysis.service;

import analysis.model.Document;

import java.util.List;

/**
 * Created by ${tianlin} on 2017/3/24.
 */
public interface IDocService {
    public int addDoc(Document document);
    public List<Document> findList();
}
