
static int i = 0;

void setup() {
}
    
void loop() {
    Serial.print("hello world ");
    Serial.print(++i);
    Serial.println();
    delay(2000);
}
