public class GISMap_CTR {
	
    @AuraEnabled
    public static String getToken() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.arcgis.com/sharing/rest/oauth2/token');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        request.setHeader('Accept', 'application/json');
        request.setBody( 'client_id=zgaFUafMYmSSrerc&grant_type=client_credentials&client_secret=d5b9b042886747bd9b0b9da991daef60' );
        HttpResponse response = http.send(request);
        
        Map<String, Object> resultsMap = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
        System.debug('## '+ resultsMap);
        
        String accessToken = (String)resultsMap.get('access_token');
        System.debug('access token --> ' + accessToken );
        
        return accessToken;
    }
}