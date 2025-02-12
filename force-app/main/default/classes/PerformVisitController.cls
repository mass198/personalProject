public class PerformVisitController {
private static String GG_API_KEY = 'AIzaSyD7TQRmSi5X3T_JH8SXfD3RcaaihrVw6LU';   // key alterada por Equipe IBM em 04/03/2021 de 'AIzaSyDWXeCaJOPdBat2LJoDGyWu4fkPg71NkDg'

	@AuraEnabled
	public static void getComment(Id subAttributeId){
	/*	List<PlanSubAttribute__c> planSubAttributeList = [ 
			SELECT Commentary__c FROM PlanSubAttribute__c WHERE Id =: subAttributeId 
		];

		if(planSubAttributeList.isEmpty()) return null;

		return planSubAttributeList[0].Commentary__c; */
	} 
    
    @AuraEnabled
	public static void getFollowUp(Id subAttributeId){
		/*List<PlanSubAttribute__c> planSubAttributeList = [ 
			SELECT FollowUp__c FROM PlanSubAttribute__c WHERE Id =: subAttributeId 
		];

		if(planSubAttributeList.isEmpty()) return null;

		return planSubAttributeList[0].FollowUp__c;
*/
	}
    

    @AuraEnabled
    public static  void  getPlan(Id objectId){
        try{
		//	String objectType = String.valueOf(objectId.getsobjecttype());
		//	String planId = getPlanId(objectId);

			List<Account> visits = [SELECT id from Account limit 1];

			if(visits.isEmpty())
		//		throw new CheckinException('Plano de ação não encontrado.');

			Account visitPlan = visits[0];
			
           // return visitPlan;
        }catch(DmlException e){
            throw new AuraHandledException(e.getDmlMessage(0));
        }catch(Exception e){
            throw new AuraHandledException(e.getMessage());
        }
    }
/*
    @AuraEnabled
    public static void performCheckInLocation(Id objectId, String lat, String lon, String typeCheckin, List<String> attributes, Boolean outOfRangeCheckin){

		try{	

			outOfRangeCheckin = outOfRangeCheckin == null ? false : outOfRangeCheckin;
			String planId = getPlanId(objectId);
			String userLocation = lat != null && lat != '0' && lon != null && lon != '0' ? getUserLocation(lat, lon) : 'Localização não especificada.';
			VisitPlan__c vsPlan = [SELECT Id, Name, RecordTypeId FROM VisitPlan__c WHERE Id = :planId];

			if(planId == null)
				throw new CheckinException('Plano de ação não encontrado.');

			if(typeCheckin == 'VisitPlan')
				update new VisitPlan__c(Id = planId, Latitude__c = lat, Longitude__c = lon, CheckInLocalization__c = userLocation, CheckInDate__c = System.now());
			else
				update new VisitPlan__c(Id = planId, CheckInDate__c = System.now());

			List<Event> relatedEvents = [SELECT Id, Status__c FROM Event WHERE VisitPlan__c = :planId AND ActivityDate = :System.today()];
            //Condição comentada para suprir a demanda de apresentar todos os compromissos no calendário.
			/*if(!relatedEvents.isEmpty()){
				* Se tem eventos para hoje relacionado ao plano de visita ele atualiza.
				List<Event> eventsToUpdate = new List<Event>();
				for(Event instEvent : relatedEvents){
					eventsToUpdate.add( buildEvent(lat,lon,typeCheckin,vsPlan,userLocation,attributes,outOfRangeCheckin,instEvent.Id) );
				}
				update eventsToUpdate;
			}else{
				Event evento = buildEvent(lat,lon,typeCheckin,vsPlan,userLocation,attributes,outOfRangeCheckin,null);
				insert evento;
			//}
          /*	}catch(DmlException e){
			System.debug('ERRO: '+String.valueOf(e));
            throw new AuraHandledException(e.getDmlMessage(0));
        }catch(Exception e){
			System.debug('ERRO: '+String.valueOf(e));
            throw new AuraHandledException(e.getMessage());
        }
    } */

}