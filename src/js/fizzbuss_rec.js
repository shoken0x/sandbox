function fb(now,max,str){
    if(now % 3 == 0){str += 'fizz';}
    if(now % 5 == 0){str += 'buzz';}
    if(now % 3 != 0 && now % 5 != 0){str += now;}

    str += ','
    if(now == max){println(str);return;}
    now ++;
    fb(now,max,str);
}

fb(1,100,'');
