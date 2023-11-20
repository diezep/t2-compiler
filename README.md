# Traductores 2: Compilador

Este es un proyecto para la clase de Traductores 2, en el cual se desarrollará un analizador léxico, sintáctico y semántico para un lenguaje de programación.

Los tokens que se reconocerán son los siguientes:
| Token | Expresión regular | Color |
| --- | --- | --- |
| Palabra reservada | `^(if\|else\|while\|for\|return)$` | 0xFFbf2153 |
| Tipo de dato | `^(num\|str\|bool)$` | 0xff4842f5 |
| Identificador | `^[a-zA-Z][a-zA-Z0-9]*$` | 0xfff5b042 |
| Constante | `^[0-9]+(\.[0-9]+)?$` | 0xff3da127 |
| Cadena | `^\".*\"$` | 0xffa17827 |
| ( | `^\($` | 0xff000000 |
| ) | `^\)$` | 0xff000000 |
| Operador lógico | `^(&&\|\|\|)$` | 0xff000000 |
| Operador relacional | `^(==\|!=\|>\|>=\|<\|<=)$` | 0xff000000 |
| Operador aritmético | `^(\+\|\-\|\*\|\/\|\%)$` | 0xff000000 |
| Operador de asignación | `^\=$` | 0xff000000 |
| ; | `^\;$` | 0xff000000 |
| , | `^\,$` | 0xff000000 |
| { | `^\{$` | 0xff000000 |
| } | `^\}$` | 0xff000000 |
| Caracter especial | `^(\;\|\,\|\{\|\})$` | 0xFF000000 |
