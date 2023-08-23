//Librerias
import processing.pdf.*;

PShape baseMap;
PImage img;
Table table;
String comunidadAutonoma[] = new String[0];
float monumento[] = new float[0];
float conjunto[] = new float[0];
float arqueologia[] = new float[0];
float posX[] = new float[0];
float posY[] = new float[0];
float total[] = new float[0];
PFont f;

void setup() {
  noLoop();
  size(1200, 850);
  f = createFont("HelveticaLTStd-BoldCond", 12);
  img = loadImage("mapaEspanya.png");
  //baseMap = loadShape("mapaEspanaOK.svg");
  table = loadTable("BIC-mapaESP.csv", "header");
  for (TableRow row : table.rows()) {
    comunidadAutonoma = append(comunidadAutonoma, row.getString("ccaa"));
    monumento = append(monumento, row.getFloat("monumento"));
    conjunto = append(conjunto, row.getFloat("conjunto"));
    arqueologia = append(arqueologia, row.getFloat("arqueologia"));
    posX = append(posX, row.getFloat("centroX"));
    posY = append(posY, row.getFloat("centroY"));
    total = append(total, row.getFloat("monumento")+row.getFloat("conjunto")+row.getFloat("arqueologia"));
  }
}

void draw() {
  beginRecord(PDF, "mapaBICComunidades.pdf");

  //shape(baseMap, 0, 0, width, height);
  noStroke();
  image(img,0,0);

  for (int i=0; i<monumento.length; i++) {

    
    textMode(MODEL);
    noStroke();
    fill(255, 163, 0, 90);
    float diamMON = monumento[i]*15;
    ellipse(posX[i], posY[i], diamMON, diamMON);
    fill(66, 130, 158, 90);
    float diamCON = conjunto[i]*15;
    ellipse(posX[i]-diamMON/4, posY[i], diamCON, diamCON);
    fill(198, 19, 10, 90);
    float diamARQ = arqueologia[i]*15;
    ellipse(posX[i]+diamMON/4, posY[i], diamARQ, diamARQ);

    fill(0);
    textAlign(CENTER);
    textFont(f);
    String[] monJU = nfc(monumento, 1);
    //text(monJU[i], posX[i], posY[i]);
    String[] conJU = nfc(conjunto, 1);
    //text(conJU[i], posX[i]-diamMON/4, posY[i]);
    String[] arqJU = nfc(arqueologia, 1);
    //text(arqJU[i], posX[i]+diamMON/4, posY[i]);
    textSize(10);
    text(comunidadAutonoma[i], posX[i], posY[i]+16);
  }
  endRecord();
  println("PDF Saved!");
}
