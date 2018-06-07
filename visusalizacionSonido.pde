import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;





Minim minim;
AudioPlayer song;
File f;
PFont tipoLetra;
int estado;

void setup()
{
  size(800,800);
 
  minim = new Minim(this);
  //tipoLetra=loadFont("Dialog-48.vlw");
  estado=0; //que quiere decir preparado
 
  // especificamos 512
  // el tamaño por defecto es 1024
  selectInput("dame un fichero de sonido", "folderSelected");
 
}
void draw()
{
  background(0);
  //stroke(255);
  //textFont(tipoLetra);
  
  // vamos dibujando cada una de las muestras con la siguiente
  // mediante una línea
  if (estado==1)
  {
  for(int i = 0; i < song.bufferSize() - 1; i=i+50)
  {
    float izq=song.left.get(i);
    
    
    color c=color(255,0,255);
    fill(c);
   
    
    
    float izqT=abs(izq);
    if (izq>0.09) izqT=(izq+10)*3;
    else izqT=(izq+10);
    
   
    textSize(izqT); 
    
    
    text(izq,random(width),random(height)); 
    
    
    
    
  }}
} 

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    String nombre=selection.getPath();
    song = minim.loadFile(nombre,512);
    song.loop();
    estado=1;
  }
}