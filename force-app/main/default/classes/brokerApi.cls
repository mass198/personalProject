@RestResource(urlMapping='/brokerApi/*')
global class brokerApi {
    
    global class AccountWrapperResponse{
        public string name {get; set; }
        public String brokerGuid { get; set; }
     
        public String legalName { get; set; }
        public Boolean loaAmendment { get; set; }
        public String status { get; set; }
        public list<TerritoryResponse> territories {get; set;}
}
    global class TerritoryResponse{
            public String territory { get; set; }
        public Boolean active { get; set; }
        public String commodity { get; set; }
}
}