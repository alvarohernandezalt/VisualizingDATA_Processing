import processing.pdf.*;

int innerRad = 300;
int lineWeight = 10;
int lineSpace = 30;

Table table;
Table table2;
String comunidadAutonoma[] = new String[0];
float monumento[] = new float[0];
float conjunto[] = new float[0];
float arqueologia[] = new float[0];
float total[] = new float[0];
float posXX[] = new float[0];
float posYY[] = new float[0];
PFont f;

void setup() {
  noLoop();
  size(1200, 1200);
  f = createFont("HelveticaLTStd-BoldCond", 12);
  table = loadTable("BIC.csv", "header");
  for (TableRow row : table.rows()) {
    comunidadAutonoma = append(comunidadAutonoma, row.getString("ccaa"));
    monumento = append(monumento, row.getFloat("monumento"));
    conjunto = append(conjunto, row.getFloat("conjunto"));
    arqueologia = append(arqueologia, row.getFloat("arqueologia"));
    total = append(total, (row.getFloat("monumento")+row.getFloat("conjunto")+row.getFloat("arqueologia"))/3);
  }
  table2 = loadTable("posXposY.csv", "header");
  for (TableRow row : table2.rows()) {
    posXX = append(posXX, row.getFloat("posXX"));
    posYY = append(posYY, row.getFloat("posYY"));
    
  }
}

void draw() {
  beginRecord(PDF, "estrellatotalSHAPE.pdf");
  
  background(230);
  int lineCount = total.length;
  float intraLineAngle = TWO_PI/lineCount;
  for (int i=0; i<11; i++) {
    
    noFill();
    stroke(150);
    ellipse(width/2, height/2, i*100, i*100);
    
  }
  for (int i=0; i<lineCount; i++) {
    float lineLength = total[i]*10;
    float posX = 2 * lineLength * sin(i*intraLineAngle+PI) + width/2;
    float posY = 2 * lineLength * cos(i*intraLineAngle+PI) + height/2;
    float endX = 500 * sin(i*intraLineAngle+PI) + width/2;
    float endY = 500 * cos(i*intraLineAngle+PI) + height/2;
    float texX = 510 * sin(i*intraLineAngle+PI) + width/2;
    float texY = 510 * cos(i*intraLineAngle+PI) + height/2;
    float valX = 2.01 * lineLength * sin(i*intraLineAngle+PI) + width/2;
    float valY = 2.01 * lineLength * cos(i*intraLineAngle+PI) + height/2;
    strokeWeight(1);
    noFill();
    stroke(200);
    line(width/2, height/2, endX, endY);
    strokeWeight(3);
    noFill();
    stroke(39, 99, 72);
    //line(width/2, height/2, posX, posY);
    
        
    noStroke();
    textMode(MODEL);
    fill(50);
    textAlign(CENTER);
    textFont(f);
    String[] totJU = nfc(total, 1);
    text(totJU[i], valX, valY);
    text(comunidadAutonoma[i], texX, texY);
    
    println(posX,",", posY);
  }
  for(int i=0; i<lineCount-1; i++){
    int u = i+1;
    strokeWeight(3);
    noFill();
    stroke(39, 99, 72);
    line(posXX[i], posYY[i], posXX[u], posYY[u]);
  }
  endRecord();
  println("PDF Saved!");
  
}
