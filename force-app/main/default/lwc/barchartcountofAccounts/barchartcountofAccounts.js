import { LightningElement, wire } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';//Utility function to load external JavaScript libraries dynamically.
import ChartJs from '@salesforce/resourceUrl/ChartJs';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountCountsByIndustry from '@salesforce/apex/AccountObjcontroller.getAccountCountsByIndustry';

export default class AccountChart extends LightningElement {
    chart;
    chartjsInitialized = false;

    @wire(getAccountCountsByIndustry)
    accountCounts;

    renderedCallback() {
        if (this.chartjsInitialized) {
            return;
        }
        this.chartjsInitialized = true;

        Promise.all([           //Loads the Chart.js library.
            loadScript(this, ChartJs) 
        ])
            .then(() => {
                this.initializeChart();
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error loading Chart.js',
                        message: error.message,
                        variant: 'error',
                    }),
                );
            });
    }

    initializeChart() {
        if (this.accountCounts.data) {
            const ctx = this.template.querySelector('canvas.chart').getContext('2d');
            const labels = Object.keys(this.accountCounts.data);
            const data = Object.values(this.accountCounts.data);

            this.chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [
                        {
                            label: 'Number of Accounts',
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1,
                            data: data,
                        },
                    ],
                },
                options: {
                    responsive: true,
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'Account Counts by Industry',
                    },
                },
            });
        } else if (this.accountCounts.error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error loading account data',
                    message: this.accountCounts.error.body.message,
                    variant: 'error',
                }),
            );
        }
    }
}