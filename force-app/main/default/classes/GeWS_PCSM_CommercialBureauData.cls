/**********************************************************************************************
* @Author: Alagar
* @Class: GeWS_PCSMautoDecision
* @Description: PCSM commercial bureau response is parsed into this class
***********************************************************************************************/
public class GeWS_PCSM_CommercialBureauData{

    public class Shareholdings {
        public String recordType;
        public String issuingCompany;
        public String currentPreviousFlag;
        public String effectiveDate;
        public String shareClassNo;
        public String shareholdingNo;
        public Integer numShares;
        public String totalNominalCapital;
        public Integer percentage;
        public Integer percentageTotalCapital;
        public String approximation;
        public String latestUpdate;
    }

    public class CorporateShareholder {
        public String regNumber;
        public String country;
        public String name { get; set; }
        public String holding;
    }

    public class Sectors {
        public String ageCompGroup;
        public String ageCompGroupName;
        public String ageCompGroupSector;
        public String ageCompGroupSectorEndDate;
        public String ageCompGroupSectorStartDate;
        public String allCompGroup;
        public String allCompGroupName;
        public String indCompGroup;
        public String indCompGroupName;
        public Object indCompGroupSector;
        public Object indCompGroupSectorName;
        public String sizeCompGroup;
        public String sizeCompGroupName;
        public Object sizeCompGroupSector;
        public Object sizeCompGroupSectorLowerBound;
        public Object sizeCompGroupSectorUpperBound;
    }

    public class CurrentDirector {
        public String foreignAddressFlag { get; set; }
        public String directorCompanyFlag { get; set; }
        public String directorNumber { get; set; }
        public String appointmentDate { get; set; }
        public String appointmentIndicator { get; set; }
        public Integer directorshipLength { get; set; }
        public String latestReturns { get; set; }
        public Object noCRef { get; set; }
        public Integer numberConvictions { get; set; }
        public Object convictionDetails { get; set; }
        public DirectorDetails directorDetails { get; set; }
    }

    public class Name {
        public String forename { get; set; }
        public String middleNames { get; set; }
        public String prefix { get; set; }
        public String suffix { get; set; }
        public String surname { get; set; }
    }

    public class Auditor {
        public String currencies { get; set; }
        public String remuneration { get; set; }
        public String nonAuditFee { get; set; }
        public String auditType { get; set; }
        public String auditQual { get; set; }
        public String auditors { get; set; }
    }

    public class Shareholders {
        public List<HeaderInfo> headerInfo;
        public List<ShareCapital> shareCapital;
        public List<Shareholdings> shareholdings;
        public List<Shareholder> shareholder;
    }

    public class SectorRanking {
        public String ageCompGroup;
        public String ageCompSector;
        public Object ageNumberHigherScore;
        public Object ageNumberLowerScore;
        public Object ageNumberSameScore;
        public String ageNumberSector;
        public String agePercentSector;
        public String agePercentile;
        public String allCompGroup;
        public Object allCompSector;
        public Object allNumberHigherScore;
        public Object allNumberLowerScore;
        public Object allNumberSameScore;
        public String allNumberSector;
        public String allPercentSector;
        public String allPercentile;
        public String indCompGroup;
        public Object indCompSector;
        public Object indNumberHigherScore;
        public Object indNumberLowerScore;
        public Object indNumberSameScore;
        public Object indNumberSector;
        public Object indPercentSector;
        public Object indPercentile;
        public String sizeCompGroup;
        public Object sizeCompSector;
        public Object sizeNumberHigherScore;
        public Object sizeNumberLowerScore;
        public Object sizeNumberSameScore;
        public Object sizeNumberSector;
        public Object sizePercentSector;
        public Object sizePercentile;
    }

    public class LimitedCompanyCIFASSummary {
        public Integer numCIFASRecords;
    }

    public class Subsidiaries {
        public String treePosition;
        public Integer totalElements;
        public Integer totalSubs;
        public Integer totalNumImmediateSubs;
        public Integer totalNumLiveImmediateSubs;
        public Integer totalNumDormantImmediateSubs;
        public Integer totalNumDissolvedLiquidatedImmediateSubs;
        public Integer totalNumNestedSubs;
        public Integer totalNumSubs;
        public Integer totalNumUKSubs;
        public Integer totalNumOverseasSubs;
        public List<UkSubsidiaries> ukSubsidiaries;
        public Object foreignSubsidiaries;
    }
    
    public class UkSubsidiaries {
        public String subRegNumber {get;set;} 
        public String subStatus {get;set;} 
        public String subLegalStatus {get;set;} 
        public String subName {get;set;} 
    }
    
    public class SectorScore {
        public String ageAverageDelphiScore;
        public String ageAverageStabilityOdds;
        public String ageCompGroup;
        public String ageCompSector;
        public AgeHistoricalScore ageHistoricalScore;
        public String allAverageDelphiScore;
        public String allAverageStabilityOdds;
        public String allCompGroup;
        public Object allCompSector;
        public AllHistoricalScore allHistoricalScore;
        public Object indAverageDelphiScore;
        public Object indAverageStabilityOdds;
        public Object indCompGroup;
        public Object indCompSector;
        public Object indHistoricalScore;
        public String recentSnapshotDate;
        public List<String> scoreHistoryDate;
        public Object sizeAverageDelphiScore;
        public Object sizeAverageStabilityOdds;
        public Object sizeCompGroup;
        public Object sizeCompSector;
        public Object sizeHistoricalScore;
    }

