public class SourceWrapper
{
    public Id SourceID {get; set;}
    public boolean IsPartner {get; set;}
    public Date AddDate {get; set;}
    public string FileFrom {get; set;}
    
    public SourceWrapper(string pSourceID, boolean pIsPartner, Date pAddDate, string pFileFrom)
    {
        SourceID = pSourceID;
        IsPartner = pIsPartner;
        AddDate = pAddDate;
        FileFrom = pFileFrom;
    }
    
}