<aura:application extends="force:slds">
  <!-- Create attribute to store lookup value as a sObject--> 
  <aura:attribute name="SRselectedLookUpRecord" type="sObject" default="{}"/>
    <aura:attribute name="STselectedLookUpRecord" type="sObject" default="{}"/>
    <aura:attribute name="OHselectedLookUpRecord" type="sObject" default="{}"/>
 
  
  <c:customLookup objectAPIName="ServiceResource" selectedRecord="{!v.SRselectedLookUpRecord}" recordId="0Hn1t000000bzBU" recordName="Mobile User" label="Service Resource"/>
  
  <c:customLookup objectAPIName="ServiceTerritory" selectedRecord="{!v.STselectedLookUpRecord}" recordId="0Hh1t000000Tb0i" recordName="North" label="Service Territory"/>
    
  <c:customLookup objectAPIName="OperatingHours" selectedRecord="{!v.OHselectedLookUpRecord}" recordId="0OH1t000000TdFR" recordName="Customer Tech - CWTransformWeek1 - Tuesday" label="Operating Hours"/>   
    
 <!-- here c: is org. namespace prefix-->
</aura:application>