    public class ScoringData {
        public LimitedCompanyDelphiCAIS limitedCompanyDelphiCAIS { get; set;}
        
        /*public Integer accountingPeriod;
        public Double acidTest;
        public Integer ageMostRecentCCJ;
        public String auditType;
        public String auditorsQualifications;
        public Integer baseTrendShareholdersFunds;
        public Double borrowingRatio;
        public Long capitalEmployed;
        public Double capitalEmployedPercentTotalAssets;
        public String companyAge;
        public Object companyClass;
        public Object consAccounts;
        public Integer creditPeriod;
        public String currAccsAvailabe;
        public Object currencies;
        public Double currentLiabilitiesPercentTotalAssets;
        public Double currentratio;
        public Object dateOfAccounts;
        public Double debtGearing;
        public Object directorsCIFASFlag;
        public Object directorsNOCFlag;
        public Long dividends;
        public String dormancyFlag;
        public Double equityGearing;
        public Object ficheDate;
        public Object filedAccsType;
        public Long fixedAssets;
        public Long grossAssets;
        public String hasSubsidiaries;
        public Integer highestValueCCJ;
        public String incompleteDirsFlag;
        public Long intangibleAssets;
        public String isSubsidiary;
        public Long issuedCapital;
        public String lastDerogatoryItem;
        public String latenessAccounts;
        public Object latestAccountsType;
        public String legalStatus;
        public List<LimitedCompanyDelphiPayment> limitedCompanyDelphiPayment;
        public List<LimitedCompanyDelphiRisk> limitedCompanyDelphiRisk;
        public LimitedCompanyDelphiCAIS limitedCompanyDelphiCAIS { get; set;}
        public Double liquidityStandardRatio;
        public Long netWorth;
        public Integer numAppointmentsLast12;
        public Integer numApprovalVolArrangement;
        public Integer numApptAdministrator;
        public Integer numApptCompLiquidator;
        public Integer numApptReceiver;
        public Integer numApptVolLiquidator;
        public Integer numCompanyDissolved;
        public Integer numCompanyReinstated;
        public Integer numCompletionsVolArrangement;
        public Integer numCurrDirs;
        public Integer numDirsHoldingShares;
        public Integer numDirsIncorpAgents;
        public Integer numDischargeAdministrator;
        public Integer numDismissedPetition;
        public Integer numDisqCurrDirs;
        public Long numEmployees;
        public Integer numIntentionToDissolve;
        public Integer numMeetingsCreditors;
        public Integer numMemArtsChangesLast12Months;
        public Integer numPetitionCompWindUp;
        public Integer numReceiverCeasing;
        public Integer numRegOfficeChangesLast12Months;
        public Integer numResolutionWindUp;
        public Integer numRevocationVoluntaryArrangement;
        public Integer numSatMortgages;
        public Integer numSuspensionVolArrangement;
        public Integer numUnsatMortgages;
        public Integer numUnsatPartSatMortgages;
        public Integer numWindUpOrders;
        public Integer numYearsAccosAvailable;
        public Integer numYearsPreTaxProfitLessThan0Last4Years;
        public Integer numberCCJs0To72;
        public Integer numberCCJs13To24;
        public Integer numberCCJs25To36;
        public Integer numberCCJs37To48;
        public Integer numberCCJs49To60;
        public Integer numberCCJs61To72;
        public Integer numberCCJsLast12Months;
        public Integer numberDaysToFile;
        public Integer oldestCurrDirAge;
        public String outOfDateFlag;
        public Double percentChangeCapitalEmployed;
        public Double percentChangeCurrentRatio;
        public Double percentChangePreTaxProfitLoss;
        public Double percentChangeShareholdersFunds;
        public Double percentChangeTotalAssets;
        public Integer percentageDirsResidentUK;
        public Integer preTaxMarginQuartile;
        public Long preTaxProfitLoss;
        public Double preTaxProfitMargin;
        public String prevAccountsDormancyFlag;
        public String prevAccsAvailabile;
        public Object prevAccsConsAccounts;
        public Object prevAccsCurrency;
        public Double proportionCurrDirsToPrevDirLast12;
        public String regOfficeCIFASIndicator;
        public String region;
        public String reportUpdateFlag;
        public Long retainedEarnings;
        public Long retainedProfit;
        public Double returnOnAssets;
        public Integer returnOnAssetsQuartile;
        public Double returnOnCapital;
        public Long revaluationReserves;
        public SiCInformation1980 siCInformation1980;
        public SiCInformation1980 siCInformation1992;
        public Long shareholdersFunds;
        public Long shortLoans;
        public Double stocksWorkInProgressPercentCurrentAssets;
        public Integer timeSinceLastAccsSubmitted;
        public Integer timeSinceLastApprovalVolArrangement;
        public Integer timeSinceLastApptAdministrator;
        public Integer timeSinceLastApptCompLiquidator;
        public Integer timeSinceLastApptReceiver;
        public Integer timeSinceLastApptVolLiquidator;
        public Integer timeSinceLastCompanyDissolved;
        public Integer timeSinceLastCompanyReinstated;
        public Integer timeSinceLastCompletionVolArrangement;
        public Integer timeSinceLastDerogatoryItem;
        public Integer timeSinceLastDirAppt;
        public Integer timeSinceLastDischargeAdministrator;
        public Integer timeSinceLastDismissedPetition;
        public Integer timeSinceLastIntentionToDissolve;
        public Integer timeSinceLastMeetingCreditors;
        public Integer timeSinceLastPetitionCompWindUp;
        public Integer timeSinceLastReceiverCeasing;
        public Integer timeSinceLastRegOfficeChange;
        public Integer timeSinceLastResolutionWindUp;
        public Integer timeSinceLastRetsSubmitted;
        public Integer timeSinceLastRevocationVolArrangement;
        public Integer timeSinceLastSuspensionVolArrangement;
        public Integer timeSinceLastWindUpHearing;
        public Integer timeSinceLastWindUpOrder;
        public Double totAssetsEmp;
        public Integer totValCCJsPropShareFunds;
        public Long totalAssets;
        public Long totalCurrentAssets;
        public Long totalCurrentLiabilities;
        public Double totalFixedAssetsPercentTotalAssets;
        public Long totalLongTermLiabilities;
        public Long totalTurnover;
        public Double turnoverPerEmp;
        public Integer valCCJsLast24MonthsPropShareFunds;
        public Integer valueCCJs0To72;
        public Integer valueCCJs13To24;
        public Integer valueCCJs25To36;
        public Integer valueCCJs37To48;
        public Integer valueCCJs49To60;
        public Integer valueCCJs61To72;
        public Integer valueCCJsLast12Months;
        public Integer valueMostRecentCCJ;
        public Long workingCapital;
        public Double workingCapitalPercentCurrentPlusFixedAssets;
        */
    }

