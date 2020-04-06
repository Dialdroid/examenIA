(deffacts datos (montacargas p 0 paquete 0 peso 0)
(paquete p 1 peso 350 destino p 3)
(paquete p 2 peso 600 destino p 3)
(paquete p 2 peso 300 destino p 4)
(tamanyo p 5)
(pesoMax 650)
(destino p 3)
(destino p 3)
(destino p 4)
)

(defrule subir_piso
?f <- (montacargas p ?x  paquete ?paq peso ?pes)
(tamanyo p ?xMax)
(test (<= (+ ?x 1) ?xMax))
=>
(assert (montacargas p (+ ?x 1) paquete ?paq peso ?pes))
(printout t "he subido 1 piso" crlf)
)

