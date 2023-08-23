import processing.pdf.*;
import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;

String csv[], csv1[], csv2[], csv3[], csv4[];
String myData[][], myData1[][], myData2[][], myData3[][], myData4[][];
String ccaa[] = new String[0];
Table table2;
PFont f;
PFont f2;
HRect d, d1, d2, d3, d4;

int[] colors = {#FCF2CB,#FFB00D,#FF8926,#BC2D19};

//OrigendelMarco
int marcoOrigen = 20;
int muestraSize = 20;

int anclaX = 180;
int anclaY = 60;

void setup() {
	size(1200, 1180);
	H.init(this).background(#222222).autoClear(true);

    f = createFont("Bau-Regular", 9);
    f2 = createFont("HelveticaNeueLTW1G-Cn", 8);
    textMode(MODEL);

    csv = loadStrings("MON_ccaa.csv");
	myData = new String[csv.length][13];
	for(int i=0; i<csv.length; i++) {
	   myData[i] = csv[i].split(",");
    }

    csv1 = loadStrings("ARQ_ccaa.csv");
	myData1 = new String[csv1.length][13];
	for(int i=0; i<csv1.length; i++) {
	   myData1[i] = csv1[i].split(",");
    }

    csv2 = loadStrings("SIT_ccaa.csv");
	myData2 = new String[csv2.length][13];
	for(int i=0; i<csv2.length; i++) {
	   myData2[i] = csv2[i].split(",");
    }

    csv3 = loadStrings("JAR_ccaa.csv");
	myData3 = new String[csv3.length][13];
	for(int i=0; i<csv3.length; i++) {
	   myData3[i] = csv3[i].split(",");
    }

	table2 = loadTable("BIC_CCAA_TOTAL100.csv", "header");
  	for (TableRow row : table2.rows()) {
      ccaa = append(ccaa, row.getString("Comunidad Autonoma"));
    }

    beginRecord(PDF, "A3ptCA01.pdf");
    
    for (int i = 0; i < ccaa.length; ++i) {
    	// HText ccA =new HText(ccaa[i],10,f);
    	// ccA.fill(240).anchorAt(H.RIGHT).loc(120+marcoOrigen, 35+marcoOrigen+(60*i));
    	// H.add(ccA);
    	fill(240);
    	textAlign(RIGHT);
    	textFont(f);
    	text(ccaa[i], 120+marcoOrigen, 45+marcoOrigen+(60*i));    	
    }

    for (int i = 0; i < csv.length; ++i) {

    	for (int u = 0; u < 13; ++u) {
    		
    	}
    	
    }

}

void draw {

	
}