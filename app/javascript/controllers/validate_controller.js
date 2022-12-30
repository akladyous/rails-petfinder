import { Controller } from "@hotwired/stimulus";
import validate from "validate.js";

export default class extends Controller {
  static targets = ["form", "input"];
  static values = { status: Boolean };

  initialize() {
    this._constrains = {};
  }
  connect() {
    for (let inputTag of this.inputTargets) {
      if (inputTag.hasAttribute("data-constrain")) {
        this._constrains[inputTag.name] = JSON.parse(
          inputTag.getAttribute("data-constrain")
        );
        inputTag.removeAttribute("data-constrain");
      }

      let feedBackTag = document.createElement("div");
      feedBackTag.id = `${inputTag.id}-feedback`;
      inputTag.parentNode.insertAdjacentElement("beforeend", feedBackTag);
    }
  }
  // disconnect() {
  //     this.inputTargets
  //         .map(inputTag => inputTag.id.concat('-feedback'))
  //         .forEach(feedback => {
  //             document.getElementById(feedback).remove();
  //         })
  //     console.log('disconnected...')
  // };

  getAttributesFor(attribute) {
    return attribute.match(/(^[^\[]+)(?=\[)|(([^\[\]]+)(?=\]))/g);
  }
  handleChange(e) {
    e.preventDefault();
    const field = { [e.target.name]: e.target.value };
    const constrains = { [e.target.name]: this._constrains[e.target.name] };
    let errors = validate(field, constrains);
    if (errors) {
      this.displayErrors(errors);
    } else {
      let inputTags = [e.target.name];
      this.removeErrors(inputTags);
    }
  }
  handleForm(e) {
    e.preventDefault();
    let errors = validate(this.formTarget, this._constrains);
    if (errors) {
      this.displayErrors(errors);
    } else {
      let inputTags = this.inputTargets.map((input) => input.name);
      this.removeErrors(inputTags);
      // this.disconnect()
      this.formTarget.submit();
    }
  }
  currentTarget(name) {
    return {
      inputTag: this.inputTargets.find((inputTag) => inputTag.name === name),
      inputFeedback: this.element.querySelector(`[name="${name}"]`)
        .nextElementSibling,
    };
  }
  displayErrors(errors) {
    if (!errors) return;
    for (let inputName in errors) {
      const errorMsg = errors[inputName];
      const target = this.currentTarget(inputName);
      this.addClass(target.inputTag, "is-invalid");
      target.inputFeedback.textContent = errorMsg.at(0);
      this.addClass(target.inputFeedback, "invalid-feedback");
    }
    this._errors = {};
  }
  removeErrors(inputTags) {
    if (!inputTags) return;
    inputTags.forEach((inputName) => {
      const target = this.currentTarget(inputName);
      // if (!this.isEmpty(target.inputTag.value)) { }
      this.addClass(target.inputTag, "is-valid");
      target.inputTag.classList.remove("is-invalid");
      target.inputFeedback.textContent = "";
      target.inputFeedback.setAttribute("class", "");
    });
  }

  initalizeForm() {
    for (let inputTag of this.element) {
      if (inputTag.type !== "hidden" || inputTag.type === "submit") {
        if (inputTag.hasAttribute("data-constrain")) {
          this._constrains[inputTag.name] = JSON.parse(
            inputTag.getAttribute("data-constrain")
          );
          inputTag.removeAttribute("data-constrain");
          inputTag.addEventListener("change", this.handleChange);
        }
      }
    }
    this.element.addEventListener("submit", this.handleForm);
  }
  addClass(target, className) {
    if (!target.classList.contains(className)) {
      target.classList.add(className);
    }
  }
  isEmpty(str) {
    return !str.trim().length;
  }
}
