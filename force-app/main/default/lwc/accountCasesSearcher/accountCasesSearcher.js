import { LightningElement, track, api } from 'lwc';
import findCasesBySubject from '@salesforce/apex/AccountCasesController.findCasesBySubject';

const COLUMNS = [
    { label: 'Sujet', fieldName: 'caseUrl', type: 'url',
  typeAttributes: { label: { fieldName: 'Subject' }, target: '_self' } },
    { label: 'Statut', fieldName: 'Status', type: 'text' },
    { label: 'Priorité', fieldName: 'Priority', type: 'text' },
];

export default class AccountCaseSearchComponent extends LightningElement {
    @api recordId;
    @track cases;
    @track error;
    searchTerm = '';
    columns = COLUMNS;

    updateSearchTerm(event) {
        this.searchTerm = event.target.value;
    }

    handleSearch() {
        findCasesBySubject({ accountId: this.recordId, subjectSearchTerm: this.searchTerm })
            .then(result => {
                this.cases = result.map(c => ({ ...c, caseUrl: '/' + c.Id }));
                this.error = undefined;
            })
            .catch(error => {
                this.error = 'Une erreur est survenue lors de la recherche des cases.';
            });
    }
}