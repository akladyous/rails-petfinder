import { Controller } from "@hotwired/stimulus"
import validate from "validate.js"

export default class extends Controller {
    static targets = ["form", "input"]
    static values = { constrains: Object, }

    initialize() {
        this.constrains = {};
        this.element.removeAttribute("data-validate-constrains-value")
    };
    connect() {
        for (let inputTag of this.inputTargets) {
            if (inputTag.hasAttribute('data-constrain')) {
                this.constrains[inputTag.name] = JSON.parse(inputTag.getAttribute('data-constrain'))
                inputTag.removeAttribute('data-constrain')
            }

            let feedBackTag = document.createElement('div')
            feedBackTag.id = `${inputTag.id}-feedback`;
            inputTag.parentNode.insertAdjacentElement('beforeend', feedBackTag)
        }
    };
    disconnect() {
        console.log('disconnect controller')
        debugger
        this.inputTargets
            .map(inputTag => inputTag.id.concat('-feedback'))
            .forEach(feedback => {
                this.element.getElementById(feedback).remove();
            })
    };
    getAttributesFor(attribute) {
        return attribute.match(/(^[^\[]+)(?=\[)|(([^\[\]]+)(?=\]))/g)
    };
    handleChange(e) {
        e.preventDefault();
        const field = { [e.target.name]: e.target.value }
        const constrains = { [e.target.name]: this.constrains[e.target.name] }
        let errors = validate(field, constrains)
        console.log('errors : ', errors)
        if (errors) {
            this.displayErrors(errors)
        } else {
            this.removeErrors([e.target.name])
        }
    }
    handleForm(e) {
        e.preventDefault();
        let errors = validate(this.formTarget, this.constrains)
        if (errors) {
            this.displayErrors(errors)
        } else {
            errors = this.inputTargets.map(input => input.name)
            this.removeErrors(errors)
            this.formTarget.submit();
        }
    };
    currentTarget(name) {
        return {
            inputTag: this.inputTargets.find(inputTag => inputTag.name === name),
            inputFeedback: this.element.querySelector(`[name="${name}"]`).nextElementSibling
        }
    };
    displayErrors(errors) {
        for (let inputName in errors) {
            const errorMsg = errors[inputName]
            const target = this.currentTarget(inputName)
            this.addClass(target.inputTag, 'is-invalid')
            target.inputFeedback.textContent = errorMsg.at(0)
            this.addClass(target.inputFeedback, 'invalid-feedback')
        }
    };
    removeErrors(errors) {
        if (!errors) return
        errors.forEach(inputName => {
            const target = this.currentTarget(inputName)
            // if (!this.isEmpty(target.inputTag.value)) { }
            this.addClass(target.inputTag, 'is-valid')
            target.inputTag.classList.remove('is-invalid')
            target.inputFeedback.textContent = ""
            target.inputFeedback.setAttribute('class', "")

        })
    }

    initalizeForm() {
        for (let inputTag of this.element) {
            if (inputTag.type !== 'hidden' || inputTag.type === 'submit') {
                if (inputTag.hasAttribute('data-constrain')) {
                    this.constrains[inputTag.name] = JSON.parse(inputTag.getAttribute('data-constrain'))
                    inputTag.removeAttribute('data-constrain')
                    inputTag.addEventListener('change', this.handleChange)
                }
            }
        }
        this.element.addEventListener('submit', this.handleForm)
    }
    addClass(target, className) {
        if (!target.classList.contains(className)) {
            target.classList.add(className)
        }
    }
    isEmpty(str) {
        return !str.trim().length;
    }
};
