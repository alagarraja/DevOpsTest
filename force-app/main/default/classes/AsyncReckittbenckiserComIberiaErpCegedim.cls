//Generated by wsdl2apex

public class AsyncReckittbenckiserComIberiaErpCegedim {
    public class SalesOrdersResponsesFuture extends System.WebServiceCalloutFuture {
        public reckittbenckiserComIberiaErpCegedim.SalesOrderResponse[] getValue() {
            reckittbenckiserComIberiaErpCegedim.SalesOrdersResponses response = (reckittbenckiserComIberiaErpCegedim.SalesOrdersResponses)System.WebServiceCallout.endInvoke(this);
            return response.Record;
        }
    }
}