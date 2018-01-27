{% if theme.valine.enable and theme.valine.appid and theme.valine.appkey %}
  <script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
  <script src="/js/src/Valine.min.js"></script> 

  <script type="text/javascript">
    new Valine({
        av: AV,
        el: '#vcomments' ,
        verify: {{ theme.valine.verify }},
        notify: {{ theme.valine.notify }},
        app_id: '{{ theme.valine.appid }}',
        app_key: '{{ theme.valine.appkey }}',
        guest_info:['nick'] ,// 评论只需要提供昵称
        avatar:'hide',
        placeholder: '{{ theme.valine.placeholder }}'
    });
  </script>
{% endif %}
