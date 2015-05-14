 #*--------------------------------------------------------#
  # Global Object Variables
#*--------------------------------------------------------#
getByClass =
    header: document.getElementsByClassName('header')[0]
    footer: document.getElementsByClassName('footer')[0]
    wrapper: document.getElementsByClassName('wrapper')[0]

location =
    protocol: window.location.protocol
    host: window.location.host
    path: window.location.pathname

#*--------------------------------------------------------#
  # Requires
#*--------------------------------------------------------#
classie    = require 'classie'
_          = require 'lodash'
modal      = require 'kbd-modal'.Modal
header     = require './lib/header'
typography = require './lib/typography'
utils      = require './lib/utils'

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