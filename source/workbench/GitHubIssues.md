---
title: 密码测试
layout: default
type: "about"
comments: true
password: 123456
---


<div id="container"></div>
<link rel="stylesheet" href="https://imsun.github.io/gitment/style/default.css">
<script src="https://imsun.github.io/gitment/dist/gitment.browser.js"></script>
<script>
var gitment = new Gitment({
  id: '页面 ID', // 可选。默认为 location.href
  owner: 'linyuxuanlin',
  repo: 'Comments',
  oauth: {
    client_id: '45dc96633245c42b1950',
    client_secret: '8395df8647523eb26234c6ad1a576193f598f5df',
  },
})
gitment.render('container')
</script>


{% btn index,, arrow-left fa-1x %}