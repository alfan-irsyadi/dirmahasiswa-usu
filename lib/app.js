function f(a,b,c,d,e){
    return 10000*a+1000*b+100*c+10*d+e
}

(async()=>{
    let i = 0
    for(let a = 1; a<=9; a++){
        for(let b = 0; b<=9; b++){
            for(let c = 0; c<=9; c++){
                for(let d = 0; d<=9; d++){
                    for(let e = 1; e<=9;e++){
                        if(f(a,b,c,d,e)%4==0 && f(e,d,c,b,a)%4==0){
                            console.log(i+' - '+f(a,b,c,d,e)+'\n')
                            i++
                        }
                    }
                }

            }
        }
    }
    console.log(i)
})()