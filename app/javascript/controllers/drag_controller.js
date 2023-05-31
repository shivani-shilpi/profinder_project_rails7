import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drag"

const dataResourceID = "data-resource-id";
const dataParent = "data-parent";
let url;
let resourceID;
let newPosition;

export default class extends Controller {
  connect() {}
  dragStart(event){
    resourceID = event.target.getAttribute(dataResourceID);
    url = event.target.getAttribute("data-url")
    event.dataTransfer.effectAllowed = "move";
  }
  
  dragOver(event){
    event.preventDefault();
    return true;
  }

  dragEnter(event){
    event.preventDefault();
  }

  drop(event){
    event.preventDefault();
    let parentID = event.target.getAttribute(dataParent);
    const dropTarget = this.findDropTarget(event.target, parentID);
    const draggedItem = document.querySelector(`[data-resource-id="${resourceID}"]`)
    if (draggedItem === null || dropTarget === null ){
      return true;
    }
    this.setNewPosition(dropTarget, draggedItem, event);
    newPosition = [...this.element.parentElement.children].indexOf(draggedItem);
  }

  dragEnd(event){
    event.preventDefault();
    if (resourceID === null || newPosition === null ){
      return;
    }
    let data = JSON.stringify({
      resource: {
        id: resourceID,
        position: newPosition,
      },
    });
    fetch(url, {
      method: "PATCH",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": getMetaValue("csrf-token"),
      },
      body: data,
    })
      .then(response => response.text())
      .then(html => {
        this.plantsTarget.innerHTML = html
      })
  }

  getMetaValue(name){
    const element = document.head.querySelector(`meta[name="${name}"]`);
    return element.getAttribute("content");
  }

  findDropTarget(target, parentID) {
    if (target === null){
      return null;
    }
    if (target.id === parentID){
      return null;
    }
    if (target.classList.contains("draggable")){
      return target;
    }
    return this.findDropTarget(target.parentElement, parentID);
  }

  setNewPosition(dropTarget, draggedItem){
    const positionComparison = dropTarget.compareDocumentPosition(draggedItem);
    if (positionComparison & Node.DOCUMENT_POSITION_FOLLOWING){
      dropTarget.insertAdjacentElement("beforebegin", draggedItem);
    } else if (positionComparison & Node.DOCUMENT_POSITION_PRECEDING){
      dropTarget.insertAdjacentElement("afterend", draggedItem);
    }
  }
}
