// weekdayCard.js
// import { LightningElement } from 'lwc';

// export default class WeekdayCard extends LightningElement {
//     weekdays = [
//         { key: '1', label: 'Monday', checked: false },
//         { key: '2', label: 'Tuesday', checked: false },
//         { key: '3', label: 'Wednesday', checked: false },
//         { key: '4', label: 'Thursday', checked: false },
//         { key: '5', label: 'Friday', checked: false },
//         { key: '6', label: 'Saturday', checked: false },
//         { key: '7', label: 'Sunday', checked: false }
//     ];

//     handleChange(event) {
//         const key = event.target.name;
//         const checked = event.target.checked;

       
//         this.weekdays = this.weekdays.map(weekday =>
//             weekday.key === key ? { ...weekday, checked } : weekday
//         );
//     }
// }
// import { LightningElement, track } from 'lwc';

// export default class WeekDayDropdown extends LightningElement {
//     @track selectedDays = [];
//     @track showCombobox = false;

//     get weekDaysOptions() {
//         return [
//             { label: 'Monday', value: 'Monday' },
//             { label: 'Tuesday', value: 'Tuesday' },
//             { label: 'Wednesday', value: 'Wednesday' },
//             { label: 'Thursday', value: 'Thursday' },
//             { label: 'Friday', value: 'Friday' },
//             { label: 'Saturday', value: 'Saturday' },
//             { label: 'Sunday', value: 'Sunday' },
//         ];
//     }

//     toggleCombobox() {
//         this.showCombobox = !this.showCombobox;
//     }

//     handleDayChange(event) {
//         this.selectedDays = event.detail.value;
//         // You can add additional logic here based on the selected days
//     }
// }


// import { LightningElement, track } from 'lwc';

// export default class WeekDayDropdown extends LightningElement {
//     @track selectedDays = [];
//     @track showCombobox = false;

//     get weekDaysOptions() {
//         return [
//             { label: 'Monday', value: 'Monday', checked: false },
//             { label: 'Tuesday', value: 'Tuesday', checked: false },
//             { label: 'Wednesday', value: 'Wednesday', checked: false },
//             { label: 'Thursday', value: 'Thursday', checked: false },
//             { label: 'Friday', value: 'Friday', checked: false },
//             { label: 'Saturday', value: 'Saturday', checked: false },
//             { label: 'Sunday', value: 'Sunday', checked: false },
//         ];
//     }

//     get dropdownOptions() {
//         return this.weekDaysOptions.map(day => ({
//             label: day.label,
//             value: day.value,
//         }));
//     }

  

//     handleDropdownChange(event) {
//         this.selectedDays = event.detail.value;
//     }

//     handleCheckboxChange(event) {
//         const value = event.target.value;
//         this.weekDaysOptions = this.weekDaysOptions.map(day => ({
//             ...day,
//             checked: day.value === value ? !day.checked : day.checked,
//         }));
//     }
// }
import { LightningElement, track } from 'lwc';

export default class DraggableWeekdays extends LightningElement {
    @track weekDaysOptions = [
        { label: 'Monday', value: 'Monday', checked: false },
        { label: 'Tuesday', value: 'Tuesday', checked: false },
        { label: 'Wednesday', value: 'Wednesday', checked: false },
        { label: 'Thursday', value: 'Thursday', checked: false },
        { label: 'Friday', value: 'Friday', checked: false },
        { label: 'Saturday', value: 'Saturday', checked: false },
        { label: 'Sunday', value: 'Sunday', checked: false },
    ];

    @track showColumn = false;

    handleDragStart(event) {
        event.dataTransfer.setData('text/plain', 'draggable');
    }

    showWeekdays() {
        this.showColumn = true;
    }

    handleCheckboxChange(event) {
        const value = event.target.value;
        this.weekDaysOptions = this.weekDaysOptions.map(day => ({
            ...day,
            checked: day.value === value ? !day.checked : day.checked,
        }));
    }
}