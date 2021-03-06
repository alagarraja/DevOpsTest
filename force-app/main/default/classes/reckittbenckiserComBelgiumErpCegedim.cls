//Generated by wsdl2apex

public class reckittbenckiserComBelgiumErpCegedim {
    public class HTTPS_Port {
        public String endpoint_x = 'https://gpiprdpas.idc.rb.net:55001/XISOAPAdapter/MessageServlet?senderParty=&senderService=CEGEDIM_P&receiverParty=&receiverService=&interface=SalesOrderCreate_Out&interfaceNamespace=urn%3AReckittBenckiser.com%3ABelgium%3AERP%3ACegedim%3ASD%3ASalesOrder';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'urn:ReckittBenckiser.com:Belgium:ERP:Cegedim:SD:SalesOrder', 'reckittbenckiserComBelgiumErpCegedim', 'urn:ReckittBenckiser.com:Spain:ERP:Vincle:SalesOrder', 'reckittbenckiserComSpainErpVincleSa', 'urn:ReckittBenckiser.com:Iberia:ERP:Cegedim:SD:SalesOrder', 'reckittbenckiserComIberiaErpCegedim'};
        public reckittbenckiserComIberiaErpCegedim.SalesOrderResponse[] SalesOrderCreate_Out(reckittbenckiserComIberiaErpCegedim.SalesOrder[] Record) {
            reckittbenckiserComIberiaErpCegedim.SalesOrders request_x = new reckittbenckiserComIberiaErpCegedim.SalesOrders();
            request_x.Record = Record;
            reckittbenckiserComIberiaErpCegedim.SalesOrdersResponses response_x;
            Map<String, reckittbenckiserComIberiaErpCegedim.SalesOrdersResponses> response_map_x = new Map<String, reckittbenckiserComIberiaErpCegedim.SalesOrdersResponses>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              'http://sap.com/xi/WebService/soap1.1',
              'urn:ReckittBenckiser.com:Spain:ERP:Vincle:SalesOrder',
              'SalesOrderCreateReq',
              'urn:ReckittBenckiser.com:Spain:ERP:Vincle:SalesOrder',
              'SalesOrderCreateResp',
              'reckittbenckiserComIberiaErpCegedim.SalesOrdersResponses'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.Record;
        }
    }
}