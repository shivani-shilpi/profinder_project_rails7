import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = [
    'dropdown',
    'content',
  ];
  connect() {
    this.showActiveContent(this.dropdownTarget);
  };
  change(event) {
    this.showActiveContent(event.target);
  };
  showActiveContent(dropdown) {
    const targets = this.contentTargets;
    targets.forEach(content => content.hidden = dropdown.value !== content.dataset.targetValue);
  };
};