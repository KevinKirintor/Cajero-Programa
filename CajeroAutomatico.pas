program Cajero;
uses crt;
var
transferencia:integer;
deposito:integer;
contrasenaLg:string;
cedulaTr:int64;
cedulaLg:int64;
operaciones:array[1..50] of integer;
op: array[1..7] of integer;
logeos:array [1..2] of  boolean;
registros: array [1..4] of boolean;
transferencias: array [1..2] of boolean;
registro: array [0..10] of 
    record
      Nombre: string[30];
      Apellido: string[30];
      cedula: int64;
      contrasena: string;
      monto:int64;
      transacciones:integer;
      transferenciaas:array [1..50] of int64;
      retiros:array [1..50] of integer;
      depositos:array[1..50] of integer;
     end;
i,x,t,r,d:integer;
procedure logeo;
begin
repeat
begin
writeln('INGRESAR CEDULA DE IDENTIDAD');
readln(cedulaLg);
for x:= 1 to 10 do
 if(cedulaLg=registro[x].cedula) then
   begin
   writeln('CEDULA ENCONTRADA EN BASE DE DATOS');
   logeos[1]:= true;
   break;
   end
 else if (x=10) and (cedulaLg<>registro[x].cedula) and (cedulalg=0) then
   begin
   logeos[1]:= false;
   writeln('La cedula ingresada no le pertenece a ninguna cuenta bancaria')
   end;
end;
until (logeos[1]=true);
repeat
Begin
writeln('INGRESE SU CLAVE');
readln(contrasenaLg);
for x:= 1 to 10 do 
  if (contrasenaLg=registro[x].contrasena) then
   begin
   writeln('LOGUEADO CORRECTAMENTE');
   writeln('BIENVENIDO/A ', registro[x].nombre,' ',registro[x].apellido);
   logeos[2]:= true;
   break;
   end
  else if (x=10) and (logeos[2]=false) then
   begin
   writeln('CLAVE INCORRECTA');
   logeos[2]:= false; 
   end;
end;
until (logeos[2]=true);
end;
procedure registrar;
begin 
for x:= 1 to 10 do
 if (registro[x].nombre='') and (registro[x].apellido='') and (registro[x].cedula=0) then
  begin
   writeln('Ingrese su nombre:');
   readln(registro[x].nombre);
   registros[1]:= true;
   clrscr;
   writeln('Muy bien señor/a ',registro[x].nombre,', ingrese su apellido:');
   readln(registro[x].apellido);
   registros[2]:= true;
   clrscr;
   writeln('Muy bien señor/a ', registro[x].nombre,' ', registro[x].apellido, ', ingrese el numero de cedula de identidad:');
  while (registros[3]=false) do 
   begin
   readln(registro[x].cedula);
   registros[3]:= true; 
    begin
    for i:= x+1 to 10 do
 if (registro[i].cedula=registro[x].cedula) then
     begin
     writeln('Ya esta cedula se encuentra registrada en la base de datos');
     writeln('Ingrese una cedula distinta');
     registros[3]:=false;
     break
     end;
    for i:= x-1 downto 0 do
 if (registro[i].cedula=registro[x].cedula) then
     begin
     writeln('Ya esta cedula se encuentra registrada');
     writeln('Ingrese una cedula distinta');
     registros[3]:=false;
     break
     end;
    end;
   end;
   clrscr;
   writeln('Ingrese una clave para el ingreso a su cuenta');
   readln(registro[x].contrasena);
   registros[4]:= true;
   writeln;
   break;
   end;
   registros[3]:=false;
   writeln('Bienvenido Señor/a ',registro[x].nombre,' ',registro[x].apellido,'. En caso de querer ingresar a su cuenta solo necesita ingresar la cedula y su clave' );
