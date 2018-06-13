component {
    this.name = "My Blogs";    
    this.applicationTimeout = CreateTimeSpan(10, 0, 0, 0); //10 days    
    this.datasource = "mysqlsource";    
    this.sessionManagement = true;    
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes  
    this.ormEnabled = true;
    this.ormSettings = { logsql : true };
    this.invokeImplicitAccessor = true;  
   
    // see also: http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc 3ff6d0ea77859461172e0811cbec22c24-750b.html    
    // see also: http://help.adobe.com/en_US/ColdFusion/10.0/Developing/ WSED380324-6CBE-47cb-9E5E-26B66ACA9E81.html
    function onApplicationStart() {      
    	application.myName = 'Simon'; 
    	application.myPosition = 'A Developer';  
    	return true;
    }
    function onSessionStart() {}
    // the target page is passed in for reference,     // but you are not required to include it    
   function onRequestStart(string targetPage){
        if(structKeyExists(url,'reload')){
            onApplicationStart();
            ormReload();
        }           
     } 
    function onRequest( string targetPage ) {        
    	include arguments.targetPage;   
    }
    function onRequestEnd() {}
    function onSessionEnd( struct SessionScope, struct ApplicationScope ) {}
    function onApplicationEnd( struct ApplicationScope ) {}
    function onError( any Exception, string EventName ) {}
}