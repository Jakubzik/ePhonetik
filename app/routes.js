var Lektion 	= require('./models/lektion');
var Frage 	= require('./models/frage');
var EPhonetik	= require('./models/ePhonetik');

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// //////////////////////////////////////////////////////////////

// Handler-Funktionen zum Lifecycle:

//   .getLektionen,
//   .addLektion,
//   .updateLektion,
//   .deleteLektion

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// //////////////////////////////////////////////////////////////
/**
 * Liest die Lektionen aus der Postgres-Datenbank
 * aus und gibt sie als JSON zurück.
 * Der Parameter "iLektion" ist tot.
 */
function getLektionen(res, iLektion){
	Lektion.load(function(err, arrLektionen) {
			if (err) res.send(err)
			res.json(arrLektionen);
	});
};

function addLektion(req, res){
	Lektion.add(req.body, function(err, oResponse){
		if(err) res.send(err);
		res.json(oResponse);
	});
};

function updateLektion(req, res){
	Lektion.update(req.body, function(err, oResponse){
		if(err) res.send(err);
		res.json(oResponse);
	});
};

function deleteLektion(req, res){
	Lektion.drop(req.body, function(err, oResponse){
		if(err) res.send(err);
		res.json(oResponse);
	});
};
/**
 * Liest die Lektionen aus der Postgres-Datenbank
 * aus und gibt sie als JSON zurück.
 * Der Parameter "iLektion" ist tot.
 */
function updateFrage(req, res){
	Frage.update(req.body, function(err, oResponse) {
			if (err) res.send(err);
			res.json(oResponse);
	});
};
function addFrage(req, res){
	Frage.add(req.body, function(err, oResponse) {
			if (err) res.send(err);
			res.json(oResponse);
	});
};
function getEPhonetikVersion(res){
	EPhonetik.version(function(err, oAppInfo) {
			if (err) res.send(err)
			res.json(oAppInfo);
	});
};

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// //////////////////////////////////////////////////////////////

// "Exportierte" API Funktionen zu den URLs

//	/api/version		[get]
//  /api/lektion		[get, post, delete, put]

// \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
// //////////////////////////////////////////////////////////////

module.exports = function(app) {

	// APP-Backend-Datenbestands-VERSION
	app.get('/api/version', function(req, res){
		getEPhonetikVersion(res);
	});

	// --------------------------------------
	// Lifecycle LEKTION ++++++++++++++++++++

	app.get('/api/lektion', function(req, res) {
		getLektionen(res,1);
	});

	app.post('/api/lektion', function(req, res) {
		addLektion(req,res);
	});

	app.put('/api/lektion', function(req, res) {
		addLektion(req,res);
	});
	
	app.delete('/api/lektion', function(req, res) {
		deleteLektion(req,res);
	});
	
	// --------------------------------------
	// Lifecycle FRAGE ++++++++++++++++++++
	app.put('/api/frage', function(req, res) {
		updateFrage(req, res);
	});
	app.post('/api/frage', function(req, res) {
		addFrage(req, res);
	});
	// --------------------------------------
	// Lifecycle ANTWORT ++++++++++++++++++++

	// --------------------------------------
	// DEFAULT

	// application -------------------------------------------------------------
	app.get('*', function(req, res) {
		res.sendfile('./public/index.html'); // load the single view file (angular will handle the page changes on the front-end)
	});
};
