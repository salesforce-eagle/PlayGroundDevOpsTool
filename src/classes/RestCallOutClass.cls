public class RestCallOutClass {
    public static HttpResponse makeGetCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:'+results);
            for (Object animal: animals) {
                System.debug(animal);
            }
        }
        return response;
    }
    public static HttpResponse makePostCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/:Id');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        System.debug('Before request body set: '+request.getBody());
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' +
                         response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
        return response;
    }
    Public static string getNameBasedonId(integer idVal){
        string nameVal;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Animals_Named_Cred_HTTP/'+'animals/'+idVal);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> test = (Map<String, Object>)results.get('animal');
            nameVal = (String)test.get('name');
            //List<Object> animals = (List<Object>) results.get('animal');
            System.debug('Result to be shown: '+test.get('name'));            
        }
        return nameVal;        
    }    
    Public static HttpResponse nameCredMethod(integer idVal){
        String username = 'dashbibhudanand@gmail.com.selftest';
        String password = 'Bibhuda!123';
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Animals_Named_Cred_HTTP/'+'animals/'+idVal);
        req.setMethod('GET');        
        // Because we didn't set the endpoint as a named credential, 
        // our code has to specify:
        // - The required username and password to access the endpoint
        // - The header and header information
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        system.debug(headerValue+' :authorizationHeader: '+authorizationHeader);
        req.setHeader('Authorization', authorizationHeader);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug('req: '+req.getBody());
        return res;
    }        
}