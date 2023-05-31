import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="practice"
export default class extends Controller {

  static targets = ["name"]
  connect() {
  }

  greet(){
    document.getElementById('demo').innerHTML= (`Hello, ${this.name}!`)
  }

  get name(){
    return this.nameTarget.value
  }
}
