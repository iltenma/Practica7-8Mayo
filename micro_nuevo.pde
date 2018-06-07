import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
//variables de estado
boolean enjuego;
boolean adelante;
//dibujar un vumetre
int volumen;
int nivel;
int tamanyo_buffer;

void setup()
{
  size(600, 600);
  //variables estado
  enjuego=true;
  adelante=false;
  nivel=0;
 
  minim = new Minim(this);
 
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  //selectInput("dame un fichero de sonido", "folderSelected");
  tamanyo_buffer=20000;
  in = minim.getLineIn();
  //lanzar el proceso independiente que va calculando la media
  thread("calcular_media_sonido");
  //thread("calcular_nivel_juego");
  
  //modificare el framerate
  frameRate(5);
  
  
  
 
}
void draw()
{
 //dibujar
  }

void calcular_media_sonido()
{  float [] auxiliar;
   float suma, media;
   while (enjuego)
   {
       //pasar al array
       auxiliar=in.mix.toArray();
       suma=0;
       for(int i = 0; i < in.bufferSize() - 1; i++)
        {
            suma=suma+abs(auxiliar[i]);
        }
        media=suma/(in.bufferSize());
        println(suma);
        // determinar que hago con ese dato
        try
        {
        Thread.sleep(500);}
        catch (Exception e){;}
   }   
} 


void keyPressed()
{
  if ( key == 'p' || key == 'P' )
  {
    enjuego=true;
  }
  else if ( key == 's' || key == 'S' )
  { enjuego=false;}
}


  
  