    public class LimitedCompanyCIFAS {
        public Object limitedCompanyCIFASDetails;
        public LimitedCompanyCIFASSummary limitedCompanyCIFASSummary;
    }

    public class ShareholderDetails {
        public String shareholderType;
        public Name_Z name;
        public Object shareholderQualifications;
        public Object shareholderTitle;
        public CommercialDetail_Z commercialDetail;
        public Object shareholderLocation;
        public Object suppressionFlag;
    }

    public class LimitedCompanyDelphiRisk {
        public String commercialDelphiOverRideFlag;
        public String commercialDelphiScore;
        public String credLimitOverRideFlag;
        public String creditCode;
        public String creditCodeOverRideFlag;
        public String creditLimit;
        public String creditRating;
        public String creditRatingOverRideflag;
    }

    public class DirectorDetails {
        public Name name { get; set; }
        public String dateOfBirth { get; set; }
        public String directorAge { get; set; }
        public String qualifications { get; set; }
        public String title { get; set; }
        public CommercialDetail commercialDetail { get; set; }
        public Location location { get; set; }
        public Object position { get; set; }
        public String occupation { get; set; }
        public String nationality { get; set; }
        public String shareInformation { get; set; }
    }

    public class DirectorNumbers {
        public List<String> directorNumber;
    }

    public class SiCInformation1980 {
        public string code { get; set; }
        public string description { get; set; }
    }
    
    public class SiCInformation1992 {
        public string code { get; set; }
        public string description { get; set; }
    }

    public class AllHistoricalScore {
        public List<String> allHistoricalAverageDelphiScore;
    }

    public class LimitedCompanyDelphiDirector {
        public String directorhsipsCreditorWindDown;
        public String maxOtherDirectorships;
        public Object nocFlag;
        public String numCCJLast12month;
        public String numConvictions;
        public String numCreditorsWindDown;
        public String numFailures;
        public String percentageFailures;
        public String valueCCJLast12month;
    }

    public class CcLs {
        public Integer totalNumberCCL;
        public List<CcLDetail> ccLDetail;
    }
    
    public class CcLDetail {
        public String licenceNumber {get;set;} 
        public String licenceDate {get;set;} 
        public String licenceCategories {get;set;} 
        public Object determinationToRevokeDate {get;set;} 
        public Object determinationToSuspendDate {get;set;} 
        public Object determinationToVaryDate {get;set;} 
        public Object appealDate {get;set;} 
        public Object suspensionDate {get;set;} 
        public Integer suspendPeriod {get;set;} 
        public Object terminationDate {get;set;} 
        public String licenseeDetail {get;set;} 
        public TradingLocation licenseeLocation {get;set;} 
        public List<TradingNames> tradingNames {get;set;} 
    }
    
    public class TradingNames {
        public String tradingName {get;set;} 
    }
    
    public class AccountsRefDate {
        public String dd { get; set; }
        public String mm { get; set; }
    }

    public class Alerts {
        public Object notes;
        public Integer notesCount;
        public String notesLength;
    }

