(deffacts datos (montacargas p 0 paquete 0 peso 0 destino 0)
(paquete p 1 peso 350 destino 3)
(paquete p 2 peso 600 destino 3)
(paquete p 2 peso 300 destino 4)
(tamanyo p 5)
(pesoMax 650)
)

(defrule subir_piso
?f <- (montacargas p ?x  paquete ?paq peso ?pes destino ?d)
(tamanyo p ?xMax)
(test (<= (+ ?x 1) ?xMax))
=>
(assert (montacargas p (+ ?x 1) paquete ?paq peso ?pes destino ?d))
(printout t "he subido 1 piso" crlf)
)

(defrule bajar_piso
?f <- (montacargas p ?x  paquete ?paq peso ?pes destino ?d)
(test (>= (- ?x 1) 0))
=>
(assert (montacargas p (- ?x 1) paquete ?paq peso ?pes destino ?d))
(printout t "he bajado 1 piso" crlf)
)

(defrule encontrar_paquete
(declare (salience 100))
?f <- (montacargas p ?x  paquete ?paq peso ?peso destino ?d)
(pesoMax ?pesoMax)
(paquete p ?xPaq peso ?pesoPaq destino ?dPaq)
(test (= ?x ?xPaq))
(test (>= ?pesoPaq ?pesoMax))
=>
(printout t "¡Encontré el paquete!" crlf)
 (assert
	(montacargas p ?x paquete (+ ?paq 1) peso (+ ?peso ?pesoPaq) destino (+ ?d ?dPaq))
 )
)


