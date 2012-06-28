var a = new Array();
function f(){
  for(var i = 0;i < 10;i++){
    a[i] = function(){
      console.log(i);
    };
  }
}

f()
a[0]() //10
a[9]() //10