    public class CommercialDelphi {
        public String commDelphiBand { get; set; }
        public String commDelphiBandText { get; set; }
        public String commDelphiScore { get; set; }
        public String conclusionText { get; set; }
        public String creditLimit { get; set; }
        public String creditLimitOverrideIndicator;
        public String creditRating { get; set; }
        public String creditRatingOverrideIndicator;
        public String creditTextLine1;
        public String creditTextLine2;
        public String creditTextLine3;
        public String creditTextLine4;
        public String creditTextLine5;
        public String creditTextOverrideIndicator;
        public String overrideIndicator;
        public String parentIndicator;
        public String stabilityOdds { get; set; }
    }

    public class Mortgages {
        public String dateMostRecentMort { get; set; }
        public String dateMostRecentSat { get; set; }
        public List<MortgageDetail> mortgageDetail {get;set;} 
        public Integer numMortgages { get; set; }
        public Integer numSatMortgages { get; set; }
        public Integer numUnsatMortgages { get; set; }
        public String recMortDateFlag { get; set; }
    }
    
    public class MortgageDetail {
        public Object alterationsToOrder {get;set;} 
        public Object amountChargeIncreased {get;set;} 
        public String amountLatestIssue {get;set;} 
        public Object amountSatisfied {get;set;} 
        public String amountSecured {get;set;} 
        public String chargeNumber {get;set;} 
        public String chargeType {get;set;} 
        public Object chargeeText {get;set;} 
        public List<CommissionDetails> commissionDetails {get;set;} 
        public String creationDate {get;set;} 
        public String currencies {get;set;} 
        public String dateFullySatisfied {get;set;} 
        public Object deedDate {get;set;} 
        public Object executionDate {get;set;} 
        public Object executorDetails {get;set;} 
        public String formType {get;set;} 
        public String fullySatisfiedIndicator {get;set;} 
        public Object latestIssueDate {get;set;} 
        public List<LenderDetails> lenderDetails {get;set;} 
        public Object lodgedDate {get;set;} 
        public Object naturePartialSatisfaction {get;set;} 
        public Integer numberCommissionElements {get;set;} 
        public Integer numberExecutionDates {get;set;} 
        public Integer numberExecutors {get;set;} 
        public Integer numberLenders {get;set;} 
        public Integer numberPartialSatisfactionDataItems {get;set;} 
        public Integer numberPartialSatisfactionDates {get;set;} 
        public Integer numberReceiverAppointmentDates {get;set;} 
        public Integer numberReceiverCessationDates {get;set;} 
        public Integer numberTrustees {get;set;} 
        public Object partialSatisfactionDate {get;set;} 
        public Object propertyAcquiredDate {get;set;} 
        public String propertyDetails {get;set;} 
        public Object propertyReleasedFromCharge {get;set;} 
        public Object publicationTown {get;set;} 
        public Object receiverAppointment {get;set;} 
        public Object receiverCessation {get;set;} 
        public String registrationDate {get;set;} 
        public Object regulatingProvisions {get;set;} 
        public Object resolutionSeriesDate {get;set;} 
        public Object restrictingProvisions {get;set;} 
        public String totalDebenture {get;set;} 
        public Object trusteeDetails {get;set;} 
    }
    
    public class commissionDetails{
        public string commission { get; set; }
    }
    
    public class LenderDetails {
        public String lenderName {get;set;}
    }
    
    public class Bank {
        public Object bankSortcode { get; set; }
        public String bankName { get; set; }
        public TradingLocation  bankLocation { get; set; }
    }

    public Integer bureauId;
    public Object errorObject { get; set; }
    public Response response { get; set; }

    public class Notice6253 {
        public String dateOfNotice;
        public String recordType;
    }

    public class Identification {
        public String legalStatus { get; set; }
        public String incorporationDate { get; set; }
        public String dissolutionDate { get; set; }
        public RegisteredOffice registeredOffice { get; set; }
        public String currencies { get; set; }
        public Integer issuedCapital { get; set; }
        public String asRegisteredOffice { get; set; }
        public String tradingTelephoneNum { get; set; }
        public RegisteredOffice tradingLocation { get; set; }
        public String principalActivities { get; set; }
        public List<SICInformation1980> siCInformation1980 { get; set; }
        public List<SICInformation1992> siCInformation1992 { get; set; }
        public PreviousNames previousNames { get; set; }
        public PreviousAddresses previousAddresses { get; set; }
        public ThomsonData thomsonData { get; set; }
        public FilingDetails filingDetails { get; set; }
        public Auditor auditor { get; set; }
        public Bank bank { get; set; }
        public CrOChanges crOChanges { get; set; }
        public PrevSearches prevSearches { get; set; }
        public CcLs ccLs { get; set; }
    }
    
    public class CrOChanges {
        public List<CrOChangeDetail> crOChangeDetail {get;set;} 
        public Integer numCROChanges {get;set;} 
    }
    
    public class CrOChangeDetail {
        public String documentDate {get;set;} 
        public String documentType {get;set;} 
    }
    
    public class PreviousNames {
        public Integer numPrevNames {get;set;} 
        public List<PreviousName> previousName {get;set;} 
    }
    
