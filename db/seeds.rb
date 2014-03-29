# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

s = """
; Uses S-C Assembler variant.
; .or is origin
; .as is ASCII String
; .hs is Hex String
        .or $300
main    ldy #$00
.1      lda str,y
        beq .2
        jsr $fded ; ROM routine, COUT, y is preserved
        iny
        bne .1
.2      rts
str     .as \"HELLO WORLD\"
        .hs 0D00
"""
Gist.create(snippet: s, lang: "nasm", description: "ASM MOS Technology 6502, Apple II (II+, IIe, IIC).")

s = """
100 REM Hello World using a mix of BBC Basic and 6502 assembler 
110 $&A200 = \"!dlrow olleH\"
115 code% = &A100
120 str = &A200
130 oswrch = &FFEE
140 FOR pass%=0 TO 3 STEP 3
150 P% = code%
160 [ 
170 OPT pass%
180 .START LDY 11
190 CLC
200 .LOOP
210 LDA str,Y
220 JSR oswrch
230 DEY
240 BCC LOOP
250 LDA 13
260 JSR oswrch
270 RTS
280 ]
290 NEXT
300 CALL code%
"""
Gist.create(snippet: s, lang: "nasm", description: "ASM MOS Technology 6502, Acorn MOS.")

s = """
1000 REM Hello World using a mix of BBC Basic and ARM assembler 
1010 DIM org 100
1020 OS_Write0 = &2
1030 FOR pass=0 TO 3 STEP 3
1040 PROCasm(pass,org)
1050 NEXT pass
1060 CALL org
1070 END
1080 
2000 DEF PROCasm(pass,org)
2010 P%=org
2020 [ OPT pass
2030 ADR    R0, message
2040 SWI    OS_Write0
2050 MOV    PC, R14
2060 .message
2070 EQUS   \"Hello, World!\" + CHR$(0)
2080 ALIGN
2090 ]
2100 ENDPROC
"""
Gist.create(snippet: s, lang: "nasm", description: "ASM - ARM, BBC BASIC inline assembler")

s = """
 A_CR  = $0D              ;carriage return
 BSOUT = $FFD2            ;kernel ROM sub, write to current output device
 ;
         LDX #$00         ;starting index in .X register
 ; 
 LOOP    LDA MSG,X        ;read message text
         BEQ LOOPEND      ;end of text
 ;
         JSR BSOUT        ;output char
         INX
         BNE LOOP         ;repeat
 ;
 LOOPEND RTS              ;return from subroutine
 ;
 MSG     .BYT 'Hello, world!',A_CR,$00
"""
Gist.create(snippet: s, lang: "nasm", description: "ASM - MOS Technology 6502, CBM KERNAL")

s = """
; The output file is 22 bytes.
; 14 bytes are taken by \"Hello, world!$
;
; Written by Stewart Moss - May 2006
; This is a .COM file so the CS and DS are in the same segment
;
; I assembled and linked using TASM
;
; tasm /m3 /zn /q hello.asm
; tlink /t hello.obj
 
.model tiny
.code
org 100h
 
main  proc
 
      mov    ah,9                       ; Display String Service
      mov    dx,offset hello_message    ; Offset of message (Segment DS is the right segment in .COM files)
      int    21h                        ; call DOS int 21h service to display message at ptr ds:dx
 
      retn                              ; returns to address 0000 off the stack 
                                        ; which points to bytes which make int 20h (exit program)
 
hello_message db 'Hello, world!$'
 
main  endp
end   main
"""
Gist.create(snippet: s, lang: "nasm", description: "ASM - x86 DOS")

s = """
#import <stdio.h>
 
int main(void)
{
    NSLog(@\"Hello, world!\n\");
    return 0;
}
"""
Gist.create(snippet: s, lang: "objective-c", description: "Hello World example in Objective-C language")

