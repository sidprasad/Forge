#lang forge

sig Node{}
one sig A, B extends Node{}
fun conditional: one Node {
    true => A else B
}

test expect {
    {conditional = A} is theorem
}