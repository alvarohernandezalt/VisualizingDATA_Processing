import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.pdf.*; 
import hype.*; 
import hype.extended.behavior.*; 
import hype.extended.colorist.*; 
import hype.extended.layout.*; 
import hype.interfaces.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class A3mCa07 extends PApplet {







boolean record = false;

String csv[];
String myData[][];
String ccaa[] = new String[0];
Table table2;
PFont f;
PFont f2;
HRect d, d1, d2, d3, d4;

HDrawablePool pool;


int[] colors = {0xffFCF2CB,0xffFFB00D,0xffFF8926,0xffBC2D19};

//OrigendelMarco
int marcoOrigen = 20;
int muestraSize = 20;

int anclaX = 170;
int anclaY = 60;




public void setup() {
	
	// noLoop();
	
    H.init(this).background(0xff222222).autoClear(true);

    f = createFont("Bau-Regular", 9);
    f2 = createFont("HelveticaNeueLTW1G-Cn", 8);
    textMode(MODEL);

    csv = loadStrings("Book3.csv");
  	println(csv);
	myData = new String[csv.length][20];
	for(int i=0; i<csv.length; i++) {
	   myData[i] = csv[i].split(",");
       // println(myData[i]);
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


    for (int i = 0; i < 17; ++i) { 

    	for (int u = 0; u < 19; ++u) {
    		
    		d = new HRect().rounding(5);
			H.add(d)
			// .strokeWeight(1)
			// .stroke(#FF3300)
			.noStroke()
			.fill(colors[1])
			.size( (int)map(PApplet.parseFloat(myData[i][u]), 0, 22, 10, 40) )
			.loc( anclaX+(60*(i)), anclaY+(60*(u)) )
			.anchorAt(H.CENTER)
			;
			
			d1 = new HRect().rounding(3);
			d.add(d1)
			
			.anchor(-50,50)
			.noStroke()
			.fill(colors[2])
			.size(20)
    		;
    	}
	}
	// println(float(myData[5][3]));
}

public void draw() {
	
	
	H.drawStage();


  
	saveVector();
  	

		
}

public void saveVector() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "/render/render-######.pdf");
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

public void mousePressed() {
    record = true;
}
  public void settings() { 	size(1180, 1180); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A3mCa07" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
