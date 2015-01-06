var dbConnection = require('../../config/database');
var pg = require('/home/heiko/npm/node_modules/pg');


function load_neuer(fSuccess){
	pg.connect(dbConnection.connString, function(err, client, done) {
	var sReturn='';
	client.connect(function(err) {
		  if(err) {
			process.stdout.write('error fetching client from pool:\n---------------\n' + err);
		  }
		  
  		  client.query('SELECT "lngFrageID", "strFrageText" from "tblSdFrage"', function(err, result) {
			done();

			if(err) {
				process.stdout.write('error running query:\n---------------\n' + err);
			}
			
			for(var ii=0;ii<result.rows.length;ii++){
				process.stdout.write('Zeile...' + ii + '\n');
			   if(ii>0) sReturn += ',';
			   sReturn += '{"frage":{"id":' + result.rows[ii].lngFrageID + ', "text":"' + result.rows[ii].strFrageText + '"}}';
			 }
			 process.stdout.write( '\n\n\n{"fragen":[' + sReturn + ']}');
			 sReturn= '{"fragen":[' + sReturn + ']}';
			 process.stdout.write('\n\n...passed "load"...\n');
			 fSuccess(sReturn);
		});
	});
	});
}

function load(fSuccess){
	var client = new pg.Client(dbConnection.connString);
	var oReturn=[];
	client.connect(function(err) {
//		process.stdout.write(err);
		client.query('SELECT "lngFrageID", "strFrageText" from "tblSdFrage"', function(err, result) {
			
			for(var ii=0;ii<result.rows.length;ii++){
			   var tmp={};
			   process.stdout.write('Zeile...' + ii + '\n');
			   tmp.id=result.rows[ii].lngFrageID;
			   tmp.text=result.rows[ii].strFrageText;
			   oReturn.push(tmp);
			 }
			 process.stdout.write(oReturn.length + '...\n' + oReturn[3].text + "\n" + oReturn[5].length);
			 //sReturn= '{"fragen":[' + sReturn + ']}';
//			 sReturn= '[' + sReturn + ']';
			 process.stdout.write('\n\n...passed "load"...\n');
			 fSuccess(err,oReturn);
		});
	});
}

function load2(fSuccess){
	var client = new pg.Client(dbConnection.connString);
	var sReturn='';
	client.connect(function(err) {
//		process.stdout.write(err);
		client.query('SELECT "lngFrageID", "strFrageText" from "tblSdFrage"', function(err, result) {
			
			for(var ii=0;ii<result.rows.length;ii++){
				process.stdout.write('Zeile...' + ii + '\n');
			   if(ii>0) sReturn += ',';
			   sReturn += '{"id":' + result.rows[ii].lngFrageID + ', "text":"' + result.rows[ii].strFrageText + '"}';
			 }
			 process.stdout.write( '\n\n\n{"fragen":[' + sReturn + ']}');
			 //sReturn= '{"fragen":[' + sReturn + ']}';
			 sReturn= '[' + sReturn + ']';
			 process.stdout.write('\n\n...passed "load"...\n');
			 fSuccess(err,sReturn);
		});
	});
}

module.exports.load = load;
