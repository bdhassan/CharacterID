         BR main,i
char:    .BYTE   1
other1:  .ASCII  "other\x00"  
cap:     .ASCII  "capital\x00"
low:     .ASCII  "lower\x00"
digit:   .ASCII  "number\x00"
even1:   .ASCII  "even\x00"
odd1:    .ASCII  "odd\x00"
dash:    .ASCII  "------\x00"
vowel1:  .ASCII  "vowel\x00"

main:    STRO    dash,d 
         LDBA    0xA,i
         STBA    0xFC16,d      
         LDBA    0xFC15,d
         STBA    char,d
         STBA    0xFC16,d
         
         STBA    char,d
         CPBA    0x0051,i
         BREQ    done,i
         CPBA    0x0071,i 
         BREQ    done,i
         
         CPBA    0x002F,i
         BRLE    other,i

         CPBA    0x0039,i    
         BRLE    number,i

         CPBA    0x0040,i
         BRLE    other,i

         CPBA    0x005A,i
         BRLE    capital,i

         CPBA    0x0060,i
         BRLE    other,i

         CPBA    0x007A,i
         BRLE    lower,i

         CPBA    0x007F,i
         BRLE    other,i

        
      
other:   LDBA    0xA,i
         STBA    0xFC16,d
         STRO    other1,d    
         LDBA    0xA,i
         STBA    0xFC16,D
         BR      main,i

number:  LDBA    0xA,i
         STBA    0xFC16,d
         STRO    digit,d
         LDBA    0xA,i
         STBA    0xFC16,d    
         LDBA    char,d
         CPBA    0x0030,i
         BREQ    even,i
         CPBA    0x0032,i
         BREQ    even,i
         CPBA    0x0034,i
         BREQ    even,i
         CPBA    0x0036,i
         BREQ    even,i
         CPBA    0x0038,i
         BREQ    even,i
         BR      odd,i
         
         

capital: LDBA    0xA,i
         STBA    0xFC16,d
         STRO    cap,d
         LDBA    0xA,i
         STBA    0xFC16,d  

         LDBA    char,d
         CPBA    0x0041,i 
         BREQ    Uvowel,i
         CPBA    0x0045,i
         BREQ    Uvowel,i
         CPBA    0x0049,i      
         BREQ    Uvowel,i
         CPBA    0x004F,i      
         BREQ    Uvowel,i
         CPBA    0x0055,i
         BREQ    Uvowel
         BR      main,i       

lower:   LDBA    0xA,i
         STBA    0xFC16,d
         STRO    low,d
         LDBA    0xA,i
         STBA    0xFC16,d
         
         LDBA    char,d
         CPBA    0x0061,i 
         BREQ    Lvowel,i
         CPBA    0x0065,i
         BREQ    Lvowel,i
         CPBA    0x0069,i      
         BREQ    Lvowel,i
         CPBA    0x006F,i    
         BREQ    Lvowel,i
         CPBA    0x0075,i
         BREQ    Lvowel
         BR      main,i 

         

even:    STRO    even1,d 
         LDBA    0xA,i            
         STBA    0xFC16,d
         BR      main,i
         

odd:     STRO    odd1,d
         LDBA    0xA,i
         STBA    0xFC16,d
         BR      main,i    

Uvowel:  STRO    vowel1,d    
         LDBA    0xA,i 
         STBA    0xFC16,d
         BR      main,i

Lvowel:  STRO    vowel1,d
         LDBA    0xA,i
         STBA    0xFC16,d
         BR      main,i
                     
done:    STOP
         .end             