%test numeros complejos - operaciones basicas
%para ejecutar dar clic en el boton triangunlo verde run
function algo = TestOB()
fprintf('test de operaciones basicas de numero complejo.\n');
fprintf('Se crean dos numeros complejos y luego se suman.\n');
a= NumeroComplejo('(3,50)')
b= NumeroComplejo('(10,-7)')
op=Operaciones;
fprintf('El resultado ser� otro numero complejo.\n');
c=suma(op,a,b)

clear a b c;

a = NumeroComplejo('5-12j')
b= NumeroComplejo('[10;5.2356]')
op=Operaciones;
fprintf('El resultado ser� otro numero complejo.\n');
c=suma(op,a,b)
clear a b c;

fprintf('Se crean dos numeros complejos y luego se restan.\n');

a = NumeroComplejo('15+10j')
b= NumeroComplejo('(8,16)')
op=Operaciones;
fprintf('El resultado ser� otro numero complejo.\n');
c=resta(op,a,b)
clear a b c;

end