end;
procedure opIng;
begin
  repeat
  begin
  textbackground(blue);
  writeln('              CAJERO               ');
  textbackground(blue);
  writeln('        ELIJA PARA INGRESAR        ');
  textbackground(green);
  writeln('_____');
  writeln('                                   ');
  textcolor(red);
  writeln('   1:       REGISTRATE             ');
  writeln('                                   ');
  writeln('   2:         LOGUEAR              ');
  textcolor(red);
  writeln('                                   ');
  writeln('_____');
  textbackground(black);
  textcolor(white);
  readln(op[1]);
  case op[1] of
  1:begin
  registrar;
  end;
  2:begin
  logeo;
  end;
  end;
end;
until (op[1]=1) or (op[1]=2);
end;
procedure depositos;
begin
if (registro[x].transacciones=50) then
   begin
   writeln('Ya ha excedido el limite de transacciones por dia');
   exit;
   end;
  clrscr;
  writeln('Ingrese el monto a depositar');
  readln(deposito);
  d:=1+d;
  registro[x].monto:= registro[x].monto + deposito;
  registro[x].transacciones:=1+registro[x].transacciones;
  registro[x].depositos[d]:= deposito;
  writeln('Ha depositado la cifra de ',deposito,'$ ahora tiene:     ',registro[x].monto,'$ en su cuenta');
end;
procedure transferenciaa;
begin
  begin
  clrscr;
  writeln('Su cuenta tiene ',registro[x].monto,'$');
     repeat
     begin
     writeln('Ingrese el monto a transferir');
     readln(transferencia);
     if (registro[x].transacciones=50) then
        begin
        writeln('Ya ha excedido el limite de transacciones por dia');
        exit;
        end
    else if (transferencia<=registro[x].monto) then
        transferencias[1]:= true
       else
        writeln('El monto a transferir es mayor al existente');
     end;
     until (transferencias[1]=true);
     repeat
     begin
     writeln('Ingrese la cedula de la persona a la que quiere transferirle');
     readln(cedulaTr);
        for i:= 1 to 10 do
     if (cedulaTr=registro[i].cedula) and (cedulatr<>0) then
        begin
        t:=1+t;
        transferencias[2]:= true;
        registro[x].monto:= registro[x].monto-transferencia;
        registro[i].monto:= registro[i].monto+transferencia;
        registro[x].transacciones:= 1+registro[x].transacciones;
        registro[x].transferenciaas[t]:= transferencia;
        textcolor(green);
        writeln('Transferencia exitosa');
        textcolor(white);
        writeln('Te quedan ',registro[x].monto,'$ ');
        break
        end
      else if (i=10) and (cedulaTr<>registro[i].cedula) or (cedulatr=0) then
        begin
         writeln('La cedula no le pertenece a ningun usuario');
         break
        end;
     end;
     until (transferencias[2]=true);
  end;
end;
procedure retiroDinero;
begin
   begin
   if (registro[x].transacciones=50) then
        begin
        writeln('Ya ha excedido el limite de transacciones por dia');
        exit;
        end
    end;
    begin
    r:=1+r;
    writeln('Elija la opcion que quire retirar');
    textbackground(white);
    textcolor(green);
    writeln('     1 =   1.000Bs                 ');
    writeln('     2 =   2.000Bs                 ');
    writeln('     3 =   10.000Bs                ');
    writeln('     4 =   20.000Bs                ');
    writeln('     5 =   50.000Bs                ');
    textbackground(black);
    textcolor(white);
    readln(op[2]);
    case op[2] of
    1:begin
    if (registro[x].monto>=1000) then
    begin
    registro[x].monto:= registro[x].monto - 1000;
    clrscr;
    writeln('Has retirado 1.000Bs te quedan ',registro[x].monto,'Bs');
    registro[x].retiros[r]:= 1000;
    registro[x].transacciones:= 1+registro[x].transacciones;
    end
    else
    begin
    writeln('El monto a retirar es mayor que el disponible');
    end;
    end;
    2:begin
    if (registro[x].monto>=2000) then
    begin
    registro[x].monto:= registro[x].monto - 2000;
    clrscr;
    writeln('Has retirado 2.000Bs te quedan ',registro[x].monto,'Bs');
    registro[x].retiros[r]:= 2000;
    registro[x].transacciones:= 1+registro[x].transacciones;
    end
    else
    begin
    writeln('El monto a retirar es mayor que el disponible');
    end;
    end;
    3:begin
    if (registro[x].monto>=10000) then
    begin
    registro[x].monto:= registro[x].monto - 10000;
    clrscr;
    writeln('Has retirado 10.000Bs te quedan ',registro[x].monto,'Bs');
    registro[x].retiros[r]:= 10000;
    registro[x].transacciones:= 1+registro[x].transacciones;
    end
    else
    begin
    writeln('El monto a retirar es mayor que el disponible');
    end;
    end;
    4:begin
    if (registro[x].monto>=20000) then
    begin
    registro[x].monto:= registro[x].monto - 20000;
    clrscr;
    writeln('Has retirado 20.000Bs te quedan ',registro[x].monto,'Bs');
    registro[x].retiros[r]:= 20000;
    registro[x].transacciones:= 1+registro[x].transacciones;
    end
    else
    begin
    writeln('El monto a retirar es mayor que el disponible');
    end;
    end;
    5:begin
    if (registro[x].monto>=50000) then
    begin
    registro[x].monto:= registro[x].monto - 50000;
    clrscr;
    writeln('Has retirado 50.000Bs te quedan ',registro[x].monto,'Bs');
    registro[x].retiros[r]:= 50000;
    registro[x].transacciones:= 1+registro[x].transacciones;
    end
    else
    begin
    writeln('El monto a retirar es mayor que el disponible');
    end;
    end;
    end;
   end;
