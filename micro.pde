import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;

void setup()
{
  size(512, 200);
 
  minim = new Minim(this);
 
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  //selectInput("dame un fichero de sonido", "folderSelected");
  in = minim.getLineIn();
  
  
 
}
void draw()
{
  background(0);
  stroke(255);
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  float suma=0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
    {
    line(i, 40 + in.left.get(i)*60, i+1, 60 + in.left.get(i+1)*60);
    line(i, 160 + in.right.get(i)*60, i+1, 160 + in.right.get(i+1)*60);
    suma=suma+in.left.get(i);
    String monitoringState = in.isMonitoring() ? "enabled" : "disabled";
    text( "Input monitoring is currently " + monitoringState + ".", 5, 15 );
    

    }
    text( "Valor de la muestra en este momento" + suma/in.bufferSize() + ".", 5, 30 );
    //float numero=song.left.get(i);
    //System.out.println(song.left.get(i)*50);
  }




void keyPressed()
{
  if ( key == 'm' || key == 'M' )
  {
    if ( in.isMonitoring() )
    {
      in.disableMonitoring();
    }
    else
    {
      in.enableMonitoring();}}}

  
  

