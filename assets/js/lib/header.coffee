#*--------------------------------------------------------*#
  # Header
#*--------------------------------------------------------*#

mobileMenu = require './menu'
classie = require 'classie'
_ = require 'lodash'

header =

  header: document.getElementsByClassName('header')[0]
  nav: document.getElementsByClassName('nav')[0]
  home: document.querySelector('a[title="home"]')
  menuItems: document.getElementsByClassName 'menu-item'
  logo: document.querySelector('.header-logo')
  search: document.querySelector '.search-util a'
  banner: document.getElementsByClassName('block-banner')[0]
  navUtil: document.getElementsByClassName('nav-util-menu')[0]
  html: document.getElementsByTagName('html')[0]

  headerLoad: ->
    classie.add @header, 'header-load'
    return

  # addPhoneIcon: ->
  #   phone = document.createElement 'li'
  #   phone.className = 'menu-item'
  #   phone.innerHTML = '<span class="moovweb-phone">1.877.666.8932</span><span class="icon-phone"></span>'
  #   @navUtil.appendChild(phone)
  #   return

  # addPhoneListener: ->
  #   phone = document.getElementsByClassName('icon-phone')[0]
  #   phone.addEventListener 'mouseover', (event) ->
  #     num = phone.parentNode.querySelector('.moovweb-phone')
  #     if !classie.has(num, 'moovweb-phone-visible')
  #       classie.add(num, 'moovweb-phone-visible')
  #       return
  #   return

  mobileMenuInit: ->
    menu = new mobileMenu()
    menu.init()

  addBannerClass: ->
    if @banner?
      classie.add(@header, 'header-with-banner')
      return true
    else
      return false

  addHeaderPadding: ->
    height = @header.offsetHeight
    if not @banner?
      block = document.getElementsByClassName('block')[0]
      blockPaddingTop = parseInt(window.getComputedStyle(block).paddingTop, 10)
      block.style.paddingTop = blockPaddingTop + height + 'px'
      return

  addScrollClass: ->
    _this = @
    if classie.has(@html, 'mobile-browser')
      classie.add(_this.header, 'header-scrolled')
    else
      window.addEventListener 'scroll', _.debounce ->
        console.log 'hello'
        y = window.pageYOffset
        if y > 100
          classie.add(_this.header, 'header-scrolled')
        else if y < 100
          classie.remove(_this.header, 'header-scrolled')
      , 20

  setLogo: ->
    navHeight = @nav.offsetHeight
    @home.innerHTML = '<img src="' + protocol + '//' + host + '/cnt/themes/thm/assets/img/logo.png" class="header-logo">'

    @logo.style.height = navHeight - 32 + 'px'

    if window.innerWidth < 801
      menuButton =document.getElementById 'open-button'
      mBHeight = menuButton.offsetHeight
      mBMargin = (navHeight - mBHeight)/2
      menuButton.style.top = mBMargin + 'px'
      menuButton.style.right = mBMargin + 'px'
    return

  fixedHeader: ->
    height = @header.offsetHeight
    newDiv = document.createElement 'div'
    newDiv.style.height = height + 'px'

    wrapper = document.getElementsByClassName('wrapper')[0]
    wrapper.insertBefore(newDiv,wrapper.childNodes[1])

  init: ->
    _this = @
    #@addPhoneIcon()
    #@addPhoneListener()
    #@addBannerClass()
    #@addHeaderPadding()
    @mobileMenuInit()
    @setLogo()
    @fixedHeader()
    window.addEventListener 'load', ->
      _this.headerLoad()
      #_this.addScrollClass()
    return
    

module.exports = header