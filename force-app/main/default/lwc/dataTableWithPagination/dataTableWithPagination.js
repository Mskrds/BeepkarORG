import { LightningElement,track } from 'lwc';
import getconlist from '@salesforce/apex/Fetchcontactsforpagination.getconlist';
export default class ContactPaginationLwc extends LightningElement {

    @track contactRecords = [];
    @track ListofContacts = [];
    @track recordList = [];
    @track pageList = [];
    @track currentPage = 1;
    @track recordPerPage = 5;
    @track totalPages = 1;
    @track startIndex = 0;
    @track endIndex = 0;

    connectedCallback() {
        setTimeout(() => {
            getconlist()
                .then((result) => {
                    this.contactRecords = result;
                    let index = 0;
                    let tempList = [];
                    for (let i = 0; i < result.length; i++) {
                        index += 1;
                        let tempObj = {
                            Name: result[i].Name,
                            Phone: result[i].Phone,
                            Email: result[i].Email,
                            sno: index,
                        };

                        tempList.push(tempObj);
                    }
                    this.ListofContacts = tempList;
                    this.recordList = tempList;
                    this.totalPages = Math.ceil(this.recordList.length / this.recordPerPage);
                    this.updatePageList();
                })
                .catch((err) => {
                    console.error('Error retrieving contacts:', err);
                });
        }, 100);
    }

    // handleFirst() {
    //     this.currentPage = 1;
    //     this.updatePageList();
    // }

    handlePrevious() {
        if (this.currentPage > 1) {
            this.currentPage -= 1;
            this.updatePageList();
        }
    }

    handleNext() {
        if (this.currentPage < this.totalPages) {
            this.currentPage += 1;
            this.updatePageList();
        }
    }

    // handleLast() {
    //     this.currentPage = this.totalPages;
    //     this.updatePageList();
    // }

   updatePageList() {
        this.startIndex = (this.currentPage - 1) * this.recordPerPage + 1;
        this.endIndex = Math.min(this.startIndex + this.recordPerPage - 1, this.recordList.length);
        this.pageList = this.recordList.slice(this.startIndex - 1, this.endIndex);
    }



    
}