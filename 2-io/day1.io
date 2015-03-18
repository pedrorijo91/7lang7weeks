m := method("calling THE method" println)

methodInvoker := method(name, self getSlot(name) call)

"insert the method name you wish to invoke" println

name := File standardInput readLine

"trying to invoke method: '#{name}'" interpolate println

e := try(methodInvoker(name))
if(e != nil, "method '#{name}' does not exist:\n #{e}" interpolate println, "successfully invoking method '#{name}'" interpolate println) 

"Goodbye :)" println