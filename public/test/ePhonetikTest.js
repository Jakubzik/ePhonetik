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
					 console.log("Folgende Versionsinfo wurde geladen:");
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
					 console.log("Folgende Lektionen wurden geladen:");
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
			 console.log("Folgende LEKTION wird angelegt:");
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
					 console.log("ID der neuen Lektion:");
					 console.log(data.rows[0].lngLektionID);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
    it("Lektion wird geändert", function (done) {
		oLektion.bezeichnung='Test222';
		oLektion.beschreibung='Durch automatischen Text geänderte Lektion';
		oLektion.sequence=-2001;
		
		if(g_bLogDetailsToConsole){
			 console.log("LEKTION folgendermaßen geändert:");
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
					 console.log("Rückgabewert der Änderung");
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
			 console.log("Folgende LEKTION wird gelöscht:");
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
					 console.log("Rückgabewert des Löschens:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
});

describe("Kann Frage edieren", function() {
    it("Frage 0 aus Lektion 0 wird geändert...", function (done) {
		var oFrageOrig=lektionen[0].fragen[0];
		var sTextOrig=oFrageOrig.text;
		console.log(sTextOrig);
		oFrageOrig.text='Durch Test geändert';

		if(g_bLogDetailsToConsole){
			 console.log("Ediere Frage '" + sTextOrig + "'");
		}
		 
        $.ajax({
            data: oFrageOrig,
            type:'PUT',
            dataType:'json',
            url: '../api/lektion',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Änderung der Frage bringt diese Antwort:");
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
			 console.log("Setzt die Frage zurück auf: '" + oFrageOrig.text + "'");
			 console.log("\n\n");
		}
		 
        $.ajax({
            data: oFrageOrig,
            type:'PUT',
            dataType:'json',
            url: '../api/lektion',
            success: function(data){
                if(g_bLogDetailsToConsole){
					 console.log("Erneute Änderung der Frage bringt diese Antwort:");
					 console.log(data);
					 console.log("\n\n");
				 }
                expect(data.rowCount).to.equal(1);
                done();
            }
        });
    });
});
