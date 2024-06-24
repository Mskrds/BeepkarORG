// productInsertion.js
import { LightningElement, track } from 'lwc';
import createProduct from '@salesforce/apex/ProductController.createProduct';
import getProducts from '@salesforce/apex/ProductController.getProducts';

export default class ProductinsertionAssig extends LightningElement {
    @track productName = '';
    @track isActive = false;
    @track productList = [];

    connectedCallback() {
        // Load existing products when the component is connected
        this.loadProducts();
    }
    async insertProduct() {
        try {
            // Call Apex method to insert the product
            await createProduct({
                productName: this.productName,
            
                isActive: this.isActive
            });

            // Reset input fields after successful insertion
            this.productName = '';
          
            this.isActive = false;

            // Reload the product list to display the new product
            this.loadProducts();
        } catch (error) {
            // Handle any errors that occur during the insertion
            console.error('Error inserting product:', error.message);
            // Optionally, show an error message to the user
        }
    }

    async loadProducts() {
        try {
            // Call Apex method to retrieve the list of products
            this.productList = await getProducts();
        } catch (error) {
            // Handle any errors that occur while retrieving products
            console.error('Error loading products:', error.message);
           
        }
    }
     handleCheckboxChange(event) {
        const selectedProductId = event.target.value;
        
        this.productList = this.productList.map(product => 
            product.Id === selectedProductId ? {product, isSelected: event.target.checked } : product
        );
    }
}