public class JSON2Apex {

	public class AuditQuestionnaireQuestions {
		public Object FlagForReviewer;
		public String ChecklistVersion;
		public String CheckListQuestionId;
		public String CheckListId;
		public List<AuditQuestionnaireComments> AuditQuestionnaireComments;
		public List<AuditQuestionnaireComments> AuditQuestionnaireAttachments;
		public List<AuditQuestionnaireAnswerTableValues> AuditQuestionnaireAnswerTableValues;
		public List<AuditQuestionnaireComments> AuditQuestionnaireAnswers;
	}

	public class Audit {
		public Integer IsFullAccessDenied;
		public Boolean FirstReviewRequired;
		public String AuditId;
	}

	public class RowData {
		public String ColumnValue;
		public String ColumnType;
		public String ColumnName;
		public String ColumnId;
	}

    @AuraEnabled public String SystemName { get; set; }
	public Object cv { get; set; }
	public Object cdl { get; set; }
	public AuditQuestionnaire AuditQuestionnaire { get; set; }
	public Audit Audit { get; set; }

	public class AuditQuestionnaireComments {
	}

	public class AuditQuestionnaire {
		public Integer version;
		public Integer QuestionnaireType;
		public String ExternalAuditAttachmentId;
		public String ChecklistId;
		public List<AuditQuestionnaireQuestions> AuditQuestionnaireQuestions;
	}

	public class AuditQuestionnaireAnswers {
		public Object LocalLanguageCode;
		public Object LocalLanguageAnswerText;
		public Boolean IsDVVerified;
		public Object FlagForReviewer;
		public String CheckListQuestionAnswerOptionId;
		public Object AuditQuestionnaireDropDownAnswerOptionId;
		public List<AuditQuestionnaireComments> AuditQuestionnaireComments;
		public List<AuditQuestionnaireComments> AuditQuestionnaireAttachments;
		public Object AnswerYValue;
		public Object AnswerXValue;
		public Object AnswerValue;
		public String AnswertTypeCode;
		public Object AnswerText;
		public Object AnswerDate;
	}

	public class AuditQuestionnaireAnswerTableValues {
		public String TableType;
		public String TableRowID;
		public List<RowData> RowData;
		public Boolean IsDVVerified;
	}

	
	public static JSON2Apex parse(String json) {
		return (JSON2Apex) System.JSON.deserialize(json, JSON2Apex.class);
	}
}