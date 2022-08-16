import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image"
export default class extends Controller {
    static targets = ["imageContainer", "input", "output"]
    connect() {
    }
    handleChange(event) {
        let input = this.inputTarget;
        let output = this.outputTarget;

        let fileReader = new FileReader();
        if (input.files[0]) {
            fileReader.onload = () => {
                output.src = fileReader.result;
            };
        }
        // input.parentElement.insertBefore(imageTag, input.nextSibling)
        fileReader.readAsDataURL(input.files[0])
    };
}
