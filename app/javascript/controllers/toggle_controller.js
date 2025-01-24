import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {

  static targets = ["togglableElement", "button", "startDate", "endDate", "guestNumber", "price", "nightAmount", "totalPrice"]

  fire(event) {
    // Prevent the form submission triggered by this button click
    if (this.buttonTarget.value === "Check availability") {
      event.preventDefault();
    }

    // Check if all required fields are filled
    if (this.startDateTarget.value && this.endDateTarget.value && this.guestNumberTarget.value) {

      // Toggle the visibility of the additional information
      this.togglableElementTarget.classList.remove("d-none");

       // Change the button text
       this.buttonTarget.value =
       this.togglableElementTarget.classList.contains("d-none")
         ? "Check availability"
         : "Book now";

      // Calculate days difference
      const startDate = new Date(this.startDateTarget.value);
      const endDate = new Date(this.endDateTarget.value);
      const timeDifference = endDate - startDate; // Difference in milliseconds
      const daysDifference = timeDifference / (1000 * 60 * 60 * 24); // Convert to days

      // Inject the days difference into html
      this.nightAmountTarget.innerHTML = daysDifference;

      // Inject the total price into html
      const price = parseInt(this.priceTarget.innerText, 10)
      console.log(price, daysDifference)
      this.totalPriceTarget.innerHTML = daysDifference*price;

    } else {
      alert("Please fill out all fields before checking availability!");
    }
  }
}
