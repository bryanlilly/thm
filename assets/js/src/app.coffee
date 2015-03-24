#*--------------------------------------------------------#
  # Requires
#*--------------------------------------------------------#
classie = require 'classie'
_ = require 'lodash'
  
#*--------------------------------------------------------#
  # Clean Load
#*--------------------------------------------------------#

wrapper = document.getElementsByClassName('wrapper')[0]


#*--------------------------------------------------------#
  # Window Load and Resize
#*--------------------------------------------------------#

window.addEventListener 'load', ->
  classie.add(wrapper, 'clean-load')

#window.addEventListener 'resize', _.debounce(->
#, 150)