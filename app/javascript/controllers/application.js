import { Application } from "@hotwired/stimulus"
import Rails from '@rails/ujs'
Rails.start();

const application = Application.start()

// Import and register all TailwindCSS Components
import { Alert, Autosave, Dropdown, Modal, Tabs, Popover, Toggle, Slideover  } from "tailwindcss-stimulus-components"
application.register('alert', Alert)
application.register('autosave', Autosave)
application.register('dropdown', Dropdown)
application.register('modal', Modal)
application.register('tabs', Tabs)
application.register('popover', Popover)
application.register('toggle', Toggle)
application.register('slideover', Slideover)

import VisibilityController from "./visibility_controller"
application.register("visibility", VisibilityController)

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
