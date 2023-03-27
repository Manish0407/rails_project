// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
$(document).ready(function() {
  $('#dttb').DataTable({
    "pageLength": 4,
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#dttb').data('source')
    },
    "columns": [
      {"data": "name"},
      {"data": "book_author"},
      {"data": "qty"}
    ]
  });
});