    public class PreviousName {
        public String dateChanged {get;set;} 
        public String name {get;set;} 
    }
    
    public class PreviousAddresses {
        public Integer numPrevAddresses {get;set;} 
        public List<PreviousCRO> previousCRO {get;set;} 
    }
    
    public class PreviousCRO {
        public String dateChanged {get;set;} 
        public RegisteredOffice registeredOffice {get;set;} 
    }
    
    public class ThomsonData {
        public String thomsonCustNumber {get;set;} 
        public String lastUpdatedDate {get;set;} 
        public String createdDate {get;set;} 
        public String thomsonPremiseCode {get;set;} 
        public String email {get;set;} 
        public String url {get;set;} 
    }
    
    public class AgeHistoricalScore {
        public List<String> ageHistoricalAverageDelphiScore;
    }

    public class LimitedCompanyDelphiCAIS {
        public String ageMostRecent;
        public String avgBalanceOwnAccounts;
        public String balanceActiveAccounts;
        public String numActiveAccounts;
        public String numDefaults;
        public String numOwnAccounts;
        public String numSettled;
        public String totalBalanceOwnAccounts;
        public String valueDefaults;
        public String worstStatusActive { get; set;}
        public String worstStatusOld { get; set;}
    }

    public class HeaderInfo {
        public String recordType;
        public String issuingCompany;
        public String currentPreviousFlag;
        public String effectiveDate;
        public Object bulkList;
        public String issuedCapital;
        public String legalStatus;
        public Object lastList;
        public String documentType;
        public Object suppressedInfo;
        public String latestCurrent;
        public Object latestPrevious;
        public String latestUpdate;
        public String dateLoaded;
    }

    public class LimitedCompanyDelphiPayment {
        public String averageCurrentDaysBeyondTerm;
        public String averageNumberExperiencesLast3month;
        public String numberOfAccountsCollectionLast12Months;
        public String numberUnpaidAccountsLastMonth;
        public String percentChangeLast3Months;
    }

    public class Directors {
        public List<CurrentDirector> currentDirector { get; set; }
        public List<PreviousDirector> previousDirector { get; set; }
    }
    
    public class PreviousDirector {
        public String foreignAddressFlag { get; set; }
        public String directorCompanyFlag { get; set; }
        public String directorNumber { get; set; }
        public String appointmentDate { get; set; }
        public String appointmentIndicator { get; set; }
        public String resignationDate { get; set; }
        public String resignationIndicator { get; set; }
        public Integer directorshipLength { get; set; }
        public String latestReturns { get; set; }
        public Integer numberConvictions { get; set; }
        public Object convictionDetails {get;set;} 
        public previousDirectorDetails directorDetails { get; set; }
    }
    
    public class previousDirectorDetails {
        public Name name { get; set; }
        public String dateOfBirth { get; set; }
        public String directorAge { get; set; }
        public String qualifications {get;set;} 
        public String title {get;set;}
        public CommercialDetail commercialDetail { get; set; }
        public Location location { get; set; }
        public String position {get;set;} 
        public String nationality { get; set; }
        public String occupation { get; set; }
        public String shareInformation {get;set;}
    }
    
    public class previousDirectorName {
        public String forename { get; set; }
        public String middleNames { get; set; }
        public String surName { get; set; }
    }
    
    public class previousDirectorLocation {
        public Object houseName { get; set; }
        public String houseNumber { get; set; }
        public String street { get; set; }
        public Object district { get; set; }
        public String town { get; set; }
        public String county { get; set; }
        public String postcode { get; set; }
        public String rmc { get; set; }
    }
    
    public class SummaryLine {
        public Integer eventCount { get; set; }
        public String eventDate { get; set; }
        public String eventType { get; set; }
    }

    public class LegalNotices {
        public Object administrators;
        public Object liquidators;
        public Object meetingCreditors;
        public List<Notice6253> notice6253;
        public Object receiver;
        public Integer summaryCount;
        public List<SummaryLine> summaryLine { get; set; }
        public Object volArrangement;
        public WindUp windUp { get; set; }
    }
    
    public class WindUp {
        public List<Dismissal> dismissal {get;set;} 
        public Object order {get;set;} 
        public List<Petition> petition {get;set;} 
        public Object resolution {get;set;} 
    }
    
    public class Dismissal {
        public String dismissalDate {get;set;} 
        public String hearingDate {get;set;} 
        public String originalPetitionDate {get;set;} 
        public String publicationDate {get;set;}
    }
    
    public class Petition {
        public String courtName {get;set;} 
        public String hearingDate {get;set;} 
        public Integer numberPetitioners {get;set;} 
        public List<Petitioners> petitioners {get;set;} 
        public String presentationDate {get;set;} 
        public String publicationDate {get;set;} 
        public Solicitors solicitors {get;set;} 
    }
    
    public class Petitioners {
        public String name {get;set;} 
        public RegisteredOffice petitionerLocation {get;set;} 
        public Object tradingName {get;set;} 
    }
    
    public class Solicitors {
        public Object firmName {get;set;} 
        public String name {get;set;} 
        public SolicitorLocation solicitorLocation {get;set;}
    }
    
