function loop(n,m,f){
    f(n);
    if(n>=m){return;}
    n++;
    loop(n,m,f);
}

loop(1,100,function(n){
    print(n + ',');
});
