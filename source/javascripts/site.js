document.addEventListener("DOMContentLoaded", function(){
  document.getElementById('back-to-top').addEventListener('click', function(e){
    window.scrollTo({top: 0, behavior: "smooth"});
  });
});
