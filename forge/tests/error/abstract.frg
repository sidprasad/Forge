#lang forge


one sig A { field: one B}
abstract sig B{
   
}

test expect {
 
    thm1: {some A.field} is sat
}