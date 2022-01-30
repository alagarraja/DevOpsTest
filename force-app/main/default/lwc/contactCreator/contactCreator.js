import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class ContactCreator extends LightningElement {

    objectApiName = CONTACT_OBJECT;
    fields = [FIRSTNAME_FIELD, LASTNAME_FIELD, EMAIL_FIELD];
    accountId;

    handleSuccess(event){

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Contact record ID:'+ event.detail.id,
                variant: 'success',
            }),
        );


    }
}