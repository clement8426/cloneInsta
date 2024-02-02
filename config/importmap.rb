# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "filepond" # @4.30.6
pin_all_from "app/javascript/custom", under: "custom"
pin "filepond-plugin-image-preview" # @4.6.12
pin "filepond-plugin-file-validate-type" # @1.2.8
pin "filepond-plugin-image-crop" # @2.0.6
