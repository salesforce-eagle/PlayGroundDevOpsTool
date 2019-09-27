public class NewTestClass {
    public static integer a = 12;
    public static integer b = 12;
    public static integer c;
    public integer mtd(){        
        system.debug('Print->> '+a);        
        system.debug('Print->> '+b);        
        c = a+b;
        system.debug('Print->> '+c); 
        return c;
    }    
    
}