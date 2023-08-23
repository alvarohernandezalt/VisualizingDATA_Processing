import processing.pdf.*;
import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;

Table table;
Table table2;
String comunidadAutonoma[] = new String[0];
float ao2000[] = new float[0];
float ao2001[] = new float[0];
float ao2002[] = new float[0];
float ao2003[] = new float[0];
float ao2004[] = new float[0];
float ao2005[] = new float[0];
float ao2006[] = new float[0];
float ao2007[] = new float[0];
float ao2008[] = new float[0];
float ao2009[] = new float[0];
float ao2010[] = new float[0];
float ao2011[] = new float[0];
float ao2012[] = new float[0];
float ao2013[] = new float[0];
float ao2014[] = new float[0];
float ao2015[] = new float[0];
float ao2016[] = new float[0];
PFont f;
PFont f2;

int[] colors = {#FF2E00,#FF4820,#FF6240,#FF7C60,#FF9680};

//OrigendelMArco
int marcoOrigen = 20;

HDrawablePool pool0;
HDrawablePool pool1;
HDrawablePool pool2;
HDrawablePool pool3;




void setup() {
	size(1160, 1260);
    H.init(this).background(#222222);

    f = createFont("Bau-Regular", 9);
    f2 = createFont("HelveticaNeueLTW1G-Cn", 8);
    textMode(MODEL);


	table = loadTable("BIC_CCAA_TOTAL100.csv", "header");
	for (TableRow row : table.rows()) {
	  comunidadAutonoma = append(comunidadAutonoma, row.getString("Comunidad Autonoma"));
	  ao2000 = append(ao2000, row.getFloat("2000"));
	  ao2001 = append(ao2001, row.getFloat("2001"));
	  ao2002 = append(ao2002, row.getFloat("2002"));
	  ao2003 = append(ao2003, row.getFloat("2003"));
	  ao2004 = append(ao2004, row.getFloat("2004"));
	  ao2005 = append(ao2005, row.getFloat("2005"));
	  ao2006 = append(ao2006, row.getFloat("2006"));
	  ao2007 = append(ao2007, row.getFloat("2007"));
	  ao2008 = append(ao2008, row.getFloat("2008"));
	  ao2009 = append(ao2009, row.getFloat("2009"));
	  ao2010 = append(ao2010, row.getFloat("2010"));
	  ao2011 = append(ao2011, row.getFloat("2011"));
	  ao2012 = append(ao2012, row.getFloat("2012"));
	  ao2013 = append(ao2013, row.getFloat("2013"));
	  ao2014 = append(ao2014, row.getFloat("2014"));
	  ao2015 = append(ao2015, row.getFloat("2015"));
	  ao2016 = append(ao2016, row.getFloat("2016"));
	  
	}

	pool0 = new HDrawablePool(20);
	pool0.autoAddToStage()
		.add(new HRect(100,60))
		
		.layout(
			new HGridLayout()
			.startX(marcoOrigen)
			.startY(marcoOrigen)
			.spacing(100,60)
			.cols(1)
			.rows(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HDrawable d = (HDrawable) obj;
					d
						.strokeWeight(0.2)
						.stroke(255)
						.noFill()
					;
					
				}
			}

		)
		.requestAll()
	;

	
	pool2 = new HDrawablePool(340);
	pool2.autoAddToStage()
		.add(new HShape("A3mCa01_cuadrado.svg"))
		
		.layout(
			new HGridLayout()
			.startX(marcoOrigen+130)
			.startY(marcoOrigen+60)
			.spacing(60,60)
			.cols(17)
			.rows(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						
						.enableStyle(false)
						.anchorAt(H.CENTER)
						//.strokeWeight(0.1)
						//.stroke(255)
						.noStroke()
						.fill(255,10,0)
						//.loc(30,30)
					;

				}
			}
						
		)
		.requestAll()
	;

	pool3 = new HDrawablePool(340);
	pool3.autoAddToStage()
		.add(new HShape("A3mCa01_circulo.svg"))
		
		.layout(
			new HGridLayout()
			.startX(marcoOrigen+130)
			.startY(marcoOrigen+60)
			.spacing(60,60)
			.cols(17)
			.rows(20)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HShape d = (HShape) obj;
					d
						.enableStyle(false)
						.anchorAt(H.CENTER)
						//.strokeWeight(0.1)
						//.stroke(255)
						.noStroke()
						.fill(10,10,255)
						
					;

				}
			}
						
		)
		.requestAll()
	;

	H.drawStage();
	noLoop();
	
}

void draw() {

		
}