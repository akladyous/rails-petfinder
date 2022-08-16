import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image"
export default class extends Controller {
    static targets = ["imageContainer", "input", "output"]
    connect() {
    }

}
