// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"


// import * as bootstrap from "bootstrap"
import "bootstrap/dist/js/bootstrap.bundle"

import "@fortawesome/fontawesome-free"
import "@fortawesome/fontawesome-free/js/all"

import * as ActiveStorage from "@rails/activestorage"
ActiveStorage.start()



