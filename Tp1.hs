{-# LANGUAGE NoMonomorphismRestriction #-}
import Text.Show.Functions -- para mostrar <Function> en consola
import Data.List -- para los metodos coleccionables que no vienen en la guia de lenguaje
import Data.Maybe -- por si llegan a usar un metodo de coleccion y devuelva Nothing or justElements
import Test.Hspec -- para usar los test


ejecutarTest = hspec $ do
      describe "Funciones basicas probadas sobre una billetera de 10" $ do
        it "Depositar 10 genera una billetera de 20" $ (billetera.deposito 10) prueba `shouldBe` 20
        it "Extraer 3 genera una billetera de 7" $ (billetera.extracción 3) prueba `shouldBe` 7
        it "Extraer 15 genera una billetera de 0" $ (billetera.extracción 15) prueba `shouldBe` 0
        it "Un upgrade genera una billetera de 12" $ (billetera.upgrade) prueba `shouldBe` 12
        it "Cerrar la cuenta genera una billetera de 0" $ (billetera.cierreDeCuenta) prueba `shouldBe` 0
        it "quedaIgual no genera modificaciones" $ (billetera.quedaIgual) prueba `shouldBe` 10
        it "Depositar 1000 y luego hacer un upgrade da 1020" $ (billetera.upgrade.deposito 1000) prueba `shouldBe` 1020
      describe "Consultas de Usuarios, sin generar nuevas funciones" $ do
        it "La billetera de pepe es de 10" $ billetera pepe `shouldBe` 10
        it "La billetera de pepe luego de un cierre de cuenta es 0" $ (billetera.cierreDeCuenta) pepe `shouldBe` 0
        it "Si a pepe le depositan 15, extrae 2 y hace upgrade le queda 27.6"
           $ (billetera.upgrade.extracción 2.deposito 15) pepe `shouldBe` 27.6
      describe "Consultas sobre transacciones 1 y 2" $ do
        it "Aplico transacción1 a pepe, entonces no sufre modificaciones su billetera"
           $ (billetera.transacción1) pepe `shouldBe` 10
        it "Aplico transacción2 a pepe, su billetera sube a 15" $ (billetera.transacción2) pepe `shouldBe` 15
        it "Aplico transaccion2 a pepe2, quien en este caso tiene una billetera de 50, entonces sube a 55"
           $ (billetera.transacción2) pepe2 `shouldBe` 55
      describe "Prueba de eventos nuevos, con una billetera inicial de 10" $ do
        it "Aplico a lucho2 transacción3, la billetera queda en 0" $ (billetera.transacción3) lucho2 `shouldBe` 0
        it "Aplico a lucho2 tranasccion4, la billetera queda en 34.0" $ (billetera.transacción4) lucho2 `shouldBe` 34.0
      describe "Prueba de transacción compleja, desde el usuario queda y el que recibe" $ do
        it "Pepe le da 7 unidades a Lucho, entonces a pepe le quedan 3 unidades"
           $ (billetera.transacción5) pepe `shouldBe` 3
        it "Pepe le da 7 unidades a Lucho, entonces a lucho tiene 17 unidades en su billetera"
           $ (billetera.transacción5) lucho2 `shouldBe` 17


--Tipos--

type Evento = Usuario -> Usuario
type Transacción = Evento

--Eventos--

sumarDinero :: Float -> Evento
sumarDinero unDinero unUsuario = unUsuario {
            billetera = billetera unUsuario + unDinero
}

restarDinero :: Float -> Evento
restarDinero unDinero unUsuario = unUsuario{
             billetera = billetera unUsuario - unDinero
}

hacerAumento unUsuario = unUsuario {
             billetera = billetera unUsuario * 1.20}

esMayorADiez unUsuario = (billetera.hacerAumento) unUsuario >= (billetera.sumarDinero 10) unUsuario

deposito :: Float -> Evento
deposito dineroDepositado = sumarDinero dineroDepositado

extracción :: Float -> Evento
extracción dineroExtraido unUsuario | (billetera.restarDinero dineroExtraido) unUsuario  <=0  = unUsuario{billetera = 0}
                                    | otherwise = restarDinero dineroExtraido unUsuario

upgrade :: Evento
upgrade unUsuario | esMayorADiez unUsuario = sumarDinero 10 unUsuario
                  | otherwise = hacerAumento unUsuario

cierreDeCuenta :: Evento
cierreDeCuenta unUsuario = unUsuario {
               billetera = 0
}

quedaIgual :: Evento
quedaIgual unUsuario = unUsuario

data Usuario = Usuario {
        nombre :: String,
        billetera :: Float
        }deriving (Show, Eq)

--Usuarios

pepe   = Usuario "Pepe" 10
lucho  = Usuario "Lucho" 2
pepe2  = Usuario "Pepe" 50
lucho2 = Usuario "Lucho" 10
--Usuario de prueba a fin de no volver a repetir a pepe ya que es pedido como prueba especifica
--en el caso de uso 8 en adelante

prueba = Usuario "prueba" 10

--Transaccciones 1 y 2--

transacción1 :: Transacción
transacción1 unUsuario | nombre unUsuario == "Lucho" = cierreDeCuenta unUsuario
                       | otherwise = quedaIgual unUsuario

transacción2 :: Transacción
transacción2 unUsuario | nombre unUsuario == "Pepe"  = deposito 5 unUsuario
                       | otherwise = quedaIgual unUsuario

-- Nuevos eventos --
-- de hecho estoy dudando si va esto, basicamente lo puse por que dice agregar como funciones el tocoYmeVoy y ahorranteErrante
-- ya que sino, esto basica-mente se puede probar en consola con composicion y es idem!

tocoYmeVoy :: Evento
tocoYmeVoy unUsuario = (cierreDeCuenta.upgrade.deposito 15) unUsuario

ahorranteErrante :: Evento
ahorranteErrante unUsuario = (deposito 10.upgrade.deposito 8. extracción 1. deposito 2.deposito 1) unUsuario

--Transacciones de prueba pedidas a modo de prueba por enunciado--
transacción3 :: Transacción
transacción3 unUsuario = tocoYmeVoy unUsuario

transacción4 :: Transacción
transacción4 unUsuario = ahorranteErrante unUsuario

--Transaccción mas compleja--

transacción5 :: Transacción
transacción5 unUsuario | nombre unUsuario == "Pepe" = extracción 7 unUsuario
                       | nombre unUsuario == "Lucho" = deposito 7 unUsuario
                       | otherwise = quedaIgual unUsuario

-- ******************************************* Parte 2 ***********************************************************
-- agregados las primeras 3 funciones del tp2
-- 6/05 : agregado funcion para el test 21!
pruebaEventosTP2 = hspec $ do
  describe " Usuario luego de la Transaccion " $ do
    it " impactar Transaccion 1 a pepe. Debe quedar igual" $ impactar transacción1 pepe `shouldBe` pepe
    it " impactar Transaccion 5 a lucho. Obteniendo 9 monedas en su billetera" $ impactar transacción5 lucho `shouldBe` nuevaBilletera 9 lucho
    it " impactar transacción5 y luego transacción2 a pepe. Obteniendo saldo 8 en su billetera" $ impactar (transacción2.transacción5) pepe `shouldBe` nuevaBilletera 8 pepe
    describe " Usuario luego de Aplicar bloques de Transacciónes" $ do
    it " impactar el bloque1 en pepe , y su saldo debe ser de 18 monedas " $ comoQuedaSaldo bloque1 pepe  `shouldBe` nuevaBilletera 18 pepe
    it " determinar saldo menor a N creditos, para pepe y lucho , mostrando el que quede con saldo mayor a 10: pepe" $ usuarioConSaldoSegunNCreditos 10 bloque1 [pepe,lucho] `shouldBe` [pepe]

nuevaBilletera :: Float -> Usuario -> Usuario
nuevaBilletera otraBilletera unUsuario = unUsuario{billetera = otraBilletera}

impactar :: Transacción -> Usuario -> Usuario
impactar unaTransaccion unUsuario = unaTransaccion unUsuario

type Bloque = [Transacción]

bloque1 :: Bloque
bloque1 = [transacción1,transacción2,transacción2,transacción2,transacción3,transacción4,transacción5,transacción3]

comoQuedaSaldo::  Bloque -> Usuario-> Usuario
comoQuedaSaldo unBloque unUsuario  = foldr impactar unUsuario unBloque

usuarioConSaldoSegunNCreditos :: Float -> Bloque -> [Usuario] ->  [Usuario]
usuarioConSaldoSegunNCreditos unCredito unBloque unosUsuarios = filter ((>= unCredito).billetera.(comoQuedaSaldo unBloque)) unosUsuarios

bloque2 = [transacción2,transacción2,transacción2,transacción2,transacción2]
