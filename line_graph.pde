void setup()
{
  background(150);
  drawGraph(rainFall);
  drawGrid(months);
  noLoop();
  size(600, 600);
  
  for (int i = 0 ; i < rainFall.length ; i ++)
  {
    println(months[i] + "\t" + rainFall[i]); 
  }
  
  // For each
  // Cant modify the array and no access to i
  for(String m:months)
  {
    println(m);
  }
  
  println(maxIndex(rainFall));
  drawGraph(rainFall);
}

void drawGrid(float[] arr, String[] arr1, int verticalIntervals, int maxVertical, float border)
{
  float border=width*0.1f;
  textAlign(CENTER,CENTER);
  fill(255);
  for(int xg=maxVertical;xg>=0;xg=xg-verticalIntervals)
  {
    float xy= map(xg,0,150,border,width-border);
    text(xg,border*0.5,xy);
    stroke(0);
    line(border,border,border,height-border);
    line(border,height-border,width-border,height-border);
  }
  for(int i=arr1.length;i<12;i++)
  {
    float xy2= map(i,0,12,border,width-border);
    text(arr1[i],xy2,border*0.5+height-border);
  }
}

void drawGraph(float[] arr)
{
  float border=width*0.1f;
  float barWidth = (width-border) / (float) arr.length-1;
  float maxValue = arr[maxIndex(arr)];
  float scaleFactor = (height-border) / maxValue;
  float x = 0;
  //background(random(0, 255), random(0, 255), random(0, 255));
  println("start");
  for (int i = 1 ; i < arr.length ; i ++)
  {
    
    x = (i-1) * barWidth+border;
    fill(random(0, 255), random(0, 255), random(0, 255));
    strokeWeight(4);
    line(x, height - (arr[i-1]) * scaleFactor,x + barWidth,height -  arr[i] * scaleFactor);
  }
}

float average(float[] arr)
{
   float sum = sum(arr);
   
   return sum / (float) arr.length;
}

float sum(float[] arr)
{
  float sum = 0;
  for(float f:arr)
  {
    sum += f;
  }
  
  return sum;
}

int minIndex(float[] arr)
{
  float minValue = Float.MAX_VALUE;
  int minIndex = -1;
  for(int i = 0 ; i < arr.length ; i ++)
  {
    if (arr[i] < minValue)
    {
      minIndex = i;
      minValue = arr[i];
    }
  }
  return minIndex;
}

int maxIndex(float[] arr)
{
  float maxValue = Float.MIN_VALUE;
  int maxIndex = -1;
  for (int i = 0 ; i < arr.length ; i ++)
  {
    if (arr[i] > maxValue)
    {
      maxValue = arr[i];
      maxIndex = i;
    }
  }
  
  
  maxValue = arr[0];
  for (int i = 1 ; i < arr.length ; i ++)
  {
    if (arr[i] > maxValue)
    {
      maxValue = arr[i];
      maxIndex = i;
    }
  }
  
  return maxIndex;
  
}

float border=450;
float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"Jan", "Feb", "Mar", "Apr", "May"
  , "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec" };
void draw()
{
  
}