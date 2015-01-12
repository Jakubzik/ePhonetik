var dbConnection = require('../../config/database');
var pg = require('pg');

/**
 * @desc Ändert den Text der Antwort in der Datenbank
 * des Backends.
 * @param {object} oAntwort. oAntwort hat die Eigenschaften frage_id, .id, .text, optional auch: .korrekt <boolean>
 * @param {function} fSuccess. fSuccess wird aufgerufen als fSuccess(err,result)
 **/
function update(oAntwort, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oAntwort.id || isNaN(oAntwort.id)) {fSuccess({"message":"Die übergebene Antwort hat keine >id<. Die Antwort kann \
		leider nicht geändert werden."}, undefined);return};

	if(!oAntwort.frage_id || isNaN(oAntwort.frage_id)) {fSuccess({"message":"Die übergebene Antwort hat keine >frage_id<. Die Antwort kann \
		leider nicht geändert werden."}, undefined);return};

	if(!oAntwort.text) {fSuccess({"message":"Die übergebene Antwort hat keinen >text<. Die Antwort kann \
		leider nicht geändert werden."}, undefined);return};
	
	// =======================================
	// Update an Datenbank absetzen.
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect(function(err) {
		if(oAntwort.korrekt && (oAntwort.korrekt===true ||oAntwort.korrekt===false)){
			client.query('update "tblSdAntwort" set "strAntwortText"=$1, "blnAntwortKorrekt"=$2 where "lngAntwortID"=$3 and "lngFrageID"=$4;', [oAntwort.text,oAntwort.korrekt,oAntwort.id,oAntwort.frage_id], function(err, result) {
				if(result.rowCount !== 1) err={"message":"Es wurden " + result.rowCount + " Zeilen geändert ... erwartet wurde das Update einer einzigen Zeile"};
				fSuccess(err,result);
			});

		}else{
			client.query('update "tblSdAntwort" set "strAntwortText"=$1 where "lngAntwortID"=$2 and "lngFrageID"=$3;', [oAntwort.text,oAntwort.id,oAntwort.frage_id], function(err, result) {
				if(result.rowCount !== 1) err={"message":"Es wurden " + result.rowCount + " Zeilen geändert ... erwartet wurde das Update einer einzigen Zeile"};
				fSuccess(err,result);
			});
		}
	});
}

/**
 * @desc Fügt die Frage oFrageXLektion der Datenbank 
 * des Backends hinzu.
 * 
 * Dazu wird die Frage in den beiden Tabellen
 * tblSdFrage und tblSdLektionXFrage eingetragen.
 * @TODO: Möglichkeit, vorhandene Frage anderer 
 *        Lektion zuzuordnen?
 * @param {object} oFrageXLektion braucht die 
 * 			Eigenschaften:
 * 			.text 		(Text der Frage),
 * 			.lektion_id (welcher Lektion zugeordnet),
 * 			.sequence	(an welcher Reihenfolgeposition der 
 * 						 Lektion wird diese Frage gezeigt?)
 * @param {function} fSuccess. fSuccess wird aufgerufen mit .err,result
 * @return per fSuccess mit err.message bzw. der ID der 
 * 			neu erzeugten Frage in result.rows[0].lngFrageID.
 **/
function TODOadd(oFrageXLektion, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oFrageXLektion.text) fSuccess({"message":"Die übergebene Frage hat keinen >text<. Die Frage kann \
		leider nicht hinzugefügt werden."}, undefined);

	if(!oFrageXLektion.lektion_id || isNaN(oFrageXLektion.lektion_id)) fSuccess({"message":"Die übergebene Frage hat keine >id<. Die Frage kann \
		leider nicht hinzugefügt werden."}, undefined);
			
	if(!oFrageXLektion.sequence || isNaN(oFrageXLektion.sequence)) fSuccess({"message":"Die übergebene Frage hat keine >sequence<. Die Frage kann \
		leider nicht hinzugefügt werden."}, undefined);	

	// =======================================
	// Füge die Frage in der Datenbank hinzu,
	// in den Tabellen
	// tblSdFrage sowie
	// tblSdLektionXFrage.
	// Beide Inserts sind in einer Trans-
	// aktion gekoppelt
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect();
	
	var rollback = function(client) {
	  client.query('ROLLBACK', function() {
		client.end();
	  });
	};
	
	client.query('BEGIN', function(err, result) {
	  if(err) return rollback(client);
	  client.query('INSERT INTO "tblSdFrage"( \
            "lngFrageID", "strFrageText") \
			select max("lngFrageID")+1, $1 from "tblSdFrage" returning "lngFrageID";', [oFrageXLektion.text], function(err, result) {
				
		if(err) return rollback(client);
		
		client.query('INSERT INTO "tblSdLektionXFrage"( \
            "lngLektionID", "lngFrageID", "lngLektionFrageSequence") \
			VALUES ($1, $2, $3) returning "lngFrageID";', [oFrageXLektion.lektion_id,result.rows[0].lngFrageID,oFrageXLektion.sequence], function(err, result) {
		  if(err) return rollback(client);
		  client.query('COMMIT', client.end.bind(client));
		  fSuccess(err,result);
		});
	  });
	});
};

/**
 * @desc Löscht die Frage aus der Datenbank des 
 * Backends.
 * @TODO:  Möglichkeit einbauen, lediglich die 
 * 			Zuordnung zu löschen? Oder sonst
 * 			intelligenter zu agieren?
 * @param {object} oFrage 
 * 			Eigenschaften:
 * 			.id,
 * @param {function} fSuccess. fSuccess wird aufgerufen mit .err,result
 * @return per fSuccess mit err.message bzw. result.rowCount.
 **/
function TODOdrop(oFrage, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oFrage.id || isNaN(oFrage.id)) fSuccess({"message":"Die übergebene Frage hat keine >id<. Die Frage kann \
		leider nicht gelöscht werden."}, undefined);
			
	// =======================================
	// Lösche die Frage vom Backend, d.h. aus
	// tblSdFrage sowie
	// tblSdLektionXFrage.
	// Beide DELETEs sind in einer Trans-
	// aktion gekoppelt
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect();
	
	var rollback = function(client) {
	  client.query('ROLLBACK', function() {
		client.end();
	  });
	};
	
	client.query('BEGIN', function(err, result) {
	  if(err) return rollback(client);
	  client.query('DELETE FROM "tblSdLektionXFrage" \
            where "lngFrageID"=$1;', [oFrage.id], function(err, result) {
				
		if(err) return rollback(client);
		
		client.query('DELETE FROM "tblSdFrage" \
            where "lngFrageID"=$1;', [oFrage.id], function(err, result) {
			  if(err) return rollback(client);
			  client.query('COMMIT', client.end.bind(client));
			  fSuccess(err,result);
		});
	  });
	});
};

//module.exports.drop = drop;
module.exports.update = update;
//module.exports.add = add;