s = """
#import <stdio.h>
#import <objc/Object.h>
 
@interface Hello: Object
- (void) say;
@end
 
@implementation Hello
- (void) say {
  printf(\"Hello, world!\n\");
}
@end
 
int main() {
  Hello *hello = [Hello new];
  [hello say];
  [hello free];
  return 0;
}
"""
Gist.create(snippet: s, lang: "objective-c", description: "Hello World example in Objective-C language")

s = """
@interface Hello:NSObject
- (void) say;
@end
@implementation Hello
- (void) say {
   NSLog(@\"Hello, world!\");
}
@end
 
int main(int argc, char *argv[])
{
    NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
    Hello *hello = [Hello new];
    [hello say];
    [hello release];
    [p release];
    return 0;
}
"""
Gist.create(snippet: s, lang: "objective-c", description: "Hello World example in Objective-C language")

s = """
@interface Hello:NSObject
- (void) say;
@end
@implementation Hello
- (void) say {
   NSLog(@\"Hello, world!\");
}
@end
 
int main(int argc, char *argv[])
{
    @autoreleasepool {;
        [[Hello new] say];
    }
    return 0;
}
"""
Gist.create(snippet: s, lang: "objective-c", description: "Hello World example in Objective-C language")

s = """
public class HelloWorld {
   public static void main(String[] args) {
       System.out.println(\"Hello, world!\");
   }
}
"""
Gist.create(snippet: s, lang: "java", description: "Hello World example in Java language")

s = """
import javax.swing.JFrame;  //Importing class JFrame
import javax.swing.JLabel;  //Importing class JLabel
public class HelloWorld {
    public static void main(String[] args) {
        JFrame frame = new JFrame();           //Creating frame
        frame.setTitle(\"Hi!\");                 //Setting title frame
        frame.add(new JLabel(\"Hello, world!\"));//Adding text to frame
        frame.pack();                          //Setting size to smallest
        frame.setLocationRelativeTo(null);     //Centering frame
        frame.setVisible(true);                //Showing frame
    }
}
"""
Gist.create(snippet: s, lang: "java", description: "Hello World example in Java (Swing) language")

s = """
import javax.swing.JOptionPane;
public class HelloWorld {
    public static void main(String[] args) {
        JOptionPane.showMessageDialog(null, \"Hello, world!\");
    }
}
"""
Gist.create(snippet: s, lang: "java", description: "Hello World example in Java (Dialog) language")

