import { LightningElement, api, wire, track } from 'lwc';
import getOpportunities from '@salesforce/apex/AccountOpportunitiesController.getOpportunitiesByAccountIdAndName';

export default class AccountOpportunitiesViewer extends LightningElement {
    @api recordId;
    @track opportunities;
    @track error;
    columns = [
        { label: 'Nom Opportunité', fieldName: 'Name', type: 'text' },
        { label: 'Montant', fieldName: 'Amount', type: 'currency' },
        { label: 'Date de Clôture', fieldName: 'CloseDate', type: 'date' },
        { label: 'Phase', fieldName: 'StageName', type: 'text' }
    ];

    updateSearchNameOpp(event) {
        this.searchNameOpp = event.target.value;
    }
    handleSearchOpp() {
        getOpportunities({ recordId: this.recordId })
        .then ((result) => {
            this.opportunities = result;
            this.error = undefined;
        })
        .catch((error) => {
            this.opportunities = 'Une erreur est survenue lors de la recherche des opportunités.';
        });
    }
   /* @wire(getOpportunities, { recordId: '$recordId' }) //error
    wiredOpportunities({ error, data }) {
        if (data) {
            this.opportunities = data;
        } else if (error) {
            this.error = error;
            this.opportunities = undefined;
        }
    }*/


}