# Identidad gráfica de AIdeaText

Guía y recursos comunes para **todas** las páginas de AIdeaText. Cualquier
desarrollo nuevo (persona o agente de IA) debe leer este archivo antes de
diseñar una pantalla.

- **Fuente de verdad del diseño:** la portada https://aideatext.ai
  (repo `aideatext/aideatext-landing`, `web/public/css/portada.css`).
- **Esta guía en línea:** https://github.com/aideatext/aideatext-identidad/blob/main/IDENTIDAD.md
- **Recursos en línea (CDN):** `https://cdn.jsdelivr.net/gh/aideatext/aideatext-identidad@v1/<ruta>`

## 1. Reglas en una línea

1. Fondo **papel cálido** `#fbf8f3`, nunca blanco puro. Texto **tinta** `#16202b`, nunca negro puro.
2. Titulares en **Fraunces**, texto en **IBM Plex Sans**, código y datos en **IBM Plex Mono**. Ninguna otra letra: en el CSS se escribe siempre `var(--ait-serif)`, `var(--ait-sans)` o `var(--ait-mono)`, nunca el nombre de una fuente.
3. Cabecera: **logotipo AIdeaText + sello NVIDIA Inception**, a la misma altura, a la izquierda; después el nombre del producto.
4. Icono de pestaña: **la marca** (anillo + círculo rojo + dos azules) de este repo. Nunca el logotipo con letras reducido.
5. Colores de acción: **azul** `#0b7ec5` (principal) y **rojo** `#ae0025` (secundaria o destacada). Son los dos colores del logotipo.

## 2. Tipografía

| Uso | Letra | Pesos | Variable CSS |
|---|---|---|---|
| Titulares (h1, h2, h3, nombre del producto) | Fraunces Variable | 600 (rango 100–900) | `--ait-serif` |
| Texto, botones, menús | IBM Plex Sans | 400 y 600 | `--ait-sans` |
| Código, cifras, etiquetas en mayúsculas | IBM Plex Mono | 500 | `--ait-mono` |

- Titulares: `line-height: 1.12`, `letter-spacing: -0.012em`.
- Texto: `line-height: 1.6`, ancho máximo de párrafo `39rem` (`--ait-lectura`).
- Etiquetas: Mono 500, `0.72rem`, mayúsculas, `letter-spacing: 0.1em` (clase `.ait-etiqueta`).
- Las fuentes se sirven **desde nuestro dominio o este repo**, no desde Google Fonts. Licencias en `fuentes/` (SIL OFL).

## 3. Colores

| Nombre | Hex | Uso |
|---|---|---|
| papel | `#fbf8f3` | fondo de página |
| panel | `#f2eee6` | tarjetas, pie, campos |
| lienzo | `#101924` | bloques oscuros (héroe, figuras) |
| tinta | `#16202b` | texto principal (15,5:1) |
| tinta-suave | `#4e5a68` | texto secundario (6,6:1, AA) |
| azul | `#0b7ec5` | marca, botón principal |
| azul-hondo | `#0a5c92` | enlaces, hover |
| azul-claro | `#5aa9e6` | acentos sobre fondo oscuro |
| rojo | `#ae0025` | marca, botón destacado («Gracias») |
| borde | `#e5dfd4` | filetes y bordes |

Todas están como variables `--ait-*` en `css/aideatext.css`.

## 4. Logotipos e iconos

| Archivo | Para qué |
|---|---|
| `logos/logo-aideatext.png` (156 px) | cabecera de cualquier página |
| `logos/logo-aideatext-300.png` | impresos, presentaciones |
| `logos/nvidia-inception-color.svg` | sello NVIDIA Inception, siempre junto al logotipo |
| `iconos/favicon.svg` | icono de pestaña (declarar primero) |
| `iconos/favicon.ico` | en la raíz del sitio, declarado como `alternate icon` |
| `iconos/apple-touch-icon.png` (180 px) | iOS |
| `iconos/icon-192.png`, `icon-512.png`, `icon-maskable-512.png` | manifest (Android, instalar como app) |
| `iconos/site.webmanifest.ejemplo` | plantilla del manifest |

Bloque `<head>` estándar:

```html
<meta name="theme-color" content="#fbf8f3" />
<link rel="icon" href="/favicon.svg" type="image/svg+xml" />
<link rel="alternate icon" href="/favicon.ico" sizes="any" />
<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
<link rel="manifest" href="/site.webmanifest" />
```

**Sello NVIDIA:** debe acompañar siempre al logotipo de AIdeaText en la
cabecera, con el mismo alto. En el pie, el aviso: «NVIDIA, the NVIDIA logo
and NVIDIA Inception are trademarks and/or registered trademarks of NVIDIA
Corporation in the U.S. and other countries.»

## 5. Cabecera

```
[logo AIdeaText] [sello NVIDIA] │ Nombre del producto          …idioma · acciones
                                │ lema corto en tinta-suave
```

- Fondo papel, filete inferior `--ait-borde`.
- Logotipo y sello al mismo alto (`--ait-logo`, de 44 a 52 px).
- El logotipo enlaza a https://aideatext.ai.
- Nombre del producto en Fraunces 600; el lema en Plex Sans 0,78 rem.
- En teléfono (< 640 px) se ocultan el sello y el lema; nunca el logotipo.
- Marcado y clases: ver `ejemplos/cabecera.html`.

## 6. Cómo usarlo en un proyecto

**A. En línea (lo más simple):**

```html
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/aideatext/aideatext-identidad@v1/css/aideatext.css" />
```

y las imágenes desde `https://cdn.jsdelivr.net/gh/aideatext/aideatext-identidad@v1/logos/...`.

**B. Copiado al sitio** (obligatorio si la CSP es `default-src 'self'`, o para no depender de un tercero):

```bash
git clone https://github.com/aideatext/aideatext-identidad
aideatext-identidad/scripts/instalar.sh ruta/a/carpeta/publica
```

Deja iconos en la raíz, logos en `/img/`, fuentes en `/fonts/` y `/css/aideatext.css`.

**Tailwind:** mapea los colores a las variables (`papel: 'var(--ait-papel)'`, etc.) y
`fontFamily: { serif: 'var(--ait-serif)', sans: 'var(--ait-sans)', mono: 'var(--ait-mono)' }`.

## 7. Versiones

Las páginas cargan `@v1`. Un cambio que rompa algo (renombrar variables o
archivos) sube a `v2`; arreglos compatibles mueven la etiqueta `v1`.

## 8. Sitios que usan esta identidad

| Sitio | Repo |
|---|---|
| https://aideatext.ai | aideatext/aideatext-landing |
| https://context.aideatext.ai | aideatext/conText-HackTheAndes |
| https://aidesk.aideatext.ai | aideatext/aideatext-desk |
| https://ssa.aideatext.ai | aideatext/simulation-strategy-agents |
