import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          // Add the new item to the list
          this.itemsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }

        // Clean the input field(s)
        this.resetForm()
      })
      .catch((error) => {
        console.error("Error:", error)
      })
  }

  resetForm() {
    console.log("Resetting form inputs")
    this.formTarget.reset() // Clear all fields in the form
  }
}
