import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
 
  greeting = 'World'; // value
  changeHandler(event) {  //onchange event
    this.greeting = event.target.value;
  }
}