import { LightningElement } from 'lwc';

export default class ShowArrayData extends LightningElement {

    ArrayDataHere;

    showDataHandler(){
            this.ArrayDataHere= [    {
                company : 'Salesforce',
            working : 'Yes',
            type : 'Private'
        },
            {company : 'Amazon',
            working : 'Yes',
            type : 'Private'},
            {company : 'Sathyam Computers',
            working : 'No',
            type : 'Private'},
            {company : 'Apple',
            working : 'Yes',
            type : 'Private'},
            {company : 'IRCTC',
            working : 'Yes',
            type : 'Public'}
        ]

   }
    
}