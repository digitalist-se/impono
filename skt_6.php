<?php

if (!empty($_POST)) {
    var_dump($_POST);
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SKT-6 test</title>
</head>
<body/>
<form method="post" name="lattjo" action="/skt_6.php">
    <input type="submit" name="action:bil" value="personbil">
    <input type="submit" name="action:lastbil" value="lastbil">
    <input type="submit"  value="send it!">
</form>

<!-- Start Impono script code --><script type="text/javascript">(function(window,document,script,dataLayer,id){window[dataLayer]=window[dataLayer]||[];window[dataLayer].push({'7tag.start':new Date().getTime(),'event':'7tag.js'});var scripts=document.getElementsByTagName(script)[0],tags=document.createElement(script),dl=dataLayer!='dataLayer'?'?dataLayer='+dataLayer:'';tags.async=!0;tags.src='//impono.test/containers/44.js'+dl;scripts.parentNode.insertBefore(tags,scripts)})(window,document,'script','dataLayer',44);</script><noscript><iframe src="//impono.test/containers/44/noscript.html" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript><!-- End Tag script code -->

</body>
</html>