my_gists = [
    ["def init():\n\tpass", "python", "Funkcja w pythonie"],
    ["def init():\n\tprint 'Hello World!'\n\tpass", "python", "Hello World in Python language!"],
    ["if __name__ == '__main__':\n\tprint 'First run of script'\n\nif __name__ == 'python_module':\n\tprint 'Im imported!'", "python", "Imports examples in Python."],
    ["my_gists.each do |s, l, d|\n\tGist.create(snippet: s, lang: l, description: d)\nend", "rb", "Wycinek z db/seeds.rb w Ruby/Rails."],
    ["#include <iostream>\nusing namespace std;\nint main()\n{\n\tcout << \"Hello World in C++!\" << endl;\n\treturn 0;\n}", "cpp", "Hello World example in C++ lang."    ],
    ["#include <stdio.h>\nvoid main()\n{\n\tprintf(\"Hello World in C.\";\n}", "c", "Hello World example in C language"],
    ["REPORT ZHELLOWORLD.\nWRITE 'Hello, world!'.", "abap", "Hello World example in ABAP (from wiki)."],
    ["trace (\"Hello, world!\");", "as3", "Hello World example in ActionScript 3.0 (from wiki)."],
    ["with Ada.Text_IO;\nprocedure Hello_World is\n use Ada.Text_IO;\nbegin\n\tPut_Line(\"Hello, world!\");\nend;", "ada", "Hello World example in Ada (from wiki)."],
    ["display dialog \"Hello, world!\"", "applescript", "Hello World example in AppleScript language (from wiki)."],
    ["Msgbox, Hello, world!", "ahk", "Hello World example in AutoHotkey language (from wiki)."],
    ["Traytip,, Hello, world!", "ahk", "Hello World example in AutoHotkey language (from wiki)."],
    ["Msgbox(64, \"\", \"Hello, world!\")", "autoit", "Hello World example in AutoIT (from wiki)."],
    ["BEGIN { print \"Hello, world!\" }", "awk", "Hello World example in AWK language (from wiki)."],
    ["@echo Hello, world!", "bat", "Hello World example in Batch file (from wiki)."],
    [">25*\"!dlrow ,olleH\":v\n\t\t\t\tv:,_@\n\t\t\t\t>  ^", "befunge", "Hello World example in Befunge language (from wiki)."],
    ["using System;\nclass Program\n{\n\tpublic static void Main()\n{\n\t\tConsole.WriteLine(\"Hello, world!\");\n\t}\n}", "c#", "Hello World example in C# (from wiki)." ],
    ["void hello() {\n\tprint(\"Hello, World!\");\n}", "ceylon", "Hello World example in Ceylon language (from wiki)."],
    ["alert 'Hello, world!'", "coffee-script", "Hello World example in CoffeScript (from wiki)."],
    ["console.log 'Hello, world!'", "coffee-script", "Hello World example in CoffeeScript (from wiki)."],
    ["(println \"Hello, world!\")", "clojure", "Hello World example in Clojure (from wiki)."],
    ["(javax.swing.JOptionPane/showMessageDialog nil \"Hello, world!\")", "clojure", "Hello World example in Clojure (from wiki)."],
    ["\t\tIDENTIFICATION DIVISION.\n\t\tPROGRAM-ID. HELLO-WORLD.\n\t\tPROCEDURE DIVISION.\n\t\t\tDISPLAY 'Hello, world!'.\n\t\t\tSTOP RUN.", "cobolfree", "Hello World example in COBOL (from wiki)."],
    ["import std.stdio;\n\nvoid main()\n{\n\twriteln(\"Hello, world!\");\n}", "d", "Hello World example in D language (from wiki)."],
    ["{$APPTYPE CONSOLE}\nbegin\n\tWriteln('Hello, world!');\nend.", "delphi", "Hello World example in Delphi language (from wiki)."],
    ["io:format(\"~s~n\", [\"Hello, world!\"])", "erlang", "Hello World example in Erlang (from wiki)."],
    ["program hello\n\twrite(*,*) 'Hello, world!'\nend program hello", "fortran", "Hello World example in Fortran language (from wiki)."],
    ["program hello\n\tprint *, 'Hello, world!'\nend program hello", "fortran", "Hello World example in Fortran language (from wiki)."],
    ["\t\tPROGRAM HELLO\n\t\tWRITE(*,*) 'Hello, world!'\n\t\tEND", "fortran", "Hello World example in Fortran language (from wiki)."],
    ["\t\tPROGRAM HELLO\n\t\tPRINT *, 'Hello, world!'\n\t\tEND", "fortran", "Hello World example in Fortran language (from wiki)."],
    ["package main\n\nimport \"fmt\"\n\nfunc main() {\n\tfmt.Println(\"Hello, world!\")\n}", "go", "Hello World example in Go language (from wiki)."],
    ["SET SERVEROUTPUT ON;\nBEGIN\n\tDBMS_OUTPUT.PUT_LINE('Hello, world!');\nEND;", "sql", "Hello World example in SQL (from wiki)."],
    ["%!PS\n/Courier 72 selectfont\n20 20 moveto\n(Hello World!) show\nshowpage", "postscript", "Hello World example in PostScript (from wiki)."],
    ["object HelloWorld extends App {\n\tprintln(\"Hello, world!\")\n}", "scala", "Hello World example in Scala (from wiki)."],
    ["module hello();\n\ninitial begin\n\n\t$display(\"Hello, world!\");\n\t\t\t$finish;\nend\n\nendmodule", "verilog", "Hello World example in Verilog (wiki)."]
]

my_gists.each do |s, l, d|
    Gist.create(snippet: s, lang: l, description: d)
end
