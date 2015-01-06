/**
 * Controller für ePhonetik
 * (c) 2015 shj-online.de
 * Autor: hj
 * 
 * Der Controller regelt
 * - Auswahl von Lektionen,
 * - Anzeige von Fragen,
 * - Auswertung von Antworten.
 * 
 * Daten Design der App:
 * Das Backend liefert die Lektionen 
 * (mit den Fragen und deren Antworten).
 * 
 * Diese Lektionen werden per 
 * indexed-db zwischengespeichert.
 * 
 * Die App selbst greift nur auf 
 * indexeddb zu.
 * 
 * Backend und indexeddb werden im 
 * Service verhandelt.
 **/

/**
 * ngSanitize wird benötigt, da 
 * die Fragen HTML-Tags enthalten können 
 * (insbes. Kursivierung), die in der
 * App interpretiert angezeigt werden sollen.
 **/
var app = angular.module('ePhonetik',["ngSanitize"]);

app.controller('LektionenController', ['$window','ePhonetikData',function($window, ePhonetikData){
  var vm = this;
  vm.lektionen=[];				// Lektionen.fragen.antworten
  vm.iFrage=0;					// Frage X der Lektion
  vm.iFragenCount=0;			// Anzahl der Fragen der Lektion
  vm.userText='';				// Die vom Nutzer eingetippte Lösung
  vm.korrekturhinweis='';		// Markierung d. Unterschiede von korrekter		@deprecated?
								//    und eingereichter Lösung (rudimentär)
  vm.iFalscheAntwortProFrage=0;
  vm.iFalscheAntwortProLektion=0;
  vm.g_iFalscheAntwortProFrageLimit=2;

  /**
   * Die nächste Frage der Lektion wird angezeigt.
   * Falls es keine Frage mehr gibt: Rücksetzen.
   **/
  vm.nextQuestionOfLesson=function(){
	  vm.korrekturhinweis='';
	  vm.userText='';
	  vm.iFrage++;
	  vm.iFalscheAntwortProFrage=0;
	  
	  if(vm.iFrage>=vm.lektionen[$window.cboLektionen.value].lektion.fragen.count){
		  alert('Gratulation -- Sie haben diese Lektion abgeschlossen!');
		  vm.iFrage=0;
	  }
  }

  // @TODO: Vergleich mit _einer der richtigen_ Antworten -- anstatt mit Antwort 0
  /**
   * Vergleich der Antwort des Nutzers mit der als 
   * richtig hinterlegten Antwort.
   **/ 
  vm.evalAnswer=function(){
	  
	  // Keine Fehler, Lob & Anzeige der nächsten Frage
	  // dieser Lektion
	  if(vm.markMistakes()===0){
		  Alert.render('Excellent!', {"head":":-)"});
		  vm.nextQuestionOfLesson();
		  return;
		  
	  // Es gibt Fehler. Lösung zeigen?
	  }else{
		  vm.iFalscheAntwortProFrage++;
		  if(vm.iFalscheAntwortProFrage<=vm.g_iFalscheAntwortProFrageLimit){
			  Alert.render("Nope, that's not quite right, sorry.<br />Mayby this hint helps?<br />" + 
					vm.korrekturhinweis + 
					"<br />Try again!", {"head":":-("});
		  }else{
			  Alert.render("No &mdash; the answer is:<br /><p style='color:green'>" + 
					vm.lektionen[$window.cboLektionen.value].lektion.fragen[vm.iFrage].antworten[0].text + 
					"</p><br />Good luck for the next question...", {"head":":-("});
			  vm.nextQuestionOfLesson();
		  }

	  }
  };
  
  /**
   * Tastatur:
   * - Hinweis, falls vor Benutzung noch keine Lektion gewählt;
   * - Sonderfkt. für 'delete' und 'return'
   * - Anzeige des Tastenwerts im Feld
   **/
  vm.type=function(keyData){
	  if(isNaN(parseInt($window.cboLektionen.value))){
		  Alert.render('Bitte erst eine Lektion auswählen!\nPlease choose a lesson first!');
		  return;
	  }
	  var key = keyData.toElement.innerText;
	  if(key==='[space]') vm.userText+= ' ';	// space
	  else if(key==='[submit]') vm.evalAnswer();
	  else if(key==='[delete]') vm.userText = vm.userText.substr(0, vm.userText.length-1);
	  else vm.userText+=key;
  }
  
  /**
   * Zeigt Unterschiede von korrekter und eingereichter Lösung 
   * an. (Rudimentärer Vergleich, übereinfache Levenshtein Distance).
   **/
  vm.markMistakes=function(){
	  var iLenMist = vm.userText.trim().length;
	  var iLenSolu = vm.lektionen[$window.cboLektionen.value].lektion.fragen[vm.iFrage].antworten[0].text.length;
	  
	  var aMist=vm.userText.trim().split("");
	  var aSolu=vm.lektionen[$window.cboLektionen.value].lektion.fragen[vm.iFrage].antworten[0].text.split("");
	  
	  var iMax=Math.max(iLenMist, iLenSolu);
	  var sHTMLResult='';
	  
	  var iNumberOfDiffs=0;
	  
	  for(var ii=0; ii<iMax; ii++){
		  if(ii<iLenMist){
			  if(ii>iLenSolu) {sHTMLResult += '<font color="red">' + aMist[ii] + '</font>';iNumberOfDiffs++;}
			  else{
				  if(ii===iLenSolu || ii>=iLenMist || aMist[ii].trim()!==aSolu[ii].trim()){
					  sHTMLResult += '<font color="red">' + aMist[ii].replace(/ /g, '_') + '</font>';iNumberOfDiffs++;
				  }else{sHTMLResult += '<font color="green">' + aMist[ii] + '</font>';}
			  }
		  }else{
			  sHTMLResult += '<font color="red">_</font>';
			  iNumberOfDiffs++;
		  }
	  }
	  vm.korrekturhinweis=sHTMLResult;
	  return iNumberOfDiffs;
  }
  
  vm.refreshList = function(){
    ePhonetikData.getLektionen().then(function(data){
      vm.lektionen=data;
    }, function(err){
      $window.alert(err);
    });
  };
  
  vm.addTodo = function(){
    ePhonetikData.addTodo(vm.todoText).then(function(){
      vm.refreshList();
      vm.todoText="";
    }, function(err){
      $window.alert(err);
    });
  };
  
  vm.deleteTodo = function(id){
    ePhonetikData.deleteTodo(id).then(function(){
      vm.refreshList();
    }, function(err){
      $window.alert(err);
    });
  };
  
  function init(){
//	  ePhonetikData.dropDatabase();
    ePhonetikData.open().then(function(){
      vm.refreshList();
    });
  }
  
  init();
}]);