    /*public class RegisteredOffice {
        public String locationLine1 {get;set;} 
        public String locationLine2 {get;set;} 
        public String locationLine3 {get;set;} 
        public Object locationLine4 {get;set;} 
        public Object locationLine5 {get;set;} 
        public String postcode {get;set;} 
    }*/
    
    public class SolicitorLocation {
        public String locationLine1 {get;set;} 
        public String locationLine2 {get;set;} 
        public String locationLine3 {get;set;} 
        public String locationLine4 {get;set;} 
        public Object locationLine5 {get;set;} 
        public String postcode {get;set;} 
    }
    
    public class Financials {
        public Object accounts;
        public Object cashflow;
        public Object ratios;
        public Object percentageChange;
        public Quartiles quartiles;
    }

    public class CompanyHistory {
        public String commDelphiBand;
        public String commDelphiBandText;
        public String commDelphiScore;
        public String overrideIndicator;
        public List<ScoreHistory> scoreHistory;
        public Integer scoreHistoryCount;
        public Object stabilityOdds;
        public Integer textCount;
    }

    public class Quartiles {
        public Object fullQuartiles;
        public Object medianQuartiles;
    }

    public class DirectorExpandedSummary {
        public Integer numDirectorsFound;
        public Integer numDirectorsNotFound;
        public String nocFlag;
        public Integer numDisqualifications;
        public Integer numConvictions;
        public Integer numCIFAS;
        public Integer numDirectorships;
        public Integer numCurrrentDirships;
        public Integer numCurrentDissolvedDirships;
        public Integer numPreviousDirectorships;
        public Integer numDirectorshipsFailed;
        public Integer numDirectorshipsNotFailed;
        public Integer numDirectorshipsCompulsoryLiquidator;
        public Integer numDirectorshipsCreditorLiquidator;
        public Integer numDirectorshipsMemberLiqidator;
        public Integer numDirectorshipsUnknownLiquidator;
        public Integer numDirectorshipsWindUpOrder;
        public Integer numDirectorshipsAdministratorAppointed;
        public Integer numDirectorshipsAdministratorDischarge;
        public Integer numDirectorshipsAppointmentAdministrativeReceiver;
        public Integer numDirectorshipsReceiverAppointed;
        public Integer numDirectorshipsAdministrativeReceiverCessation;
        public Integer numDirectorshipsReceiverCessation;
        public Integer numDirectorshipsApprovalVoluntaryArrangements;
        public Integer numDirectorshipsCompletionVoluntaryArrangements;
        public Integer numDirectorshipsRevocationVoluntaryArrangements;
        public Integer numDirectorshipsSuspensionVoluntaryArrangements;
        public Integer numDirectorshipsReinstated;
        public Integer numDirectorshipsDissolved;
        public DirectorNumbers directorNumbers;
    }

    public class NoticeOfCorrection {
        public Object noCDetail;
        public Integer numCorrections;
    }

    public class ShareCapital {
        public String recordType;
        public String issuingCompany;
        public String currentPreviousFlag;
        public String effectiveDate;
        public String shareClassNo;
        public String currencies;
        public String shareClassCode;
        public String shareClassDesc;
        public String votingRights;
        public String totalNominalCapital;
        public Integer numShares;
        public String nominalValue;
        public Integer percentage;
        public String latestUpdate;
    }

    public class ManagementInfo {
        public String latestReturns;
        public Integer numDirs;
        public Integer numSecs;
        public Integer numCurrDirs;
        public Integer numPrevDirs;
        public Integer directorAvgAge;
        public Integer directorAvgLength;
        public Integer numCurrDirectorLast12;
        public Integer numAppointmentsLast12;
        public Integer numResignationsLast12;
        public Integer numDisqualifications;
        public Directors directors { get; set; }
        public Secretaries secretaries { get; set; }
    }
    
    public class Secretaries {
        public List<CurrentSecretary> currentSecretary { get; set; }
        public List<PreviousSecretary> previousSecretary { get; set; }
    }
    
    public class PreviousSecretary {
        public String foreignAddressFlag { get; set; }
        public String secretaryCompanyFlag { get; set; }
        public String directorNumber { get; set; }
        public String appointmentDate { get; set; }
        public String appointmentIndicator { get; set; }
        public String resignationDate { get; set; }
        public String resignationIndicator { get; set; }
        public SecretaryDetails secretaryDetails { get; set; }
    }
    
    public class CurrentSecretary {
        public String foreignAddressFlag { get; set; }
        public String secretaryCompanyFlag { get; set; }
        public String directorNumber { get; set; }
        public String appointmentDate { get; set; }
        public String appointmentIndicator { get; set; }
        public SecretaryDetails secretaryDetails { get; set; }
    }
    
    public class SecretaryDetails {
        public Name name { get; set; }
        public String dateOfBirth { get; set; }
        public String directorAge { get; set; }
        public CommercialDetail commercialDetail { get; set; }
        public Location location { get; set; }
        public String nationality { get; set; }
    }
    
    public class Name_Z {
        public String firstName;
        public Object middleNames;
        public Object prefix;
        public Object suffix;
        public String surname;
    }

