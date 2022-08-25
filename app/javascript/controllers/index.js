// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import DropdownController from "./dropdown_controller.js"
application.register("dropdown", DropdownController)


import TabsController from "./tabs_controller.js"
application.register("tabs", TabsController)


import ModalController from "./modal_controller.js"
application.register("collapse", ModalController)

import CollapseController from "./collapse_controller.js"
application.register("collapse", CollapseController)
