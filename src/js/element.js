list = {a:1,b:{c:2,d:3},e:{f:1,g:"ss",h:{i:1},j:[{k:[{kk:1},2,3]},{l:1},{m:0}]},n:1,o:[{p:1}],q:[1,2,3,4,5]};

console.log(list);

function f(e){
  if (Array.isArray(e)){
      for (j = 0; j < e.length; j++ ){
        //console.log("j = " + j)
        f(e[j])
        //console.log("e[i] = " + e[j])
      } 
  }else{
  for (i in e) {
    console.log("i = " + i);
    if (Array.isArray(e[i])){ 
      f(e[i])
      //console.log("isArray = " + Array.isArray(e[i]));
      //console.log("length = " + e[i].length);
    } else if (typeof e[i] == "object") {
      //console.log("else if " )
      f(e[i])
    }
  }
  }
}

f(list)
