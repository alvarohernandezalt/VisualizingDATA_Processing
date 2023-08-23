import processing.pdf.*;
import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;
boolean record = false;

String csv[], csv1[], csv2[], csv3[], csv4[];
String myData[][], myData1[][], myData2[][], myData3[][], myData4[][];
String ccaa[] = new String[0];
Table table2;
PFont f;
PFont f2;
HRect d, d1, d2, d3, d4;

HDrawablePool pool;


int[] colors = {#FCF2CB,#FFB00D,#FF8926,#BC2D19};

//OrigendelMarco
int marcoOrigen = 20;
int muestraSize = 20;

int anclaX = 180;
int anclaY = 60;




void setup() {
	size(1200, 1180);
	// noLoop();
	
    H.init(this).background(#222222).autoClear(true);

    f = createFont("Bau-Regular", 9);
    f2 = createFont("HelveticaNeueLTW1G-Cn", 8);
    textMode(MODEL);

    csv = loadStrings("TOTAL_ccaa.csv");
	myData = new String[csv.length][19];
	for(int i=0; i<csv.length; i++) {
	   myData[i] = csv[i].split(",");
    }

    csv1 = loadStrings("TOT_inco_ccaa.csv");
	myData1 = new String[csv1.length][19];
	for(int i=0; i<csv1.length; i++) {
	   myData1[i] = csv1[i].split(",");
    }

    csv2 = loadStrings("TOT_decl_ccaa.csv");
	myData2 = new String[csv2.length][19];
	for(int i=0; i<csv2.length; i++) {
	   myData2[i] = csv2[i].split(",");
    }

	table2 = loadTable("BIC_CCAA_TOTAL100.csv", "header");
  	for (TableRow row : table2.rows()) {
      ccaa = append(ccaa, row.getString("Comunidad Autonoma"));
    }

    for (int i = 0; i < ccaa.length; ++i) {
    	HText ccA =new HText(ccaa[i],10,f);
    	ccA.fill(240).anchorAt(H.RIGHT).loc(120+marcoOrigen, 35+marcoOrigen+(60*i));
    	H.add(ccA);
    	// fill(240);
    	// textAlign(RIGHT);
    	// textFont(f);
    	// text(ccaa[i], 120+marcoOrigen, 45+marcoOrigen+(60*i));    	
    }


    for (int u = 0; u < 19; ++u) { 

    	for (int i = 0; i < 17; ++i) {
    		
    		d = new HRect().rounding(5);
			H.add(d)
			// .strokeWeight(1)
			// .stroke(#FF3300)
			.noStroke()
			.fill(colors[1])
			.size( map(float(myData[u][i]), 0, 4000, 15, 40) )
			.loc( anclaX+(60*(i)), anclaY+(60*(u)) )
			.anchorAt(H.CENTER)
			;
			
			d1 = new HRect().rounding(3);
			H.add(d1)
			
			.noStroke()
			.fill(colors[2])
			.size(map(float(myData1[u][i]), 0, 4000, 10, 30))
			.loc( anclaX+(60*(i)+10), anclaY+(60*(u)) )
			.anchorAt(H.CENTER)
    		;

    		d2 = new HRect().rounding(3);
			H.add(d2)
			
			.noStroke()
			.fill(colors[3])
			.size(map(float(myData2[u][i]), 0, 4000, 10, 30))
			.loc( anclaX+(60*(i)-10), anclaY+(60*(u)) )
			.anchorAt(H.CENTER)
    		;

    		HText nuM =new HText(myData[u][i],8,f2);
    		nuM.fill(240).anchorAt(H.CENTER).loc(anclaX+(60*(i)), anclaY+(60*(u)+25));
    		H.add(nuM);

    		HText nuM2 =new HText(myData1[u][i],7,f2);
    		nuM2.fill(colors[2]).anchorAt(H.CENTER).loc(anclaX+(60*(i)+10), anclaY+(60*(u)+15));
    		H.add(nuM2);

    		HText nuM3 =new HText(myData2[u][i],7,f2);
    		nuM3.fill(colors[3]).anchorAt(H.CENTER).loc(anclaX+(60*(i)-10), anclaY+(60*(u)+15));
    		H.add(nuM3);
    	}
	}
	// println(float(myData[5][3]));
}

void draw() {
	
	
	H.drawStage();


  
	saveVector();
  	

		
}

void saveVector() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "/render/A3mCa08.pdf");
	}

	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}	
}

void mousePressed() {
    record = true;
}
