import controlP5.*;
import rita.*;
import java.util.List;
import java.util.Set;
import java.util.HashSet;
import java.util.Map;

ControlP5 cp5;

DropdownList d1, d2;

Textarea myTextarea;

PImage bg;

Chart myChart;

void setup() {
  size(1500, 550);
  smooth();
  textAlign(CENTER);
  textFont(createFont("Helvetica", 24));

  movieList = loadTable("movie_titles_metadata_header.csv", "header");
  movieLines = loadTable("movie_lines_header.csv", "header");

  cp5 = new ControlP5(this);
  
  bg = loadImage("Chair.jpg");
  
  d1 = cp5.addDropdownList("Film Title")
    .setPosition(100, 160)
    .setSize(200, 200)
    ;
    
    customize1(d1);
    
  myChart = cp5.addChart("hello")
               .setPosition(400, 100)
               .setSize(300, 300)
               .setRange(-20, 20)
               .setView(Chart.PIE)
               ;

  myChart.getColor().setBackground(color(#FFEB08));
  myChart.addDataSet("prp");
  myChart.setColors("prp", color(255,0,155),color(55,66,0));
  myChart.setStrokeWeight(1.5);
  
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(375,415)
                  .setSize(350,25)
                  .setFont(createFont("arial",14))
                  .setLineHeight(14)
                  .setColor(color(255))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea.setText("Personal Pronoun Percentage Result = " + (percentage * 100) + "%");
}

void customize1(DropdownList ddl) {
  ddl.setBackgroundColor(color(#EE4540));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  for (TableRow row : movieList.rows()) {
    movieTitle = row.getString("MovieName");
    movieId = row.getString("MovieID");
    ddl.addItem(movieTitle, movieId);
  }
  ddl.setColorBackground(color(#801336));
  ddl.setColorActive(color(#801336));
}

void controlEvent(ControlEvent theEvent) {
  Map m = new HashMap<String, String>();
  if (theEvent.isController() && d1.isMouseOver()) {
    
    id = int(theEvent.getController().getValue());
    selectId = ("m" + id);
    
    for (TableRow row : movieLines.rows()) {
      charName = row.getString("CharacterName");
      charId = row.getString("CharacterID");
      movieFilter = row.getString("MovieID");
      if (movieFilter.equals(selectId)) {
        m.put(charName, charId);
      }
      print(m);
    }
    
    println(selectId);
    for (TableRow row : movieLines.findRows(selectId, "MovieID")) {
    String charNAME = row.getString("CharacterName");
    
    d2 = cp5.addDropdownList("Character")
      .setPosition(100, 200)
      .setSize(200, 200)
      .addItems(m)
      ;
      
    customize2(d2);
     }
  }

  if (theEvent.isController() && d2.isMouseOver()) {

    Object Cid = (d2.getItem((int)theEvent.getController().getValue()).get("value"));
    println(Cid + " from " + selectId);
    selectCId = Cid.toString();
    
  }
  for (TableRow row : movieLines.findRows(selectCId, "CharacterID")) {
    charDlog = (row.getString("MovieLine"));
    dialog_list.append(row.getString("MovieLine"));
    
  }
  println(dialog_list);
  dialog1 = dialog_list.array();
  int size = dialog_list.size();
  for (int i = 1; i < size; i = i+1) {
    words_list.append(split(dialog1[i], " "));
  }
  println(words_list);
  int wordsAmount = words_list.size();
  println(wordsAmount);
  words1 = words_list.array();
  for (int i = 1; i < wordsAmount; i = i+1) {
    rita_list.append(RiTa.pos(words1[i]));
  }
  rita1 = rita_list.array();
  int ritaAmount = rita_list.size();
  println(rita_list);
  for (int i = 1; i < ritaAmount; i = i+1) {
    if (rita1[i] == "prp") {
      prp_list.append(rita1[i]);
      prpTrue++;
    }
    else {
      prpFalse++;
    }
  }  
  println(prp_list);
  println(prpTrue);
  println(prpFalse);
  int prpAmount = prp_list.size();
  println(prpAmount);
  percentage = (float(prpAmount)/float(wordsAmount));
  println(percentage);
  String resultPrp = ("Personal Pronoun Percentage Result = " + (percentage * 100) + "%");
  println(resultPrp);
  myChart.updateData("prp", (percentage*100) , (100 - (percentage*100)));
  myTextarea.setText("Personal Pronoun Percentage = " + (percentage * 100) + "%");
}

void customize2(DropdownList ddl) {
  ddl.setBackgroundColor(color(#EE4540));
  ddl.setItemHeight(20);
  ddl.setBarHeight(15);
  ddl.setColorBackground(color(#C72C41));
  ddl.setColorActive(color(#801336));
}

void draw() {
  background(bg);
}
