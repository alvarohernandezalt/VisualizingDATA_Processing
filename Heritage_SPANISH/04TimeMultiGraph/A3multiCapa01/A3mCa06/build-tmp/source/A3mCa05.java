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

public class A3mCa05 extends PApplet {








Table table;
Table table2;
String comunidadAutonoma[] = new String[0];
String ccaa[] = new String[0];
float andalucia[] = new float[0];
float aragon[] = new float[0];
float asturias[] = new float[0];
float baleares[] = new float[0];
float canarias[] = new float[0];
float cantabria[] = new float[0];
float leon[] = new float[0];
float mancha[] = new float[0];
float catalunya[] = new float[0];
float valencia[] = new float[0];
float extremadura[] = new float[0];
float galicia[] = new float[0];
float madrid[] = new float[0];
float murcia[] = new float[0];
float navarra[] = new float[0];
float euskadi[] = new float[0];
float rioja[] = new float[0];
float ceuta[] = new float[0];
float melilla[] = new float[0];
int anuales[] = new int[0];
PFont f;
PFont f2;

HDrawablePool pool;


int[] colors = {0xffFCF2CB,0xffFFB00D,0xffFF8926,0xffBC2D19};

//OrigendelMarco
int marcoOrigen = 20;
int muestraSize = 20;

int anclaX = 170;
int anclaY = 60;




public void setup() {
	
	noLoop();
	beginRecord(PDF, "A3mCa05.pdf");
    H.init(this).background(0xff222222).autoClear(true);

    f = createFont("Bau-Regular", 9);
    f2 = createFont("HelveticaNeueLTW1G-Cn", 8);
    textMode(MODEL);

    table = loadTable("BICCCAATOTALTRANS.csv", "header");
	for (TableRow row : table.rows()) {
	  comunidadAutonoma = append(comunidadAutonoma, row.getString("ccaa"));
	  andalucia = append(andalucia, row.getFloat("Andalucia"));
	  aragon = append(aragon, row.getFloat("Aragon"));
	  asturias = append(asturias, row.getFloat("Asturias (Principado de)"));
	  baleares = append(baleares, row.getFloat("Balears (Illes)"));
	  canarias = append(canarias, row.getFloat("Canarias"));
	  cantabria = append(cantabria, row.getFloat("Cantabria"));
	  leon = append(leon, row.getFloat("Castilla y Leon"));
	  mancha = append(mancha, row.getFloat("Castilla-La Mancha"));
	  catalunya = append(catalunya, row.getFloat("Catalunya"));
	  valencia = append(valencia, row.getFloat("Comunitat Valenciana"));
	  extremadura = append(extremadura, row.getFloat("Extremadura"));
	  galicia = append(galicia, row.getFloat("Galicia"));
	  madrid = append(madrid, row.getFloat("Madrid (Comunidad de)"));
	  murcia = append(murcia, row.getFloat("Murcia (Region de)"));
	  navarra = append(navarra, row.getFloat("Navarra (Comunidad Foral de)"));
	  euskadi = append(euskadi, row.getFloat("Pais Vasco"));
	  rioja = append(rioja, row.getFloat("Rioja (La)"));
	  ceuta = append(ceuta, row.getFloat("Ceuta"));
	  melilla = append(melilla, row.getFloat("Melilla"));	  
	}

	table2 = loadTable("BIC_CCAA_TOTAL100.csv", "header");
  	for (TableRow row : table2.rows()) {
      ccaa = append(ccaa, row.getString("Comunidad Autonoma"));
    }

    float[][] series = new float[0][0];

    for (int i = 0; i < 19; ++i) { 

    	series[i][0] = andalucia[i];
    	println(series[i][0]);
    	
    }

    for (int u = 0; u < 19; ++u) {
    	
    
	    pool = new HDrawablePool(17); //323 en total
	    pool.autoAddToStage()
	    	.add(new HRect(50).rounding(5))
	    	.layout(
				new HGridLayout()
				.startX(anclaX)
				.startY(anclaY+(60*u))
				.spacing(60,60)
				.cols(17)
				
			)

	    	.onCreate(
				new HCallback() {
					public void run(Object obj) {
						int i = pool.currentIndex();

						HDrawable d = (HDrawable) obj;
						d
							.anchorAt(H.CENTER)
							.noStroke()
							.fill(colors[0])
							.size((int)map(andalucia[i], 0, 22, 10, 40))
							
						;
						
						d.extras( new HBundle().num("i", i));
					}
				}


			)
			.requestAll()
		;

	}
}

public void draw() {
	
	
	H.drawStage();


	for (int i = 0; i < ccaa.length; ++i) {
    	// HText ccA =new HText(ccaa[i],10,f);
    	// ccA.fill(240).anchorAt(H.RIGHT).loc(120+marcoOrigen, 35+marcoOrigen+(60*i));
    	// H.add(ccA);
    	fill(240);
    	textAlign(RIGHT);
    	textFont(f);
    	text(ccaa[i], 120+marcoOrigen, 45+marcoOrigen+(60*i));    	
    }

    
	endRecord();
  	println("PDF Saved!");

		
}
  public void settings() { 	size(1180, 1180); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A3mCa05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