    public class Shareholder {
        public String recordType;
        public String issuingCompany;
        public String currentPreviousFlag;
        public String effectiveDate;
        public String shareClassNo;
        public String shareholdingNo;
        public String shareholderNo;
        public ShareholderDetails shareholderDetails;
        public Object noCRef;
        public String latestUpdate;
    }

    public class ScoreHistory {
        public String commDelphiScore;
        public String creditLimit;
        public String creditLimitOverrideIndicator;
        public String creditRating;
        public String creditRatingOverrideIndicator;
        public String overrideIndicator;
        public String scoreHistoryDate;
    }

    public class CorporateStructure {
        public CompanyOwnership companyOwnership { get; set; }
        public Subsidiaries subsidiaries;
    }

    public class CommercialDetail {
        public Object name { get; set; }
        public Object regNumber { get; set; }
    }

    public class CommercialDelphiHistory {
        public CompanyHistory companyHistory;
        public SectorRanking sectorRanking;
        public SectorScore sectorScore;
        public Sectors sectors;
    }

    public class Response {
        public String regNumber { get; set; }
        public String commercialName { get; set; }
        public Identification identification { get; set; }
        public CorporateStructure corporateStructure { get; set; }
        public ManagementInfo managementInfo { get; set; }
        //public LimitedCompanyCIFAS limitedCompanyCIFAS;
        //public Object limitedCompanyCAISMembersSummary;
        //public List<LimitedCompanyDelphiDirector> limitedCompanyDelphiDirector;
        //public Shareholders shareholders;
        public CommercialDelphi commercialDelphi { get; set; }
        //public Object paymentPerformance;
        //public Financials financials;
        public CcJs ccJs { get; set; }
        public Mortgages mortgages { get; set; }
        public LegalNotices legalNotices { get; set; }
        //public CommercialDelphiHistory commercialDelphiHistory;
        public ScoringData scoringData { get; set; }
        //public List<Alerts> alerts;
        //public NoticeOfCorrection noticeOfCorrection;
        //public List<DirectorExpandedSummary> directorExpandedSummary;
        public LtdCompanyCAIS ltdCompanyCAIS { get; set; }
        public Object error;
    }
    
    public class LtdCompanyCAIS {
        public LtdCompanyCAISSummary ltdCompanyCAISSummary { get; set; }
        public List<LtdCompanyCAISDetails> ltdCompanyCAISDetails { get; set; }
    }
    
    public class LtdCompanyCAISDetails {
        public String accountState { get; set; }
        public String companyType { get; set; }
        public String accountType { get; set; }
        public String defaultBalance { get; set; }
        public String currentBalance { get; set; }
        public String status1To2 { get; set; }
        public String status3To9 { get; set; }
        public String caisLastUpdate { get; set; }
        public String accountStatus12 { get; set;}
        public String monthsData { get; set; }
        public String settlementDate { get; set; }
        public String defaultDate { get; set; }
    }
    
    public class LtdCompanyCAISSummary {
        public String ageSinceLast89;
        public String monthCount;
        public List<MonthlyData> monthlyData { get; set; }
    }
    
    public class MonthlyData {
        public String monthYyyy { get; set; }
        public String monthMm { get; set; }
        public String status0 { get; set; }
        public String status1 { get; set; }
        public String status2 { get; set; }
        public String status3 { get; set; }
        public String status4 { get; set; }
        public String status5 { get; set; }
        public String status6 { get; set; }
        public String statusU { get; set; }
        public String status89 { get; set; }
        public String currentBalance { get; set; }
        public String numActiveAccounts { get; set; }
        public String defaultBalance { get; set; }
    }

    public class FilingDetails {
        public String databaseAccountsOutOfDate { get; set; }
        public String filedAccountsOutOfDate { get; set; }
        public String latestAccounts { get; set; }
        public String latestReturns { get; set; }
        public Object latestAccountsReceived { get; set; }
        public String latestReturnsDatabase { get; set; }
        public String latestAccountsDatabase { get; set; }
        public Integer numAccountsOnFile { get; set; }
        public String latestAccountType { get; set; }
        public AccountsRefDate accountsRefDate { get; set; }
        public integer numberDaysToFileAccounts { get; set; }
    }

    public class CcJs {
        public Integer ageMostRecentCCJ { get; set; }
        public List<ccJDetail> ccJDetail { get; set; }
        public Integer numberCCJs0To72 { get; set; }
        public Integer numberCCJs13To24 { get; set; }
        public Integer numberCCJs25To36 { get; set; }
        public Integer numberCCJs37To48 { get; set; }
        public Integer numberCCJs49To60 { get; set; }
        public Integer numberCCJs61To72 { get; set; }
        public Integer numberCCJsLast12Months { get; set; }
        public Integer valueCCJs0To72 { get; set; }
        public Integer valueCCJs13To24 { get; set; }
        public Integer valueCCJs25To36 { get; set; }
        public Integer valueCCJs37To48 { get; set; }
        public Integer valueCCJs49To60 { get; set; }
        public Integer valueCCJs61To72 { get; set; }
        public Integer valueCCJsLast12Months { get; set; }
    }
    
