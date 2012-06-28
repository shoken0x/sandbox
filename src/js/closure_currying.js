var a = new Array();
function f(){
  for(var i = 0;i < 10;i++){
    a[i] = function(i){
      return function(){
               console.log(i);
             }
    }(i)
  }
}

f()
a[0]() //0
a[9]() //9

