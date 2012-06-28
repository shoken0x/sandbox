var a = new Array();
function f(){
  for(var i = 0;i < 10;i++){
    a[i] = function(i){
      console.log(i);
    }(i)
  }
}

f()

