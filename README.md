# Demo Haskell

Repositorio de demostración en **Haskell** enfocado en ilustrar conceptos clave de la programación funcional y evidenciar algunas de las ventajas del lenguaje frente a paradigmas imperativos tradicionales.

---

## 📌 Descripción

Este proyecto contiene ejemplos prácticos escritos en Haskell que permiten explorar características distintivas del lenguaje como la inmutabilidad, el tipado fuerte y la evaluación perezosa. Está orientado a aprendizaje, experimentación y comprensión de cómo Haskell resuelve problemas de forma declarativa.

---

## ⚡ Ventajas de Haskell (evidenciadas en el proyecto)

A través de los ejemplos incluidos en este repositorio, se pueden observar varias ventajas importantes:

### 1. **Funciones puras**
Las funciones no tienen efectos secundarios, lo que facilita:
- Mayor previsibilidad
- Código más fácil de testear
- Menos errores ocultos

### 2. **Tipado estático y fuerte**
Haskell detecta errores en tiempo de compilación:
- Reduce fallos en ejecución
- Mejora la seguridad del código
- Permite inferencia de tipos sin perder rigor

### 3. **Evaluación perezosa (Lazy Evaluation)**
- Los valores se calculan solo cuando son necesarios
- Permite trabajar con estructuras potencialmente infinitas
- Mejora la eficiencia en ciertos casos

### 4. **Inmutabilidad por defecto**
- Evita modificaciones accidentales de datos
- Facilita la concurrencia
- Reduce efectos colaterales

### 5. **Expresividad y concisión**
- Menos código para expresar la misma lógica
- Uso intensivo de funciones de orden superior

---

## 🚀 Tecnologías

- **Haskell**
- **GHC (Glasgow Haskell Compiler)**
- **GHCi (REPL interactivo)**

---

## ⚙️ Dependencias

Para ejecutar este proyecto necesitas instalar:

### Opción recomendada: GHCup

Instala GHC, Cabal y herramientas necesarias:

👉 https://www.haskell.org/ghcup/

### Alternativas

- **GHC** directamente: https://www.haskell.org/ghc/
- **Stack** (opcional): https://docs.haskellstack.org/

---

## 🔍 Verificación de instalación

```bash
ghc --version
ghci --version
