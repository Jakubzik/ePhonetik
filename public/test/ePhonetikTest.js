/* 
 * Request-Parameter:
 * Keine
 * 
 * @TODO: 
 *  
 *  
 */

/**
 * ====================================================================
 * e P H O N E T I K   T E S T S
 * ====================================================================
 */
var expect = chai.expect;
var lektionen=[];
var g_bLogDetailsToConsole=true;
var oLektion={};
var g_iNeueFrageID=-1;

/**
 * Versionsinfo (.version, .autor, .datum) kann geladen werden.
 * 
 * Das Client-Frontend erkennt an einer neuen Versionsnr.
 * die Notwendigkeit, Lektionen neu zu laden.
 */ 
describe("Backend: kann Version laden", function() {
    it("Anfrage nach Version liefert valides JSON", function (done) {
        $.ajax({
            data: {},
            type:'GET',
            dataType:'json',
            url: '../api/version',
            success: function(data){
                expect(data.version).to.have.length.above(2);
                if(g_bLogDetailsToConsole){
					 console.log("Backend: Version laden ... folgende Versionsinfo wurde geladen:");
					 console.log(data);
					 console.log("\n\n");
				 }
                
                done();
            }
        });
    });
});

/**
 * Laden der Lektionen (mindestens zwei)
 */
