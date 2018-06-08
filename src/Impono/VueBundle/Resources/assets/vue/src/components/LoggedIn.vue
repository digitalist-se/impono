<template>
  <div class="wrapper">
    <h1>Congratz!</h1>
    <p>
      You are now logged in.
    </p>
    <p>
      {{ msg }}
    </p>
    <p>
      access_token: {{ userClient.access_token }}
    </p>
  </div>
</template>

<script>
(function($, Drupal)
{
    // Make parapgraph columns equal height together with jquery-match-height
    Drupal.behaviors.makeEqual = {
        attach:function(){
          $(window).on('resize', function() {
            var width = $(window).width();
            if (width >= 768) {
                $('.paragraph__column').matchHeight();
            }
else{
  // Maybe?
  $('.paragraph__column').style('height', 'auto');
}
          });
        }
    };
}(jQuery, Drupal));
$(window).on('resize scroll', function() {
  console.log('resizing');
});
addEvent(window, "resize", function(event) {
  console.log('resizing');
  var w = window.innerWidth;
  if(w<768){

  }
});

<img
  width="1170"
  height="630"
  src="https://hejjobbet.se/app/uploads/2018/05/xmaxa.semester.1.png.pagespeed.ic.wL7S28YThK.jpg"
  class="attachment-redo-thumb-news size-redo-thumb-news wp-post-image"
  alt="Så maxar du din semesterkänsla"
  srcset="
  https://hejjobbet.se/app/uploads/2018/05/xmaxa.semester.1.png.pagespeed.ic.wL7S28YThK.jpg 1170w,
  https://hejjobbet.se/app/uploads/2018/05/maxa.semester.1-300x162.png 300w,
  https://hejjobbet.se/app/uploads/2018/05/maxa.semester.1-768x414.png 768w,
  https://hejjobbet.se/app/uploads/2018/05/maxa.semester.1-1024x551.png 1024w,
  https://hejjobbet.se/app/uploads/2018/05/maxa.semester.1-370x199.png 370w,
  https://hejjobbet.se/app/uploads/2018/05/maxa.semester.1-760x409.png 760w"
  sizes="(max-width: 1170px) 100vw, 1170px"
  data-pagespeed-url-hash="101580463"
  onload="pagespeed.CriticalImages.checkImageForCriticality(this);"
>


export default {
  name: 'LoggedIn',
  data() {
    return {
      msg: 'Logged in',
      userClient: JSON.parse(localStorage.getItem('userClient')),
    };
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
