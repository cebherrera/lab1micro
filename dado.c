// Autor: Sebastian Herrera Esquivel - B93851
#include <pic14/pic12f683.h>
 
// Se desabilita Main Reset y Watch Dog Timer con macron en el registro CONFIG
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF) ;

// Definicion de funcion Delay
void delay (unsigned inttiempo);

// Funcion Principal
void main(void)
{

    TRISIO = 0b00100000; //Se ponen todos los bits como salido excpeto P5, el cual es una entrada
	GPIO   = 0x00; //Poner pines en bajo
	ANSEL = 0; // Se pone el registro en 0 ya que no se utilizan señales analogicas
	CM0 = 1; // Se desabilita el comparador analogico 
	CM1 = 1; // Se desabilita el comparador analogico 
	CM2 = 1; // Se desabilita el comparador analogico 
 
    unsigned int time = 100;
	unsigned int counter = 1; 

    //Loop forever
    while ( 1 )
    {
		if (GP5 == 0){
			if (counter == 1){
				GP1 = 1;
				delay(time);
			}
			if (counter == 2){
				GP4 = 1;
				delay(time);
			}
			if (counter == 3){
				GP4 = 1;
				GP1 = 1;
				delay(time);
			}
			if (counter == 4){
				GP0 = 1;
				GP4 = 1;
				delay(time);
			}
			if (counter == 5){
				GP0 = 1;
				GP4 = 1;
				GP1 = 1;
				delay(time);
			}
			if (counter == 6){
				GP0 = 1;
				GP4 = 1;
				GP1 = 1;
				GP2 = 1;
				delay(time);
			}
		}
		// Verifica GP5 después de haber verificado las condiciones anteriores
    	else {
			counter++;
			// Restablece todos los pines GPIO a 0
    		GPIO = 0;
			if (counter == 7){
				counter = 1;
        }
    }
    }
}

// Funcion Delay
void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}
