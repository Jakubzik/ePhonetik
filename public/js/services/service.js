var app = angular.module('ePhonetik'); //Hier ohne "[]", weil das bereits geladene Modul referenziert werden soll.

app.factory('ePhonetikData', ['$window','$q','$http',function($window, $q,$http){
  var indexedDB = $window.indexedDB;
  var db=null;
  var lastIndex=0;
  
  var open = function(){
    var deferred = $q.defer();
    var version = 1;

    var request = indexedDB.open("ePhonetikLektionen", version);
  
    request.onupgradeneeded = function(e) {
      db = e.target.result;
  
      e.target.transaction.onerror = indexedDB.onerror;
  
      if(db.objectStoreNames.contains("ePhonetik")) {
        db.deleteObjectStore("ePhonetik");
      }
      console.log('ePhonetik ObjectStore wird neue erzeugt...');
      var store = db.createObjectStore("ePhonetik",
        {keyPath: "id"});
        
		$http.get('/api/lektion').success(function(data){
		  console.log(data);
		  for(var ii=0,ij=data.length;ii<ij;ii++){
			  console.log('Adding Lektion No. ' + ii);
			  addLektion(data[ii]);
		  }
		});
    };
  
    request.onsuccess = function(e) {
      db = e.target.result;
      deferred.resolve();
    };
  
    request.onerror = function(){
      deferred.reject();
    };
    
    return deferred.promise;
  };
  
  var getLektionen = function(){
    var deferred = $q.defer();
    
    if(db === null){
      deferred.reject("IndexDB is not opened yet!");
    }
    else{
      var trans = db.transaction(["ePhonetik"], "readwrite");
      var store = trans.objectStore("ePhonetik");
      var lektionen = [];
    
      // Get everything in the store;
      var keyRange = IDBKeyRange.lowerBound(0);
      var cursorRequest = store.openCursor(keyRange);
    
      cursorRequest.onsuccess = function(e) {
        var result = e.target.result;
        if(result === null || result === undefined){
			console.log(lektionen);
          deferred.resolve(lektionen);
        }
        else{
          lektionen.push(result.value);
          if(result.value.id > lastIndex){
            lastIndex=result.value.id;
          }
          result.continue();
        }
      };
    
      cursorRequest.onerror = function(e){
        console.log(e.value);
        deferred.reject("Something went wrong!!!");
      };
    }
    
    return deferred.promise;
  };
  
  var deleteTodo = function(id){
    var deferred = $q.defer();
    
    if(db === null){
      deferred.reject("IndexDB is not opened yet!");
    }
    else{
      var trans = db.transaction(["ePhonetik"], "readwrite");
      var store = trans.objectStore("ePhonetik");
    
      var request = store.delete(id);
    
      request.onsuccess = function(e) {
        deferred.resolve();
      };
    
      request.onerror = function(e) {
        console.log(e.value);
        deferred.reject("Todo item couldn't be deleted");
      };
    }
    
    return deferred.promise;
  };
  
  var addLektion = function(oLektion){
    var deferred = $q.defer();
    
    if(db === null){
      deferred.reject("IndexDB is not opened yet!");
    }else{
      var trans = db.transaction(["ePhonetik"], "readwrite");
      var store = trans.objectStore("ePhonetik");
      lastIndex++;
      var request = store.put({
        "id": lastIndex,
        "lektion": oLektion
      });
    
      request.onsuccess = function(e) {
        deferred.resolve();
      };
    
      request.onerror = function(e) {
        console.log(e.value);
        deferred.reject("Todo item couldn't be added!");
      };
    }
    return deferred.promise;
  };

  var dropDatabase=function(){
	var req = indexedDB.deleteDatabase('ePhonetikLektionen');
	req.onsuccess = function () {
		console.log("Deleted database successfully");
	};
	req.onerror = function () {
		console.log("Couldn't delete database");
	};
	req.onblocked = function () {
		console.log("Couldn't delete database due to the operation being blocked");
	};
  };
  
  return {
    open: open,
    getLektionen: getLektionen,
    addLektion: addLektion,
    deleteTodo: deleteTodo,
    dropDatabase: dropDatabase
  };
  
}]);


