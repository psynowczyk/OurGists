root = exports ? this
jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_posts_url = $('.pagination .next a').attr('href')
      if !root.isActive && more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
          root.isActive = true;
          console.log(more_posts_url)
          $.getScript more_posts_url
      return
    return