end;
procedure Vertransaccion;
begin
   clrscr;
   for i:= 1 to 50 do
   if (registro[x].transferenciaas[i]<>0) then
   begin
   textcolor(green);
   writeln('Has transferido ',registro[x].transferenciaas[i],'Bs');
   end;
   for i:= 1 to 50 do
   if (registro[x].retiros[i]<>0) then
   begin
   textcolor(Red);
   writeln('Has retirado ',registro[x].retiros[i],'Bs');
   textcolor(white);
   end;
   for i:= 1 to 50 do
   if (registro[x].depositos[i]<>0) then
   begin
   textcolor(Blue);
   writeln('Has depositado ',registro[x].depositos[i],'Bs');
   textcolor(white);
   end;  
   writeln;
   writeln('SALDO DISPONIBLE = ',registro[x].monto,'Bs');
   writeln;
   writeln('PRESIONE ENTER PARA SALIR');
   readln;
   clrscr;
end;
procedure cerrarsesion;
begin
  x:=0;
  d:=0;
  i:=0;
  t:=0;
  r:=0;
  opIng;
end;
procedure menu;
begin
  repeat
  begin
  textbackground(blue);
  writeln('         ELIJA UNA ACCION          ');
  textbackground(white);
  writeln('_____');
  writeln('                                   ');
  textcolor(brown);
  writeln('   1:       TRANSFERIR             ');
  writeln('                                   ');
  writeln('   2:       DEPOSITAR              ');
  textcolor(brown);
  writeln('                                   ');
  writeln('   3:       RETIRAR                ');
  writeln('                                   ');
  writeln('   4:       VER TRANSACCIONES      ');
  writeln('                                   ');
  writeln('   5:       CERRAR SESIÓN          ');
  writeln('                                   ');
  writeln('   6:       SALIR                  ');
  writeln('_____');
  textbackground(black);
  textcolor(white);
  readln(op[3]);
    case op[3] of
    1:begin
    if (registro[x].monto<>0) then
    begin
    transferenciaa;
    end
    else 
    begin
    clrscr;
    writeln('No tiene fondos para transferir');
    end;
    end;
    2:begin
    depositos;
    end;
    3:begin
    retiroDinero;
    end;
    4:begin
    vertransaccion;
    end;
    5:begin
    clrscr;
    writeln('Sesion cerrada');
    cerrarsesion;
    end;
    6:begin
    end;
    else
    begin 
    writeln('Opcion incorrecta');
    end;
   end;
  end;
  until (op[3]>0) and (op[3]<7);
end;
begin
 begin
 clrscr;
 opIng;
 end;
 repeat
 begin
 menu;
 end;
 until (op[3]=6);
end.