public virtual class ExtendCheckSuperClass {
    public integer a;
    public integer b;
    public integer c;
    public ExtendCheckSuperClass(){
        a = 10;
        b = 5;
        c = a+b;
        system.debug('Sum is: '+ c);
    }

}