public class Ebe {
	
    //public static string jsonStr = '{"SystemName":"INLIGHT","cv":null,"cdl":null,"AuditQuestionnaire":{"version":1.0,"QuestionnaireType":1,"ExternalAuditAttachmentId":"00000000-0000-0000-0000-000000000000","ChecklistId":"c3cfe308-3040-4c92-8b8a-6c635a36089b","AuditQuestionnaireQuestions":[{"FlagForReviewer":null,"ChecklistVersion":"2","CheckListQuestionId":"daa7ce0c-c569-4ccb-91ae-02a9e79f5bf5","CheckListId":"c3cfe308-3040-4c92-8b8a-6c635a36089b","AuditQuestionnaireComments":[],"AuditQuestionnaireAttachments":[],"AuditQuestionnaireAnswerTableValues":[{"TableType":"Fixed Rows and Columns","TableRowID":"ddf95f7e-ab77-48ff-bdea-8995e3e9f1be","RowData":[{"ColumnValue":"Ebenezer","ColumnType":"Text","ColumnName":"First Name ","ColumnId":"49852794-b9e5-4560-b07f-87f8d7bbb32f"},{"ColumnValue":"Rajakumar","ColumnType":"Text","ColumnName":"Last Name ","ColumnId":"d1db4d21-02e3-424f-9c88-edc2b189bca2"},{"ColumnValue":"Mr.","ColumnType":"Text","ColumnName":"Title ","ColumnId":"da87705c-bfbd-4571-8a77-5555c8b2dd46"}],"IsDVVerified":false}],"AuditQuestionnaireAnswers":[]},{"FlagForReviewer":null,"ChecklistVersion":"2","CheckListQuestionId":"7c26e377-c504-47de-a0fa-099af1aefc36","CheckListId":"c3cfe308-3040-4c92-8b8a-6c635a36089b","AuditQuestionnaireComments":[],"AuditQuestionnaireAttachments":[],"AuditQuestionnaireAnswerTableValues":[{"TableType":"Fixed Rows and Columns","TableRowID":"a2d8bf8a-795e-4c23-92f6-882ad83adf37","RowData":[{"ColumnValue":"Mobile","ColumnType":"Dropdown","ColumnName":"Phone Type","ColumnId":"41aba45d-a67d-4a6b-81f0-baf302c84ead"},{"ColumnValue":"44","ColumnType":"Text","ColumnName":"Country Code","ColumnId":"c6193a0c-4931-4126-a341-d2c561fc260a"},{"ColumnValue":"232","ColumnType":"Text","ColumnName":"Area Code","ColumnId":"5cf9b56b-7180-438d-83b6-4d5cc69c3157"},{"ColumnValue":"123343343","ColumnType":"Text","ColumnName":"Number","ColumnId":"8dde9216-093d-4919-a746-3c207d839268"}],"IsDVVerified":false}],"AuditQuestionnaireAnswers":[]},{"FlagForReviewer":null,"ChecklistVersion":"2","CheckListQuestionId":"8c9bc362-fe36-413e-9112-420794626590","CheckListId":"c3cfe308-3040-4c92-8b8a-6c635a36089b","AuditQuestionnaireComments":[],"AuditQuestionnaireAttachments":[],"AuditQuestionnaireAnswerTableValues":[],"AuditQuestionnaireAnswers":[{"LocalLanguageCode":null,"LocalLanguageAnswerText":null,"IsDVVerified":false,"FlagForReviewer":null,"CheckListQuestionAnswerOptionId":"e58d437a-a9ca-4cd7-9c31-46840516bcb5","AuditQuestionnaireDropDownAnswerOptionId":null,"AuditQuestionnaireComments":[],"AuditQuestionnaireAttachments":[],"AnswerYValue":null,"AnswerXValue":null,"AnswerValue":null,"AnswertTypeCode":"Single Selection","AnswerText":null,"AnswerDate":null}]}]},"Audit":{"IsFullAccessDenied":1,"FirstReviewRequired":true,"AuditId":"a0L1w000000cJk8EAE"}}';
    
    @AuraEnabled
    public static JSON2Apex parseJson(){
        
        String jsonStr;
        //jsonStr = '{"SystemName":"INLIGHT","cv":null,"cdl":null}'; //working
        jsonStr = '{"SystemName":"INLIGHT","cv":null,"cdl":null,"Audit":{"IsFullAccessDenied":1,"FirstReviewRequired":true,"AuditId":"a0L1w000000cJk8EAE"}}';
        System.debug('json Str --> '+ jsonStr);
		        
        JSON2Apex wrp = JSON2Apex.parse( jsonStr );
        
        System.debug('SystemName --> '+ wrp.SystemName );
        System.debug('Audit --> '+ wrp.Audit );
        
        //return JSON.serialize(wrp);
        return wrp;
    }
    
}