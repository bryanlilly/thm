 #*--------------------------------------------------------#
  # Typography Methods
#*--------------------------------------------------------#
_ = require 'lodash'

typography =
    nowidows: (els) ->
      for el in els
        do (el) ->
          if el.innerHTML.indexOf('<br>') is -1
            text = el.textContent
            words = _.words( text )
            if words.length > 4
              words[words.length - 3] += '&nbsp;' + words[words.length - 2] + '&nbsp;' + words[words.length - 1]
              words.splice(words.length - 1, 2)
              el.innerHTML = words.join ' '

module.exports = typography