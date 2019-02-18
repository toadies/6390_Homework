// Barchart API Key 3035437187286c88d0063dc6e26055ae
HashMap<String, String> params = new HashMap<String, String>();
String apiKey = new String("3035437187286c88d0063dc6e26055ae");
String symbol;
String startDate;
String endDate;

int[] closingPrice;
String[] tradingDay;


void setup()
{
  size(600,400);
  
  symbol = new String("TSLA");
  startDate = new String("20190101");
  endDate = new String("20190217");
  
  JSONArray result = getStocks(symbol,startDate,endDate);

  closingPrice = new int[result.size()];
  tradingDay = new String[result.size()];

  for (int i = 0; i < result.size(); i++) {
    
    JSONObject row = result.getJSONObject(i); 

    tradingDay[i] = row.getString("tradingDay");
    closingPrice[i] = int(row.getFloat("close")); //converting to int to play nice with max & min

    println(tradingDay[i] + ", " + closingPrice[i]);
  }

  // Draw x & y
  int margin = 50;
  //y-axis
  line(margin,0,margin,height-margin);
  //x-axis
  line(margin, height-margin, width, height-margin);
  
  //Draw Ticks on y axis
  int ceiling = int(max(closingPrice) * 1.25);
  println(ceiling);
  int yTicks = 24;
  int yTicksDistance = ( height - margin ) / yTicks;
  int xTicks = tradingDay.length;
  int xTicksDistance = ( width - margin ) / xTicks;
  
  println(yTicks);
  println(xTicks);
  
  int y = 0;
  int priceLabel = ceiling;
  for(int i = yTicksDistance; i < height - margin; i = i + yTicksDistance){
    text(priceLabel,margin - 30,i + yTicksDistance / 2);
    line(margin - 5, i, margin + 5, i); 
    priceLabel -= int(ceiling / yTicks);
  }
  for(int i = margin + xTicksDistance; i < width; i = i + xTicksDistance){
    line(i, height-margin - 5, i, height-margin + 5); 
  }
  
  // Store Stocks in in PVector Coordinates
  PVector prices[] = new PVector[closingPrice.length];
  int x = margin;
  y = 0;
  for(int i=0; i < prices.length; i++){
    Float distance = float(closingPrice[i]) / float(ceiling);
    y = int((height - margin + yTicksDistance) * (1-distance));
    x = x + xTicksDistance;
    prices[i] = new PVector(x, y); 
  }
  
  //Plot Results
  for(int i=0; i < prices.length; i++){
    ellipse(prices[i].x,prices[i].y, 10,10);
  }
}
