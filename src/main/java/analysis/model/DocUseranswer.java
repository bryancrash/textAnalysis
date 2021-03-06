package analysis.model;

import java.util.List;

public class DocUseranswer {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doc_useranswer.id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doc_useranswer.user_id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    private String userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column doc_useranswer.doc_id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    private String docId;

    private SysUser sysUser;

    private List<AnswerValue> userAnswers;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doc_useranswer.id
     *
     * @return the value of doc_useranswer.id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doc_useranswer.id
     *
     * @param id the value for doc_useranswer.id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doc_useranswer.user_id
     *
     * @return the value of doc_useranswer.user_id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doc_useranswer.user_id
     *
     * @param userId the value for doc_useranswer.user_id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column doc_useranswer.doc_id
     *
     * @return the value of doc_useranswer.doc_id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    public String getDocId() {
        return docId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column doc_useranswer.doc_id
     *
     * @param docId the value for doc_useranswer.doc_id
     *
     * @mbggenerated Mon May 15 16:32:15 CST 2017
     */
    public void setDocId(String docId) {
        this.docId = docId;
    }

    public SysUser getSysUser(){
        return sysUser;
    }

    public void setSysUser(SysUser sysUser){
        this.sysUser=sysUser;
    }

    public List<AnswerValue> getUserAnswers(){
        return userAnswers;
    }

    public void setUserAnswers(List<AnswerValue> userAnswers){
        this.userAnswers=userAnswers;
    }
}