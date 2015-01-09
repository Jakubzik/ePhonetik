var dbConnection = require('../../config/database');
var pg = require('/home/heiko/npm/node_modules/pg');

/**
 * Objektrelationales Mapping:
 * tblLektion ¹ - n tblFrage ¹ - n tblAntwort
 * 
 * -->
 * [
 *   lektion (id, text, sequence, 
 * 		fragen [
 * 				frage (id, text, sequence, 
 * 					antworten [
 * 						antwort(id, text)
 * 					])
 * 		])
 * ]
 * 
 **/
function load(fSuccess){
	var client = new pg.Client(dbConnection.connString);
	var oReturn=[];
	var tmpFrageID=-1;
	client.connect(function(err) {

		client.query('SELECT \
			  l."lngLektionID", \
			  l."strLektionBeschreibung", \
			  f."lngFrageID", \
			  f."strFrageText", \
			  a."lngAntwortID", \
			  a."strAntwortText" \
			FROM \
			  "tblSdLektion" l, \
			  "tblSdLektionXFrage" x, \
			  "tblSdFrage" f, \
			  "tblSdAntwort" a \
			WHERE \
			  l."lngLektionID" = x."lngLektionID" AND \
			  f."lngFrageID" = x."lngFrageID" AND \
			  a."lngFrageID" = f."lngFrageID" \
			ORDER BY \
			  l."lngLektionSequence" ASC, \
			  x."lngLektionFrageSequence" ASC;', function(err, result) {
			
			for(var ii=0;ii<result.rows.length;ii++){
			
			   // Zu Beginn wird eine neue Lektion angelegt
			   if(ii==0){
				   var lektion={};
				   lektion.id=result.rows[ii].lngLektionID;
				   lektion.text=result.rows[ii].strLektionBeschreibung;
				   lektion.fragen=[];
			   }else{
				   // Falls eine neue Lektion beginnt, muss 
				   // die alte abgewickelt und die neue 
				   // angelegt werden:
				   if(lektion.id!==result.rows[ii].lngLektionID){
					   oReturn.push(lektion);
					   lektion={};
					   lektion.id=result.rows[ii].lngLektionID;
					   lektion.text=result.rows[ii].strLektionBeschreibung;
					   lektion.fragen=[];
				   }
			   }
			   
			   var antwort={};
			   antwort.id=result.rows[ii].lngAntwortID;
			   antwort.text=result.rows[ii].strAntwortText;
			   
			   // Falls der Datensatz eine neue Frage enthält
			   // (und nicht nur eine alternative Antwort), 
			   // muss diese initialisiert werden
			   if(tmpFrageID!=result.rows[ii].lngFrageID){
					frage={};
					frage.id=result.rows[ii].lngFrageID;
					frage.text=result.rows[ii].strFrageText;
					frage.antworten=[];
			   }
			   
			   frage.antworten.push(antwort);
			   lektion.fragen.push(frage);
			   
			   tmpFrageID=result.rows[ii].lngFrageID;
			 }
			 oReturn.push(lektion);
			 fSuccess(err,oReturn);
		});
	});
}

/**
 * Füge neue Lektion in die Datenbank ein (noch 
 * ohne Fragen und Antworten):
 * .bezeichnung
 * .beschreibung
 * .sequence
 * 
 * Die LektionID wird automatisch ermittelt (fort-
 * laufend) und als Rückgabewert "lngLektionID" 
 * geliefert (.rows[0].lngLektionID).
 */ 
function add(oLektion, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oLektion.bezeichnung) fSuccess({"message":"Die übergebene Lektion >" + oLektion + "< hat keine >bezeichnung<. Die Lektion kann \
		leider nicht gespeichert werden."}, undefined);
	
	if(!oLektion.beschreibung) oLektion.beschreibung='';
	
	if(isNaN(oLektion.sequence)) fSuccess({"message":"Die übergebene Lektion soll an Position >" + oLektion.sequence + "< erscheinen -- \
		das ist ein nicht-numerischer Wert. Die Lektion kann \
		leider nicht gespeichert werden."}, undefined);
		
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect(function(err) {
		client.query('INSERT INTO "tblSdLektion"( \
            "lngLektionID", "strLektionBezeichnung", "strLektionBeschreibung", \
            "lngLektionSequence") \
			select max("lngLektionID")+1, $1, $2, $3 from "tblSdLektion" returning "lngLektionID";', [oLektion.bezeichnung,oLektion.beschreibung,oLektion.sequence], function(err, result) {
			fSuccess(err,result);
		});
	});
};

/**
 * Ändere Bezeichnung, Beschreibung oder Sequence der Lektion 
 * (die anhand von oLektion.id identifiziert wird).
 */ 
function update(oLektion, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oLektion.id || isNaN(oLektion.id)) fSuccess({"message":"Die übergebene Lektions-ID >" + oLektion.id + "< ist nicht numerisch. Die Lektion kann \
		leider nicht geändert werden."}, undefined);
			
	var client = new pg.Client(dbConnection.connString);
	client.connect(function(err) {
		client.query('UPDATE "tblSdLektion" \
            set "strLektionBezeichnung"=$1, "strLektionBeschreibung"=$2, \
            "lngLektionSequence"=$3 where "lngLektionID"=$4);', 
            [oLektion.bezeichnung,oLektion.beschreibung,oLektion.sequence, oLektion.id], function(err, result) {
			fSuccess(err,result);
		});
	});
};

/**
 * Lösche die übergebene Lektion aus der Datenbank 
 * (Relevant ist nur oLektion.id).
 */ 
function drop(oLektion, fSuccess){
	// =======================================
	// Schnittstelle
	if(!oLektion.id || isNaN(oLektion.id)) fSuccess({"message":"Die übergebene Lektion hat die unbekannte ID >" + oLektion.id + "<. Die Lektion kann \
		leider nicht gelöscht werden."}, undefined);
		
	var client = new pg.Client(dbConnection.connString);
	var tmpFrageID=-1;
	client.connect(function(err) {
		client.query('delete from "tblSdLektion" \
            where "lngLektionID" = $1;', [oLektion.id], function(err, result) {
			fSuccess(err,result);
		});
	});
}

module.exports.load = load;
module.exports.drop = drop;
module.exports.add = add;
