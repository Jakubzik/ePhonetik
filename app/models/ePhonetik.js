var dbConnection = require('../../config/database');
var pg = require('/home/heiko/npm/node_modules/pg');

/**
 * Versionsinfo zu den aktuellen Lektionen.
 * 
 * Der Client kann so neue bzw. korrigierte Lektionen 
 * laden, ohne bei jedem Start alle Lektionen neu 
 * herunterzuladen.
 **/
function version(fSuccess){
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect(function(err) {

		client.query('SELECT * from "tblAppInfo" where "blnAppInfoVersionAktiv"=true;', function(err, result) {
			if(result.rows.length>1) throw ('ePhonetik Backend Problem: mehr als eine App-Version ist als aktiv markiert!');
			if(result.rows.length<=0) throw ('ePhonetik Backend Problem: keine App-Version ist als aktiv markiert!');
			oReturn.version=result.rows[0].strAppInfoVersion;
			oReturn.datum=result.rows[0].strAppInfoVersionDatum;
			oReturn.beschreibung=result.rows[0].strAppInfoVersionBeschreibung;
			fSuccess(err,oReturn);
		});
	});
}
module.exports.version = version;
