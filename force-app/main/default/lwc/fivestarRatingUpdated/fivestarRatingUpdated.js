import { LightningElement, api } from 'lwc';
const MAX_RATING = 5;
export default class FivestarRatingUpdated extends LightningElement {

  @api readOnly;
  @api value;

  get starClass() {
    return this.readOnly ? 'readonly' : 'editable';
  }

  get stars() {
    const starList = [];
    const rating = this.value || 0;

    for (let i = 1; i <= MAX_RATING; i++) {
      const cssClass = i <= rating ? 'selected' : '';
      starList.push({ index: i, cssClass });
    }

    return starList;
  }
}