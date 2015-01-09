var dbConnection = require('../../config/database');
var pg = require('/home/heiko/npm/node_modules/pg');

function update(oFrage, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oFrage.id) fSuccess({"message":"Die übergebene Frage >" + oFrage + "< hat keine >id<. Die Frage kann \
		leider nicht geändert werden."}, undefined);

	if(!oFrage.text) fSuccess({"message":"Die übergebene Frage hat keinen >text<. Die Frage kann \
		leider nicht geändert werden."}, undefined);
			
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect(function(err) {
		client.query('update "tblSdFrage" set "strFrageText"=$1 where "lngFrageID"=$2;', [oFrage.text,oFrage.id], function(err, result) {
			if(result.rowCount !== 1) err={"message":"Es wurden " + result.rowCount + " Zeilen geändert ... erwartet wurde das Update einer einzigen Zeile"};
			fSuccess(err,result);
		});
	});
}

function add(oFrageXLektion, fSuccess){
	
	// =======================================
	// Schnittstelle
	if(!oFrageXLektion.text) fSuccess({"message":"Die übergebene Frage hat keinen >text<. Die Frage kann \
		leider nicht hinzugefügt werden."}, undefined);

	if(!oFrageXLektion.lektion_id || isNaN(oFrageXLektion.lektion_id)) fSuccess({"message":"Die übergebene Lektion hat keine >id<. Die Frage kann \
		leider nicht hinzugefügt werden."}, undefined);
			
	if(!oFrageXLektion.sequence || isNaN(oFrageXLektion.sequence)) fSuccess({"message":"Die übergebene Lektion hat keine >sequence<. Die Frage kann \
		leider nicht hinzugefügt werden."}, undefined);	
		
	var client = new pg.Client(dbConnection.connString);
	var oReturn={};
	var tmpFrageID=-1;
	client.connect();
	
	var rollback = function(client) {
	  //terminating a client connection will
	  //automatically rollback any uncommitted transactions
	  //so while it's not technically mandatory to call
	  //ROLLBACK it is cleaner and more correct
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
		  //disconnect after successful commit
		  client.query('COMMIT', client.end.bind(client));
		  
		  fSuccess(err,result);
		});
	  });
	});
};

module.exports.update = update;
module.exports.add = add;
