(function(now,max,FizzBuzz){
  if(now%3 == 0 && now%5 == 0) FizzBuzz+='FizzBuzz';
  else if(now%5 == 0) FizzBuzz+='Buzz';
  else if(now%3 == 0) FizzBuzz+='Fizz';
  else FizzBuzz+=now;
  
  if(now>=max) {console.log(FizzBuzz);return;}
  FizzBuzz+=',';
  now++;
  arguments.callee(now,max,FizzBuzz);
})(1,100,'');
