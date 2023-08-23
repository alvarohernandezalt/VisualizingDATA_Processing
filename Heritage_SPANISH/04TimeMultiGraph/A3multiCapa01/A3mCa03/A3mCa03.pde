import processing.pdf.*;
import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;

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

PShape cuaMap;
PShape cirMap;

int[] colors = {#FF2E00,#FF4820,#FF6240,#FF7C60,#FF9680};

//OrigendelMArco
int marcoOrigen = 20;
int muestraSize = 20;




void setup() {
	size(1260, 1240);
	noLoop();
	beginRecord(PDF, "A3mCa03_##.pdf");
    H.init(this).background(#222222);

    f = createFont("Bau-Regular", 9);
    f2 = createFont("HelveticaNeueLTW1G-Cn", 8);
    textMode(MODEL);

    cuaMap = loadShape("A3mCa01_cuadrado.svg");
	cirMap = loadShape("A3mCa01_circulo.svg");


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

}

void draw() {
	
	shapeMode(CENTER);
	rectMode(CENTER);

	cuaMap.disableStyle();
	cirMap.disableStyle();


	for (int i = 0; i < 19; i++) {

	    //float[] serie1 = {andalucia[i],aragon[i],asturias[i],baleares[i],canarias[i],
	    //cantabria[i],leon[i],mancha[i],catalunya[i],valencia[i],extremadura[i],galicia[i],
	    //madrid[i],murcia[i],navarra[i],euskadi[i],rioja[i],ceuta[i],melilla[i]};

	   	


		for (int u = 0; u < 17; ++u) {

			if (i == 0) {
					
				noStroke();
				fill(colors[(int)random(5)]);
				shape(cuaMap, 200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i)-(map(andalucia[i],0,30,0,60)-30), muestraSize, muestraSize);
				noStroke();
				fill(#FFFFFF);
				shape(cirMap, 200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i)-(map(andalucia[i],0,30,0,60)-30), muestraSize, muestraSize);
				stroke(240);
				noFill();
				rect(200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i), 60, 60);
			}

			else if (i == 1) {
				noStroke();
				fill(colors[(int)random(5)]);
				shape(cuaMap, 200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i)-(map(aragon[i],0,30,0,60)-30), muestraSize, muestraSize);
				noStroke();
				fill(#FFFFFF);
				shape(cirMap, 200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i)-(map(aragon[i],0,30,0,60)-30), muestraSize, muestraSize);
				stroke(240);
				noFill();
				rect(200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i), 60, 60);
			}

			else  {
				noStroke();
				fill(colors[(int)random(5)]);
				shape(cuaMap, 200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i), muestraSize, muestraSize);
				noStroke();
				fill(#FFFFFF);
				shape(cirMap, 200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i), muestraSize, muestraSize);
				stroke(240);
				noFill();
				rect(200+marcoOrigen+(60*u), 60+marcoOrigen+(60*i), 60, 60);
			} 
			
				
		}
				
	}

	for (int i = 0; i < ccaa.length; ++i) {
    	fill(240);
    	textAlign(RIGHT);
    	textFont(f);
    	text(ccaa[i], 160+marcoOrigen, 65+marcoOrigen+(60*i));    	
    }

	endRecord();
  	println("PDF Saved!");

		
}