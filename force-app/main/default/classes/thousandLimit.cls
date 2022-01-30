public class thousandLimit
{
    private limitWrapper[] thousandBlocks = new limitWrapper[]{};
    
    private final integer listLimit;
    
    public thousandLimit()
    {
        listLimit = 1000;
    }
    
    public limitWrapper[] getthousandBlocks()
    {
        thousandBlocks = new limitWrapper[]{};
        
        integer counter = 0;
        integer loopCount = 0;
        case[] tmpcase = new case[]{};
        
        for(case c:[select Id,CaseNumber,owner.name from Case order by createdDate desc])
        {
            if(counter < listLimit)
            {
                tmpcase.add(c);
                counter++;
            }
            else
            {
                loopCount++;
                thousandBlocks.add(new limitWrapper(tmpcase,loopCount));
                tmpcase = new case[]{};
                tmpcase.add(c);
                counter = 0;
            }            
        }
        
        if(thousandBlocks.size() == 0)
        {
            loopCount++;
            thousandBlocks.add(new limitWrapper(tmpcase,loopCount));
        }
        
        System.debug('### '+thousandBlocks.size() );
        System.debug('### counter:: '+ counter );
        
        return thousandBlocks;
    }
    
    public class limitWrapper
    {
        public case [] cases {get;set;}
        public integer blockNumber {get;set;}
        public limitWrapper(case[] accs, integer i)
        {
            cases = accs;
            blockNumber = i;
        }
        
    }
}