describe("Backend: kann Lektionen laden", function() {
    it("Anfrage nach Lektionen liefert valides JSON und mehr als 2 Lektionen", function (done) {
        $.ajax({
            data: {},
            type:'GET',
            dataType:'json',
            url: '../api/lektion',
            success: function(data){
				lektionen=data;
                if(g_bLogDetailsToConsole){
					 console.log("Backend: kann Lektionen laden: folgende Lektionen wurden geladen:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data).to.have.length.above(2);
                done();
            }
        });
    });
});
describe("Lifecycle >Lektionen<", function() {
    it("Neue Lektion wird angelegt", function (done) {
		oLektion.bezeichnung='Test';
		oLektion.beschreibung='Durch automatischen Text erzeugte Lektion';
		oLektion.sequence=2001;
		
		if(g_bLogDetailsToConsole){
			 console.log("Lifecycle >Lektionen< ... folgende LEKTION wird angelegt:");
			 console.log(oLektion);
			 console.log("\n\n");
		}
		 
        $.ajax({
            data: oLektion,
            type:'POST',
            dataType:'json',
            url: '../api/lektion',
            success: function(data){
				oLektion.id=data.rows[0].lngLektionID;
                if(g_bLogDetailsToConsole){
					 console.log("Lifecycle >Lektionen< ... ID der neuen Lektion:");
					 console.log(data.rows[0].lngLektionID);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
    it(">Lektion< wird geändert", function (done) {
		oLektion.bezeichnung='Test222';
		oLektion.beschreibung='Durch automatischen Text geänderte Lektion';
		oLektion.sequence=-2001;
		
		if(g_bLogDetailsToConsole){
			 console.log(">Lektion< wird geändert:");
			 console.log(oLektion);
			 console.log("\n\n");
		}
		 
        $.ajax({
            data: oLektion,
            type:'PUT',
            dataType:'json',
            url: '../api/lektion',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log(">Lektion< wird geändert ... Rückgabewert der Änderung");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
    it("Neue Lektion wird wieder gelöscht", function (done) {
		console.log('Löschen von ' + oLektion.id);
		if(g_bLogDetailsToConsole){
			 console.log("Neue Lektion wird wieder gelöscht ... folgende LEKTION wird gelöscht:");
			 console.log(oLektion);
			 console.log("\n\n");
		}
		 
        $.ajax({
            data: oLektion,
            type:'DELETE',
            dataType:'json',
            url: '../api/lektion',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Neue Lektion wird wieder gelöscht ... Rückgabewert des Löschens:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
});

describe("Lifecycle Frage", function() {
    it("Frage 0 aus Lektion 0 wird geändert...", function (done) {
		var oFrageOrig=lektionen[0].fragen[0];
		var sTextOrig=oFrageOrig.text;
		console.log(sTextOrig);
		oFrageOrig.text='Durch Test geändert';

		if(g_bLogDetailsToConsole){
			 console.log("Frage 0 aus Lektion 0 wird geändert ... ediere Frage '" + sTextOrig + "'");
		}
		 
        $.ajax({
            data: oFrageOrig,
            type:'PUT',
            dataType:'json',
            url: '../api/frage',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Frage 0 aus Lektion 0 wird geändert ... Änderung der Frage bringt diese Antwort:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                // undo
                oFrageOrig.text=sTextOrig;
                done();
            }
        });
    });
    
    it("Frage 0 aus Lektion 0 wird wieder hergestellt...", function (done) {
		var oFrageOrig=lektionen[0].fragen[0];
		
		if(g_bLogDetailsToConsole){
			 console.log("Frage 0 aus Lektion 0 wird wieder hergestellt...setzt die Frage zurück auf: '" + oFrageOrig.text + "'");
			 console.log("\n\n");
		}
		 
        $.ajax({
            data: oFrageOrig,
            type:'PUT',
            dataType:'json',
            url: '../api/frage',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Frage 0 aus Lektion 0 wird wieder hergestellt...Erneute Änderung der Frage bringt diese Antwort:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
    
    it("Füge neue Frage zu Lektion 0 hinzu...", function (done) {
		var oFrageOrig=lektionen[0].fragen[0];
		
		var oFrageNeu={};
		oFrageNeu.lektion_id=lektionen[0].id;
		oFrageNeu.text='Frage von automatischer Testfunktion.';
		oFrageNeu.sequence=10000;
		 
        $.ajax({
            data: oFrageNeu,
            type:'POST',
            dataType:'json',
            url: '../api/frage',
            success: function(data){
				g_iNeueFrageID=parseInt(data.rows[0].lngFrageID);
                if(g_bLogDetailsToConsole){
					 console.log("Füge neue Frage zu Lektion 0 hinzu...Antwort:");
					 console.log(data);
					 console.log(data.rows[0].lngFrageID);
					 g_iNeueFrageID=data.rows[0].lngFrageID;
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
    
    it("Lösche neue Frage wieder...", function (done) {
		var oFrageOrig=lektionen[0].fragen[0];
		
		var oFrageNeu={};
		oFrageNeu.lektion_id=lektionen[0].id;
		oFrageNeu.text='Frage von automatischer Testfunktion.';
		oFrageNeu.sequence=10000;
		oFrageNeu.id=g_iNeueFrageID;
		 
        $.ajax({
            data: oFrageNeu,
            type:'DELETE',
            dataType:'json',
            url: '../api/frage',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Lösche neue Frage wieder...Antwort:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
});

describe("Lifecycle Antwort", function() {
    
    it("Antwort 0 aus Frage 0 aus Lektion 0 wird geändert...", function (done) {
		var oAntwortOrig=lektionen[0].fragen[0].antworten[0];
		oAntwortOrig.frage_id=lektionen[0].fragen[0].id;
		var sTextOrig=oAntwortOrig.text;
		console.log(sTextOrig);
		oAntwortOrig.text='Durch Test geändert: öäüß';

		if(g_bLogDetailsToConsole){
			 console.log("Antwort (0,0,0) wird geändert ... ediere Antwort '" + sTextOrig + "'");
		}
		 
        $.ajax({
            data: oAntwortOrig,
            type:'PUT',
            dataType:'json',
            url: '../api/antwort',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Antwort (0,0,0) ... Änderung der Frage bringt diese Antwort:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                // undo
                oAntwortOrig.text=sTextOrig;
                done();
            }
        });
    });
    
    it("Antwort (0,0,0) wird wiederhergestellt...", function (done) {
		var oAntwortOrig=lektionen[0].fragen[0].antworten[0];
		oAntwortOrig.frage_id=lektionen[0].fragen[0].id;
		if(g_bLogDetailsToConsole){
			 console.log("Antwort (0,0,0) wird wiederhergestellt... setze Antwort auf '" + oAntwortOrig.text + "'");
		}
		 
        $.ajax({
            data: oAntwortOrig,
            type:'PUT',
            dataType:'json',
            url: '../api/antwort',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Antwort (0,0,0) wird wiederhergestellt ... Änderung der Antwort bringt diese Response:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
});
