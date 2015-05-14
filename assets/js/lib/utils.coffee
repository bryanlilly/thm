#*--------------------------------------------------------*#
  # Utilities
#*--------------------------------------------------------*#
utils =

    # Sets Items
    equalizr: (className) ->
        items = document.getElementsByClassName className
        if items[0]?
            width = items[0].offsetWidth
            for el in items
                do (el) ->
                    el.style.height = width + px

module.exports = utils