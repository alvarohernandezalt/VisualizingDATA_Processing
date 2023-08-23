import processing.pdf.*;

int innerRad = 300;
int lineWeight = 12;
int lineSpace = 35;

Table table;
String comunidadAutonoma[] = new String[0];
float monumento[] = new float[0];
float conjunto[] = new float[0];
float arqueologia[] = new float[0];
float total[] = new float[0];
PFont f;

void setup() {
  noLoop();
  size(1000, 1000);
  f = createFont("HelveticaLTStd-BoldCond", 12);
  table = loadTable("BIC.csv", "header");
  for (TableRow row : table.rows()) {
    comunidadAutonoma = append(comunidadAutonoma, row.getString("ccaa"));
    monumento = append(monumento, row.getFloat("monumento"));
    conjunto = append(conjunto, row.getFloat("conjunto"));
    arqueologia = append(arqueologia, row.getFloat("arqueologia"));
    total = append(total, row.getFloat("monumento")+row.getFloat("conjunto")+row.getFloat("arqueologia"));
  }
}

void draw() {
  beginRecord(PDF, "circulosporcomunidad.pdf");

  background(230);
  textMode(MODEL);
  noStroke();
  fill(50);
  textAlign(LEFT);
  textFont(f);
  
  textSize(10);
  text("Monumento", (width/2)+15, height/2+4);
  text("Conjunto", (width/2)+15, height/2+20+4);
  text("Arqueologia", (width/2)+15, height/2+40+4);

  noFill();
  strokeWeight(0.1);
  stroke(80);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  line(0, 0, width, height);
  line(0, height, width, 0);


  for (int i=0; i<comunidadAutonoma.length; i++) {
    textSize(12);
    noFill();
    strokeWeight(0.1);
    stroke(80);
    ellipse(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace);

    strokeWeight(lineWeight);

    // Monumentos Arc
    float walkLength = map(monumento[i], 0, max(total) + 7, 0, TWO_PI);
    stroke(255, 163, 0);
    arc(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace, 0-HALF_PI, walkLength-HALF_PI);
    line(width/2, height/2, (width/2)+5, height/2);

    // Conjuntos Arc
    float runLength = map(conjunto[i], 0, max(total) + 7, 0, TWO_PI);
    stroke(66, 130, 158);
    arc(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace, walkLength-HALF_PI, walkLength+runLength-HALF_PI);
    line(width/2, height/2+20, (width/2)+5, height/2+20);

    // Arqueologia Arc
    float cycleLength = map(arqueologia[i], 0, max(total) + 7, 0, TWO_PI);
    stroke(198, 19, 10);
    arc(width/2, height/2, innerRad+i*lineSpace, innerRad+i*lineSpace, walkLength+runLength-HALF_PI, walkLength+runLength+cycleLength-HALF_PI);
    line(width/2, height/2+40, (width/2)+5, height/2+40);

    // Draw Labels
    noStroke();
    fill(50);
    textAlign(RIGHT);
    textFont(f);
    text(comunidadAutonoma[i], width/2-10, height/2-(innerRad+i*lineSpace)/2+5);
    //String[] totJU = nfc(total,1);
    //text(totJU[i], width/2-200, height/2-(innerRad+i*lineSpace)/2+5);
    textSize(10);
    //Aqui colocamos los datos en texto colocado al final de cada curva
    pushMatrix();
    fill(170);
    translate(width/2, height/2);
    rotate((walkLength-PI));
    String[] monJU = nfc(monumento, 1);
    text(monJU[i], 0, (innerRad+i*lineSpace)/2+5);
    popMatrix();

    pushMatrix();
    fill(170);
    translate(width/2, height/2);
    rotate((walkLength+runLength-PI)+0.01);
    String[] conJU = nfc(conjunto, 1);
    text(conJU[i], 0, (innerRad+i*lineSpace)/2+5);
    popMatrix();

    pushMatrix();
    fill(68);
    translate(width/2, height/2);
    rotate((walkLength+runLength+cycleLength-PI)+0.04);
    String[] arqJU = nfc(arqueologia, 1);
    text(arqJU[i], 0, (innerRad+i*lineSpace)/2+5);
    popMatrix();
  }

  endRecord();
  println("PDF Saved!");
}
