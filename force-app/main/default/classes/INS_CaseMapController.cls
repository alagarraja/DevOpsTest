public with sharing class INS_CaseMapController {
    
    public WorkOrder workOrderRec { get; set; }
    public string gisAuthToken { get; set; }
    public string labelTxt { get; set; }
    public string boundaryType { get; set; }
    public string polyMarker { get; set; }
    public string polygonLabelName { get; set; }
    
    public List<List<addressWrapper>> mainAddressList { get; set; }
    
    public List<addressWrapper> addressList { get; set; }
    public List<assetWrapper> assetList { get; set; }
    
    public Map<String,String> sketchTypeMap { get; set; }
    public string colorStr { get; set; }
    
    public Map<String,List<String>> existingPolygon { get; set; }
    public STring tempStr { get; set; }
    public List<SelectOption> boundaryTypes { get; set; }
    public string selectedType { get; set; }
    public List<SelectOption> dryWetOpt { get; set; }
    
    public string coOrdsParam { get; set; }
    
    public INS_CaseMapController(ApexPages.StandardController controller) {  
        workOrderRec = (WorkOrder)controller.getRecord();
    }
    
    public void mapOnloadAction() {
        gisAuthToken = getGISToken();
        addressList = new List<addressWrapper>();
        
        mainAddressList = new List<List<addressWrapper>>();
        assetList = new List<assetWrapper>();
        
        dryWetOpt = new List<SelectOption>();
        dryWetOpt.add( new SelectOption('','-- None --'));
        dryWetOpt.add( new SelectOption('Dry','Dry'));
        dryWetOpt.add( new SelectOption('Wet','Wet'));
        
        boundaryTypes = new List<SelectOption>();
        boundaryTypes.add( new SelectOption('','-- None --'));
        boundaryTypes.add( new SelectOption('Impacted Boundary','Impacted Boundary'));
        boundaryTypes.add( new SelectOption('Disturbance Boundary','Disturbance Boundary'));
        
        sketchTypeMap = new Map<String,String>();
        existingPolygon = new Map<String,List<String>>();
        
        for(INS_GISBoundaries__c bry: [Select Id,Name,INS_CoOrdinates__c,INS_BoundaryType__c from INS_GISBoundaries__c 
                                              where INS_WorkOrder__c =: workOrderRec.Id]){
                                              
            bry.INS_CoOrdinates__c = bry.INS_CoOrdinates__c.replace('],[', '];[');                                     
            List<String> splitStr = bry.INS_CoOrdinates__c.split(';');
            existingPolygon.put( bry.Name, splitStr);
            
            sketchTypeMap.put( bry.Name, bry.INS_BoundaryType__c);
        }
        
        /*List<String> tempList1 = new List<string>();
        tempList1.add('[53.305494546495495,-2.3863350838519573]');
        tempList1.add('[53.30592518444972,-2.384320610949227]');
        tempList1.add('[53.304210095772255,-2.3851654517567136]');
        existingPolygon.put('poly 22', tempList1);
        
        List<String> tempList = new List<string>();
        tempList.add('[53.3037704679943,-2.381356575264983]');
        tempList.add('[53.30512091353213,-2.3792510292446116]');
        tempList.add('[53.30403903703362,-2.3791752641944504]');
        
        existingPolygon.put('poly 1', tempList); */
        
        
        colorStr = JSON.serialize(sketchTypeMap); 
        tempStr = JSON.serialize(existingPolygon);
        System.debug('##### '+existingPolygon );
    }
    
    public static string getGISToken(){
        String accessToken ;
        AccessTokenWrapper accTokenObj = new AccessTokenWrapper();

      Http http = new Http();
      HttpRequest request = new HttpRequest();
      request.setEndpoint('https://www.arcgis.com/sharing/rest/oauth2/token');
      request.setMethod('POST');
      request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
      request.setHeader('Accept', 'application/json');
      request.setBody( 'client_id=zgaFUafMYmSSrerc&grant_type=client_credentials&client_secret=d5b9b042886747bd9b0b9da991daef60' );
      HttpResponse response = http.send(request);
        System.debug('## '+response.getBody() );
      if(response.getStatusCode()==200){
        accTokenObj = (AccessTokenWrapper)JSON.deserialize(response.getBody(), AccessTokenWrapper.class);
        accessToken = accTokenObj.access_token;
        
      }
      
      return accessToken;

  }
  
   public void createBoundaries(){
       
       INS_GISBoundaries__c igb = new INS_GISBoundaries__c();
       igb.Name = labelTxt;
       igb.INS_WorkOrder__c = workOrderRec.id;
       igb.INS_CoOrdinates__c = polyMarker;
       igb.INS_BoundaryType__c = boundaryType;
       insert igb;
           
       System.debug('$$$$$ labelTxt --->'+ labelTxt );
       System.debug('$$$$$ coordinates  --->'+ polyMarker );   
       System.debug('$$$$$ type --->'+ boundaryType );
   }
   
   //Get Drainage Area
   public void getAffectedAddress(){
        
        System.debug('$$$$$ accessToken --->'+ gisAuthToken );
        System.debug('$$$$$ coordinates  --->'+ polyMarker );  
        
        
        addressList = new List<addressWrapper>();
        HttpRequest reuest = new HttpRequest(); 
        reuest.setMethod('GET');
        reuest.setEndpoint('https://services5.arcgis.com/5eoLvR0f8HKb7HWP/ArcGIS/rest/services/Hybrid_Address/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry={"rings":[['+polyMarker+']]}&geometryType=esriGeometryPolygon&inSR=4326&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=ADDRESS_ID,DA_CODE,DC_CODE&returnGeometry=true&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=27700&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnDistinctValues=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pjson&token='+gisAuthToken);
        Http http = new Http();
        HTTPResponse response = http.send(reuest);
        
        system.debug('response body ----->'+ response.getBody() );
        
        if(response.getStatusCode()==200){
            
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody()); 
            system.debug('response results----->'+ results);
            
            List< Object> results2 = (List< Object>)(results.get( 'features'));
            
            mainAddressList = new List<List<addressWrapper>>();
            List<addressWrapper> innerList = new List<addressWrapper>();
            Integer recCount=0;
            
            for(Object obj: results2){
                
                Map<String,Object> objAttr = (Map<String,Object>)obj;
                
                Map<String,Object> addressMap = (Map<String,Object>) objAttr.get('attributes');
                Map<String,Object> xyMap = (Map<String,Object>) objAttr.get('geometry');
                
                AddressWrapper wrp = new AddressWrapper();
                wrp.selectedRec = false;
                wrp.addressId = (Integer) addressMap.get('ADDRESS_ID');
                wrp.dcCode = (String) addressMap.get('DC_CODE');
                wrp.daCode = (String) addressMap.get('DA_CODE');
                wrp.xCoOrd = (Decimal) xyMap.get('x');
                wrp.yCoOrd = (Decimal) xyMap.get('y');
                wrp.selectedDryWet = '';
                //addressList.add(wrp);
                //system.debug('Obj results----->'+ wrp);
                
                
                if (Math.mod(recCount++, 1000) == 0 ) {
                    innerList = new List<addressWrapper>();
                    mainAddressList.add(innerList);
                }
                
                innerList.add(wrp);
            }
              
            System.debug('### recCount :::::: '+ recCount);
        } 
        
   }
   
   public void getAffectedAssets(){
        System.debug('##### accessToken --->'+ gisAuthToken );
        System.debug('##### coordinates  --->'+ polyMarker );  
       
        assetList = new List<assetWrapper>();
        HttpRequest reuest = new HttpRequest(); 
        reuest.setMethod('GET');   //WWGRAVITYSEWER_1
        reuest.setEndpoint('https://services5.arcgis.com/5eoLvR0f8HKb7HWP/ArcGIS/rest/services/cwPRESSURISED_MAIN/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry={"rings":[['+polyMarker+']]}&geometryType=esriGeometryPolygon&inSR=4326&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=false&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnDistinctValues=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pjson&token='+gisAuthToken);
        Http http = new Http();
        HTTPResponse response = http.send(reuest);
        
        system.debug('response body ----->'+ response.getBody() );
        
        if(response.getStatusCode()==200){
            
            Map<String,Object> results = (Map<String,Object>) JSON.deserializeUntyped(response.getBody()); 
            system.debug('response results----->'+ results);
            
            List< Object> results2 = (List< Object>)(results.get( 'features'));
            
            for(Object obj: results2){
                
                Map<String,Object> objAttr = (Map<String,Object>)obj;
                
                Map<String,Object> addressMap = (Map<String,Object>) objAttr.get('attributes');
                Map<String,Object> xyMap = (Map<String,Object>) objAttr.get('geometry');
                
                AssetWrapper wrp = new AssetWrapper();
                wrp.selectedRec = false;
                //wrp.featureNum = (Integer) addressMap.get('FEATURENUM');
                wrp.featureNum =1;
                assetList.add(wrp);
            }
        }
   }
   
   public void saveImpactedAssets(){
   
   }
   
   public void saveImpactedCustomers(){
   
       List<Integer> insertList = new List<Integer>();
       
       for(AddressWrapper adr: addressList){
           if(adr.selectedRec){
               insertList.add( adr.addressId );
           }    
       }
       
       if(insertList.size() == 0){
           //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, 'Please select a record to save the impacted customers.'));
       }
   
   }
   
   
   public without sharing class addressWrapper{
       public Boolean selectedRec {get;set;} 
       public Integer addressId {get;set;} 
       public String dcCode{get;set;} 
       public String daCode{get;set;}  
       public Decimal xCoOrd {get;set;} 
       public Decimal yCoOrd {get;set;} 
       public string selectedDryWet {get;set;} 
   }
   
   public without sharing class assetWrapper{
       public Boolean selectedRec {get;set;} 
       public Integer featureNum {get;set;} 
   }
   
   public with sharing class AccessTokenWrapper{
        public String access_token {get;set;} 
        public Integer expires_in {get;set;} 
   }

}