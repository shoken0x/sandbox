list = {a:1,b:{c:2,d:3},e:{f:1,g:"ss",h:{i:1},j:[{k:[{0:1},2,3,{kk:1}]},{l:1},{m:0}]},n:1,o:[{p:1}],q:[1,2,3,4,5]};

console.log(list);

var stack = new Array();
function getLastField(e){
  for (i in e) {
    if (typeof e[i] == "object"){
      if(e.constructor != Array) stack.push(i);
      arguments.callee(e[i]); 
    }else{
      if(e.constructor != Array) {
        if(stack.length > 0) console.log("i = " + stack.join('.') + '.'+ i);
        else console.log("i = " + i)
      }
    }
  }
  stack.pop();
}

getLastField(list)


