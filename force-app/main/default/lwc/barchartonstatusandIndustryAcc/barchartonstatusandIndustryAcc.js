import { LightningElement, wire } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';//Utility function to load external JavaScript libraries dynamically.
import ChartJs from '@salesforce/resourceUrl/ChartJs';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getAccountCountsByIndustryAndStatus from '@salesforce/apex/AccountObjcontroller.getAccountCountsByIndustryAndStatus';

export default class BarchartonstatusandIndustryAcc extends LightningElement {
    chart;
    chartjsInitialized = false;

    @wire(getAccountCountsByIndustryAndStatus)
    accountCounts;

    renderedCallback() {
        if (this.chartjsInitialized) {
            return;
        }
        this.chartjsInitialized = true;

        Promise.all([
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

            // Prepare the data for the chart
            const industries = Object.keys(this.accountCounts.data);
            const statuses = new Set();
            industries.forEach(industry => {
                Object.keys(this.accountCounts.data[industry]).forEach(status => {
                    statuses.add(status);
                });
            });

            const datasets = Array.from(statuses).map(status => {
                return {
                    label: status,
                    backgroundColor: this.getRandomColor(),
                    data: industries.map(industry => this.accountCounts.data[industry][status] || 0),
                };
            });

            this.chart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: industries,
                    datasets: datasets,
                },
                options: {
                    responsive: true,
                    scales: {
                        x: {
                            stacked: true,
                        },
                        y: {
                            stacked: true,
                        },
                    },
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        title: {
                            display: true,
                            text: 'Account Counts by Industry and Status',
                        },
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

    getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }
}