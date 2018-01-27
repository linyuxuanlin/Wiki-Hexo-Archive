<!--崩溃欺骗-->
var OriginTitile = document.title;
 var titleTime;
 document.addEventListener('visibilitychange', function () {
     if (document.hidden) {
         $('[rel="icon"]').attr('href', "/img/TEP.ico");
         document.title = ' 你好像掉线了';
         clearTimeout(titleTime);
     }
     else {
         $('[rel="icon"]').attr('href', "/favicon.ico");
         document.title = ' 嗯正常了~         ' ;
         titleTime = setTimeout(function () {
             document.title = OriginTitile;
         }, 2000);
     }
 });