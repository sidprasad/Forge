#lang forge/bsl

sig Node {
    next: lone Node,
    field: pfunc Node -> Node
}

one sig A extends Node {}

pred rightjoin {
    reachable[A, A.field.Node, next]
}

test expect{ {rightjoin} is sat}