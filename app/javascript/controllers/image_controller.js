import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image"
export default class extends Controller {
    static targets = ["imageContainer", "input", "output"]
    connect() {
    }

    triggerUpload(event) {
        event.preventDefault();
        this.inputTarget.click()
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

/*
        let input = this.inputTarget;
        let container = this.imageContainerTarget
        // let output = this.outputTarget;

        let fileReader = new FileReader();
        fileReader.onloadstart = () => {
            spinner = document.createElement('i')
            spinner.classList.add("fas fa-spinner fa-pulse")
            container.insertAdjacentElement('afterbegin', spinner)
        }
        if (input.files[0]) {
            fileReader.onload = () => {
                imageTag.src = fileReader.result;
            };
            fileReader.onloadend = () => {
                let imageTag = document.createElement('img');
                fileReader.readAsDataURL(input.files[0])
                // container.insertAdjacentElement('afterbegin', output)
                input.parentElement.insertBefore(imageTag, input.nextSibling)
            }
            if (fileReader.readyState === 2) {
                let imageTag = document.createElement('img');
                fileReader.readAsDataURL(input.files[0])
                // container.insertAdjacentElement('afterbegin', output)
                input.parentElement.insertBefore(imageTag, input.nextSibling)
            }
        }
*/
