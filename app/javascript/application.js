// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "@fortawesome/fontawesome-free"

import jQuery from "jquery";

// NOTE: make jQuery global if needed
window.$ = window.jQuery = jQuery;

console.log($); // ok


import Rails from "@rails/ujs";
Rails.start();

// window.bootstrap = bootstrap
import "trix"
import "@rails/actiontext"
