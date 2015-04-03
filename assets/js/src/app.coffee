#*--------------------------------------------------------#
  # Requires
#*--------------------------------------------------------#
#classie = require 'classie'
#_ 		= require 'lodash'
modal 	= require 'kbd-modal'.Modal
header 	= require './lib/header'

#*--------------------------------------------------------#
  # Location Variables
#*--------------------------------------------------------#
protocol = window.location.protocol
host = window.location.host
path = window.location.pathname
  
#*--------------------------------------------------------#
  # Clean Load
#*--------------------------------------------------------#
wrapper = document.getElementsByClassName('wrapper')[0]

#*--------------------------------------------------------#
  # Inits
#*--------------------------------------------------------#
header.init()

m = new modal('md-trigger', '[id^="md"]', 'md-close')
m.init()


#*--------------------------------------------------------#
  # Window Load and Resize
#*--------------------------------------------------------#
window.addEventListener 'load', ->
  classie.add(wrapper, 'clean-load')

#window.addEventListener 'resize', _.debounce(->
#, 150)