    public class ccJDetail {
        public Object satisfactionDate { get; set; } //verify with dataset
        public String judgmentType { get; set; }
        public String judgmentSource { get; set; }
        public String judgmentDate { get; set; }
        public String judgmentAmount { get; set; }
        public String caseNumber { get; set; }
        public String judgmentAgainst { get; set; }
        public List<TradingNameDetails> tradingNameDetails { get; set; }
        public TradingLocation tradingLocation { get; set; }
        public String courtName { get; set; }
    }
    
    public class TradingNameDetails {
        public Object tradingIndicator {get;set;} 
        public Object tradingName {get;set;} 
    }
    
    public class TradingLocation {
        public String locationLine1 { get; set; }
        public String locationLine2 { get; set; }
        public String locationLine3 { get; set; }
        public String locationLine4 { get; set; }
        public String locationLine5 { get; set; }
        public String postcode {get;set;} 
    }
    
    public class companyOwnership {
        public String parRegNumber;
        public String parCountry;
        public String prevParRegNumber;
        public String prevParCountry;
        public Object ultParRegNumber;
        public String ultParCountry;
        public Object prevUltParRegNumber;
        public String prevUltParCountry;
        public String bulkShareHolders;
        public String bulkTelephone;
        public Integer numPrincShareHldrs;
        public ParentDetail parentDetail { get; set; }
        public PrevParName prevParName;
        public UltParentDetail ultParentDetail { get; set; }
        public Object prevUltParName;
        public List<CorporateShareholder> corporateShareholder { get; set; }
    }
    
    public class PrevParName {
        public String commercialName {get;set;}
    }
    
    public class RegisteredOffice {
        public String locationLine1 { get; set; }
        public String locationLine2 { get; set; }
        public String locationLine3 { get; set; }
        public String locationLine4 { get; set; }
        public String locationLine5 { get; set; }
        public String postcode { get; set; }
    }

    public class ParentDetail {
        public String commercialName { get; set; }
        public RegisteredOffice businessLocation;
        public Object commDelphiScore;
        public Object commDelphiBand;
        public Object stabilityOdds;
        public Object creditRating;
        public Object creditLimit;
        public Object dateOfAccounts;
        public Object currencies;
        public Object currenciesMultiplier;
        public Object consAccounts;
        public Object latestAccountsType;
        public Object accountingPeriod;
        public Object netWorth;
        public Object grossProfit;
        public Object turnoverSales;
        public Object turnoverHomeNation;
        public Object turnoverExport;
        public Object groupLiabilities;
        public Object groupLoans;
        public Object liquidityRatio;
        public Object currentDBT;
        public Object experienceMonth;
        public Object commDelphiBandText;
    }
    
    public class UltParentDetail {
        public String commercialName {get;set;} 
        public RegisteredOffice businessLocation {get;set;} 
        public Object commDelphiScore {get;set;} 
        public Object commDelphiBand {get;set;} 
        public Object stabilityOdds {get;set;} 
        public Object creditRating {get;set;} 
        public Object creditLimit {get;set;} 
        public Object dateOfAccounts {get;set;} 
        public Object currencies {get;set;} 
        public Object currenciesMultiplier {get;set;} 
        public Object consAccounts {get;set;} 
        public Object latestAccountsType {get;set;} 
        public Object accountingPeriod {get;set;} 
        public Object netWorth {get;set;} 
        public Object grossProfit {get;set;} 
        public Object turnoverSales {get;set;} 
        public Object turnoverHomeNation {get;set;} 
        public Object turnoverExport {get;set;} 
        public Object groupLiabilities {get;set;} 
        public Object groupLoans {get;set;} 
        public Object liquidityRatio {get;set;} 
        public Object currentDBT {get;set;} 
        public Object experienceMonth {get;set;} 
        public Object commDelphiBandText {get;set;} 
    }
    
    public class PrevSearches {
        public Integer numPrevSearch { get; set; }
        public Integer numPrevSearch3Mth { get; set; }
        public Integer numPrevSearch6Mth { get; set; }
        public Integer numPrevSearch12Mth { get; set; }
        public List<PreviousSearchDetail> previousSearchDetail { get; set; }
    }
    
    public class PreviousSearchDetail {
        public String searchDate {get;set;} 
        public String enquiryType {get;set;} 
        public String ownEnquiryFlag {get;set;} 
        public SiCInformation siCInformation {get;set;} 
    }
    
    public class SiCInformation {
        public String code {get;set;} 
        public String description {get;set;} 
        public String type {get;set;}
    }
    
    public class Location {
        public String houseName { get; set; }
        public String houseNumber { get; set; }
        public String street { get; set; }
        public String district { get; set; }
        public String town { get; set; }
        public String county { get; set; }
        public String postcode { get; set; }
        public String rmc { get; set; }
    }

    public class CommercialDetail_Z {
        public Object name;
        public String kgENName;
        public Object regNumber;
    }

    public static GeWS_PCSM_CommercialBureauData parse(String json) {
        return (GeWS_PCSM_CommercialBureauData) System.JSON.deserialize(json, GeWS_PCSM_CommercialBureauData.class);
    }
}