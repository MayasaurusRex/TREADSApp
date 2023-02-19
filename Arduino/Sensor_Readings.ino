//Libraries and C files to include
#include <Adafruit_AHTX0.h>
#include <SPI.h>
#include <Arduino.h>
#include "Adafruit_BluefruitLE_UART.h"
#include "Adafruit_BLE.h"

//Bluetooth variables
#define BUFSIZE                        128   // Size of the read buffer for incoming data
#define VERBOSE_MODE                   true
#define BLUEFRUIT_HWSERIAL_NAME Serial1
#define BLUEFRUIT_UART_MODE_PIN -1
Adafruit_BluefruitLE_UART ble(BLUEFRUIT_HWSERIAL_NAME, BLUEFRUIT_UART_MODE_PIN);

Adafruit_AHTX0 aht;

//ADC variables
int Sample = 1;
char answer = 'a';
int n;
int val = 0;
float voltage = 0.0;
byte upperByte; //ADC upper byte
byte lowerByte; //ADC lower byte
int SegmentSize = 7000;//10002
int SPIBuffSize = 100;

SPISettings settings(100000000, MSBFIRST, SPI_MODE1); //Initialize to S clock to 100MHz
//Storage Variables
int * ptrdata;
int peakstartindex;
int upperThresh = 28002;//Threshold to mark start of primary wave 1.4V 28002
int lowerThresh = 23830;//Theshold to mark end of button pressing 1.2V 23830
int LeftoverStart = 0;


void setup()
{

  pinMode(14, OUTPUT); //Chip select
  pinMode(10, OUTPUT); //power to OpAmp
  pinMode(15, OUTPUT); //power to OpAmp
  pinMode(2, OUTPUT);  //Creates Delay
  pinMode(3, OUTPUT);  //power for 1.8 V supply
  pinMode(4, INPUT);
  digitalWrite(10, HIGH);
  digitalWrite(15, HIGH);
  digitalWrite(3, HIGH);

//  Serial.begin(115200);                 //Arduino Serial Monitor
  Serial.begin(9600);
  Serial.setTimeout(10);
  SPI.begin();                          //SPI begin for SPI.h function
  BLUEFRUIT_HWSERIAL_NAME.begin(9600);  //Hardware Serial Monitor

  //RAM initialization

  /* Initialise the module */
  /* Disable command echo and berbose from Bluefruit (only need for debugging*/
  ble.echo(false);
  ble.verbose(false);

  //Wait until it is disconected
  while (! ble.isConnected()) {
    delay(500);
  }
  if (! aht.begin()) {
    Serial.println("Could not find AHT? Check wiring");
    while (1) delay(10);
  }
  Serial.println("AHT10 or AHT20 found");
}

void loop() {
  sensors_event_t humidity, temp;
  aht.getEvent(&humidity, &temp);// populate temp and humidity objects with fresh data
  double far = (temp.temperature * 9 / 5) + 32;
  Serial.print("Temperature: "); Serial.print(far); Serial.println(" degrees F");
  Serial.print("Humidity: "); Serial.print(humidity.relative_humidity); Serial.println("% rH");
  ble.print("AT+BLEUARTTX=");
  ble.print("T");
  ble.println(far);
  ble.print("AT+BLEUARTTX=");
  ble.print("H");
  ble.println(humidity.relative_humidity);
  delay(750);
}
