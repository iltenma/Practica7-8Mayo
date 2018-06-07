import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;





Minim minim;
AudioPlayer song;
File f;
int estado;

void setup()
{
  size(512, 200);
 
  minim = new Minim(this);
  estado=0; //que quiere decir preparado
 
  // especificamos 512
  // el tamaño por defecto es 1024
  selectInput("dame un fichero de sonido", "folderSelected");
 
}
void draw()
{
  background(0);
  stroke(255);
  // vamos dibujando cada una de las muestras con la siguiente
  // mediante una línea
  if (estado==1)
  {
  for(int i = 0; i < song.bufferSize() - 1; i++)
  {
    int par=i%2;
    if (par==0)
    {
    line(i, 60 + song.left.get(i)*60, i+1, 60 + song.left.get(i+1)*60);
    line(i, 160 + song.right.get(i)*60, i+1, 160 + song.right.get(i+1)*60);
    }
    //float numero=song.left.get(i);
    //System.out.println(song.left.get(i)*50);
  }}
} 

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    String nombre=selection.getPath();
    song = minim.loadFile(nombre, 512);
    song.loop();
    estado=1;
  }
}
