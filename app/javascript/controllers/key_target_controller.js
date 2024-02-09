import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="key-target"
export default class extends Controller {
  connect() {
    console.log("Connected to key-target controller");
  }
  search(event) {
    clearTimeout(this.timer);

    const query = event.target.value.trim();

    this.timer = setTimeout(() => {
      fetch(`/users?search_query=${encodeURIComponent(query)}`, {
        headers: { "Turbo-Frame": "search_results" },
      })
        .then((response) => response.text())
        .then((html) => {
          const frame = document.getElementById("search_results");
          frame.innerHTML = html;
        })
        .catch((error) => {
          console.error("Error fetching search results:", error);
        });
    }, 300);
  }
}
